#include <DigiKeyboard.h>
#define KEY_ARROW_LEFT 80
#define KEY_ARROW_RIGHT 79
#define KEY_ARROW_DOWN 81
#define KEY_ARROW_UP 82

const uint8_t sequence[] PROGMEM = {
  KEY_ARROW_DOWN, KEY_ARROW_LEFT, KEY_ARROW_DOWN, KEY_ARROW_UP, KEY_ARROW_RIGHT
};

const int sequenceLength = sizeof(sequence) / sizeof(sequence[0]);

void setup() {
  DigiKeyboard.delay(9000);
  DigiKeyboard.enableLEDFeedback();
}

void loop() {
  for (int i = 0; i < sequenceLength; i++) {
    uint8_t key = pgm_read_byte_near(sequence + i);
    DigiKeyboard.sendKeyStroke(key);
    DigiKeyboard.delay(800);
  }

  DigiKeyboard.delay(5000);
}