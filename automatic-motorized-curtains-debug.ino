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
const int CURTAIN_TIMER        = 1;
const int CURTAIN_1_TIMER      = 2;
const int CURTAIN_2_TIMER      = 3;
const int SYSTEM_LIVE_STATE    = 4;
const int SYSTEM_CURRENT_STATE = 5;

/**
 * OUTPUT Pins for 2 relays [ON|OFF] per curtain.
 */
const int CURTAIN_1_OPEN_PIN  = 2;
const int CURTAIN_1_CLOSE_PIN = 3;
const int CURTAIN_2_OPEN_PIN  = 4;
const int CURTAIN_2_CLOSE_PIN = 5;

/**
 * INPUT Analog pins for 2 button commands [OPEN|CLOSE|STOP].
 * STOP state will be interpreted by reading input 1 and 2 at the same time having inputs > ACTIVE_THRESHOLD.
 */
const int OPEN_BUTTON  = A4;
const int CLOSE_BUTTON = A5;

/**
 * Active threshold; when voltage signal equals or greater than.
 */
const int ACTIVE_THRESHOLD = 1000;

/**
 * This is an int representing a second.
 * Could rather be in millis (unsigned long) to avoid extra processor operations.
 */
const int TIME_INTERVAL = 1;


/**
 * Each curtain maximum time (the time it takes for it to open or close completely).
 */
const int CURTAIN_MIN_TIME   = 0;
const int CURTAIN_1_MAX_TIME = 10;
const int CURTAIN_2_MAX_TIME = 15;

/**
 * The 3 states of the curtains as numbers {0,1,2}.
 */
const int STOP_STATE  = 0;
const int OPEN_STATE  = 1;
const int CLOSE_STATE = 2;

/**
 * Curtain timers accumulators.
 */
int curtain_timer = 0;

/**
 * The last calculated second [MEMORY].
 * And the time now as global as to avoid passing params in functions.
 */
unsigned long last_second = 0;
unsigned long now = 0;


/**
 * Main loop globals.
 */
int open                = 0;
int close               = 0;
int stop                = 1;
int is_currently_active = 0;

/**
 * Set pin modes and memory setup.
 */
void setup()
{
	Serial.begin(9600);

	// Setup output pins (digital).
	pinMode(CURTAIN_1_OPEN_PIN, OUTPUT);
	pinMode(CURTAIN_1_CLOSE_PIN, OUTPUT);
	pinMode(CURTAIN_2_OPEN_PIN, OUTPUT);
	pinMode(CURTAIN_2_CLOSE_PIN, OUTPUT);

	// Setup input pins (analog).
	pinMode(OPEN_BUTTON, INPUT);
	pinMode(CLOSE_BUTTON, INPUT);


	// If it's first time install write necesary variables.
	if (!EEPROM.read(SYSTEM_LIVE_STATE))
	{
		Serial.println("First Time Setup");

		// Set each curtain to a closed state timer [zero].
		EEPROM.write(CURTAIN_TIMER, CURTAIN_MIN_TIME);

		// Write: sets the current system state, should be STOP.
		EEPROM.write(SYSTEM_CURRENT_STATE, STOP_STATE);

		// Write that the system has been turned on for the first time.
		EEPROM.write(SYSTEM_LIVE_STATE, true);
	}

	// Set globals to the last saved state written in memory.
	curtain_timer       = EEPROM.read(CURTAIN_TIMER);
	is_currently_active = EEPROM.read(SYSTEM_CURRENT_STATE);
	last_second         = millis() / 1000; // Set the time here because you'll lose time reading memory.

	if (is_currently_active == STOP_STATE)
	{
		_stop();
	}
	if (is_currently_active == OPEN_STATE)
	{
		_open();
	}
	if (is_currently_active == CLOSE_STATE)
	{
		_close();
	}
}

/**
 * The main loop.
 */
