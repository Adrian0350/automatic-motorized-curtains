const int TIME_INTERVAL = 1;

int curtain_1_state = LOW;
int curtain_2_state = LOW;

unsigned long last_second = 0;

void setup()
{
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
