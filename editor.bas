!--------------------------------------------------
!- Saturday, May 20, 2017 4:56:15 PM
!- Import of : 
!- c:\src\zelch64\editor 3.5.prg
!- Commodore 64
!--------------------------------------------------
1 GOTO10
2 G=0:PRINT"{reverse on} {reverse off}{left}";:GETA$:IFA$=""THEN2
3 FORI4=1TOLEN(C$):IFMID$(C$,I4,1)=A$THENG=I4
4 NEXTI4:IFG=0THEN2
5 PRINTA$:RETURN
6 NN=FRE(0):I$="":LN=0:PRINT"{reverse on} {reverse off}{left}";:GOTO30
7 PRINT#1,"p"CHR$(99)CHR$(X)CHR$(Y)CHR$(0):RETURN
10 PRINTCHR$(14):POKE53280,0:POKE53281,0:PRINT"{yellow}PUT{sh space}YOUR MAIN{sh space}DATA{sh space}DISK IN
20 PRINT"DRIVE 8 AND{sh space}HIT {reverse on}RETURN{reverse off}":WAIT203,1:PRINT"{down*2}OK.. READING..":GOSUB7700
21 GOTO100
30 GETIN$:IFIN$=""THEN30
31 IFIN$=CR$THENPRINT" ":RETURN
32 IFIN$="{delete}"ANDLN>0THENLN=LN-1:I$=LEFT$(I$,LEN(I$)-1):PRINTIN$;"{reverse on} {reverse off}{left}";
33 IFIN$="{delete}"THEN30
39 PRINTIN$;"{reverse on} {reverse off}{left}";:LN=LN+1:I$=I$+IN$:GOTO30
100 PRINT"{clear}{yellow}"TAB(15)"MAIN{sh space}MENU:":PRINTTAB(15)"{white}{cm t*9}"
110 PRINTTAB(12)"1) {yellow}MAIN{sh space}EDITOR":PRINTTAB(12)"{white}2) {yellow}USER{sh space}EDITOR"
120 PRINTTAB(12)"{white}3) {yellow}SIG{sh space}RECORD{sh space}MAKER":PRINTTAB(12)"{white}4) {yellow}SIG{sh space}RECORD{sh space}EDITOR"
130 PRINTTAB(12)"{white}5) {yellow}EXIT{sh space}TO{sh space}BASIC":PRINT"{down*6}"TAB(12)"{white}ENTER{sh space}YOUR{sh space}CHOICE:";
140 C$="12345":GOSUB2:ONGGOTO1000,500,8000,8500:PRINT"{clear}";:END
500 IFFL=1THENFL=0:GOTO721
505 PRINT"{clear}{yellow}"TAB(12)"USER{sh space}EDIT{sh space}MENU":PRINTTAB(12)"{white}{cm t*14}"
510 PRINTTAB(9)"1) {yellow}RESET{sh space}THE{sh space}USER{sh space}LOG":PRINTTAB(9)"{white}2) {yellow}EDIT{sh space}A{sh space}MAIN{sh space}USERFILE"
520 PRINTTAB(9)"{white}3) {yellow}EDIT A{sh space}VAR{sh space}USERFILE":PRINTTAB(9)"{white}4) {yellow}ADD{sh space}A{sh space}USERFILE"
530 PRINTTAB(9)"{white}5) {yellow}LIST{sh space}USERS":PRINTTAB(9)"{white}6) {yellow}EXIT TO{sh space}MAIN{sh space}MENU{down*6}"
540 PRINTTAB(14)"{white}CHOOSE:";:C$="123456":GOSUB2:ONGGOTO550,600,700,800,850,100
550 PRINT"{clear}{down*3}ARE{sh space}YOU SURE{sh space}OF{sh space}THIS(Y/N)?";:C$="yn":GOSUB2:IFG=2THEN500
551 PRINT"{down}{pink}SCRATCHING...":OPEN1,8,15,"s0:{pound}log1,{pound}log2,{pound}log3":CLOSE1
552 PRINT"{clear}{white}ENTER{sh space}YOUR{sh space}HANDLE (ALL{sh space}CAPS)":PRINT"17 CHARS{sh space}MAX:";:GOSUB6:NA$=I$
553 IFI$=""ORLEN(I$)>17THEN552
554 PRINT"{home}{down*2}ENTER{sh space}YOUR{sh space}REAL{sh space}NAME (ALL{sh space}CAPS":PRINT"17 CHARS{sh space}MAX:";:GOSUB6
555 RN$=I$:IFI$=""ORLEN(I$)>17THEN554
556 PRINT"{home}{down*4}ENTER{sh space}YOUR{sh space}PHONE{sh space}NUMBER":PRINT"(XXX/XXX-XXXX):";:GOSUB6:PH$=I$
557 IFI$=""ORLEN(I$)<12ORLEN(I$)>20THEN556
558 PRINT"{home}{down*6}ENTER{sh space}A{sh space}PASSWORD":PRINT"7 CHARS MAX:";:GOSUB6:PA$=I$
559 IFI$=""ORLEN(I$)>7THEN568
560 NC=0:PRINT"{home}{down*8}CORRECT(Y/N)?";:C$="yn":GOSUB6:IFG=2THEN551
565 PRINT"{clear}{down*7}{light blue}WRITING{sh space}FILES...";:OPEN1,8,15:FORT=1TO3:A$=RIGHT$(STR$(T),1)
566 OPEN2,8,3,"{pound}log"+A$+",l,"+CHR$(100):FORI=1TO2:FORX=1TO5:Y=0:GOSUB7:CA=0
567 PRINT#2,"EMPTY":PRINT".";:NEXTX:NEXTI:CLOSE2:NEXTT:OPEN2,8,3,"{pound}log3":X=1
568 GOSUB7:PRINT#2,"NOBODY"+CR$+"TODAY"+CR$+STR$(1)+CR$+STR$(1):CLOSE2:CLOSE1
569 AC$=STR$(9):FORI=0TO9:P(0)=0:NEXTI:P(5)=100:P(6)=6:P(4)=2:GOSUB900:GOTO500
570 ER=0:PRINT"{clear}{down*4}EDIT{sh space}USER{sh space}#";:GOSUB6:IFI$=""THENER=1:RETURN
571 IFVAL(I$)=0THENER=1:RETURN
572 A=VAL(I$):Y=INT(A/256):X=A-(Y*256):OPEN1,8,15:OPEN2,8,3,"{pound}log1":GOSUB7
573 GET#2,A$:INPUT#1,E:IFA$<>"{pound}"ORE>0THENCLOSE1:CLOSE2:ER=1:RETURN
574 RETURN
600 GOSUB570:IFER>0THEN500
610 INPUT#2,NA$,PH$,AC$,RN$,PA$:CLOSE2:CLOSE1:
620 PRINT"{home}{down*6}HANDLE:"+NA$+":";:GOSUB6:IFI$=""THENI$=NA$
621 NA$=I$:IFLEN(I$)>17THENPRINT"TOO{sh space}LONG":GOTO620
622 PRINT"{home}{down*7}REAL{sh space}NAME:"+RN$+":";:GOSUB6:IFI$=""THENI$=RN$
623 RN$=I$:IFLEN(I$)>17THENPRINT"TOO{sh space}LONG":GOTO622
624 PRINT"{home}{down*8}PHONE{sh space}NUMBER:"+PH$+":";:GOSUB6:IFI$=""THENI$=PH$:I$=PH$
625 PH$=I$:IFLEN(I$)<12ORLEN(I$)>20THENPRINT"WRONG{sh space}FORMAT!":GOTO624
626 PRINT"{home}{down*9}ACCESS:"+AC$+":";:GOSUB6:IFI$=""THENI$=AC$
627 AC$=I$:IFVAL(I$)=0ANDI$<>"0"ANDI$<>" 0"THENPRINT"NUMBER":GOTO626
628 PRINT"{home}{down*10}PASSWORD:"+PA$+":";:GOSUB6:IFI$=""THENI$=PA$
629 PA$=I$:IFLEN(I$)>7THENPRINT"TOO{sh space}LONG!":GOTO628
630 PRINT"{down*2}CORRECT(Y/N)?";:C$="yn":GOSUB2:IFG=2THEN620
640 PRINT"{down*2}SAVING...":GOSUB910:GOTO500
700 GOSUB570:IFER=1THEN500
710 INPUT#2,A$:PRINT"{clear}{down*2}";A$:CLOSE2:OPEN2,8,3,"{pound}log2":GOSUB7:INPUT#2,CA,NC
720 FORI=0TO9:INPUT#2,P(I):NEXT:CLOSE2:CLOSE1
721 PRINT"CALLS{sh space}TODAY:"+STR$(CA)+":";:GOSUB6:IFI$=""THENI$=STR$(CA)
722 CA=VAL(I$):PRINT"LAST{sh space}CALL:"+STR$(NC)+":";:GOSUB6:IFI$=""THENI$=STR$(NC)
723 NC=VAL(I$):FORI=0TO9:PRINT"VARIABLE #"+STR$(I)+":"+STR$(P(I))+":";:
724 GOSUB6:IFI$=""THEN726
725 P(I)=VAL(I$)
726 NEXTI:PRINT"CORRECT(Y/N)?";:C$="yn":GOSUB2:IFG=2THEN721
727 PRINT"{down*2}SAVING...":GOSUB950:GOTO500
800 PRINT"{clear}{down*3}SEARCHING{sh space}FOR{sh space}A{sh space}RECORD...";:OPEN1,8,15:OPEN2,8,3,"{pound}log1":X=1:Y=0
810 GOSUB7:GET#2,A$:INPUT#1,E:IFA$<>"{pound}"ORE>0THEN830
820 INPUT#2,I$:IFI$<>"EMPTY"THENX=X+1:PRINT".";:IFX=256THENX=0:Y=Y+1
825 IFI$<>"EMPTY"THEN810
830 CLOSE2:CLOSE1:FL=1:GOTO620
850 S=1:PRINT"{clear}{down*3}START{sh space}AT{sh space}RECORD #";:GOSUB6:IFI$=""THEN860
855 S=VAL(I$):IFS=0THENS=1
860 OPEN1,8,15:OPEN2,8,3,"{pound}log1"
870 Y=INT(S/256):X=S-(Y*256):GOSUB7:GET#2,A$:INPUT#1,E:IFA$<>"{pound}"ORE>0THEN890
875 GETA$:IFA$=" "THEN890
880 INPUT#2,I$:PRINTSTR$(S)+")"+I$:S=S+1:GOTO870
890 CLOSE2:CLOSE1:PRINT"hit return":WAIT203,1:GOTO500
900 GOSUB910:GOSUB950:RETURN
910 OPEN1,8,15:OPEN2,8,3,"{pound}log1":A$="{pound}"+NA$+CR$+PH$+CR$+AC$+CR$+RN$+CR$+PA$
920 GOSUB7:PRINT#2,A$:CLOSE2:CLOSE1:RETURN
950 OPEN1,8,15:OPEN2,8,3,"{pound}log2":A$=STR$(CA)+CR$+STR$(NC)+CR$:FORI=0TO9
960 A$=A$+STR$(P(I)):NEXTI:GOSUB7:PRINT#2,A$:CLOSE2:CLOSE1:RETURN
1000 PRINT"{clear}{yellow}"TAB(15)"MAIN{sh space}EDITOR":PRINTTAB(15)"{white}{cm t*11}":A=6
1010 PRINTTAB(A)"1) {yellow}NAME{sh space}OF{sh space}BBS: {pink}"+BN$:PRINTTAB(A)"{white}2){yellow} LIBRARY DEVICE:{pink}";UL
1020 PRINTTAB(A)"{white}3) {yellow}MODEM TYPE: {pink}";:GOSUB1260
1030 PRINTTAB(A)"{white}4) {yellow}MAIL{sh space}DEVICE:{pink}";MD:PRINTTAB(A)"{white}5) {yellow}U/D RATIO:{pink}";UC;"/";DC
1040 PRINTTAB(A)"{white}6) {yellow}OF{sh space}DRIVES:{pink}";D0:PRINTTAB(A)"{white}7){yellow} COMMAND EDITOR"
1050 PRINTTAB(A)"{white}8) {yellow}MSG{sh space}MAKER{sh space}EDITOR":PRINTTAB(A)"{white}9){yellow} MESSAGE{sh space}BASE{sh space}EDITOR"
1060 PRINTTAB(A-1)"{white}10){yellow} SYSOP SEC.{sh space}EDITOR":PRINTTAB(A-1)"{white}11){yellow} EMAIL{sh space}EDITOR"
1070 PRINTTAB(A-1)"{white}12){yellow} PROGRAM SEC. EDITOR":PRINTTAB(A-1)"{white}13){yellow} TIME/CALLS{sh space}EDITOR"
1080 PRINTTAB(A-1)"{white}14){sh space}{yellow}COLORS EDITOR":PRINTTAB(A-1)"{white}15) {yellow}U/D SECTION{sh space}EDITOR"
1089 PRINTTAB(A-1)"{white} *){yellow} SAVE{sh space}AND{sh space}QUIT"
1090 PRINT"{home}{down*20}{white}"TAB(15)"CHOOSE:";
1100 GOSUB6:IFI$=""THEN1000
1110 IFVAL(I$)=0ANDI$<>"*"ORVAL(I$)>15THEN1000
1120 IFI$="*"THEN7900
1130 I=VAL(I$):ONIGOTO1200,1220,1230,1270,1280,1290,1300,1400,1600,1700,1800
1140 I=I-11:ONIGOTO1900,2100,2200,2300
1200 PRINT"{home}{down*2}{pink}"TAB(22);:GOSUB6:IFI$=""THENI$=BN$
1210 BN$=I$:GOTO1090
1220 PRINT"{home}{down*3}{pink}"TAB(25);:GOSUB6:IFI$=""THENI$=STR$(UL)
1225 IFVAL(I$)>12ORVAL(I$)<8THENI$=STR$(8)
1226 UL=VAL(I$):GOTO1000
1230 PRINT"{down*2}{white}SPACE TO{sh space}CYCLE/RETURN{sh space}TO{sh space}CHOOSE":PRINT"{home}{down*4}{pink}"TAB(21);
1235 GETA$:IFA$<>" "ANDA$<>CR$THEN1235
1240 IFA$=" "THENM0=M0+1:IFM0=3THENM0=0
1245 IFA$=CR$THEN1000
1250 GOSUB1260:PRINT"{home}{down*4}{pink}"TAB(21);:GOTO1235
1260 IFM0=0THENPRINT"1670/HAYES "
1261 IFM0=1THENPRINT"1650 COMPAT"
1262 IFM0=2THENPRINT"1660 COMPAT"
1263 RETURN
1270 PRINT"{home}{down*5}{pink}"TAB(22);:GOSUB6:IFI$=""THENI$=STR$(MD)
1271 IFVAL(I$)>12ORVAL(I$)<8THENI$=STR$(8)
1272 MD=VAL(I$):GOTO1000
1280 PRINT"{down}CREDITS{sh space}RECIEVED{sh space}PER{sh space}UPLOAD:";:GOSUB6:IFI$=""THENI$=STR$(UC)
1281 UC=VAL(I$):PRINT"CREDITS TAKEN{sh space}PER{sh space}DOWNLOAD :";:GOSUB6:IFI$=""THENI$=STR$(DC)
1282 DC=VAL(I$):GOTO1000
1290 PRINT"{home}{down*7}{pink}"TAB(20);:GOSUB6:IFI$=""THENI$=STR$(D0)
1291 IFVAL(I$)>4ORVAL(I$)<1THENI$=STR$(1)
1292 D0=VAL(I$):GOTO1000
1300 L=16:A=0:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO1300
1310 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO1310
1315 RESTORE
1320 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
1330 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
1340 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN1300
1350 IFI$="q"THEN1000
1360 IFVAL(I$)=0THEN1300
1390 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
1391 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
1392 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
1393 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO1300
1400 L=13:A=1:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO1400
1410 RESTORE:FORI=1TO16:READI$:NEXT
1420 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER":FORI=1TOL:READI$
1430 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)
1440 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN1400
1450 IFI$="q"THEN1000
1460 IFVAL(I$)=0THEN1400
1490 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I)
1491 PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
1492 C$(A)=I1$+I$+I2$:GOTO1400
1500 L=8:A=2:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO1500
1510 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO1510
1515 RESTORE:FORI=1TO29:READI$:NEXT
1520 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
1530 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
1540 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN1500
1550 IFI$="q"THENI=N(0):GOTO7800
1560 IFVAL(I$)=0THEN1500
1590 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
1591 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
1592 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
1593 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO1500
1600 PRINT"{clear}{down}{white}N){yellow}UMBER{sh space}OF{sh space}SIGS:{pink}"+STR$(N(0)+1):PRINT"{white}C){yellow}ONTINUE"
1610 PRINT"{white}#/{light blue}NAME/{cyan}ACCESS/{blue}DEVICE/{light green}MAX MSGS":FORI=0TON(0):PRINT"{white}"+STR$(I+1);
1620 PRINT"/{light blue}"+NA$(0,I)+"/{cyan}"+STR$(AC(0,I))+"/{blue}"+STR$(DV(0,I))+"/{light green}"+STR$(MM(0,I))
1630 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$="c"THEN1500
1635 IFI$="n"THENPRINT"NEW{sh space}NUMBER:";:GOSUB6:N(0)=VAL(I$)-1:GOTO1600
1640 IFI$=""THEN1600
1650 IFVAL(I$)<1ORVAL(I$)-1>N(0)THEN1600
1660 I=VAL(I$)-1:PRINT"NEW NAME:";:GOSUB6:IFI$=""THEN1670
1665 NA$(0,I)=I$
1670 PRINT"NEW{sh space}ACCESS:";:GOSUB6:IFI$=""THEN1680
1675 IFVAL(I$)<10THENAC(0,I)=VAL(I$)
1680 PRINT"NEW{sh space}DEVICE:";:GOSUB6:IFI$=""THEN1690
1685 II=VAL(I$):IFII>7ANDII<12THENDV(0,I)=II
1690 PRINT"MAX{sh space}MSGS:";:GOSUB6:IFI$=""THEN1600
1692 MM(0,I)=VAL(I$):GOTO1600
1700 L=9:A=3:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO1700
1710 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO1710
1715 RESTORE:FORI=1TO37:READI$:NEXT
1720 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
1730 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
1740 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN1700
1750 IFI$="q"THEN1000
1760 IFVAL(I$)=0THEN1700
1790 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
1791 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
1792 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
1793 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO1700
1800 L=4:A=4:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO1800
1810 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO1810
1815 RESTORE:FORI=1TO46:READI$:NEXT
1820 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
1830 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
1840 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN1800
1850 IFI$="q"THEN1000
1860 IFVAL(I$)=0THEN1800
1890 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
1891 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
1892 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
1893 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO1800
1900 PRINT"{clear}{down}{white}N){yellow}UMBER{sh space}OF{sh space}SECTIONS:{pink}"+STR$(N(1)+1):PRINT"{white}C){yellow}ONTINUE"
1910 PRINT"{white}#/{light blue}NAME/{cyan}ACCESS/{blue}DEVICE/{light green}NOT{sh space}USED":FORI=0TON(1):PRINT"{white}"+STR$(I+1);
1920 PRINT"/{light blue}"+NA$(1,I)+"/{cyan}"+STR$(AC(1,I))+"/{blue}"+STR$(DV(1,I))+"/{light green}"+STR$(MM(1,I))
1930 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$="c"THEN2000
1935 IFI$="n"THENPRINT"NEW{sh space}NUMBER:";:GOSUB6:N(1)=VAL(I$)-1:GOTO1900
1940 IFI$=""THEN1900
1950 IFVAL(I$)<1ORVAL(I$)-1>N(1)THEN1900
1960 I=VAL(I$)-1:PRINT"NEW NAME:";:GOSUB6:IFI$=""THEN1970
1965 NA$(1,I)=I$
1970 PRINT"NEW{sh space}ACCESS:";:GOSUB6:IFI$=""THEN1980
1975 IFVAL(I$)<10THENAC(1,I)=VAL(I$)
1980 PRINT"NEW{sh space}DEVICE:";:GOSUB6:IFI$=""THEN1900
1985 II=VAL(I$):IFII>7ANDII<12THENDV(1,I)=II
1987 GOTO1900
2000 L=4:A=5:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO2000
2010 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO2010
2015 RESTORE:FORI=1TO50:READI$:NEXT
2020 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
2030 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
2040 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN2000
2050 IFI$="q"THENI=N(1):GOTO7800
2060 IFVAL(I$)=0THEN2000
2090 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
2091 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
2092 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
2093 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO2000
2100 PRINT"{clear}{pink}Q)UIT{down*4}"+CR$+"{light blue}LVL/{blue}CALLS/{light green}TIME (MIN.)":FORI=0TO9
2110 PRINT"{light blue}"+STR$(I)+"/{blue}"+STR$(CA(I))+"{light green}/    "+STR$(TM(I)):NEXTI
2120 PRINT"{down*2}CHOOSE:";:GOSUB6:IFI$="q"THEN1000
2130 IFI$=""THEN2100
2140 IFVAL(I$)=0ANDI$<>"0"ANDI$<>" 0"THEN2100
2150 I=VAL(I$):PRINT"{down}CALLS{sh space}PER{sh space}DAY:";:GOSUB6:IFI$<>""THENCA(I)=VAL(I$)
2160 PRINT"TIME{sh space}PER{sh space}CALL:";:GOSUB6:IFI$<>""THENTM(I)=VAL(I$):IFTM(I)<256THEN2100
2170 PRINT"MUST{sh space}BE{sh space}255 OR{sh space}LESS!{up*2}":GOTO2160
2200 V$(0)="{red}RED":V$(1)="{cyan}CYAN":V$(2)="{purple}PURPLE":V$(3)="{brown}BROWN":V$(4)="{green}GREEN"
2210 V$(5)="{blue}BLUE":V$(6)="{yellow}YELLOW":V$(7)="{orange}ORANGE":V$(8)="{pink}PINK":V$(9)="{dark gray}DK GREY
2220 V$(10)="{gray}MED{sh space}GREY":V$(11)="{light green}LT{sh space}GREEN":V$(12)="{light blue}LT BLUE"
2225 V$(14)="{white}WHITE":V$(13)="{light gray}LT GREY"
2230 PRINT"{clear}{red}Q)UIT":PRINT"{down}{light blue}COLOR{sh space}CYCLE!":FORT=1TO2:FORI=1TO8:PRINT"{white}#";STR$(I);
2240 GOSUB2290:NEXTI:NEXTT:PRINT"{white}{down*2}CHOOSE:";:GOSUB6:IFI$=""THEN2230
2245 IFI$="q"THEN1000
2250 I=VAL(I$):IFI<1ORI>8THEN2230
2270 PRINT"COLOR:";:C$="{white}{red}{cyan}{purple}{green}{blue}{yellow}{orange}{brown}{pink}{dark gray}{gray}{light green}{light blue}{light gray}":GOSUB2:FL$(I)=A$:GOTO2200
2290 WW=0:FORW=0TO14:IFFL$(I)=LEFT$(V$(W),1)THENPRINTV$(W)+"{white}":WW=1
2291 NEXTW:IFWW=0THENPRINT"UNKNOWN!":
2292 RETURN
2300 PRINT"{clear}{down}{white}N){yellow}UMBER{sh space}OF{sh space}U/DS:{pink}"+STR$(N(2)+1):PRINT"{white}C){yellow}ONTINUE"
2310 PRINT"{white}#/{light blue}NAME/{cyan}ACCESS/{blue}DEVICE/{light green}BLK SPACE":FORI=0TON(2):PRINT"{white}"+STR$(I+1);
2320 PRINT"/{light blue}"+NA$(2,I)+"/{cyan}"+STR$(AC(2,I))+"/{blue}"+STR$(DV(2,I))+"/{light green}"+STR$(MM(2,I))
2330 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$="c"THEN2400
2335 IFI$="n"THENPRINT"NEW{sh space}NUMBER:";:GOSUB6:N(2)=VAL(I$)-1:GOTO2300
2340 IFI$=""THEN2300
2350 IFVAL(I$)<1ORVAL(I$)-1>N(2)THEN2300
2360 I=VAL(I$)-1:PRINT"NEW NAME:";:GOSUB6:IFI$=""THEN2370
2365 NA$(2,I)=I$
2370 PRINT"NEW{sh space}ACCESS:";:GOSUB6:IFI$=""THEN2380
2375 IFVAL(I$)<10THENAC(2,I)=VAL(I$)
2380 PRINT"NEW{sh space}DEVICE:";:GOSUB6:IFI$=""THEN2390
2385 II=VAL(I$):IFII>7ANDII<12THENDV(2,I)=II
2390 PRINT"BLK{sh space}SPACE #";:GOSUB6:IFI$=""THEN2300
2395 IFVAL(I$)>200THENPRINT"TOO{sh space}MUCH{up*2}":GOTO2390
2396 MM(2,I)=VAL(I$):GOTO2300
2400 L=5:A=6:PRINT"{clear}{light green}Q)UIT{sh space}EDITING":IFLEN(C$(A))<LTHENC$(A)=C$(A)+"l":GOTO2400
2410 IFLEN(A$(A))<LTHENA$(A)=A$(A)+"0":GOTO2410
2415 RESTORE:FORI=1TO54:READI$:NEXT
2420 PRINT"{light blue}#/{white}FUNCTION/{yellow}LETTER/{pink}ACCESS":FORI=1TOL:READI$
2430 PRINT"{light blue}"+STR$(I)+"/{white}"+I$+"/{yellow}"+MID$(C$(A),I,1)+"/{pink}"+MID$(A$(A),I,1)
2440 NEXTI:PRINT"{down*2}CHOICE:";:GOSUB6:IFI$=""THEN2400
2450 IFI$="q"THENI=N(2):GOTO7800
2460 IFVAL(I$)=0THEN2400
2490 I=VAL(I$):I1$=LEFT$(C$(A),I-1):I2$=RIGHT$(C$(A),L-I):I3$=LEFT$(A$(A),I-1)
2491 I4$=RIGHT$(A$(A),L-I):PRINT"{white}{down}NEW LETTER:";:GOSUB6:IFLEN(I$)<>1THENI$="l"
2492 C$(A)=I1$+I$+I2$:PRINT"NEW ACCESS:";:GOSUB6:IFLEN(I$)<>1THENI$="0"
2493 B$=STR$(VAL(I$)):A$(A)=I3$+RIGHT$(B$,1)+I4$:GOTO2400
7700 DIMC$(6),A$(6),N(2),NA$(2,50),AC(2,50),DV(2,50),MM(2,50),CA(9),TM(9)
7710 DIMFL$(8),V$(20):OPEN8,8,8,"{pound}vars,s,r":CR$=CHR$(13)
7720 INPUT#8,BN$,MD,UL,UC,DC,M0,D0:FORI=0TO6:INPUT#8,C$(I),A$(I):NEXT:FORI=0TO2
7730 INPUT#8,N(I):FORX=0TON(I):INPUT#8,NA$(I,X),AC(I,X),DV(I,X),MM(I,X):NEXTX
7740 NEXTI:FORI=0TO9:INPUT#8,CA(I),TM(I):NEXT:FORI=1TO8:INPUT#8,FL$(I):NEXT
7750 CLOSE8:RETURN
7800 C$(A)=LEFT$(C$(A),L)
7805 FORX=0TOI:C$(A)=C$(A)+CHR$(97+X):NEXTX:FORX=0TOI:C$(A)=C$(A)+CHR$(193+X)
7810 NEXTX:GOTO1000
7900 PRINT"{down}SAVING...":OPEN1,8,15,"s0:{pound}vars":CLOSE1:OPEN8,8,8,"0:{pound}vars,s,w"
7910 PRINT#8,BN$:PRINT#8,MD:PRINT#8,UL:PRINT#8,UC:PRINT#8,DC:PRINT#8,M0:
7920 PRINT#8,D0:FORI=0TO6:PRINT#8,C$(I):PRINT#8,A$(I):NEXTI:FORI=0TO2:
7930 PRINT#8,N(I):FORX=0TON(I):PRINT#8,NA$(I,X):PRINT#8,AC(I,X):PRINT#8,DV(I,X)
7940 PRINT#8,MM(I,X):NEXTX:NEXTI:FORI=0TO9:PRINT#8,CA(I):PRINT#8,TM(I):NEXT
7950 FORI=1TO8:PRINT#8,FL$(I):NEXT:CLOSE8:GOTO100
8000 PRINT"{clear}{down*2}CREATE{sh space}A)LL,O)NE,OR Q)UIT?";:C$="aoq":GOSUB2:IFG=3THEN100
8010 IFG=1THENFORI=0TON(0):PRINT"WORKING...";:GOTO8100
8020 PRINT"{down*2}WHICH{sh space}ONE ( 1-"+STR$(N(0)+1)+"):";:GOSUB6:IFI$=""THEN100
8030 IFVAL(I$)>N(0)+1ORVAL(I$)<1THEN100
8040 I=VAL(I$):PRINT"WORKING...":GOTO8110
8100 FORI=1TON(0)+1:PRINT".";
8110 OPEN1,8,15,"s0:{pound}Sig "+CHR$(96+I):OPEN2,8,3,"{pound}Sig "+CHR$(96+I)+",l,"+CHR$(15)
8120 Y=0:X=1:GOSUB7:A$=STR$(0)+CR$+STR$(0):PRINT#2,A$:FORX=2TOMM(0,I-1)
8130 GOSUB7:PRINT#2,A$:NEXTX:CLOSE2:CLOSE1:IFG<>1THEN100
8140 NEXTI:GOTO100
8500 PRINT"{clear}{down*2}WHICH{sh space}ONE ( 1-"+STR$(N(0)+1)+"):";:GOSUB6:IFI$=""THEN100
8510 I5=VAL(I$):IFI5<1ORI5>N(0)+1THEN100
8520 OPEN1,8,15:OPEN2,8,3,"{pound}Sig "+CHR$(96+I5):X=1:Y=0:GOSUB7:INPUT#2,I1,I2
8530 PRINT"MESSAGES:"+STR$(I1)+":";:GOSUB6:IFI$<>""THENI1=VAL(I$)
8540 PRINT"NEXT SLOT:"+STR$(I2)+":";:GOSUB6:IFI$<>""THENI2=VAL(I$)
8545 IFI1>MM(0,I5-1)ORI2>MM(0,I5-1)THENPRINT"ILLEGAL!":CLOSE2:CLOSE1:GOTO100
8550 GOSUB7:PRINT#2,STR$(I1)+CR$+STR$(I2):FORX=2TOI2+1:GOSUB7:INPUT#2,A,B
8555 PRINT"MESSAGE #"+STR$(X-1)
8560 PRINT"REPLYS:"+STR$(A)+":";:GOSUB6:IFI$<>""THENA=VAL(I$)
8570 PRINT"MSG{sh space}NUMBER:"+STR$(B)+":";:GOSUB6LIFI$<>""THENB=VAL(I$)
8580 GOSUB7:PRINT#2,STR$(A)+CR$+STR$(B):NEXTX:CLOSE2:CLOSE1:GOTO100
10000 DATA "FEEDBACK","LOGOFF","INFO{sh space}FILE","CHAT","USERLIST","STATUS","EMAIL"
10010 DATA "SYSOP","MSG{sh space}BASE","TRANSFER","VOTE","BAUD{sh space}CHANGE"
10020 DATA "LIBRARY","VAR. EDITOR","PROGRAMS","TOGGLE GFX/ASCII"
10030 DATA "HELP","SAVE","EDIT","DELETE{sh space}LINES","LIST","CLEAR","VIEW"
10040 DATA "INSERT","ABORT","TOGGLE GFX","WORD{sh space}WRAP","CENTER","LINE{sh space}NUMBERS"
10050 DATA "LIST{sh space}SIGS","READ","SCAN","NEW","QUIT","POST/REPLY","SUBOP"
10060 DATA "ALL{sh space}NEW"
10070 DATA "DISK{sh space}CHANNEL","USERLIST","EDIT{sh space}USER","VAR. EDIT","RELOAD"
10080 DATA "MEMBERS","TIME{sh space}EDIT","VOTE{sh space}EDIT","QUIT"
10090 DATA "READ{sh space}MAIL","USERLIST","SEND{sh space}MAIL","QUIT"
10100 DATA "LOAD","DIRECTORY","LIST SUBS","QUIT"
10110 DATA "DIRECTORY","QUIT","UPLOAD","DOWNLOAD","LIST{sh space}UDS"
