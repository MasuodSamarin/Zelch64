!--------------------------------------------------
!- Saturday, May 20, 2017 2:44:25 PM
!- Import of : 
!- c:\src\zelch64\prg.menu.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8020 TX$="{clear}{f1}Sub Section{down*2}":GOSUB210:FI$="{pound}pgmenu":GOSUB1200
8030 TX$=CHR$(13)+"{f1}Sub"+STR$(NP+1)+":{ct c}":GOSUB210
8040 GOSUB100:IFIN$="q"THENTX$="q":GOSUB210:GOTO2120
8050 IFIN$="p"THENTX$="p":GOSUB210:GOTO8100
8060 IFIN$="c"THENTX$="c":GOSUB210:GOTO8200
8070 IFIN$="l"THENTX$="l":GOSUB210:GOTO8300
8071 IFIN$="$"THENTX$="$":GOSUB210:FI$="{pound}section"+STR$(NP+1):GOSUB1200:GOTO8030
8072 IFIN$="?"THENTX$="?":GOSUB210:GOTO8090
8080 GOTO8040
8090 FI$="{pound}pgmenu":TX$="{clear}":GOSUB210:GOSUB1200:GOTO8030
8100 TX$=CHR$(13)+"Program #{ct c}":GOSUB210:GOSUB111:IFI=0THEN8030
8110 I$="{pound}pgm"+STR$(NP+1)+STR$(I):OPEN1,8,15,"i0"
8111 OPEN8,8,8,"0:"+I$+",p,r":SYSZ,8:INPUT#1,E,E$,E1,E1:SYSZ,1:IFE=0THEN88
8112 TX$="{f1}Program NOT FOUND!":GOSUB210:GOTO8030
8200 TX$=CHR$(13)+"New Sub:{ct c}":GOSUB210:GOSUB111:IFI=0ORI-1>SSTHEN8030
8210 IFAC>=SS(I-1)THENNP=I-1
8230 GOTO8030
8300 TX$="Sub Sections:":GOSUB210:I=0
8310 IFAC>=SS(I)THENTX$="{f1}"+STR$(I+1)+"):"+SS$(I):GOSUB210
8320 I=I+1:IFI<=SSTHEN8310
8330 GOTO8030
