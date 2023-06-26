#include <8051.h>

#define FQ 5500 //Frequency
#define LED_PORT_P P1
#define LED_PORT_N P2
#define KB_PORT P0

unsigned char count;
unsigned char a[4];
unsigned char key = 0xf;

unsigned char decode[16] = {0b00000011, 0b10011111, 0b00100101, 0b00001101,
                            0b10011001, 0b01001001, 0b01000001, 0b00011111,
                            0b00000001, 0b00001001, 0b01000001, 0b00011111,
                            0b00000011, 0b10011111, 0b00100101, 0b11111111};

const unsigned short tone[] = {64400,64464,64522,64580,64634,64685,64733,64778,64820,64860,64898,64934,64968,65000,65030,65058};
const unsigned short tlengh[] = {9600, 4800, 7200, 2400, 3600, 1800, 1200};

char read_Keyboard()  // get keyboard value
{
    unsigned char rv;//return value
    
    for(char c=0; c<4; c++){ // scan keyboard and get value
        KB_PORT = ~(0x10<<c);
        rv = ~(KB_PORT % 16); //input
        for(char t=0; t<4;t++){
            if(rv&1==1)return c * 4 + t;
            else
                rv = rv >> 1;
        }
    }
    return 17;
}

void timer(void) __interrupt (1) __using (1){
    // 初始化timer的頻率
    TH0 = (char)((65536-FQ)>>8);
    TL0 = (char)(65536-FQ);
    
    //display LED
    unsigned char index[4] = {0xE,0xD,0xB,0x7};
    unsigned char indexN[4] = {0xE,0xD,0xB,0x7};
    LED_PORT_P = index[count];
    LED_PORT_N = decode[a[count]];

    //每四個interrupt掃描keyboard，切換顯示位置
    count = (count+1)%4;
    if(!count)
        key = read_Keyboard(); 
    

}

void main(){
    a[0] = a[1] = a[2] = a[3] = 0xf; //燈號初始化

    //初始化timer設定
    TMOD = 0x81;
    TH0 = (char)((65536-FQ)>>8);
    TL0 = (char)(65536-FQ);
    EA = 1;
    ET0 = 1;
    TR0 = 1;

    //切換LED顯示位置
    unsigned char oldkey = 17;
    while(1){
        if(key != oldkey){
            oldkey = key;
            if(key != 17){
                a[3] = a[2];
                a[2] = a[1];
                a[1] = a[0];
                a[0] = key;
            }
        }
    }
}