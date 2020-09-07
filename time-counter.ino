#include <EEPROM.h>

const int SYSTEM_LIVE_STATE_ADDR = 0;

const int CURTAIN1_TIME_ADDR  = 0;
const int CURTAIN2_TIME_ADDR  = 1;
const int CURTAIN1_STATE_ADDR = 2;
const int CURTAIN2_STATE_ADDR = 3;

const int SEC_INTERVAL   = 1;

int curtain_1_max_time = 3;
int curtain_2_max_time = 5;

int curtain_1_state = LOW;
int curtain_2_state = HIGH;

unsigned long last_second = 0;

void setup()
{
  Serial.begin(9600);

  // If it's first time install write necesary variables.
  if (!EEPROM.read(SYSTEM_LIVE_STATE_ADDR))
  {
    // Write the timing for each curtain.
    EEPROM.write(CURTAIN1_TIME_ADDR, curtain_1_max_time);
    EEPROM.write(CURTAIN2_TIME_ADDR, curtain_2_max_time);

    // Set each curtain to a low state (OFF).
    EEPROM.write(CURTAIN1_STATE_ADDR, LOW);
    EEPROM.write(CURTAIN2_STATE_ADDR, LOW);

    // Write that the system has been turned on for the first time.
    EEPROM.write(SYSTEM_LIVE_STATE_ADDR, true);
  }

  // Set globals to the last saved state written in memory.
  curtain_1_state = EEPROM.read(CURTAIN1_STATE_ADDR);
  curtain_2_state = EEPROM.read(CURTAIN2_STATE_ADDR);
}

void loop()
{
  unsigned long seconds = millis() / 1000;

  if ((unsigned long)(seconds - last_second) == SEC_INTERVAL)
  {
    Serial.println(seconds);
  }


  last_second = seconds;
}

void toggleCurtain(int curtain)
{
  Serial.print("Curtain ");
  Serial.print(curtain);
  Serial.println("");
}
