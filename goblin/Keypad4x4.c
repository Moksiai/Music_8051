#include "Keypad4x4.h"

char Keypad4x4() {
	/*P1 = 0x0f;
	unsigned short d0, d1;
	if (P1 != 0x0f) {
		DELAY
	}*/
	unsigned char row, col;
	__bit flag = 0;
	for (col = 1; col < 16; col <<= 1) {
		KEYPAD_PORT = ~(col << 4);
		if (KEYPAD_PORT % 0x10 != 0x0f) {
			return col;
			// flag = 1;
			// break;
			// KEYPAD_PORT = (~KEYPAD_PORT);
			// for(row = 1; row < 16; row <<= 1){
			// 	if(KEYPAD_PORT&row == 1){
			// 		flag = 1;
			// 		break;
			// 	}
			// }
			// if(flag)break;			
		}
		
	}
	
	if (flag == 0)
		return 17;
	return col;
	// for (unsigned char i = 1, j = 0; i < 16; i *= 2, j++) {
	// 	if (row == i)
	// 		row = j;
	// 	if (col == i)
	// 		col = j;
	// }	
	// col = 3-col;
	// row = 3-row;
	// row *= 4;
	// col += row;
	
	return col;

}