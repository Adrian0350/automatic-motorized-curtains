#include <EEPROM.h>

/**
 * OUTPUT Pins for 2 relays/curtains.
 */
const int RELAY_OPEN_PIN  = 8;
const int RELAY_CLOSE_PIN = 9;

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
 * GLOBALS
 */
int open  = 0;
int close = 0;
int stop  = 1;
int is_currently_active = 0;

int active_state = 0;

/**
 * Set pin modes and memory setup.
 */
void setup()
{
	pinMode(RELAY_OPEN_PIN, OUTPUT);
	pinMode(RELAY_CLOSE_PIN, OUTPUT);

	pinMode(OPEN_BUTTON, INPUT);
	pinMode(CLOSE_BUTTON, INPUT);

	EEPROM.write(0, 0);

	Serial.begin(9600);
}

void loop()
{
	open  = analogRead(OPEN_BUTTON);
	close = analogRead(CLOSE_BUTTON);
	stop  = open && close;

	is_currently_active = EEPROM.read(0);

	if (is_currently_active && (!open && !close))
	{
		if (is_currently_active == 1)
		{
			return _open();
		}
		if (is_currently_active == 2)
		{
			return _close();
		}

		EEPROM.write(0, is_currently_active = 0);
	}

	if (open > ACTIVE_THRESHOLD && close > ACTIVE_THRESHOLD)
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
}

void _stop()
{
	EEPROM.write(0, 0);

	Serial.println("STOP");
	digitalWrite(RELAY_OPEN_PIN, LOW);
	digitalWrite(RELAY_CLOSE_PIN, LOW);
	delay(50);
}

void _open()
{
	EEPROM.write(0, 1);

	Serial.println("OPEN");
	digitalWrite(RELAY_CLOSE_PIN, LOW);
	delay(50);
	digitalWrite(RELAY_OPEN_PIN, HIGH);
}

void _close()
{
	EEPROM.write(0, 2);

	Serial.println("CLOSE");
	digitalWrite(RELAY_OPEN_PIN, LOW);
	delay(50);
	digitalWrite(RELAY_CLOSE_PIN, HIGH);
}