void loop()
{
	delay(50);

	now   = millis() / 1000;
	open  = analogRead(OPEN_BUTTON);
	close = analogRead(CLOSE_BUTTON);
	stop  = open > ACTIVE_THRESHOLD && close > ACTIVE_THRESHOLD;

	int no_input = !stop && !open && !close;

	if (no_input && is_currently_active)
	{
		if (is_currently_active == OPEN_STATE)
		{
			return _open();
		}
		if (is_currently_active == CLOSE_STATE)
		{
			return _close();
		}
	}

	if (stop)
	{
		return _stop();
	}

	if (open > ACTIVE_THRESHOLD)
	{
		return _open();
	}

	if (close > ACTIVE_THRESHOLD)
	{
		return _close();
	}

	last_second = now;
}

/**
 * Turn low state all the output pins and set the system state to stop.
 */
void _stop()
{
	setState(STOP_STATE);

	Serial.println("Stop");

	digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
	digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);

	digitalWrite(CURTAIN_2_OPEN_PIN, LOW);
	digitalWrite(CURTAIN_2_CLOSE_PIN, LOW);

	last_second = now;
}

/**
 * Manage to open curtains 1 and 2.
 */
void _open()
{
	setState(OPEN_STATE);
	int curtains_opened = 0;

	if (oneSecond(now))
	{
		curtain_timer += 1;

		if (curtain_timer < CURTAIN_1_MAX_TIME)
		{
			Serial.print("Opening curtain 1 -> ");
			Serial.println(curtain_timer);

			digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_1_OPEN_PIN, HIGH);
		}
		else
		{
			curtains_opened += 1;

			digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
		}

		if (curtain_timer < CURTAIN_2_MAX_TIME)
		{
			Serial.print("Opening curtain 2 -> ");
			Serial.println(curtain_timer);

			digitalWrite(CURTAIN_2_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_2_OPEN_PIN, HIGH);
		}
		else
		{
			curtains_opened += 1;

			digitalWrite(CURTAIN_2_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_2_OPEN_PIN, LOW);
		}

		Serial.println("");

		EEPROM.write(CURTAIN_TIMER, curtain_timer);
	}

	if (curtains_opened == 2)
	{
		return _stop();
	}

	last_second = now;
}

/**
 * Manage to close curtains 1 and 2.
 */
void _close()
{
	setState(CLOSE_STATE);
	int curtains_closed = 0;

	if (oneSecond(now))
	{
		curtain_timer -= 1;

		if (curtain_timer > (CURTAIN_2_MAX_TIME - CURTAIN_1_MAX_TIME))
		{
			Serial.print("Closing curtain 1 -> ");
			Serial.println(curtain_timer);

			digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
			digitalWrite(CURTAIN_1_CLOSE_PIN, HIGH);
		}
		else
		{
			curtains_closed += 1;

			digitalWrite(CURTAIN_1_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_1_OPEN_PIN, LOW);
		}

		if (curtain_timer > CURTAIN_MIN_TIME && curtain_timer <= CURTAIN_2_MAX_TIME)
		{
			Serial.print("Closing curtain 2 -> ");
			Serial.println(curtain_timer);

			digitalWrite(CURTAIN_2_OPEN_PIN, LOW);
			digitalWrite(CURTAIN_2_CLOSE_PIN, HIGH);
		}
		else
		{
			curtains_closed += 1;

			digitalWrite(CURTAIN_2_CLOSE_PIN, LOW);
			digitalWrite(CURTAIN_2_OPEN_PIN, LOW);
		}

		Serial.println("");

		EEPROM.write(CURTAIN_TIMER, curtain_timer);
	}

	if (curtains_closed == 2)
	{
		return _stop();
	}

	last_second = now;
}

/**
 * Check if 1 second has elapsed sinced the last time millis() was called.
 */
bool oneSecond(unsigned long time_now)
{
	return ((unsigned long) time_now - last_second) == TIME_INTERVAL;
}

/**
 * Sets the system state as well as in EEPROM [memory].
 */
void setState(int state)
{
	// Do not write in memory if not needed to prolong memory lifespan.
	if (state == is_currently_active)
	{
		return;
	}

	EEPROM.write(SYSTEM_CURRENT_STATE, is_currently_active = state);
}
