!--------------------------------------------------
!- Friday, May 19, 2017 9:55:48 PM
!- Import of : 
!- c:\src\zelch64\j1.prg
!- Commodore 64
!--------------------------------------------------
1 IFPEEK(764)=3THEN15600
2 IFSG=0THENGOSUB1600
10 GOTO1000
100 IN$="":SYS49152
110 IFPEEK(830)=1THEN500
120 RETURN
200 IFOU$=""THENRETURN
210 POKE254,ASC(OU$)
220 SYS49155
230 RETURN
300 I$="":SYS49158
310 IFPEEK(830)=1THEN500
320 RETURN
400 IFTX$=""THENRETURN
420 SYS49161,TX$
430 RETURN
500 GOSUB1900:RL=2520:TX$="Standby...":GOSUB400:A=FRE(0)
510 LOAD"{pound}@1",8,1
600 GOSUB1900:TX$="Standby...":GOSUB400:A=FRE(0)
610 LOAD"{pound}b1",8,1
1000 CS=0:GOSUB1010:GOTO2000
1010 TX$="{down*3}Entering Sig"+STR$(CS+1):GOSUB400:CM=0
1040 OPEN1,8,15:OPEN2,8,2,"{pound}index.File"
1050 PRINT#1,"p"CHR$(98)CHR$(CS+2)CHR$(0)CHR$(1)
1060 INPUT#2,I1$
1070 NM=255-(ASC(I1$)):CLOSE1:CLOSE2
1092 TX$=CHR$(13)+STR$(NM)+" Bulletins":GOSUB400
1099 CLOSE1:CLOSE2
1100 OPEN8,SD(CS),8,"{pound}Sig"+STR$(CS)+",s,r"
1110 IFNM=0THEN1199
1120 FORI=1TONM:INPUT#8,A$:Z1(I)=VAL(A$)
1130 INPUT#8,A$:Z2(I)=VAL(A$):NEXTI
1199 CLOSE8:VF=0:RETURN
1600 OPEN8,8,8,"{pound}Fpreps,s,r"
1610 INPUT#8,SG:DIMSG$(SG),SG(SG),SD(SG),SF(SG):FORI=0TOSG
1620 INPUT#8,SG$(I):INPUT#8,SG(I):INPUT#8,SD(I):INPUT#8,SF(I):NEXTI
1630 CLOSE8:PP=VAL(P$(0))+256*VAL(P$(1))
1640 OPEN1,8,15:OPEN2,8,2,"{pound}index.File"
1650 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(1):INPUT#2,HN$:HN=VAL(HN$):
1660 CLOSE1:CLOSE2
1670 I=0:FORQ=0TOSG:IFSF(Q)>ITHENI=SF(Q)
1680 NEXT:DIMZ1(I),Z2(I):RETURN
1800 OPEN1,8,15:OPEN2,8,2,"{pound}index.File"
1810 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(1)
1820 I1$=STR$(HN)
1840 PRINT#2,I1$:CLOSE1:CLOSE2:RETURN
1900 IFVF=0THENRETURN
1901 TX$=CHR$(13)+"Saving Msg Index...":GOSUB400
1910 OPEN1,SD(CS),15,"s0:{pound}Sig"+STR$(CS):CLOSE1
1915 OPEN8,SD(CS),8,"{pound}Sig"+STR$(CS)+",s,w"
1935 FORI=1TONM:PRINT#8,STR$(Z1(I)):PRINT#8,STR$(Z2(I)):NEXTI
1940 CLOSE8:RETURN
2000 TX$=CHR$(14)+CHR$(13)+"{white}Sig"+STR$(CS+1)+":":GOSUB400
2010 GOSUB100:IFIN$=""THEN2010
2020 TX$=IN$+CHR$(13):GOSUB400
2030 IFIN$="?"THEN12000
2040 IFIN$="l"THEN3000
2050 IFIN$="c"THEN4000
2060 IFIN$="r"THENGOSUB5000:GOTO2000
2071 IFIN$="q"THEN600
2072 IFIN$="e"THEN15000
2073 IFIN$="s"THEN16000
2074 IFIN$="d"THEN17000
2076 IFIN$=CHR$(13)THENCM=CM+1:GOSUB5010:GOTO2000
2080 GOTO2000
3000 TX$="{clear}Current Sigs Are:{down*2}":GOSUB400
3009 FORI=0TOSG
3010 IFSG(I)>ACTHEN3030
3020 TX$=STR$(I+1)+" "+SG$(I):GOSUB400
3030 NEXTI:GOTO2000
4000 TX$="New Sig #:":GOSUB400:GOSUB300:II=VAL(I$):IFII-1=CSTHEN2000
4010 IFII=0ORII-1>SGTHEN2000
4020 IFSG(II-1)>ACTHEN2000
4030 GOSUB1900:CS=II-1:GOSUB1010:GOTO2000
5000 TX$="File # or RETURN:":GOSUB400:GOSUB300:I=VAL(I$):CM=I
5010 IFCM<=0THENCM=1:GOTO5030
5020 IFCM>NMTHENTX$="No Message #"+STR$(CM):CM=NM:GOSUB400:RETURN
5030 I1=Z1(CM):I2=Z2(CM)
5040 OPEN8,SD(CS),8,"{pound}msg"+STR$(CS)+STR$(CM)
5050 SYS49164
5060 CLOSE8:IFI1=0THEN5500
5070 TX$=CHR$(14)+CHR$(13)+"Replys:(?):":GOSUB400
5080 GOSUB100:IFIN$=""THEN5080
5090 IFIN$="s"THEN5900
5091 IFIN$="?"THENTX$=CHR$(13)+"R)ead, S)kip, or Q)uit":GOSUB400:GOTO5070
5100 IFIN$="q"THEN5500
5110 IFIN$="r"ORIN$=CHR$(13)THENI9=0:GOTO5200
5120 GOTO5080
5200 OPEN8,SD(CS),8,"{pound}msg"+STR$(CS)+STR$(CM):SYS49170
5201 IFI9=0THEN5220
5202 FORI=1TOI9:SYS49170:NEXT
5210 IFI9=I1THENCLOSE8:GOTO5500
5220 TX$="{clear}Response #"+STR$(I9+1):GOSUB400:SYS49164:CLOSE8
5230 TX$="RETURN cont. A)bort:":GOSUB400
5240 GOSUB100:IFIN$="a"THEN5500
5250 IFIN$<>CHR$(13)THEN5240
5260 I9=I9+1:GOTO5200
5500 TX$=CHR$(14)+CHR$(13):GOSUB400:RETURN
5900 TX$=CHR$(13)+"Number to skip:":GOSUB400:GOSUB300
5910 IFI$=""THEN5070
5920 I9=VAL(I$):IFI9>Z1(CM)THEN5500
5930 GOTO 5200
12000 OU$="{clear}":GOSUB200
12010 OPEN8,8,8,"{pound}editmenu,s,r"
12020 SYS49164
12030 CLOSE8:GOTO2000
15000 TX$="Filename:":GOSUB400:GOSUB300:IFI$=""THEN2000
15010 II$=I$:TX$="Device:":GOSUB400:GOSUB300:I=VAL(I$):IFI<8ORI>11THEN2000
15020 POKE682,65:POKE683,0:V1=I
15030 TX$="Standby..Loading msg...":GOSUB400
15040 OPEN8,V1,8,II$+",s,r":GET#8,A$
15050 IFST>0THENCLOSE8:TX$="File Not Found!":GOSUB400:GOTO2000
15060 CLOSE8:OPEN8,V1,8,II$+",s,r"
15080 LN=0:FORI=0TO50:TT$(I)="":NEXT
15090 SYS49182:IFPEEK(253)=1THENGOTO15500
15100 SYS49161,I$:TT$(LN)=I$:LN=LN+1:GOTO15090
15500 CLOSE8:CLOSE1:A=FRE(0):TT$(LN)=I$:SYS49161,I$:LN=LN+1:
15505 TX$=CHR$(13)+"File Closed... Loading...":GOSUB400
15510 POKE764,3:POKE721,ASC("j"):QQ$="":QD$=""
15520 LOAD"{pound}m1",8
15600 POKE764,0:TX$="Save your mods?:":GOSUB400
15610 GOSUB100:IFIN$="n"THENOPEN1,V1,15,"s0:a":CLOSE1:A=FRE(0):GOTO2000
15620 IFIN$<>"y"THEN15610
15630 OPEN1,V1,15,"s0:"+II$:PRINT#1,"r0:"+II$+"=a":CLOSE1:GOTO2000
16000 TX$="Msg to Edit:":GOSUB400:GOSUB300:M=VAL(I$):IFI$=""THEN2000
16005 T=Z1(M)
16010 IFM>NMORZ1(M)=0ORM=0THEN2000
16020 TX$="Message #"+I$+".. are you sure?":GOSUB400:V1=SD(CS)
16030 GOSUB100:IFIN$="n"THEN2000
16040 IFIN$<>"y"THEN16030
16050 OPEN1,V1,15,"r0:msg={pound}msg"+STR$(CS)+STR$(M):CLOSE1:CT=1
16055 TX$="Storing bulletin...":GOSUB400
16060 OPEN8,V1,8,"msg,s,r":OPEN9,V1,9,"{pound}msg"+STR$(CS)+STR$(M)+",s,w"
16070 SYS49182:IFI$=CHR$(1)THEN16085
16080 PRINT#9,I$:GOTO16070
16085 PRINT#9,CHR$(1):MM=Z1(M)
16090 TX$="Save Response #"+STR$(CT)+"?:":GOSUB400
16100 GOSUB100:IFIN$="n"THENTX$="n":GOSUB400:GOTO16160
16110 IFIN$<>"y"THEN16100
16111 TX$="y":GOSUB400
16120 SYS49182:IFI$=CHR$(1)THENPRINT#9,I$:GOTO16140
16125 IFPEEK(253)=1THEN16140
16130 PRINT#9,I$:GOTO16120
16140 IFCT=MMTHEN16999
16150 CT=CT+1:GOTO16090
16160 SYS49170:Z1(M)=Z1(M)-1:IFZ1(M)=0ORCT=MMTHEN16998
16170 GOTO16150
16998 IFT<>Z1(M)THENVF=1
16999 CLOSE9:CLOSE8:OPEN1,8,15,"s0:msg":CLOSE1:GOTO2000
17000 TX$="Msg to delete:":GOSUB400:GOSUB300:IFI$=""THEN2000
17010 I=VAL(I$):IFI>NMORI=0THEN2000
17020 TX$="Delete msg #"+STR$(I)+" Are you sure?":GOSUB 400:V1=SD(CS)
17030 GOSUB100:IFIN$="n"THEN2000
17040 IFIN$<>"y"THEN17030
17050 TX$="Working...":GOSUB400
17060 OPEN1,V1,15,"s0:{pound}msg"+STR$(CS)+STR$(I)
17070 FORX=ITONM
17080 PRINT#1,"r0:{pound}msg"+STR$(CS)+STR$(I)+"={pound}msg"+STR$(CS)+STR$(I+1):NEXTX:CLOSE1
17090 FORX=ITONM:Z1(I)=Z1(I+1):Z2(I)=Z2(I+1):NEXTX:NM=NM-1
17100 CLOSE1:CLOSE2:OPEN1,8,15:OPEN2,8,2,"{pound}index.File"
17110 I1$=CHR$(255-NM):PRINT#1,"p"+CHR$(98)+CHR$(CS+2)+CHR$(0)+CHR$(1)
17120 PRINT#2,I1$:CLOSE1:CLOSE2:VF=1:GOTO2000