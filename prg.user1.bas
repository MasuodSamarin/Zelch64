!--------------------------------------------------
!- Saturday, May 20, 2017 4:38:19 PM
!- Import of : 
!- c:\src\zelch64\prg.user1.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 TX$="User #{ct c}":GOSUB210:GOSUB111:IFI=0THEN3150
8010 C2=INT(I/256):C3=C2*256:C1=I-C3:OPEN1,8,15,"i0":OPEN2,8,3,"0:{pound}log1"
8020 I=0:GOSUB6:GET#2,A$:INPUT#1,E1
8030 IFA$<>"{pound}"ORE1>0THENSYSZ,1:SYSZ,2:TX$="no record":GOSUB210:GOTO3150
8500 GOSUB8550
8510 TX$="HANDLE:"+TT$(0)+":{ct c}":GOSUB210:POKE731,1:GOSUB190:IFLEN(I$)>20THEN8510
8520 IFI$<>""THENTT$(0)=I$
8530 GOTO8590
8550 FORI=0TO4:INPUT#2,TT$(I):NEXT:RETURN
8590 TX$="Fone #:"+TT$(1)+":{ct c}":GOSUB210:GOSUB190:IFLEN(I$)>15THEN8590
8600 IFI$<>""THENTT$(1)=I$
8610 TX$="Access:"+TT$(2)+":{ct c}":GOSUB210:GOSUB190:IFLEN(I$)>1THEN8610
8620 IFI$<>""THENTT$(2)=I$
8630 TX$="Name:"+TT$(3)+":{ct c}":GOSUB210:POKE731,1:GOSUB190:IFLEN(I$)>17THEN8630
8640 IFI$<>""THENTT$(3)=I$
8643 TX$="Pass:"+TT$(4)+":{ct c}":GOSUB210:GOSUB190:IFLEN(I$)>7THEN8643
8646 IFI$<>""THENTT$(4)=I$
8651 TX$="S)ave E)dit or A)bort:{ct c}":GOSUB210:GOSUB190:IFI$="e"THEN8510
8660 IFI$="a"THENSYSZ,1:SYSZ,2:GOTO3150
8670 IFI$<>"s"THEN8651
8680 A$="{pound}":FORI=0TO4:A$=A$+TT$(I)+CHR$(13):NEXT:I=0:GOSUB6:PRINT#2,A$
8720 SYSZ,1:SYSZ,2:GOTO3150