#include "LED_Display.h"
#include "Keypad4x4.h"
#define CONTROL_PORT P1

void main() {
	char oldKey = 17,key = 17;
	LED_Display_struct LED = {0xf, 0xf, 0xf, 0xf}; //四位初始設定為f


	while (1) {
		
		DELAY(100,10)
		int key =  Keypad4x4();
		
		LED_Display(&LED, oldKey, key);
		//P0 = Keypad4x4() + 0xe0;
		
		oldKey = key;
	}
	
}


// void main() {
// 	TMOD = 0x11;	//timer control byte
// 	EA = ET0 = ET1 = TR0 = TR1 = 1;	
// 	while(1);
// 	// while (1) {		//每四次瘸任一次keypad 20 hz
// 	// 	speaker = s[toPlay[music]];	
// 	// }
// }

// void timer0_isr(void) __interrupt(1) __using(1) {
// 	SETTIME0(CLOCK);
// 	interrupt_count++;
// 	if(interrupt_count >= 10)		//時間頻率會超過65535 所以分成10次interrupt 0.625跳一次
// 	{			
// 		interrupt_count = 0;		//歸0
// 		music++;
// 		if(music >= 96)				//如果樂譜跑到底 重跑
// 			music = 0;
			
// 	}

		
// }

// void timer1_isr(void) __interrupt(3) __using(2) {
// 	SETTIME1(s[toPlay[music]]);
// 	P1_7 ^= 1;		//蜂鳴器震動
// }