!--------------------------------------------------
!- Saturday, May 20, 2017 4:56:39 PM
!- Import of : 
!- c:\src\zelch64\emprg.w.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 IFI9=0THEN9000
8015 GOSUB8900
8020 TX$="{f1}BATTLE COMMAND(?) #{ct c}":GOSUB5:GOSUB30:IFI$="q"THEN9000
8030 IFI$="?"THENFI$="{pound}empfile.wm":NN=1:GOSUB25:GOTO8020
8040 IFI=0ORI>5THEN8020
8050 ONIGOTO8100,8200,8300,8400,8500
8100 IFRND(TI)<.8THEN8110
8101 TX$="{f1}A{sh space}SPACE{sh space}BATTLE{sh space}RESULTS{sh space}IN"+CR$+"{f1}THE{sh space}DESTRUCTION OF ONE{sh space}OF"
8102 IFRND(TI)>.5THENTX$=TX$+" YOUR{sh space}SHIPS!":Z1(2)=Z1(2)-20:Z1(4)=Z1(4)-1:GOTO811
8103 TX$=TX$+" THEIR{sh space}SHIPS!":Z2(22)=Z2(22)-20:Z2(24)=Z2(24)-1
8110 TX$=CR$+"{f1} YOUR{sh space}SHIPS{sh space}LAND! BATTLE{sh space}BEGINS!":GOSUB5
8115 TX$="{f1}+ ENEMY LOSS          - YOUR{sh space}LOSS":GOSUB5:
8120 TX$="{f1}@ ENEMY{sh space}SHIP{sh space}LOSS     * YOUR{sh space}SHIP{sh space}LOSS"+CR$+CR$+"{f1}BATTLE:{ct c}":GOSUB5
8125 IFZ1(2)<1ORZ1(4)<1THEN8180
8127 IFZ2(22)<1ORZ2(24)<1THEN8190
8130 IFRND(TI)>.5THENTX$="{f1}-{ct c}":Z1(2)=Z1(2)-1:GOTO8140
8135 TX$="{f1}+{ct c}":Z2(22)=Z2(22)-1
8140 GOSUB5:IFRND(TI)<.93THEN8125
8142 IFRND(TI)>.5THENTX$="{f1}@{ct c}":Z2(24)=Z2(24)-1:GOSUB5:GOTO8125
8145 TX$="{f1}*{ct c}":Z1(4)=Z1(4)-1:GOSUB5:GOTO8125
8180 TX$=CR$+CR$+"{f1}A{sh space}HORRIBLE{sh space}LOSS!":GOSUB5:A=INT(Z1(1)*.2):
8181 IFZ1(2)<0THENZ1(2)=0
8182 IF(Z1(4)*20)<Z1(2)THENZ1(2)=(Z1(4)*20):TX$="{f1}WARRIORS{sh space}SCATTER!":GOSUB5
8183 IFZ1(4)<1THENZ1(4)=0:Z1(2)=0
8184 IFZ1(2)<1THENZ1(2)=0
8185 Z1(1)=Z1(1)+100:TX$="{f1}YOUR{sh space}REMAINING BATTLE{sh space}CREW":GOSUB5
8186 TX$="{f1}SEIZE 100 ACRES OF ENEMY SOIL!"+CR$+"TO{sh space}HAUL{sh space}HOME!":GOSUB5
8187 Z2(21)=Z2(21)-100:GOTO8900
8190 TX$=CR$+CR$+"{f1}A{sh space}GLORIOUS{sh space}WIN!":GOSUB5:A=INT(Z1(1)*.2):
8191 IFZ1(2)<0THENZ1(2)=0
8192 IF(Z2(24)*20)<Z2(22)THENZ2(22)=(Z2(24)*20):TX$="{f1}WARRIORS{sh space}SCATTER!":GOSUB5
8193 IFZ2(24)<1THENZ2(24)=0:Z2(22)=0
8194 IFZ2(22)<1THENZ2(22)=0
8195 TX$="{f1}YOUR{sh space}REMAINING BATTLE{sh space}CREW":GOSUB5:A=(.2*Z2(21)):Z1(1)=Z1(1)+A
8196 TX$="{f1}SEIZE"+STR$(A)+" ACRES OF ENEMY SOIL!"+CR$+"TO{sh space}HAUL{sh space}HOME!":GOSUB5
8197 Z2(21)=Z2(21)-A:GOTO8900
8900 OPEN2,8,3,"{pound}emprec":A=U1:B=U2:I=0:U1=I9:U2=0:GOSUB4:I0=VAL(I$)
8910 FORI=21TO32:INPUT#2,Z2(I):NEXTI:CLOSE2:U1=A:U2=B:RETURN
8950 OPEN2,8,3,"{pound}emprec":A=U1:B=U2:I=0:U1=I9:U2=0:A$=STR$(I0)+CR$
8960 FORI=21TO32:A$=A$+STR$(Z2(I))+CR$:NEXTI:GOSUB3:PRINT#2,A$
8970 CLOSE2:U1=A:U2=B:RETURN
