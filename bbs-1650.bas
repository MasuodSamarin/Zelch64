!--------------------------------------------------
!- Saturday, May 20, 2017 2:21:36 PM
!- Import of : 
!- c:\src\zelch64\bbs-1650.prg
!- Commodore 64
!--------------------------------------------------
1 GOTO10
10 PRINTCHR$(14)
11 GOTO25
12 IFP0>100THENP0$(100)="log full":RETURN
13 P0$(P0)=E$:P0=P0+1:RETURN
25 CLOSE5:OPEN5,2,3,CHR$(6)
30 DIMTT$(50),Z1(50),Z2(50),P0$(100),DA(12):POKE53280,0
40 DA(1)=31:DA(2)=28:DA(3)=31:DA(4)=30:DA(5)=31:DA(6)=30:DA(7)=31:DA(8)=31
45 DA(9)=30:DA(10)=31:DA(11)=30:DA(12)=31
50 IFPEEK(702)<>16THENGOTO230
60 POKE702,0:MN=PEEK(703):DA=PEEK(704)
70 GOTO290
80 POKE56579,32:POKE56577,0:RETURN
88 FORI=0TO9:POKE721+I,PEEK(43+I):NEXT:SYS51971:LOADI$,8:
90 POKE56579,6:POKE56577,2:RETURN
100 IN$="":SYS38200:IFPEEK(830)=1THEN1230
101 IFPEEK(197)=5ANDPEEK(653)=1THEN106
102 IFPEEK(197)=6THEN107
103 IFPEEK(197)<>5THENRETURN
104 PRINTCHR$(13)+"CURRENT{sh space}ACCESS:"+STR$(AC)
105 INPUT"NEW{sh space}ACCESS";AC:RETURN
106 T1=0:T2=6:GOSUB1700:PRINT"6hr BURST":RETURN
107 TX$=CHR$(13)+"Hold on...":GOSUB210:PRINT"F1 aborts..enters chat"
108 POKE720,1:RETURN
111 I=0:SYS38206:IFPEEK(830)>0THEN1230
112 IFI$=""ORLEN(I$)>4THENRETURN
113 IFVAL(I$)>0THENI=VAL(I$)
114 RETURN
120 IFOU$=""THENRETURN
130 POKE254,ASC(OU$):SYS38203:RETURN
190 SYS38206:POKE710,0:IFPEEK(830)=1THEN1230
200 RETURN
210 IFTX$=""THENRETURN
220 SYS 38209,TX$:POKE710,0:RETURN
230 PRINT"{yellow}";:MN=PEEK(703):DA=PEEK(704):O=PEEK(709)
240 PRINT"Put your data disk in drive 8"
250 PRINT"and press {reverse on}return{reverse off}"
260 GETA$:IFA$<>CHR$(13)THEN260
270 POKE56334,PEEK(56334)AND254:POKE1,PEEK(1)AND251:POKE788,0:POKE789,203
280 POKE1,PEEK(1)OR4:POKE56334,PEEK(56334)OR1
290 OPEN1,8,15,"i0":OPEN8,8,8,"0:{pound}variables,s,r":INPUT#8,BN$:INPUT#1,E1
300 IFE1<>0THENCLOSE8:CLOSE1:PRINT"{up*2}";:POKE646,INT(RND(TI)*15)+1:GOTO240
310 INPUT#8,MD,CD$,CC$,CE$,CF$,CG$,SG:DIMSG$(SG),SG(SG),SD(SG),SF(SG)
314 FORI=0TOSG:INPUT#8,SG$(I),SG(I),SD(I),SF(I):NEXTI
315 INPUT#8,UD:DIMUD$(UD),UA(UD),UV(UD)
316 FORI=0TOUD:INPUT#8,UD$(I),UA(I),UV(I):NEXTI:FORI=0TO9:INPUT#8,CA(I),TM(I)
320 NEXTI:INPUT#8,UL,CH$,CI$:INPUT#8,NP:DIMFL(NP):FORI=0TONP:INPUT#8,FL(I)
330 CLOSE8:CLOSE1
380 OPEN8,8,8,"0:{pound}last caller,s,r":INPUT#8,L1$:SYS38230:L2$=I$:INPUT#8,LZ
389 INPUT#8,HN:CLOSE8:CLOSE1
390 PRINT"{clear}{down*11}{yellow}";BN$:C1=0:POKE682,0:POKE714,0:POKE705,0:GOSUB80
400 POKE53280,0:POKE53281,0:PRINT"{pink}BBS mode: {yellow}{reverse on}F1{reverse off} for menu":POKE829,0
410 PRINT"{cyan}{reverse on}F3{reverse off} to log-on":POKE896,0:POKE720,0:I=300:FH=1:GOSUB6230
430 PRINT"{light blue}Last caller=";L1$:POKE720,0
440 PRINT"{blue}{yellow}Logged off at:";L2$
450 PRINT"{purple}Calls today:";STR$(PEEK(733))
460 SYS38215:PRINT"{home}{down}{right*2}{white}TIME=";I$+"{black}"
470 A$=LEFT$(I$,2):B$=RIGHT$(I$,2):A=VAL(A$)
480 IFA=11ANDB$="pm"ANDPEEK(712)<>15THENPOKE712,15:GOTO1530
485 IFA=12ANDB$="am"ANDPEEK(712)<>15THENPOKE712,15:GOTO1530
490 IFPEEK(712)=15ANDVAL(A$)<12ANDB$="am"THENPOKE712,0
500 GETQ$:IFQ$="{f1}"THEN580
520 IFQ$="{f3}"THENPOKE714,1:POKE830,0:POKE720,1:GOTO690
530 IF(PEEK(56577)AND8)=8THEN460
540 CT=0:GOSUB90:
550 A=PEEK(56577):IF(AAND16)=0THENPOKE830,0:GOTO690
560 CT=CT+1:IFCT<6THENFORI=0TO900:NEXT:GOTO550
570 GOTO390
580 PRINT"{yellow}{clear}menu"
590 PRINT"1)Return to BBS
600 PRINT"2)Monster mode
610 PRINT"3)Zelch (Zap){sh space}Term"
620 PRINT"4)Read Feedback"
621 PRINT"5)View log"
630 GETA$:IFA$=""THEN630
640 IFA$="1"THEN390
650 IFA$="2"THENDD=1:GOTO1530
660 IFA$="3"THEN6810
665 IFA$="4"THENFI$="{pound}feedback":GOSUB5690
667 IFA$="5"THENFI$="{pound}Log!":GOSUB5690
680 GOTO630
690 CLOSE1:CLOSE2:CLOSE7:CLOSE8:FORI=0TO50:GET#5,A$:NEXT
700 POKE681,0:TX$=CHR$(13)+CHR$(13)+"{white*2}connection!!!":GOSUB210
701 SYS38215:E$=I$+" Call":GOSUB12
710 TX$=CHR$(13)+CHR$(13)+"hit return:{ct c}":GOSUB210
720 TI$="000000"
730 GOSUB100:IFVAL(TI$)>59THEN1230
740 IFIN$<>CHR$(13)ANDIN$<>CHR$(10)THEN730
750 NA$="":TX$=CHR$(13)+CHR$(13)+"using commodore graphics?{ct c}":GOSUB210
760 TI$="000000"
770 GOSUB100:IFVAL(TI$)>59THEN1230
780 IFIN$=CHR$(110)THENIN$=CHR$(206)
790 IFIN$=CHR$(121)THENIN$=CHR$(217)
800 IFIN$="n"ORIN$="N"THENOU$=IN$:GOSUB120:GOTO830
810 IFIN$<>"Y"ANDIN$<>"y"THEN770
820 POKE681,1:OU$=IN$:GOSUB120
830 NN=1:FI$="{pound}opening msg":GOSUB1200:T1=1:T2=0:GOSUB1710
840 CLOSE2:CLOSE1:CLOSE8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog":CT=0
850 CT=CT+1:IFCT=6THENTX$="GOODBYE!":GOSUB210:GOTO1230
860 TX$=CHR$(13)+"{yellow}Enter your ID number :{ct c}":GOSUB210:GOSUB111
870 IFI=0ANDI$<>"new"THEN850
880 NA=VAL(I$):IFI$="new"THENCLOSE1:CLOSE2:I$="{pound}prg.new":GOTO88
900 C2=INT(NA/256):I3=C2*256:C1=NA-I3
910 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(90):GET#2,A$:INPUT#1,E1
920 IFA$=""ORE1>0THEN970
930 SYS38233:PS$=A$+I$
940 TX$=CHR$(13)+"{pink}Enter your password  :{ct c}":GOSUB210:POKE710,1:GOSUB190
950 IFI$=PS$THENCLOSE1:CLOSE2:GOTO990
960 TX$="{red}Invalid PASSWORD":GOSUB210:GOTO850
970 TX$="{red}Invalid ID":GOSUB210:TX$="{white}New Users type NEW at the ID prompt"
980 GOSUB210:GOTO850
990 TX$="{clear}{home}Loading info":GOSUB210:GOSUB1440:AC=VAL(AC$):E$=NA$:GOSUB12
991 T2=INT(TM(AC)/10):T1=TM(AC)-(T2*10):GOSUB1700
1000 POKE1,53:PRINT"{clear}{pink}{reverse on}Hndl:{reverse off}{white}";NA$;TAB(23);"{reverse on}{light blue}Acs:{reverse off}{white}";AC$
1010 SYS38215:PRINT"{reverse on}{yellow}Name:{reverse off}{white}";RN$;TAB(23);"{reverse on}{light green}Time on:{reverse off}{white}";I$
1020 SYS38239:PRINT"{reverse on}{cyan}ID#  {white}{reverse off}";STR$(NA);TAB(23);"{reverse on}{cyan}Off at:{white}{reverse off}"+I$
1030 PP=VAL(P$(0))+256*VAL(P$(1))
1040 TX$="{yellow}Welcome Back "+NA$+"!":GOSUB210:POKE733,PEEK(733)+1:SYS38215
1050 CA=VAL(CA$):IFPEEK(709)=1THENOPEN4,4,7:PRINT#4,NA$;":";I$:PRINT#4:CLOSE4
1060 IFCA>CA(AC)THENTX$="{red}Daily Call Limit Exceeded!":GOSUB210:GOTO1230
1070 TX$="{white}You may make "+STR$((CA(AC))-CA)+" more calls today."
1080 GOSUB210:TX$="{cyan}You are caller #"+STR$(LZ):GOSUB210:Q$=CHR$(13)
1090 TX$="{blue}Last Call:"+LC$+Q$+"{light blue} Off at:"+TM$:GOSUB210
1100 TX$="{green}Last Caller:"+L1$+Q$+"{light green} Off at:"+L2$:GOSUB210
1105 TX$="{light gray}There are "+STR$(HN-PP)+" new messages":GOSUB210
1110 TX$="{blue}Checking for mail!":GOSUB210:I3=0
1120 OPEN8,MD,8,"0:{pound}mail"+STR$(NA)+",s,r":GET#8,A$:CLOSE8
1130 IFST<>0THENTX$="{white}NO mail.. (SORRY)":GOSUB210:GOTO1150
1140 TX$="{white}You Have Mail!{ct g}":GOSUB210
1150 IFAC<4THEN1190
1160 OPEN8,8,8,"0:{pound}newsfile,s,r":GET#8,A$:CLOSE8
1170 IFST<>0THENTX$="{red}No News":GOSUB210:GOTO1190
1180 TX$="{yellow}System {purple}News{white}:{ct c}":GOSUB210:OPEN8,8,8,"0:{pound}newsfile,s,r":SYS38212:CLOSE8
1190 IFVAL(P$(2))<=BATHEN2120
1191 TX$="{yellow}Change to "+P$(2)+" Baud?{ct c}":GOSUB210:
1192 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO2120
1193 IFIN$<>"y"THEN1192
1194 TX$="y"+CHR$(13)+"{pink}Change and hit {reverse on}RETURN{reverse off}{ct c}":GOSUB210:I=VAL(P$(2))
1195 FH=1:GOSUB6230:GOSUB6370:GOTO2120
1200 IFNN=1THENOU$="{clear}":GOSUB120
1210 IFVD<8ORVD>11THENVD=8
1220 OPEN8,VD,8,"0:"+FI$+",s,r":SYS38212:CLOSE8:NN=0:VD=0:RETURN
1230 CLOSE1:CLOSE2:CLOSE8:CLOSE9:CLOSE7
1240 POKE1,55:IFPEEK(830)=1THENTX$="{red}Time UP!!":GOSUB210
1250 POKE703,MN:POKE704,DA
1260 IFNA$=""THENPOKE702,16:GOTO1345
1270 FI$="{pound}closing msg":GOSUB1200
1280 IFPEEK(709)=1THENOPEN4,4,7:SYS38215:PRINT#4,"off at:";I$:PRINT#4:CLOSE4
1290 CA$=STR$(VAL(CA$)+1)
1300 SYS38215:TM$=I$:LC$=STR$(MN)+"/"+STR$(DA):C2=INT(NA/256):C3=C2*256
1310 C1=NA-C3:GOSUB1350:TX$="{red}{reverse on}Bye...":GOSUB210
1311 PRINT"{white}{reverse on}Saving Log...":OPEN8,8,8,"0:{pound}Log!,s,r":CLOSE8:OPEN1,8,15
1312 INPUT#1,E:CLOSE1:IFE=0THEN1317
1313 OPEN8,8,8,"0:{pound}Log!,s,w":PRINT#8,"start":CLOSE8
1317 IFP0=0THEN1320
1318 OPEN8,8,8,"0:{pound}Log!,a":FORI=0TOP0-1:PRINT#8,P0$(I):NEXTI
1319 SYS38215:PRINT#8,"off at:"+I$:PRINT#8,CHR$(1):CLOSE8
1320 OPEN1,8,15,"s0:{pound}last caller":CLOSE1:SYS38215
1330 OPEN8,8,8,"0:{pound}last caller,s,w":PRINT#8,NA$+"  ":LC$=LC$+" "+I$:PRINT#8,LC$
1340 PRINT#8,LZ+1:PRINT#8,HN:CLOSE8:OPEN1,8,15,"i0":CLOSE1:POKE702,16
1345 GOSUB80:CLOSE5:RUN
1350 CLOSE1:CLOSE2:CLOSE8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog":GOTO1370
1360 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(I):RETURN
1370 I=5:GOSUB1360:PRINT#2,NA$:I=25:GOSUB1360:PRINT#2,PH$:I=35:GOSUB1360
1380 PRINT#2,AC$:I=40:GOSUB1360:PRINT#2,RN$:I=60:GOSUB1360:PRINT#2,LC$
1390 I=80:GOSUB1360:PRINT#2,TM$:I=90:GOSUB1360:PRINT#2,PS$:CT=0
1395 IFY0=1THENY0=0:GOTO1410
1400 I2=INT(HN/256):P$(1)=STR$(I2):I2=I2*256:I1=HN-I2:P$(0)=STR$(I1)
1410 FORI=100TO145STEP5:GOSUB1360:PRINT#2,P$(CT):CT=CT+1:NEXT:CLOSE1:CLOSE2
1420 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}calls"
1430 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(1):PRINT#2,CA$:CLOSE1:CLOSE2:RETURN
1440 EQ=0:CLOSE1:CLOSE2:CLOSE8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog":GOTO1470
1460 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(I):SYS38233:RETURN
1470 I=5:GOSUB1460:INPUT#1,E1:IFE1>0THENCLOSE1:CLOSE2:RETURN
1480 NA$=I$:I=25:GOSUB1460:PH$=I$:I=35:GOSUB1460:AC$=I$:I=40:GOSUB1460:RN$=I$
1490 I=60:GOSUB1460:LC$=I$:I=80:GOSUB1460:TM$=I$:I=90:GOSUB1460:PS$=I$:CT=0
1500 FORI=100TO145STEP5:GOSUB1460:P$(CT)=I$:CT=CT+1:NEXT:CLOSE1:CLOSE2
1510 OPEN1,8,15:OPEN2,8,2,"0:{pound}calls":PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(1)
1520 SYS38233:CA$=I$:CLOSE1:CLOSE2:RETURN
1530 POKE712,15:POKE733,0:PRINT"{clear}{down*3}{reverse on}{green}monster mode"
1540 PRINT"user update":C1=1:C2=0:PRINT"Counting users..."
1550 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
1560 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(25):GET#2,A$:INPUT#1,E1
1580 IFA$=""ORE1>0THENCLOSE1:CLOSE2:GOTO1620
1590 PRINT"{home}{down*6}";STR$(C1+256*C2)
1600 C1=C1+1:IFC1=256THENC1=0:C2=C2+1:
1610 GOTO1560
1620 PRINTCHR$(13)+"Saving Calls..."
1630 OPEN1,8,15,"s0:{pound}calls":OPEN2,8,2,"0:{pound}calls,l,"+CHR$(6):C=C1+256*C2
1640 FORI=1TOC:C2=INT(I/256):C3=C2*256:C1=I-C3
1650 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(1):PRINT#2,"0":NEXTI:CLOSE1:CLOSE2
1660 PRINT"Validating Disk...":CLOSE1:OPEN1,8,15,"v0":CLOSE1
1670 IFDD=0THENDA=DA+1:IFDA>DA(MN)THENMN=MN+1:DA=1:IFMN=13THENMN=1
1680 DD=0:POKE703,MN:POKE704,DA:POKE709,O
1690 GOTO390
1700 REM
1710 H=PEEK(56587):M=PEEK(56586):S=PEEK(56585):T=PEEK(56584):CH=0
1720 IFH>128THENCH=128
1730 H3=(HAND16)/16:H2=(HAND15):H1=H3*10+H2:M1=(MAND240)/16:M2=(MAND15)
1760 M1=M1+T1:IFM1>=6THENM1=M1-6:T2=T2+1
1775 IFT2=0THEN1820
1780 H1=H1+1:T2=T2-1:IFH1=13THENH1=1
1790 IFH1<>12THEN1820
1800 IFCH=128THENCH=0:GOTO1820
1810 IFCH=0THENCH=128
1820 IFT2>0THEN1780
1821 H3=INT(H1/10):H4=H3*10:H2=H1-H4:
1830 H=(16*H3)+H2+CH:M=(16*M1)+M2
1840 POKE896,H:POKE897,M:RETURN
2120 SYS38215:TX$=CHR$(13)+CHR$(13)+"{green}TIME={light green}"+I$+"{white}:(?):{blue}C{light blue}O{cyan}M{white}M{yellow}A{pink}N{red}D{white}:{ct c}"
2121 GOSUB210:IFPEEK(681)=1THENTX$="{cm w}{up}{cm e}{down}{cm q}{down}{left*2}{cm r}{left}{up}{ct c}":GOSUB210
2130 GOSUB100:IFIN$=""ORIN$=" "THEN2130
2140 G=0:IFIN$="?"THENFI$="{pound}mainmenu"+STR$(AC):NN=1:GOSUB1200:GOTO2120
2150 FORI=1TOLEN(CD$):IFIN$=MID$(CD$,I,1)THENG=I:IFAC<VAL(MID$(CC$,I,1))THENG=0
2160 NEXTI:IFG=0THEN2130
2161 E$="cmd:"+MID$(CD$,G,1):GOSUB12:TX$=IN$+CHR$(13):GOSUB210
2170 ONGGOTO2200,2250,2190,2270,2340,2440,3735,3145,4050,5165
2175 G=G-10:ONGGOTO5740,6200,6250,6500,7200
2180 GOTO2120
2190 FI$="{pound}info":NN=1:GOSUB1200:GOTO2120
2200 TX$="FEEDBACK?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)<>"y"THEN2230
2210 FF$="{pound}feedback":QQ$="BY:"+NA$+" ID#"+STR$(NA):SYS38215
2220 QD$="ON:"+STR$(MN)+"/"+STR$(DA)+" AT:"+I$:V1=8:GOSUB2480
2230 IFPEEK(765)<>1THEN2120
2240 POKE765,0:GOTO1230
2250 TX$="OFF?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)="y"THENPOKE765,1:GOTO2200
2260 GOTO2120
2270 TX$="Page the SYSOP?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)<>"y"THEN2120
2280 TX$="Making noises...":GOSUB210:POKE53280,1:FORI=54272TO54296
2290 POKEI,0:NEXTI:POKE54296,15:POKE54277,8:POKE54278,255:POKE54276,21:I2=255
2300 FORI=1TO40:POKE54287,I2:OU$=">":GOSUB120:FORI1=255TO0STEP-10:POKE54273,I1
2310 I2=I2-.1:NEXTI1:NEXTI:POKE54278,15:GOTO2120
2320 IFPEEK(682)=0THEN2120
2330 POKE682,0:RETURN
2340 TX$=CHR$(13)+"{light gray}{reverse on}RETURN{reverse off} or String:{ct c}":GOSUB210:GOSUB190:IFI$=""THEN2439
2345 OPEN8,8,8,"0:{pound}members,s,r":S$=I$:I=0:SYS38230:TX$=I$:GOSUB210
2350 SYS38230:IFI$=""THENCLOSE8:GOTO2120
2355 Y$=RIGHT$(LEFT$(I$,LEN(I$)-1),LEN(I$)-LEN(STR$(I))-4)
2360 IFMID$(Y$,1,LEN(S$))=S$THENTX$=I$:GOSUB210
2370 I=I+1:GOSUB100:IFIN$=" "THENCLOSE8:GOTO2120
2380 GOTO2350
2439 FI$="{pound}members":GOSUB1200:GOTO2320
2440 TX$=CHR$(13)+"{blue}--------------------":GOSUB210:TX$="Status: ":GOSUB210
2450 TX$="{cyan}Handle:"+NA$:GOSUB210:TX$="{white}Real Name:"+RN$:GOSUB210:SYS38215
2460 TX$="{yellow}Access:"+AC$:GOSUB210:TX$="{pink}Time:"+I$:GOSUB210:SYS38239
2470 TX$="{white}Logoff:"+I$:GOSUB210:TX$="{blue}--------------------":GOSUB210:GOTO2120
2480 REM MSG MKR
2520 IFPEEK(764)<>3THENFORI=0TO50:TT$(I)=CHR$(144):NEXTI:LN=0:UP=0
2530 POKE764,0:A=FRE(0):POKE763,0:TX$="{clear}{reverse on}{pink}message{white} {light blue}maker{white}!{reverse off}":GOSUB210
2540 TX$="type *h for help"+CHR$(13)+"50 lines max. go: ":GOSUB210
2550 GOSUB190:IFI$=""THENI$=CHR$(144)
2560 TT$(LN)=I$:K$="":Q$=LEFT$(TT$(LN),2):IFLEFT$(Q$,1)="*"THENK$=RIGHT$(Q$,1)
2561 IFK$="u"ANDPEEK(681)=1ANDUP=0THENUP=1:OU$=CHR$(142):GOSUB120:GOTO2550
2562 IFK$="u"ANDUP=1THENUP=0:OU$=CHR$(14):GOSUB120:GOTO2550
2563 IFK$="w"ANDPEEK(705)=1THENPOKE705,0:TX$="w/w off":GOSUB210:GOTO2550
2564 IFK$="w"ANDPEEK(705)=0THENPOKE705,1:TX$="w/w on":GOSUB210:GOTO2550
2570 IFK$=""THEN2610
2580 G=0:FORI=1TOLEN(CE$):IFK$=MID$(CE$,I,1)THENG=I
2590 NEXTI:IFG=0THEN2610
2600 ONGGOTO2630,2640,3070,2970,2960,2900,2950,3040,2840
2610 IFLN>49THENTX$="50 lines MAX!":GOSUB210:GOTO2550
2620 LN=LN+1:GOTO2550
2630 FI$="{pound}msgmkr help":GOSUB1200:GOTO2550
2640 TX$="save..(y/n){ct c}":GOSUB210:
2650 GOSUB100:IFIN$=""THEN2650
2660 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2670 IFIN$<>"y"THEN2640
2675 IFS0=1THENS0=0:OPEN1,8,15,"s0:"+FF$:CLOSE1:GOTO2700
2680 TX$="saving...":GOSUB210:OPEN8,V1,8,"0:"+FF$+",s,r":CLOSE8:OPEN1,V1,15
2690 INPUT#1,E1:CLOSE1:IFE1<20THEN2710
2700 OPEN8,V1,8,"0:"+FF$+",s,w":GOTO2720
2710 OPEN8,V1,8,"0:"+FF$+",a":PRINT#8,CHR$(1)
2720 IFQQ$<>""ANDQD$<>""THENPRINT#8,QQ$:PRINT#8,QD$:PRINT#8,CHR$(2)
2730 TT$(LN)=CHR$(144):I=0:IFUP=1THENPRINT#8,CHR$(142)+CHR$(147)
2740 PRINT#8,TT$(I):IFI<LN-1THENI=I+1:GOTO2740
2750 CLOSE8:TX$="saved!":GOSUB210
2755 OPEN1,8,15:INPUT#1,E,E$:CLOSE1:IFE>0THENGOSUB12
2759 GOTO2890
2760 X=1:TX$="change:{ct c}":GOSUB210:GOSUB190:I3=LEN(I$):I4=LEN(TT$(Q))
2770 IFI$=""THEN2550
2780 IFMID$(TT$(Q),X,I3)=I$THEN2810
2790 X=X+1:IFX<=I4THEN2780
2800 TX$="not found!":GOSUB210:GOTO2550
2810 I1=X-1:I2=I4-X-I3+1:I1$=LEFT$(TT$(Q),I1):I2$=RIGHT$(TT$(Q),I2)
2820 TX$="to:{ct c}":GOSUB210:GOSUB190:TT$(Q)=I1$+I$+I2$:IFTT$(Q)=""THENTT$(Q)="{black}"
2830 GOTO2550
2840 TX$="abort..(y/n){ct c}":GOSUB210
2850 GOSUB100:IFIN$=""THEN2850
2860 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2870 IFIN$<>"y"THEN2840
2880 POKE763,1
2890 POKE705,0:QQ$="":QD$="":UP=0
2891 S0=0:FORI=0TO50:TT$(I)="":NEXTI:A=FRE(0):OU$=CHR$(14):GOSUB120:RETURN
2900 TX$="clear..(y/n){ct c}":GOSUB210
2910 GOSUB100:IFIN$=""THEN2910
2920 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2930 IFIN$<>"y"THEN2900
2940 GOTO2520
2950 GOSUB6450:IFER=1THEN2550
2952 TX$=TT$(Q):GOSUB210
2953 GOSUB100:IFIN$=" "THEN2550
2954 Q=Q+1:IFQ<=LN-1THEN2952
2956 GOTO2550
2960 GOSUB6450:IFER=1THEN2550
2962 TX$=STR$(Q)+"):"+TT$(Q)+CHR$(0):GOSUB210
2963 GOSUB100:IFIN$=" "THEN2550
2964 Q=Q+1:IFQ<=LN-1THEN2962
2965 GOTO2550
2970 TX$="from (0-"+STR$(LN-1)+"){ct c}":GOSUB210:GOSUB111:S1=I:IFS1>LN-1THEN2550
2990 TX$="to ("+STR$(S1)+"-"+STR$(LN-1)+"){ct c}":GOSUB210:GOSUB111:
3010 S2=I:IFS2>LN-1ORS2<S1THEN2550
3020 S3=S2-S1+1:FORI=S1TOLN:TT$(I)=TT$(I+S3):NEXTI:LN=LN-S3:IFLN<0THENLN=0
3030 A=FRE(0):GOTO2550
3040 GOSUB6450:IFER=1THEN2550
3050 S1=Q:IFLN+1>50THEN2550
3060 FORI=LNTOS1+1STEP-1:TT$(I)=TT$(I-1):NEXTI:TT$(S1)="{black}":LN=LN+1:GOTO2550
3070 GOSUB6450:IFER=1THEN2550
3090 SYS38209,TT$(Q):TX$="e)dit or r)ewrite?{ct c}":GOSUB210
3100 GOSUB100:IFIN$=""THEN3100
3110 TX$=IN$:GOSUB210:IFIN$="e"THEN2760
3120 IFIN$<>"r"THEN2550
3130 TX$="rewrite: ":GOSUB210:GOSUB190:IFI$<>""THENTT$(Q)=I$:
3140 GOTO2550
3145 I$="{pound}prg.user":GOTO88
3150 IFAC>6THENTX$=CHR$(13)+"{white}SysOp:{ct c}":GOSUB210:GOSUB190:IFI$="q"THEN2120
3160 IFI$="?"THENFI$="{pound}sysopmenu":NN=1:GOSUB1200:GOTO3150
3170 IFI$="d"THENDV=8:GOTO3230
3180 IFI$="l"THENPOKE682,1:GOSUB2340:POKE682,0
3190 IFI$="e"THEN8005
3215 IFI$="m"THENGOSUB6900:GOTO3220
3216 IFI$="t"THENGOSUB6981
3220 GOTO3150
3230 TX$=CHR$(13)+STR$(DV)+":{ct c}":GOSUB210:GOSUB190:IFI$=""THEN3150
3240 Q$=LEFT$(I$,1):IFQ$="@"ANDLEN(I$)>2THENQ$=RIGHT$(I$,LEN(I$)-2):GOTO3320
3250 IFQ$="w"ANDLEN(I$)>2THENFF$=RIGHT$(I$,LEN(I$)-2):GOTO3370
3260 IFQ$="e"ANDLEN(I$)>2THENFF$=RIGHT$(I$,LEN(I$)-2):GOTO3400
3270 IFQ$="@"THENI$="":GOTO3300
3280 IFQ$="$"THENPOKE253,0:OPEN8,DV,0,I$:SYS38224:CLOSE8:GOTO3230
3285 IFQ$="%"THEN6480
3290 IFLEN(I$)<4ANDVAL(I$)>7ANDVAL(I$)<11THENDV=VAL(I$):GOTO3230
3300 OPEN1,DV,15,I$:INPUT#1,E1,E1$,E2,E3:CLOSE1
3310 TX$=STR$(E1)+","+E1$+","+STR$(E2)+","+STR$(E3):GOSUB210:GOTO3230
3320 OPEN8,DV,8,"0:"+Q$+",s,r"
3330 SYS38212:IFPEEK(253)=0THENCLOSE8:GOTO3230
3340 TX$=CHR$(14)+"{white}Cont or Skip:{ct c}":GOSUB210:GOSUB190:IFI$="c"ORI$=""THEN3330
3350 IFI$="s"THENSYS38218:GOTO3340
3360 GOTO3340
3370 QQ$="":QD$="":S0=1:V1=DV:GOSUB2480:POKE764,0:GOTO3230
3400 TX$="Loading msg...":GOSUB210:OPEN8,DV,8,"0:"+FF$+",s,r":GET#8,I$
3405 IFST>0THEN3450
3410 QQ$="":CLOSE8:OPEN8,DV,8,"0:"+FF$+",s,r":LN=0:FORI=0TO50:TT$(I)="{black}":NEXTI
3420 SYS38230:IFPEEK(253)=1THEN3440
3425 IFI$=CHR$(142)+CHR$(147)THENUP=1:GOTO3420
3430 SYS38209,I$:TT$(LN)=I$:LN=LN+1:GOTO3420
3440 QD$="":CLOSE8:SYS38209,I$:A=FRE(0):TT$(LN)=I$:LN=LN+1:POKE764,3:GOTO3370
3450 CLOSE8:GOTO3230
3735 TX$="{clear}{down*2}{light blue} Email Section...":GOSUB210:OPEN8,MD,8,"0:{pound}mail"+STR$(NA)
3736 GET#8,A$:CLOSE8:OPEN1,8,15:INPUT#1,E,E$,Q,Q:CLOSE1
3737 IFE<>0THENTX$="{down}{light green}No Mail Waiting."
3738 IFE=0THENTX$="{down}{light green}Mail Waiting!"
3739 GOSUB210:FI$="{pound}emailmenu":GOSUB1200
3740 TX$="{white}Email:{ct c}":Q$=CHR$(13):GOSUB210
3750 GOSUB100:IFIN$="q"THEN2120
3760 IFIN$="?"THENFI$="{pound}emailmenu":NN=1:GOSUB1200:GOTO3740
3770 IFIN$="r"THENWH=0:GOTO3890
3780 IFIN$="u"THENPOKE682,1:GOSUB2340:POKE682,0:GOTO3740
3800 IFIN$<>"s"THEN3750
3810 TX$=Q$+"User ID#{ct c}":GOSUB210:GOSUB111:I7=I:IFI=0THEN3740
3830 I2=I7/256:I3=I2*256:I4=I7-I3:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
3840 PRINT#1,"p"CHR$(98)CHR$(I4)CHR$(I2)CHR$(5):GET#2,A$:INPUT#1,E1:CLOSE1
3850 IFA$=""ORE1>0THENCLOSE1:CLOSE2:TX$="Not found!":GOSUB210:GOTO3740
3855 SYS38233:I$=A$+I$:CLOSE2:CLOSE1:IFI$="EMPTY"ORNA=I7THENE1=5:GOTO3850
3860 QQ$="FROM:"+NA$+" ID#"+STR$(NA):SYS38215:QD$="ON:"+STR$(MN)+"/"+STR$(DA)
3870 QD$=QD$+" AT:"+I$:V1=MD:FF$="{pound}mail"+STR$(I7):GOSUB2480:IFMF=0THENGOTO3740
3880 MF=0:GOTO3890
3890 TX$="Mail...":GOSUB210:OPEN8,MD,8,"0:{pound}mail"+STR$(NA)+",s,r":GET#8,A$
3900 IFST>0ANDWH=0THENTX$="No Mail Found!":GOSUB210:CLOSE8:GOTO3740
3910 B=0:IFWH=0THEN3940
3920 SYS38218:GET#8,E$:IFASC(E$)=199THEN4030
3930 B=B+1:IFB<WHTHEN3920
3940 GET#8,A$:IFA$<>"#"ANDST=0THEN3940
3950 SYS38230:I7=VAL(I$):CLOSE8:OPEN8,MD,8,"0:{pound}mail"+STR$(NA)
3960 IFWH>0THENFORI=1TOWH:SYS38218:NEXTI
3970 SYS38212:
3980 CLOSE8:TX$=CHR$(14)+"R)eply A)gain N)ext:{ct c}":GOSUB210
3990 GOSUB100:IFIN$="a"THENTX$="a":GOSUB210:OPEN8,MD,8,"0:{pound}mail"+STR$(NA)
3995 GOTO3960
4000 IFIN$="n"THENWH=WH+1:TX$="n":GOSUB210:GOTO3890
4010 IFIN$<>"r"THEN3990
4020 TX$="r":GOSUB210:MF=1:GOTO3830
4030 CLOSE8:OPEN1,MD,15,"s0:{pound}mail"+STR$(NA):CLOSE1:TX$="Mail Deleted!":GOSUB210
4040 GOTO3740
4050 CS=0:TX$="{clear}{light blue}{down}Sig System!{white}":GOSUB210:I$="{pound}prg.read":GOTO88
4055 GOSUB4060:GOTO4260
4060 TX$="{cyan}{down}Entering Sig"+STR$(CS+1):GOSUB210:VD=SD(CS):CM=0:I1=0:I2=0:J0=0
4070 FI$="{pound}sigmsg"+STR$(CS):GOSUB1200:OPEN1,8,15:OPEN2,8,2,"0:{pound}Sig"+STR$(CS)
4075 FORI=1TONM:Z1(I)=0:Z2(I)=0:NEXTI:GOTO 4090
4080 PRINT#1,"p"CHR$(98)CHR$(J)CHR$(0)CHR$(I):SYS38233:RETURN
4090 J=1:I=1:GOSUB4080:NM=VAL(I$):I=7:GOSUB4080:MP=VAL(I$):FORJ=2TONM+1
4100 I=1:GOSUB4080:Z1(J-1)=VAL(I$):I=7:GOSUB4080:Z2(J-1)=VAL(I$)
4110 I1=I1+Z1(J-1):IFZ2(J-1)>PPTHENJ0=J0+1:
4120 NEXTJ:CLOSE2:CLOSE1
4130 TX$=CHR$(13)+STR$(NM)+" {cyan}{reverse on}Bulletins and "+STR$(I1)+" Responses":GOSUB210
4140 TX$=STR$(J0)+" {light blue}{reverse on}New Bulletins/Responses":GOSUB210:RETURN
4150 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}Sig"+STR$(CS):GOTO4170
4160 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(J):RETURN
4170 I=1:J=1:GOSUB4160:PRINT#2,NM:J=7:GOSUB4160:PRINT#2,MP:CLOSE2:CLOSE1:RETURN
4180 OPEN1,8,15:OPEN2,8,2,"0:{pound}Sig"+STR$(CS):I=I+1:J=1:GOSUB4160:PRINT#2,A:J=7
4190 GOSUB4160:PRINT#2,B:CLOSE2:CLOSE1:RETURN
4220 MP=1:GOTO4910
4260 IFWI=1THENCM=CM+1:GOTO4800
4265 IFKD=1THEN6620
4270 TX$=CHR$(14)+CHR$(13)+"{yellow}{reverse on}Sig{reverse off}"+STR$(CS+1)+"{white}:{ct c}":GOSUB210:G=0
4280 GOSUB100:IFIN$=""ORIN$=" "THEN4280
4285 IFIN$=CHR$(13)THEN6650
4290 IFIN$="?"THENFI$="{pound}msgmenu":NN=1:GOSUB1200:GOTO4270
4300 FORI=1TOLEN(CF$):IFIN$=MID$(CF$,I,1)THENG=I:IFAC<VAL(MID$(CG$,I,1))THENG=0
4305 NEXTI:IFG>0THENE$="msg:"+MID$(CF$,G,1):GOSUB12:TX$=IN$:GOSUB210
4310 IFG>0THENONGGOTO4330,4360,8005,4720,4790,2120,4840,4940,5120,6600
4320 GOTO4280
4330 TX$="Sigs: ":GOSUB210:FORI=0TOSG:IFSG(I)>ACTHEN4350
4340 TX$=STR$(I+1)+"):"+SG$(I):GOSUB210
4350 NEXTI:GOTO4260
4360 TX$="{white}New Sig:{ct c}":GOSUB210:GOSUB111:IFI=0THEN4260
4370 Q=I-1:IFQ=CSOR(Q>SG)THEN4260
4380 IFAC>=SG(Q)THENCS=Q:GOSUB4060
4390 GOTO4260
4690 TX$="Num to Skip:{ct c}":GOSUB210:GOSUB111:IFI=0THEN8050
4700 I9=I:IFI9>Z1(CM)THEN8190
4710 GOTO8100
4720 I=1:IFI>NMTHEN4260
4730 OPEN8,SD(CS),8,"0:{pound}msg"+STR$(CS)+STR$(I)::SYS38230:I$=RIGHT$(I$,LEN(I$)-2)
4740 I$=" P"+I$:CLOSE8:GOSUB100:IFIN$=" "THEN4260
4750 TX$="Msg #"+STR$(I)+":"+STR$(Z1(I))+" Responses":GOSUB210:SYS38209,I$
4760 GOSUB100:IFIN$=" "THEN4260
4770 I=I+1:IFI>NMORI<1THEN4260
4780 GOTO4730
4790 CM=1:WI=0:TX$="Search...":GOSUB210
4800 IFCM>NMTHENTX$=CHR$(13)+"Search Complete.":GOSUB210:WI=0:GOTO4260
4805 G=3:IFZ2(CM)>PPTHENWI=1:GOTO8020
4810 CM=CM+1:GOTO4800
4840 V1=SD(CS):TX$="{white}Post a Message?:{ct c}":GOSUB210
4850 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO4260
4860 IFIN$<>"y"THEN4850
4865 TX$="y":GOSUB210:Q$=CHR$(13)
4870 QQ$="{clear}POSTED BY:"+NA$+"{reverse off}{white} ID#"+STR$(NA)+Q$+"ON:"+STR$(MN)+"/"+STR$(DA)
4880 TX$=Q$+"Subject:{ct c}":GOSUB210:GOSUB190:S$=I$:IFI$=""THEN4260
4890 SYS38215:QD$="TIME:"+I$+" SUBJECT:"+S$+"{reverse off}{white}"+Q$:IFSF(CS)>NMTHENNM=NM+1
4900 S0=1:MP=MP+1:IFMP>=SF(CS)THEN4220
4910 FF$="{pound}msg"+STR$(CS)+STR$(MP):GOSUB2480:IFPEEK(763)=1THENNM=NM-1:GOTO4260
4920 TX$="Fixing...":GOSUB210:GOSUB4150:I=MP:Z1(MP)=0:Z2(MP)=HN+1:HN=HN+1
4930 A=Z1(MP):B=Z2(MP):GOSUB4180:GOTO4260
4940 IFVAL(P$(5))=CS+1ORVAL(P$(5))=100THEN4945
4941 GOTO4270
4945 V1=SD(CS):TX$="Msg #{ct c}":GOSUB210:GOSUB111:IFI=0THEN4260
4950 M=I:T=Z1(M):IFM>NMORT=0THEN4260
4960 OPEN1,V1,15,"s0:msg":PRINT#1,"r0:msg={pound}msg"+STR$(CS)+STR$(M):CLOSE1:CT=1
4970 TX$="Storing Bulletin...":GOSUB210:OPEN8,V1,8,"0:msg,s,r"
4980 OPEN9,V1,9,"0:{pound}msg"+STR$(CS)+STR$(M)+",s,w"
4990 SYS38230:IFI$<>CHR$(1)THENPRINT#9,I$:GOTO4990
5000 MM=Z1(M)
5010 TX$="Save response #"+STR$(CT)+"?{ct c}":GOSUB210:GOSUB190:IFI$=""THEN5010
5020 IFI$="n"THEN5090
5030 IFI$<>"y"THEN5010
5040 PRINT#9,CHR$(1)
5045 SYS38230:IFI$=CHR$(1)THEN5070
5050 IFPEEK(253)=1THENPRINT#9,I$:A=FRE(0):GOTO5070
5060 PRINT#9,I$:GOTO5045
5070 IFCT=MMTHEN5110
5080 CT=CT+1:GOTO5010
5090 SYS38218:Z1(M)=Z1(M)-1:IFZ1(M)=0ORCT=MM:5110
5100 GOTO5080
5110 CLOSE8:CLOSE9:OPEN1,8,15,"s0:msg":CLOSE1:A=Z1(M):B=Z2(M):I=M:GOSUB4180
5111 GOTO4260
5120 IFVAL(P$(5))=CS+1ORVAL(P$(5))=100THEN5125
5121 GOTO4270
5125 V1=SD(CS):TX$="Delete Msg #{ct c}":GOSUB210:GOSUB111:IFI=0ORI>NMTHEN4260
5140 TX$="Standby...":GOSUB210:OPEN1,V1,15,"s0:{pound}msg"+STR$(CS)+STR$(I)
5150 FORX=ITONM:PRINT#1,"r0:{pound}msg"+STR$(CS)+STR$(X)+"={pound}msg"+STR$(CS)+STR$(X+1)
5160 Z1(X)=Z1(X+1):Z2(X)=Z2(X+1):NEXTX:CLOSE1:IFMP>=ITHENMP=MP-1
5161 Q=I:FORG=QTONM:A=Z1(G):B=Z2(G):I=G:GOSUB4180:NEXTG:NM=NM-1:GOSUB4150
5162 GOTO4260
5165 TX$="{clear}{down}{pink}Upload/Download system!":GOSUB210:TX$="{down}{yellow}In UD"+STR$(CU+1)
5166 GOSUB210:OPEN8,UV(CU),0,"$:z=u":SYS38245:CLOSE8:TX$="{white}{down}There are"
5167 TX$=TX$+STR$(PEEK(707)+256*PEEK(708))+" blocks free here":GOSUB210
5170 TX$="{down*2}{pink}U{white}/{yellow}D{white}"+STR$(CU+1)+":{ct c}":GOSUB210
5180 GOSUB100:IFIN$=""THEN5180
5190 G=0:IFIN$="?"THENFI$="{pound}udmenu":NN=1:GOSUB1200:GOTO5170
5200 FORI=1TOLEN(CH$):IFMID$(CH$,I,1)=IN$THENG=I:IFVAL(MID$(CI$,I,1))>ACTHENG=0
5210 NEXTI:IFG=0THEN5180
5220 TX$=IN$:GOSUB210:ONGGOTO5250,2120,5270,5460,6300,6330,6430
5250 TX$="{clear}Directory...":GOSUB210
5260 POKE253,64+CU:OPEN8,UV(CU),0,"$0:"+CHR$(64+CU)+"*":SYS38224:CLOSE8:GOTO5170
5270 POKE512,0:TX$="{white}UPLOAD!":GOSUB210:GOSUB6391:IFER=1THEN5170
5310 FI$=I$:IFLEFT$(I$,1)<>"{pound}"THENFI$=CHR$(64+CU)+I$
5320 GOSUB5640:IFER=1THEN5170
5325 GOSUB6400
5330 TX$="{clear}{down}O.K. Go To Send!!":GOSUB210
5360 TI$="000000"
5370 GETA$:IFA$="a"THEN5620
5380 IFPEEK(830)=1THEN1230
5390 IFVAL(TI$)>40THEN5620
5400 GET#5,A$:IFA$="a"ORA$="A"THEN5620
5410 IFA$<>"g"ANDA$<>"o"ANDA$<>"k"THEN5370
5420 SYS49173:SYS49161:IFPEEK(512)=1THEN5620
5421 IFFH=0THENE$="ul:"+FI$:GOSUB12:P$(3)=STR$(VAL(P$(3))+1)
5430 OPEN1,UV(CU),15,"i0":OPEN2,UV(CU),2,"0:"+FI$:INPUT#1,E:IFE>0THEN5620
5440 FORI=1TO1300:NEXTI:SYS61310:SYS49173:SYS49155
5450 FORX=1TO1000:NEXTX:POKE668,PEEK(667):YU=1:GOTO5620
5460 POKE512,0:TX$="{white}DOWNLOAD!":GOSUB210:GOSUB6391:IFER=1THEN5170
5490 FI$=I$:GOSUB5640:IFII$<>"{pound}"THENFI$=CHR$(64+CU)+FI$
5500 FI$=FI$+"r":OPEN1,UV(CU),15,"i0":OPEN2,UV(CU),2,"0:"+FI$:INPUT#1,E
5510 IFE>1THENCLOSE1:CLOSE2:GOTO5170
5520 TX$="{clear}{down}O.K. Go To Receive!!":GOSUB210
5550 TI$="000000"
5560 GETA$:IFA$="a"THEN5620
5570 IFPEEK(830)=1THEN1230
5575 IFVAL(TI$)>40THEN5620
5580 GET#5,A$:IFA$="a"ORA$="A"THEN5620
5590 IFA$<>"g"ANDA$<>"o"ANDA$<>"k"THEN5560
5600 POKE51227,TY:SYS49173:SYS49164:IFPEEK(512)=1THEN5620
5601 IFFH=0THENE$="dl:"+FI$:GOSUB12:P$(4)=STR$(VAL(P$(4))+1)
5610 SYS49173:POKE51224,255:SYS49158
5620 CLOSE1:CLOSE2
5625 IFFH=1THENFH=0:GOTO6830
5630 IFYU=0THEN5170
5631 OPEN8,UV(CU),0,"$0:z=u":SYS38245:CLOSE8:IFPEEK(707)>20ORPEEK(708)>0THEN5170
5632 OPEN1,UV(CU),15,"s0:"+LEFT$(FI$,LEN(FI$)-4):PRINT#1,"v":CLOSE1:GOTO5170
5640 ER=0:TX$="{pink}P)RG{white} or {yellow}S)EQ{white}:{ct c}":GOSUB210
5650 GOSUB100:IFIN$=""THEN5650
5655 IFIN$=CHR$(13)THENER=1
5660 TX$=IN$:GOSUB210:IFIN$="p"THENFI$=FI$+",p,":TY=1:RETURN
5670 IFIN$="s"THENFI$=FI$+",s,":TY=2:RETURN
5680 GOTO5640
5690 PRINT"{clear}":OPEN8,8,8,"0:"+FI$+",s,r"
5700 SYS38212:IFPEEK(253)=0THENCLOSE8:GOTO390
5710 PRINT"Hit RETURN:"
5720 GETA$:IFA$<>CHR$(13)THEN5720
5730 GOTO5700
5740 I$="{pound}prg.vote":GOTO88
6200 IFPEEK(659)=8THENTX$="1200 baud cannot change":GOSUB210:GOTO2120
6201 TX$="Baud is:"+STR$(BA):GOSUB210:TX$="New Baud (RETURN):{ct c}":GOSUB210
6210 GOSUB111:IFI=0THEN2120
6220 IFI<200ORI>500THEN2120
6225 TX$="Change baud and hit RETURN{ct c}":GOSUB210:POKE659,6
6230 BA=I:A=1022730/BA/2:GOSUB6249:POKE51196,I1:POKE51197,I2:A=1022730/BA
6240 GOSUB6249:POKE665,I1:POKE666,I2:A=1022730/BA/2-100:GOSUB6249
6241 POKE661,I1:POKE662,I2:POKE659,6
6244 IFFH=1THENFH=0:RETURN
6245 GOSUB100:IFIN$<>CHR$(13)THEN6245
6248 GOTO2120
6249 I2=INT(A/256):I3=I2*256:I1=A-I3:RETURN
6250 TX$="{clear}{light green}Text Library Subsection"+CHR$(13)+CHR$(13):GOSUB210
6251 FI$="@txt 0":VD=UL:GOSUB1200
6252 TX$=CHR$(14)+"{light blue}File #{white}:?:{cyan}Q=QUIT{white}:{ct c}":GOSUB210:GOSUB190:IFI$=""THEN6252
6253 IFI$="q"ORLEN(I$)>4THEN2120
6254 IFI$="?"THENA=0:GOTO6260
6255 A=VAL(I$):IFA<1THEN6252
6260 FI$="@txt"+STR$(A):NN=1:VD=UL:GOSUB1200:IFPEEK(252)=0THEN6252
6270 TX$="hit return{ct c}":GOSUB210:GOSUB6370:GOTO6252
6300 TX$="UD Sections:"
6301 FORI=0TOUD:IFAC>=UA(I)THENTX$="{white}"+STR$(I+1)+"):"+UD$(I):GOSUB210
6310 NEXTI:GOTO5170
6330 TX$="{cyan}New UD{white}:{ct c}":GOSUB210:GOSUB111:IFI=0ORI>UD+1THEN5170
6345 IFAC<UA(I-1)THEN5170
6350 CU=I-1:TX$="{yellow}{down}In UD"+STR$(CU+1):GOTO5166
6370 GOSUB100:IFIN$<>CHR$(13)THEN6370
6390 TX$=" ":GOSUB210:RETURN
6391 ER=0:TX$="{white}Filename:{ct c}":GOSUB210:GOSUB190:IFI$=""ORLEN(I$)>14THENER=1
6392 FORL=1TOLEN(I$):L$=MID$(I$,L,1):IFL$="*"ORL$=","ORL$="?"ORL$="$"THENER=1
6394 IFL$=":"ORL$=";"ORL$="#"ORL$="{ct c}"THENER=1
6395 NEXTL:RETURN
6400 TX$="{white}Now enter a description of the file":GOSUB210:TX$="Hit Return"
6410 GOSUB210:GOSUB6370:FF$="^"+CHR$(64+CU)+MID$(FI$,2,LEN(FI$)-4)
6420 S0=1:V1=UV(CU):GOSUB2480:RETURN
6430 GOSUB6391:IFER=0THENFI$="^"+CHR$(64+CU)+I$:VD=UV(CU):GOSUB1200
6445 GOTO5170
6450 Q=0:ER=0:E$=RIGHT$(TT$(LN),LEN(TT$(LN))-2):IFLEN(E$)>4THENER=1:GOTO6470
6460 Q=VAL(E$):IFQ>LN-1ORQ<0THENTX$="bad #":GOSUB210:ER=1
6470 RETURN
6480 I$=RIGHT$(I$,LEN(I$)-1):OPEN8,DV,0,"$"+I$:SYS38242:CLOSE8
6490 TX$=STR$(PEEK(706))+" files counted":GOSUB210:GOTO3230
6500 I$="{pound}prg.var":GOTO88
6600 TX$="{white}Start...":GOSUB210:KD=0
6605 IFJ0>0THENG=3:KD=1:GOTO4790
6606 GOTO6620
6610 GOSUB4060:IFJ0>0THENG=3:KD=1:GOTO4790
6620 CS=CS+1:IFCS>SGTHENTX$="Done.":GOSUB210:CS=CS-1:KD=0:GOTO4260
6625 IFSG(CS)>ACTHENTX$="Done.":GOSUB210:CS=CS-1:KD=0:GOTO4260
6630 GOTO6610
6650 TX$=" ":GOSUB210:CM=CM+1:G=3:GOTO8020
6700 OPEN8,8,8,"0:{pound}newqs,s,r":GET#8,B$:I=0
6701 SYS38230:NQ$(I)=I$:GET#8,B$:IFST>0THEN6710
6702 IFI<9THENI=I+1:GOTO6701
6710 CLOSE8:FORX=0TOI:TX$=NQ$(X)+"{ct c}":GOSUB210:GOSUB190:NA$(X)=I$:NEXTX
6720 TX$="Is this all correct?{ct c}":GOSUB210
6730 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO6710
6735 IFIN$<>"y"THEN6730
6740 TX$="y":GOSUB210:OPEN8,8,8,"0:{pound}newinfo,s,r":GET#8,I$:IFST=0THEN6750
6745 CLOSE8:OPEN8,8,8,"0:{pound}newinfo,s,w":PRINT#8,"start"
6750 CLOSE8:OPEN8,8,8,"0:{pound}newinfo,a":PRINT#8,CHR$(1):PRINT#8,"#"+STR$(ID)+" ";
6760 PRINT#8,NN$:FORX=0TOI:PRINT#8,NQ$(X)+NA$(X):NEXTX:CLOSE8:RETURN
6810 POKE681,1:GOSUB90
6820 PRINT"{yellow}term active":SYS38236
6830 PRINTCHR$(13)+"{white}CMD:";:
6831 GETA$:IFA$="q"THENPRINT:POKE702,16:GOTO1345
6832 IFA$="b"ANDPEEK(659)=6THENPRINT:GOTO6840
6833 IFA$="u"THENPRINT:GOTO7000
6834 IFA$="d"THENPRINT:GOTO7100
6835 IFA$="t"THENPRINT:GOTO6820
6836 GOTO6831
6840 INPUT"new baud";I:IFI<200ORI>500THEN6830
6841 FH=1:GOSUB6230:GOTO6830
6900 TX$="{pink}W{yellow}o{white}r{light green}k{cyan}i{light blue}n{blue}g...{ct c}":GOSUB210:OPEN1,8,15,"s0:{pound}members":CLOSE1
6910 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog":OPEN8,8,8,"0:{pound}members,s,w":I1=1:I2=0
6920 PRINT#8,"{white}List as of "+STR$(MN)+"/"+STR$(DA)
6930 PRINT#1,"p"CHR$(98)CHR$(I1)CHR$(I2)CHR$(5):GET#2,A$:INPUT#1,E
6940 IFA$=""ORE>0THEN6980
6950 SYS38233:I$=A$+I$:IFI$="EMPTY"THEN6970
6960 PRINT#8,"{white}"+STR$(I1+(256*I2))+"):"+I$+"{white}"
6970 OU$=".":GOSUB120:I1=I1+1:IFI1=256THENI1=0:I2=I2+1
6975 GOTO6930
6980 CLOSE8:CLOSE2:CLOSE1:TX$=CHR$(13)+"{white}Done.":GOSUB210:RETURN
6981 CH=0:TX$="{pink}{reverse on}Month{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI=0ORI>12THENRETURN
6982 MN=I:POKE703,MN:TX$="{yellow}{reverse on}Day{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI=0ORI>DA(MN)THENRETURN
6983 DA=I:POKE704,DA:TX$="{white}{reverse on}Hour{reverse off}:{ct c}":GOSUB210:GOSUB111:IFI=0ORI>12THENRETURN
6984 H1=I:TX$="{light green}{reverse on}Am or Pm{reverse off}:{white}{ct c}":GOSUB210:GOSUB190:CH=0:IFI$="p"THENCH=128
6985 IFH1=12ANDCH=128THENCH=0:GOTO6987
6986 IFH1=12ANDCH=0THENCH=128
6987 H3=INT(H1/10):H4=H3*10:H2=H1-H4:POKE56587,(16*H3)+H2+CH
6988 H1=0:TX$="{cyan}{reverse on}Minute{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI<60THENH1=I
6989 H3=INT(H1/10):H4=H3*10:H2=H1-H4:POKE56586,(16*H3)+H2:POKE56585,0
6990 POKE56584,0:RETURN
7000 GOSUB7040:IFER=1THEN6830
7010 FH=1:OPEN1,8,15,"i0":OPEN2,8,2,"0:"+A$+","+B$+",r"
7020 INPUT#1,E:IFE>0THENCLOSE2:CLOSE1:GOTO6830
7030 GOTO5600
7040 INPUT"filename";A$:IFLEN(A$)>16ORA$=""THENER=1:RETURN
7050 INPUT"Prg/Seq";B$:IFB$<>"p"ANDB$<>"s"THEN7050
7060 IFB$="p"THENTY=1
7070 IFB$="s"THENTY=2
7080 RETURN
7100 GOSUB7040:IFER=1THEN6830
7110 FH=1:FI$=A$+","+B$+",w":GOTO5420
7200 I$="{pound}prg.menu":GOTO88
7999 PRINT"{ct z}{ct x}{ct c}"
8000 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8010 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8011 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8012 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8013 ::        :    : :::::  : ::: :::::::::::::::::: :: :::: :::: ::: ::: ::::
8014 ::::::: ::: :::: ::: :::: ::: :::::::::::::::: ::::    : ::: ::::     ::::
8015 ::::: :::::    : ::: ::::     :::::::::::::: :::::: :::: ::: :::: ::: ::::
8016 ::: ::::::: :::: :::: ::: ::: ::::::::::::        :    :   :::  : ::: ::::
8017 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8018 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8019 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8020 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8021 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8022 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8023 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8024 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8025 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8026 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8027 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8028 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8029 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8030 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8031 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8032 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8033 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8034 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8035 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8036 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8037 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8038 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8039 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8040 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8041 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8042 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8043 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8044 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8045 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8046 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8047 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8048 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8049 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8050 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8051 GOTO2120