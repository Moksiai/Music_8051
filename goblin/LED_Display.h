#include <8051.h>

#ifndef DELAY
#define DELAY(a,b) for(int i = 0;i < a;i++)for(int j = 0;j < b;j++);
#endif // !DELAY
#define LED_A 0b10000000
#define LED_B 0b01000000
#define LED_C 0b00100000
#define LED_D 0b00010000
#define LED_E 0b00001000
#define LED_F 0b00000100
#define LED_G 0b00000010
#define LED_P 0b00000001
#define LED_PORT P2
#define CONTROL_PORT P1

typedef struct { // struct for led
    unsigned char _1 : 4;
    unsigned char _2 : 4;
    unsigned char _3 : 4;
    unsigned char _4 : 4;
}LED_Display_struct;

void LED_Display(LED_Display_struct *LED,char oldKey,char key);