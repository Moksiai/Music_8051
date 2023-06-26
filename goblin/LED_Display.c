#include "LED_Display.h"

const unsigned char led_0_to_f[16] = { LED_A + LED_B + LED_C + LED_D + LED_E + LED_F,  //0
                        LED_E + LED_F,                                  //1
                        LED_A + LED_B + LED_G + LED_E + LED_D,          //2
                        LED_A + LED_B + LED_G + LED_C + LED_D,          //3
                        LED_B + LED_C + LED_G + LED_F,                  //4
                        LED_A + LED_F + LED_G + LED_C + LED_D,          //5
                        LED_C + LED_B + LED_G + LED_E + LED_D,          //6
                        LED_A + LED_B + LED_C + LED_F,                  //7
                        0b11111110,                                     //8
                        LED_A + LED_B + LED_C + LED_D + LED_G + LED_F,  //9
                        LED_A + LED_B + LED_C + LED_E + LED_G + LED_F,  //A
                        LED_E + LED_B + LED_G + LED_D,                  //B
                        LED_A + LED_F + LED_E + LED_D,                  //C
                        LED_B + LED_G + LED_E + LED_D,                  //D
                        LED_A + LED_F + LED_G + LED_E + LED_D,          //E
                        LED_A + LED_F + LED_G + LED_E,                  //F
};

void LED_Display(LED_Display_struct *LED,char oldKey,char key) {

	//4位數分別亮
	LED_PORT = ~led_0_to_f[LED->_1];
	CONTROL_PORT = 0b0111;
	DELAY(10, 10);
	LED_PORT = ~led_0_to_f[LED->_2];
	CONTROL_PORT = 0b1011;
	DELAY(10, 10);
	LED_PORT = ~led_0_to_f[LED->_3];
	CONTROL_PORT = 0b1101;
	DELAY(10, 10);
	LED_PORT = ~led_0_to_f[LED->_4];
	CONTROL_PORT = 0b1110;
	DELAY(10, 10);
	
	if(key != oldKey && key != 17){// shift left
		LED->_4 = LED->_3;
		LED->_3 = LED->_2;
		LED->_2 = LED->_1;
		LED->_1 = key;
	}


	
}