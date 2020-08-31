#include <EEPROM.h>

/**
 * OUTPUT Pins for 2 relays/curtains.
 */
const int RELAY_UP_PIN   = 8;
const int RELAY_DOWN_PIN = 9;

/**
 * INPUT Analog pins for 2 button commands, up and down.
 */
const int DOWN_BUTTON    = A4;
const int UP_BUTTON      = A5;


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
 * 1 byte will sufice for each relay state/time.
 *
 *
 * Extra notes:
 *	An EEPROM write takes 3.3 ms to complete.
 *	The EEPROM memory has a specified life of 100,000 write/erase cycles,
 *	so you may need to be careful about how often you write to it.
 */
const int RELAY_UP_TIME_ADDR   = 0;
const int RELAY_DOWN_TIME_ADDR = 1;

int down_button     = 0;
int up_button       = 0;

boolean relay_up_state   = false;
boolean relay_down_state = false;

/**
 * Set pin modes and memory setup.
 */
void setup()
{
	pinMode(RELAY_UP_PIN, OUTPUT);
	pinMode(RELAY_DOWN_PIN, OUTPUT);

	pinMode(DOWN_BUTTON, INPUT);
	pinMode(UP_BUTTON, INPUT);

	Serial.begin(9600);
}

void loop()
{
	int down_button = analogRead(DOWN_BUTTON);
	int up_button   = analogRead(UP_BUTTON);

	if (down_button > 1020 && up_button > 1020)
	{
		digitalWrite(RELAY_UP_PIN, LOW);
		digitalWrite(RELAY_DOWN_PIN, LOW);
	}

	if (down_button > 1020)
	{
		digitalWrite(RELAY_UP_PIN, HIGH);
	}
	else
	{
		digitalWrite(RELAY_UP_PIN, LOW);
	}


	if (up_button > 1020)
	{
		digitalWrite(RELAY_DOWN_PIN, HIGH);
	}
	else
	{
		digitalWrite(RELAY_DOWN_PIN, LOW);
	}
}
