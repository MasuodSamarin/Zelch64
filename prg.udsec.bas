!--------------------------------------------------
!- Friday, May 12, 2017 11:15:28 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.udsec.prg
!- Commodore 64
!--------------------------------------------------
8000 SYS51983:GOTO2805
8100 TX$="{clear}{down*2}{f1}BLKS {f1}FILENAME       {f1}FILETYPE":GOSUB5:POKE253,193+CU
8110 OPEN2,DV(2,CU),0,"$0:"+CHR$(193+CU)+"*":SYS38224:CLOSE2:GOTO2810
8200 TX$="{f1}UD SECTIONS{sh space}AVAILABLE":GOSUB5:FORI=0TON(2)
8210 IFAC>=AC(2,I)THENTX$="{f1}("+CHR$(I+193)+") "+NA$(2,I):GOSUB5
8220 NEXTI:GOTO2810
8299 IN$=CHR$(ASC(IN$)+96)
8300 I=ASC(IN$)-193:IFI=CUORAC<AC(2,I)THEN2810
8310 CU=I:TX$=CR$+"{f1}ENTERING:{white}"+NA$(2,I):GOSUB5:GOTO2810
8400 ER=0:TX$="{f1}P)RG{white} or {f1}S)EQ{white}:{ct c}":GOSUB5
8410 GOSUB11:IFIN$=""THEN8410
8420 IFIN$=CR$THENER=1:RETURN
8430 TX$=IN$:GOSUB5:IFIN$="p"THENFI$=FI$+",p,":TY=1:RETURN
8440 IFIN$="s"THENFI$=FI$+",s,":TY=2:RETURN
8450 GOTO8400
8500 ER=0:TX$="{f1}FILENAME:{ct c}":GOSUB5:GOSUB7:IFI$=""ORLEN(I$)>14THENER=1:RETURN
8510 FORI=1TOLEN(I$):A$=MID$(I$,I,1):IFA$="*"ORA$=","ORA$="?"ORA$="$"THENER=1
8520 IFA$=":"ORA$=";"ORA$="#"ORA$="{ct c}"THENER=1
8530 NEXTI:IFLEFT$(I$,1)="{pound}"ANDAC<9THENER=1
8540 IFLEFT$(I$,1)<>"{pound}"THENI$=CHR$(193+CU)+I$
8550 FI$="":RETURN
9000 POKE512,0:TX$="{f1}UPLOAD!":GOSUB5:GOSUB8500:IFER=1THEN2810
9010 FI$=I$:GOSUB8400:IFER=1THEN2810
9020 GOTO2830
9500 POKE512,0:TX$="{f1}DOWNLOAD!":GOSUB5:GOSUB8500:IFER=1THEN2810
9510 FI$=I$:GOSUB8400:IFER=1THEN2810
9520 FI$=FI$+"r":OPEN2,DV(2,CU),2,"0:"+FI$:INPUT#DV(2,CU),E:CLOSE2
9530 IFE>1THENTX$="{f1}FILE NOT FOUND!":GOSUB5:GOTO2810
9540 OPEN2,DV(2,CU),0,"$0:"+FI$:SYS38239:CLOSE2:A=PEEK(251)
9550 IFA=0OR(A*DC)>CCTHENTX$="{f1}NOT{sh space}ENOUGH CREDIT!":GOSUB5:GOTO2810
9560 OPEN2,DV(2,CU),2,"0:"+FI$:GOTO2930
