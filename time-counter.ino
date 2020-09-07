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
const int CURTAIN1_TIME_ADDR     = 0;
const int CURTAIN2_TIME_ADDR     = 1;
const int CURTAIN1_STATE_ADDR    = 2;
const int CURTAIN2_STATE_ADDR    = 3;
const int SYSTEM_LIVE_STATE_ADDR = 0;

const int TIME_INTERVAL = 1;

const int CURTAIN_1_MAX_TIME = 3;
const int CURTAIN_2_MAX_TIME = 5;

int curtain_1_state = LOW;
int curtain_2_state = LOW;

unsigned long last_second = 0;

void setup()
{
	// If it's first time install write necesary variables.
	if (!EEPROM.read(SYSTEM_LIVE_STATE_ADDR))
	{
		// Write the timing for each curtain (change to zero) PROLLY DONT NEED THIS.
		EEPROM.write(CURTAIN1_TIME_ADDR, CURTAIN_1_MAX_TIME);
		EEPROM.write(CURTAIN2_TIME_ADDR, CURTAIN_2_MAX_TIME);

		// Set each curtain to a low state (OFF).
		EEPROM.write(CURTAIN1_STATE_ADDR, LOW);
		EEPROM.write(CURTAIN2_STATE_ADDR, LOW);

		// Write that the system has been turned on for the first time.
		EEPROM.write(SYSTEM_LIVE_STATE_ADDR, true);
	}

	// Set globals to the last saved state written in memory.
	curtain_1_state = EEPROM.read(CURTAIN1_STATE_ADDR);
	curtain_2_state = EEPROM.read(CURTAIN2_STATE_ADDR);

	Serial.begin(9600);
}

void loop()
{
	unsigned long now = millis() / 1000;

	if (oneSecond(now))
	{
		Serial.println("ONE SECOND");
	}

	last_second = now;
}

bool oneSecond(unsigned long now)
{
	return (unsigned long)(now - last_second) == TIME_INTERVAL;
}
