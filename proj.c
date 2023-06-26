#include <8051.h>

#define KP_NULL 17

#define KB_PORT P0

#define FTIME(X) (1000000/X)  //限輸入常數
#define Hz1(X)   TH1 = (char)((65536-FTIME(X))>>8);\
                TL1 = (char)(65536-FTIME(X))

#define LED_PORT_P P1
#define LED_PORT_N P2
#define SPEKER P1_7

#define MODE_RECORD 0x00
#define MODE_PLAY 0x01
#define MODE_PLAYSLOW 0x02
#define MODE_PLAYFAST 0x03

#define MAX_RECORD 200

const unsigned short tone[] = {64580,64634,64684,64732,64777,64820,64860, 64898 ,64934,64967,64999,65029,0};

const unsigned char decode[16] = {0b00000011, 0b10011111, 0b00100101, 0b00001101,
                            0b10011001, 0b01001001, 0b01000001, 0b00011111,
                            0b00000001, 0b00001001, 0b01101100, 0b00110000,
                            0b11100010, 0b10010000, 0b00100101, 0b11111111};
__bit silence = 1;
__bit change;

unsigned char key = KP_NULL;
unsigned char mode = MODE_RECORD;


unsigned char show[4];

__xdata unsigned char record_tone[MAX_RECORD];
__xdata unsigned short record_lengh[MAX_RECORD];
__xdata unsigned char record_ntone = 0;
unsigned char replay_point;
unsigned short replay_lengh;

unsigned short play_tone;

char read_Keyboard()  // get keyboard value
{
    unsigned char rv;//return value
    __code const unsigned char Inputchar[4] = {0xEF, 0xDF, 0xBF, 0x7F};
    for(char c=0; c<4; c++){ // scan keyboard and get value
        KB_PORT = Inputchar[c];
        rv = ~(KB_PORT % 16); //input
        for(char t=0; t<4;t++){
            if(rv&1)return c * 4 + t;
            else
                rv >>= 1;
        }
    }
    return KP_NULL;
}

void timer_PLAY_tone(void) __interrupt (1) __using (1){
    TH0 = (char)(play_tone>>8);
    TL0 = (char)(play_tone);
    if(!silence){
        SPEKER = !SPEKER;
    }
}

void timer_(void) __interrupt (3) __using (2){ 
    // 初始化timer的頻率
    Hz1(500);
    
    __code const unsigned char index[4] = {0xE,0xD,0xB,0x7};
    static unsigned char count = 0;

    //display LED
    LED_PORT_P = (LED_PORT_P & 0xF0)|index[count];
    LED_PORT_N = show[count];


    //每四個interrupt掃描keyboard，切換顯示位置 (50HZ)
    count = (count+1)%4;
    if(!count){
        switch (mode)
        {
        case MODE_RECORD:
            record_lengh[record_ntone]+=2;
            break;
        case MODE_PLAYFAST:
            replay_lengh+=2;
        case MODE_PLAY:
            replay_lengh++;
        case MODE_PLAYSLOW:
            replay_lengh++;
            break;
        default:
            break;
        }

        key = read_Keyboard();
    }

}



void main(){
    //初始化timer設定
    TMOD = 0x11;
    EA = 1;
    ET0 = 1;
    TR0 = 1;
    ET1 = 1;
    TR1 = 1;

    //切換LED顯示位置
    unsigned char oldkey = KP_NULL;
    while(1){
        if(key != oldkey){
            oldkey = key;
            change = 1;
            switch (key)
            {
            case 0x0C:
                change = 0;
                mode = MODE_RECORD;
                record_ntone = 0;
                silence = 1;
                break;
            case 0x0D:
                change = 0;
                record_lengh[0] = 0;
                mode = MODE_PLAYSLOW;
                replay_point = 0;
                replay_lengh = 0;
                break;
            case 0x0E:
                change = 0;
                record_lengh[0] = 0;
                mode = MODE_PLAY;
                replay_point = 0;
                replay_lengh = 0;
                break;
            case 0x0F:
                change = 0;
                record_lengh[0] = 0;
                mode = MODE_PLAYFAST;
                replay_point = 0;
                replay_lengh = 0;
                break;
            case KP_NULL:
                if(mode == MODE_RECORD){
                    silence = 1;
                }
                break;
            default:
                if(mode == MODE_RECORD){
                    silence = 0;
                    play_tone = tone[key];
                }
                break;
            }
        }
        if(mode == MODE_RECORD){
            unsigned char Segshow = MAX_RECORD-record_ntone;
            show[3] = decode[10];
            show[2] = decode[(Segshow/100)%10];
            show[1] = decode[(Segshow/10)%10];
            show[0] = decode[Segshow%10];

            if(record_lengh[record_ntone] > 65500)change = 1;
            if(change){
                record_ntone++;
                if(record_ntone == MAX_RECORD){
                    mode = MODE_PLAY;
                    continue;
                }
                record_tone[record_ntone] = key;
                record_lengh[record_ntone] = 0;
                change = 0;
            }
        }
        else{
            if(replay_lengh >= record_lengh[replay_point]){
                replay_lengh = 0;
                replay_point++;
                if(replay_point == record_ntone) replay_point = 0;
                play_tone = tone[record_tone[replay_point]];

                if(record_tone[replay_point] == KP_NULL)silence = 1;
                else silence = 0;
            }
            unsigned char Segshow = record_ntone - replay_point;
            show[3] = decode[10+mode];
            show[2] = decode[(Segshow/100)%10];
            show[1] = decode[(Segshow/10)%10];
            show[0] = decode[Segshow%10];
        }
    }
}