!--------------------------------------------------
!- Friday, May 12, 2017 11:14:29 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.read.prg
!- Commodore 64
!--------------------------------------------------
8000 SYS51983:GOSUB2610:GOTO2650
8010 TX$="{f1}READ MSG #{ct c}":GOSUB5:GOSUB30:CM=I
8050 IFCM>NMORCM<1THENTX$="{f1}END{sh space}OF{sh space}MESSAGES":GOSUB5:CM=NM:WI=0:GOTO2650
8070 I1=Z1(CM):I2=Z2(CM):TX$="{clear}{f1}MESSAGE #"+RIGHT$(STR$(CM),LEN(STR$(CM))-1)
8080 GOSUB5:OPEN2,DV(0,CS),2,"0:{pound}msg "+CHR$(65+CS)+STR$(CM):SYS38212:CLOSE2
8090 IFPEEK(252)THENTX$=CR$+"hit return{ct c}":GOSUB5:GOSUB35
8110 CLOSE2:TX$="{ct n}{f1}"+STR$(I1)+" REPLY(S) ":GOSUB5:NE=0:I9=0:IFI1=0THEN8280
8120 TX$="{f1}N)EW {f1}J)UMP {f1}Q)UIT {f1}A)GAIN {f1}(RETURN)?{ct c}":GOSUB5:C$="jnqa"+CR$:GOSUB66
8130 IFG=2THENNE=1:TX$="{f1}NEW REPLYS{f1}.{f1}.{f1}.{ct c}":GOSUB5
8140 ONGGOTO8400,8170,8280,8070,8170
8170 CLOSE2:OPEN2,DV(0,CS),2,"0:{pound}msg "+CHR$(65+CS)+STR$(CM):SYS38218
8190 IFI9>0THENFORI=1TOI9:SYS38218:NEXT
8200 IFI9>=I1THEN8280
8210 SYS38230:SYS38230:IFVAL(I$)<=LCANDNETHEN8420
8220 NE=0:TX$=CR$+"{clear}{f1}RESPONSE #"+STR$(I9+1):GOSUB5:SYS38212
8225 IFPEEK(252)THENTX$=CR$+"hit return{ct c}":GOSUB5:GOSUB35
8230 TX$="{ct n}{f1}Q)UIT {f1}J)UMP {f1}A)GAIN{sh space}{f1}(RETURN)?{ct c}":GOSUB5:C$="qja"+CR$:GOSUB66
8240 I=I9:I9=I9+1:ONGGOTO8280,8400,8410,8200
8280 CLOSE2:IFAC<VAL(MID$(A$(2),6,1))ORZ2(CM)=0THEN2650
8290 TX$="{ct n}{reverse off}"+CR$+"{f1}REPLY (Y/N/Q)?{white}{ct c}":GOSUB5:C$="yqn"+CR$:GOSUB66:IFG>2THEN2650
8300 IFG=2THENWI=0:KD=0:GOTO2650
8340 GOSUB75:QQ$=STR$(A)+CR$+"{f1}POSTED BY:"+NA$+" ID#"+STR$(NA)
8350 SYS38215:V1=DV(0,CS):QD$="{f1}DATE:"+STR$(MN)+"/"+STR$(DA)+" TIME:"+I$+CR$
8360 TX$=" ":GOSUB5:FF$="{pound}msg "+CHR$(65+CS)+STR$(CM):GOSUB5000:M=CM:GOSUB75
8370 G=3:IFS2=0THENZ1(M)=Z1(M)+1:Z2(M)=A:X=Z1(M):Y=Z2(M):CC=CC+UC:GOSUB2620
8390 ONGGOTO8120,8230,2650
8400 TX$="{f1}JUMP TO REPLY #{ct c}":GOSUB5:GOSUB30:I=I-1:IFI<0ORI+1>Z1(CM)THEN8390
8410 I9=I:TX$="{f1}SCANNING...":GOSUB5:GOTO8170
8420 SYS38218:TX$="{f1}.{ct c}":GOSUB5:I9=I9+1:GOTO8200
8500 TX$="{f1}POST{sh space}A{sh space}NEW{sh space}SUBJECT (Y/N)?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN2650
8510 V1=DV:QQ$="{f1}POSTED BY:"+NA$+" ID#"+STR$(NA)+CR$
8520 TX$=CR$+"{f1}SUBJECT:{ct c}":GOSUB5:GOSUB7:A$=I$:IFI$=""THENA$="NONE"
8530 SYS38215:QQ$=QQ$+"{f1}ON:"+STR$(MN)+"/"+STR$(DA)+"  TIME:"+I$
8540 QD$="{f1}SUBJECT:"+A$+CR$:IFMM(0,CS)>NMTHENNM=NM+1
8550 D=MP:S0=1:MP=MP+1:IFMP>MM(0,CS)THENMP=1
8560 FF$="{pound}msg "+CHR$(CS+65)+STR$(MP):GOSUB5000:IFS2=1THENNM=NM-1:MP=D:GOTO2650
8570 GOSUB75:CC=CC+UC:M=MP:Z1(M)=0:Z2(M)=A:X=Z1(M):Y=Z2(M):GOSUB2620:GOTO2650
8600 TX$="{f1}SIGS:":GOSUB5:FORI=0TON(0):IFAC(0,I)>ACTHEN8620
8610 TX$="{f1}("+CHR$(I+193)+") "+NA$(0,I):GOSUB5
8620 NEXTI:GOTO2650
8700 TX$="{f1}START AT MSG #{ct c}":GOSUB5:GOSUB30:CM=I:IFCM>NMORCM=0THEN8050
8710 OPEN2,DV,2,"0:{pound}msg "+CHR$(65+CS)+STR$(CM)+",s,r":SYS38227
8720 CLOSE2:TX$="{f1}MSG #"+STR$(CM)+" /"+STR$(Z1(CM))+" REPLYS":GOSUB5:TX$=I$
8730 GOSUB5:GOSUB11:ON(IN$=" ")+2GOTO2650:CM=CM+1:ON(CM>NM)+2GOTO8050:GOTO8710
