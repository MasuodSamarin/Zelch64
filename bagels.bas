!--------------------------------------------------
!- Friday, May 12, 2017 11:09:07 PM
!- Import of : 
!- c:\src\zelch64\bak\bagels.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8010 TX$="{clear}{down*6}{f1}BAGELS!!"+CR$+"{f1}READY TO{sh space}PLAY(Y/N)?{ct c}":GOSUB5
8020 C$="yn":GOSUB66:IFG=2THEN2000
8040 TX$="{f1}{down*3}OK, I'VE THOUGHT UP A{sh space}NUMBER!":GOSUB5:CT=1
8050 Z1(1)=INT(RND(TI)*9)+1:Z1(2)=INT(RND(TI)*9)+1:IFZ1(2)=Z1(1)THEN8050
8060 Z1(3)=INT(RND(TI)*9)+1:IFZ1(3)=Z1(2)ORZ1(3)=Z1(1)THEN8060
8070 Z1(4)=INT(RND(TI)*9)+1:IFZ1(4)=Z1(2)ORZ1(4)=Z1(1)ORZ1(4)=Z1(3)THEN8070
8080 TX$=CR$+"{f1}GUESS NUMBER"+STR$(CT)+":{ct c}":GOSUB5:GOSUB30:IFI$="q"THEN2000
8090 IFLEN(I$)<>4THENTX$="{f1}NUMBER MUST BE FOUR DIGITS.":GOSUB5:GOTO8080
8100 FORI=1TO4:Z2(I)=VAL(MID$(I$,I,1)):NEXT:A=0:FORI=1TO4:IFZ2(I)=0THENA=1
8110 NEXT:IFA=1THENTX$="{f1}NO ZEROS ALLOWED.":GOSUB5:GOTO8080
8120 TX$="":A=0:FORX=1TO4:FORY=1TO4:IFX<>YANDZ2(X)=Z2(Y)THENA=1
8130 NEXT:NEXT:IFA=1THENTX$="{f1}DIGITS MUST ALL{sh space}BE{sh space}DIFFERENT.":GOSUB5:GOTO8080
8140 FORX=1TO4:IFZ1(X)<>Z2(X)THENA=1
8150 NEXT:IFA=0THEN8200
8160 FORX=1TO4:FORY=1TO4:IFZ1(X)=Z2(Y)ANDX=YTHENTX$=TX$+"{f1}FERMA,":GOTO8180
8170 IFZ1(X)=Z2(Y)THENTX$=TX$+"{f1}PICO,"
8180 NEXT:NEXT:IFTX$=""THENTX$="{f1}BAGELS!":GOSUB5:CT=CT+1:GOTO8080
8190 TX$=LEFT$(TX$,LEN(TX$)-1):GOSUB5:CT=CT+1:GOTO8080
8200 TX$="{f1}YOU GOT IT{sh space}IN"+STR$(CT)+" GUESSES!"+CR$+"{f1}PLAY AGAIN(Y/N)?{ct c}":GOSUB5
8210 GOTO8020
