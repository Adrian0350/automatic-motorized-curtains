#include <EEPROM.h>

/**
 * The states are memory addresses indicating which byte
 * to use (variable name describes whom it belongs to).
 *
 * EEPROM memory size by Arduino:
 * - Arduno Duemilanove: 512b EEPROM storage.
 * - Arduino Uno:        1kb  EEPROM storage.
 * - Arduino Mega:       4kb  EEPROM storage.
 *
 * Since we're only storing time representation in seconds (up to 15 seconds),
 * 1 byte (8 bits > 0-255) will sufice for each relay state/time.
 *
 *
 * Extra notes:
 *	An EEPROM write takes 3.3 ms to complete.
 *	The EEPROM memory has a specified life of 100,000 write/erase cycles,
 *	so you may need to be careful about how often you write to it.
 */
const int CURTAIN1_TIME        = 0;
const int CURTAIN2_TIME        = 1;
const int CURTAIN1_STATE       = 2;
const int CURTAIN2_STATE       = 3;
const int SYSTEM_LIVE_STATE    = 4;
const int SYSTEM_CURRENT_STATE = 5;

/**
 * OUTPUT Pins for 2 relays/curtains.
 */
const int CURTAIN_1_OPEN_PIN  = 8;
const int CURTAIN_1_CLOSE_PIN = 9;
const int CURTAIN_2_OPEN_PIN  = 6;
const int CURTAIN_2_CLOSE_PIN = 7;

/**
 * INPUT Analog pins for 2 button commands, _open and close.
 */
const int OPEN_BUTTON  = A4;
const int CLOSE_BUTTON = A5;

/**
 * Active threshold; when voltage signal equals or greater than.
 */
const int ACTIVE_THRESHOLD = 1020;

/**
 * This is an int representing a second.
 * Could rather be in millis (unsigned long) to avoid extra processor operations.
 */
const int TIME_INTERVAL = 1000;


/**
 * Each curtain maximum time (the time it takes for it to open or close completely).
 */
const int CURTAIN_1_MAX_TIME = 3;
const int CURTAIN_2_MAX_TIME = 5;

const int STOP_STATE  = 0;
const int OPEN_STATE  = 1;
const int CLOSE_STATE = 2;

/**
 * The last calculated second [MEMORY].
 */
unsigned long last_second = 0;
unsigned long now = 0;


/**
 * Main loop globals.
 */
int open   = 0;
int close  = 0;
int stoped = 1;
int is_currently_active = 0;

/**
 * Set pin modes and memory setup.
 */
void setup()
{
	// Setup output pins (digital).
	pinMode(CURTAIN_1_OPEN_PIN, OUTPUT);
	pinMode(CURTAIN_1_CLOSE_PIN, OUTPUT);

	// Setup input pins (analog).
	pinMode(OPEN_BUTTON, INPUT);
	pinMode(CLOSE_BUTTON, INPUT);


	// If it's first time install write necesary variables.
	if (!EEPROM.read(SYSTEM_LIVE_STATE))
	{
		// Write the timing for each curtain (change to zero) PROLLY DONT NEED THIS.
		EEPROM.write(CURTAIN1_TIME, CURTAIN_1_MAX_TIME);
		EEPROM.write(CURTAIN2_TIME, CURTAIN_2_MAX_TIME);

		// Set each curtain to a low state (OFF).
		EEPROM.write(CURTAIN1_STATE, LOW);
		EEPROM.write(CURTAIN2_STATE, LOW);

		// Write: sets the current system state, should be STOP.
		EEPROM.write(SYSTEM_CURRENT_STATE, STOP_STATE);

		// Write that the system has been turned on for the first time.
		EEPROM.write(SYSTEM_LIVE_STATE, true);
		Serial.println("ALWAYS ENTERS");
	}

	is_currently_active = EEPROM.read(SYSTEM_CURRENT_STATE);

	// Set globals to the last saved state written in memory.
	// curtain_1_state = EEPROM.read(CURTAIN1_STATE);
	// curtain_2_state = EEPROM.read(CURTAIN2_STATE);

	Serial.begin(9600);
}

void loop()
{
	open   = analogRead(OPEN_BUTTON);
	close  = analogRead(CLOSE_BUTTON);

	stoped = open > ACTIVE_THRESHOLD && close > ACTIVE_THRESHOLD;
	now    = millis();

	if (is_currently_active && stoped)
	{
		if (is_currently_active == OPEN_STATE)
		{
			return _open();
		}
		if (is_currently_active == CLOSE_STATE)
		{
			return _close();
		}

		EEPROM.write(SYSTEM_CURRENT_STATE, STOP_STATE);
		is_currently_active = STOP_STATE;
	}

	if (stoped)
	{
		return _stop();
	}

	if (close > ACTIVE_THRESHOLD)
	{
		return _open();
	}

	if (open > ACTIVE_THRESHOLD)
	{
		return _close();
	}

	Serial.println("END");
}

void _stop()
{
	EEPROM.write(SYSTEM_CURRENT_STATE, STOP_STATE);
	is_currently_active = STOP_STATE;

	digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
	digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);

	if (oneSecond(now))
	{
		Serial.println("STOP");
	}
	last_second = now;
}

void _open()
{
	EEPROM.write(SYSTEM_CURRENT_STATE, OPEN_STATE);
	is_currently_active = OPEN_STATE;

	digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);
	digitalWrite(CURTAIN_1_OPEN_PIN, HIGH);

	if (oneSecond(now))
	{
		Serial.println("OPEN");
	}
	last_second = now;
}

void _close()
{
	EEPROM.write(SYSTEM_CURRENT_STATE, CLOSE_STATE);
	is_currently_active = CLOSE_STATE;

	digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
	digitalWrite(CURTAIN_1_CLOSE_PIN, HIGH);

	if (oneSecond(now))
	{
		Serial.println("CLOSE");
	}
	last_second = now;
}


bool oneSecond(unsigned long time_now)
{
	return ((unsigned long) time_now - last_second) >= TIME_INTERVAL;
}
