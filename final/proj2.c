/*
    109321016
    Bo Rong Huang  at 2023/6/20
*/
#include <8051.h>

#define KP_NULL 120

#define KP_PORT P0
#define LED_PORT_P P1
#define LED_PORT_N P2
#define SPEKER P1_7

#define FTIME(X) (65536-(1000000/X))  //only constant
#define Hz0(X)  TH0 = (char)((FTIME(X))>>8);\
                TL0 = (char)(FTIME(X))

#define MODE_RECORD 0
#define MODE_PLAY 1

#define PLAYMOD_common 0
#define PLAYMOD_reverse 1

#define MAX_RECORD 510

const unsigned short tone[] = {
     4381, 7812,11051,14108,16997,19721,22292,24719,27010,29172,31213,33139,
    34957,36674,38293,39823,41265,42628,43913,45127,46273,47354,48374,49337,
    50246,51105,51914,52679,53401,54082,54725,55331,55904,56445,56955,57436,
    57891,58320,58725,59107,59468,59808,60130,60433,60720,60990,61245,61486,
    61713,61928,62130,62321,62502,62672,62833,62984,63128,63263,63390,63511,
    63624,63732,63833,63928,64019,64104,64184,64260,64332,64399,64463,64523,
    64580,64634,64684,64732,64777,64820,64860,64898,64934,64967,64999,65029,
    65058,65085,65110,65134,65156,65178,65198,65217,65235,65251,65267,65282,
    65297,65310,65323,65335,65346,65357,65367,65376,65385,65393,65401,65409,
    65416,65423,65429,65435,65441,65446,65451,65456,65460,65464,65468,65472,0
};


const unsigned char decode[16] = {0b00000011, 0b10011111, 0b00100101, 0b00001101, //0~9 : number 0~9
                                  0b10011001, 0b01001001, 0b01000001, 0b00011111, //11 : P. mean Play, 12: R. mean reverse
                                  0b00000001, 0b00001001, 0b01101100, 0b00110000,
                                  0b00010000, 0b10010000, 0b00100101, 0b11111111};
__bit silence = 1; //When silence == 1, disable speaker
__bit change;
__bit mode = MODE_RECORD;         //replay or record
__bit play_mode = PLAYMOD_common; //common or reverse
__bit play_fast = 0;              //normal or 2*speed

unsigned char key = 0x0c;      
unsigned degree = 48;               


unsigned char show[4];   //LED SHOW

__xdata unsigned char record_tone[MAX_RECORD];
__xdata unsigned char record_lengh[MAX_RECORD];
__xdata unsigned short record_ntone = 0;

unsigned short replay_point = 0;
unsigned short replay_lengh = 0;

unsigned short play_tone = 0;

char read_Keyboard()  // get keyboard value
{
    unsigned char rv;//return value
    __code const unsigned char Inputchar[4] = {0xEF, 0xDF, 0xBF, 0x7F};
    for(char c=0; c<4; c++){ // scan keyboard and get value
        KP_PORT = Inputchar[c];
        rv = ~(KP_PORT % 16); //input
        for(char t=0; t<4;t++){
            if(rv&1)return c * 4 + t;
            else
                rv >>= 1;
        }
    }
    return KP_NULL;
}

void timer_PLAY_tone(void) __interrupt (3) __using (2){
    TH1 = (char)(play_tone>>8);
    TL1 = (char)(play_tone);
    if(!silence){
        SPEKER = !SPEKER;
    }
}

void timer_(void) __interrupt (1) __using (1){ 
    Hz0(500);
    
    __code const unsigned char index[4] = {0xE,0xD,0xB,0x7};
    static unsigned char count = 0;

    //display LED
    ET1 = 0;
    LED_PORT_N = show[count];
    LED_PORT_P = (LED_PORT_P & 0xF0)|index[count];
    ET1 = 1;


    //Scan the keyboard every four interrupts (125HZ)
    count = (count+1)%4;
    if(!count){
        if(mode == MODE_PLAY){
            if(play_fast)
                replay_lengh += 2;
            else
                replay_lengh++;
        }
        else{
            record_lengh[record_ntone]++;
        }

        key = read_Keyboard();
    }

}



void main(){
    //initialize timer
    TMOD = 0x11;
    EA = 1;
    ET0 = 1;
    TR0 = 1;
    ET1 = 1;
    TR1 = 1;

    unsigned short Segshow = 0;
    
    unsigned char oldkey = KP_NULL;
    while(1){
        if(key != oldkey){
            oldkey = key;
            change = 1;
            switch (key)
            {
            case 0x0C: //start record
                Segshow = MAX_RECORD;
                change = 0;
                mode = MODE_RECORD;
                record_ntone = 0;
                play_tone = 0;
                silence = 1;
                record_tone[0] = KP_NULL;
                break;
            case 0x0D: //start replay
                change = 0;
                record_lengh[0] = 0;
                mode = MODE_PLAY;
                play_mode = PLAYMOD_common;
                play_fast = 0;
                replay_point = 0;
                replay_lengh = 0;
                break;
            case 0x0E: //When replay: reverse on/off;  When record: octave down.
                change = 0;
                if(mode == MODE_PLAY){
                    play_mode = !play_mode;
                    // replay_lengh = 0;
                    // replay_point = record_ntone ;
                }
                else{
                    if(degree >= 12)
                        degree -= 12;
                }
                break;
            case 0x0F: //When replay: change speed;  When record : octave up
                change = 0;
                if(mode == MODE_PLAY){
                    play_fast = !play_fast;
                    //replay_lengh = 0;
                    // replay_point = (play_mode == PLAYMOD_common)?0:record_ntone;
                }
                else{
                    if(degree <= 96)
                        degree += 12;
                }
                break;
            case KP_NULL:
                if(mode == MODE_RECORD){
                    silence = 1;
                }
                break;
            default: 
                if(mode == MODE_RECORD){
                    silence = 0;
                    play_tone = tone[degree + key];
                }
                break;
            }
        }

        if(mode == MODE_RECORD){ 
            show[3] = decode[degree/12]&0xFE; //display degree

            if(record_lengh[record_ntone] > 250)change = 1; 
            if(change){ //record current note
                record_ntone++;
                Segshow--;
                if(record_ntone == MAX_RECORD){
                    mode = MODE_PLAY;
                    continue;
                }
                if(key == KP_NULL)
                    record_tone[record_ntone] = KP_NULL;
                else
                    record_tone[record_ntone] = degree + key;
                record_lengh[record_ntone] = 0;
                change = 0;
            }
        }
        else{ //MODE_PLAY
            if(play_mode == PLAYMOD_reverse){
                if(replay_lengh >= record_lengh[replay_point]){
                    replay_lengh = 0;
                    replay_point--;
                    Segshow = replay_point;
                    if(replay_point == 0) replay_point = record_ntone;
                    play_tone = tone[record_tone[replay_point]];

                    if(record_tone[replay_point] == KP_NULL)silence = 1;
                    else silence = 0;
                }

                show[3] = decode[12];
            }
            else{ //common play
                if(replay_lengh >= record_lengh[replay_point]){
                    replay_lengh = 0;
                    replay_point++;

                    if(replay_point == record_ntone) replay_point = 0; //Loop play

                    play_tone = tone[record_tone[replay_point]];

                    if(record_tone[replay_point] == KP_NULL)silence = 1;
                    else silence = 0;

                    Segshow = record_ntone - replay_point;
                }
                show[3] = decode[11];
            }
        }
        show[2] = decode[(Segshow/100)%10];
        show[1] = decode[(Segshow/10)%10];
        show[0] = decode[Segshow%10];
    }
}