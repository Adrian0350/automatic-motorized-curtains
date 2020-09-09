#include <EEPROM.h>

void setup()
{
	EEPROM.write(0, 0);
	EEPROM.write(1, 0);
	EEPROM.write(2, 0);
	EEPROM.write(3, 0);
	EEPROM.write(4, 0);
	EEPROM.write(5, 0);
}

void loop()
{
}
