
{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 �     Sibyl Visual Development Environment                                 �
 �                                                                          �
 �     Copyright (C) 1995,99 SpeedSoft Germany,   All rights reserved.      �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

{浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
 �                                                                          �
 � Sibyl Integrated Development Environment (IDE)                           �
 � Object-oriented development system.                                      �
 �                                                                          �
 � Copyright (C) 1995,99 SpeedSoft GbR, Germany                             �
 �                                                                          �
 � This program is free software; you can redistribute it and/or modify it  �
 � under the terms of the GNU General Public License (GPL) as published by  �
 � the Free Software Foundation; either version 2 of the License, or (at    �
 � your option) any later version. This program is distributed in the hope  �
 � that it will be useful, but WITHOUT ANY WARRANTY; without even the       �
 � implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR          �
 � PURPOSE.                                                                 �
 � See the GNU General Public License for more details. You should have     �
 � received a copy of the GNU General Public License along with this        �
 � program; if not, write to the Free Software Foundation, Inc., 59 Temple  �
 � Place - Suite 330, Boston, MA 02111-1307, USA.                           �
 �                                                                          �
 � In summary the original copyright holders (SpeedSoft) grant you the      �
 � right to:                                                                �
 �                                                                          �
 � - Freely modify and publish the sources provided that your modification  �
 �   is entirely free and you also make the modified source code available  �
 �   to all for free (except a fee for disk/CD production etc).             �
 �                                                                          �
 � - Adapt the sources to other platforms and make the result available     �
 �   for free.                                                              �
 �                                                                          �
 � Under this licence you are not allowed to:                               �
 �                                                                          �
 � - Create a commercial product on whatever platform that is based on the  �
 �   whole or parts of the sources covered by the license agreement. The    �
 �   entire program or development environment must also be published       �
 �   under the GNU General Public License as entirely free.                 �
 �                                                                          �
 � - Remove any of the copyright comments in the source files.              �
 �                                                                          �
 � - Disclosure any content of the source files or use parts of the source  �
 �   files to create commercial products. You always must make available    �
 �   all source files whether modified or not.                              �
 �                                                                          �
 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕}

PROGRAM SPC25;

USES Dos,Crt,SysUtils,SPC_Data,Projects;


CONST
  LastErrorType:LONGINT = 0;


PROCEDURE SetCompilerStatusMessage(CONST StatusMsg,ErrorFile:CSTRING;
  ErrorType:LONGINT; ErrorLine,ErrorColumn:LONGINT); CDECL;
VAR
  s,d,n,e:STRING;
  ErrorMsg:STRING;
  newline:BOOLEAN;
BEGIN
  newline := LastErrorType <> errLineNumber;
  LastErrorType := ErrorType;

  CASE ErrorType OF
    errNone:       s := StatusMsg;
    errWarning:    s := 'Warning at [';
    errError:      s := 'Error at [';
    errFatalError: s := 'Fatal Error at [';
  END;

  CASE ErrorType OF
    errWarning,errError,errFatalError:
    BEGIN
      FSplit(ErrorFile,d,n,e);
      ErrorMsg := '"' + StatusMsg + '"';
      s := s + tostr(ErrorLine) + ',' + tostr(ErrorColumn) +
        '] in ' + n + e + '  ' + ErrorMsg;
    END;
    errLineNumber:
    BEGIN
      FSplit(ErrorFile,d,n,e);
      s := n + e + ' (' + tostr(ErrorLine) + ')';
    END;
    ELSE s := StatusMsg;
  END;

  IF not newline THEN GotoXY(1,WhereY-1);
  Writeln(s);
END;



PROCEDURE CallInvokeCompiler(VAR Params:TPasParams;VAR Return:TPasReturn);
BEGIN
  TRY
    InvokeSpc(Params,Return);
  EXCEPT
    Return.Error := TRUE;
    SetCompilerStatusMessage('Internal Compiler Error occured.','',errNone,0,0);
  END;
END;


VAR
  Params:TPasParams;
  Return:TPasReturn;
  prj,d,n,e,s:STRING;
  Settings:TProjectSettings;
  i:LONGINT;
  TheCount:LONGINT;

BEGIN
  IF ParamCount = 0 THEN
  BEGIN
    Writeln('浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�');
    Writeln('�                                                                         �');
    {$IFDEF OS2}
    Writeln('� Speed-Pascal Version 2.5 for OS/2  (C) 1995..99 SpeedSoft               �');
    {$ENDIF}
    {$IFDEF Win32}
    Writeln('� Speed-Pascal Version 2.5 for Win32  (C) 1995..99 SpeedSoft              �');
    {$ENDIF}
    Writeln('�                                                                         �');
    Writeln('� Syntax: SPC25 Source[.PAS] [OutDir[ LibDir[ IncSrcDir]]] [Options]      �');
    Writeln('�     or: SPC25 PrjFile.SPR [Options]                                     �');
    Writeln('�                                                                         �');
    Writeln('� Options are:                                                            �');
    Writeln('�   -M     Make Units                                                     �');
    Writeln('�   -B     Build Units                                                    �');
    Writeln('�                                                                         �');
    {$IFDEF OS2}
    Writeln('�   -OS2   OS/2 Target (default)                                          �');
    Writeln('�   -W32   Win32 Target                                                   �');
    {$ENDIF}
    {$IFDEF Win32}
    Writeln('�   -W32   Win32 Target (default)                                         �');
    Writeln('�   -OS2   OS/2 Target                                                    �');
    {$ENDIF}
    Writeln('�                                                                         �');
    Writeln('�   -A     Generate assembler source                                      �');
    Writeln('�   -Z     Inlined string functions                                       �');
    Writeln('�   -V     Strict VAR strings                                             �');
    Writeln('�   -C     Complete boolean evaluation                                    �');
    Writeln('�                                                                         �');
    Writeln('�   -O0    Disable optimizations                                          �');
    Writeln('�   -O1    Optimize subexpressions only                                   �');
    Writeln('�   -O2    Peephole optimization only                                     �');
    Writeln('�   -O3    Optimize all (default)                                         �');
    Writeln('�                                                                         �');
    Write  ('� >> RETURN <<                                                            �');
    Readln;
    Writeln('�                                                                         �');
    Writeln('�   -$I-   Disable IO checking                                            �');
    Writeln('�   -$Q+   Enable Overflow checking                                       �');
    Writeln('�   -$S+   Enable Stack checking                                          �');
    Writeln('�   -$R+   Enable Range checking                                          �');
    Writeln('�                                                                         �');
    Writeln('�   -$WA+  Enable all warnings                                            �');
    Writeln('�   -$WA-  Disable all warnings                                           �');
    Writeln('�   -$W1+  Enable warning "Possible use of variable before definition"    �');
    Writeln('�   -$W2-  Disable warning "Inherited property redefined"                 �');
    Writeln('�   -$W3-  Disable warning "Inherited variable redefined"                 �');
    Writeln('�   -$W4-  Disable warning "Virtual method redefined"                     �');
    Writeln('�   -$W5-  Disable warning "Identifier is declared but never used"        �');
    Writeln('�   -$W6-  Disable warning "Parameter is declared but never used"         �');
    Writeln('�   -$W7-  Disable warning "Function should return a value"               �');
    Writeln('�   -WC..  Maximum warning count                                          �');
    Writeln('�   -EC..  Maximum error count                                            �');
    Writeln('�                                                                         �');
    Writeln('�   -D     Generate debug information                                     �');
    Writeln('�   -L     Generate local symbols info                                    �');
    Writeln('�                                                                         �');
    Writeln('�   -$C+   Enable Assertions                                              �');
    Writeln('�   -$TRY+ Save Constructors                                              �');
    Writeln('�                                                                         �');
    Write  ('� >> RETURN <<                                                            �');
    Readln;
    Writeln('�                                                                         �');
    Writeln('�   -%S..  Stack size in kByte                                            �');
    Writeln('�   -%H..  Heap size in kByte                                             �');
    Writeln('�                                                                         �');
    Writeln('�   -T1    GUI window target (default)                                    �');
    Writeln('�   -T2    Text window target                                             �');
    Writeln('�   -T3    Fullscreen text window target                                  �');
    Writeln('�                                                                         �');
    Writeln('�   -P1    EXE Pack 1  (OS/2 2.x only)                                    �');
    Writeln('�   -P2    EXE Pack 2  (OS/2 Warp only)                                   �');
    Writeln('�                                                                         �');
    Writeln('�   -VDM   Run from Virtual DOS Machine  (OS/2 only)                      �');
    Writeln('�                                                                         �');
    Writeln('�   -%M    Single shared DLL data segment                                 �');
    Writeln('�                                                                         �');
    Writeln('藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�');
    exit;
  END;

  FillChar(Params,sizeof(Params),0);
  Params.Version := 2;

  FSplit(ParamStr(1),d,n,e);
  UpcaseStr(e);

  IF pos('.SPR',e) > 0 THEN
  BEGIN {lade Settings aus dem Projekt}
    prj := FExpand(ParamStr(1));

    ProjectBaseDir := ExtractFilePath(prj);
    UpcaseStr(ProjectBaseDir);

    InitializeProject(Settings);
    IF Not FileExists(prj) THEN
    BEGIN
      Writeln('Could not find project file: '+ prj);
      exit;
    END;

    IF not ReadProject(Settings,prj) THEN
    BEGIN
      Writeln('Could not read project file: '+ prj);
      exit;
    END;

    Params.Quell := ProjectPrimary(Settings);
    Params.Out := ProjectOutDir(Settings);
    Params.ExeOut := '';
    Params.Lib := ProjectLibDir(Settings);
    Params.LibSrc := ProjectLibSrcDir(Settings);
    Params.IncSrcDir := ProjectIncSrcDir(Settings);
    FSplit(ProjectSCUName(Settings),d,n,e);
    IF d[Length(d)] = '\' THEN SetLength(d,Length(d)-1);
    Params.SCUDir := FExpandProject(d);
    Params.Params := '-M' + GetCompilerOptions(Settings);
    FOR i := 2 TO ParamCount DO
      Params.Params := Params.Params + ParamStr(i);
    Params.Defines := GetCompilerDefines(Settings);
  END
  ELSE
  BEGIN {lade Settings aus der Kommandozeile}
    Params.Quell := FExpand(ParamStr(1));
    Params.Out := Dos.FExpand('');
    Params.ExeOut := '';
    Params.Lib := Dos.FExpand('');
    Params.IncSrcDir := Dos.FExpand('');
    Params.Defines := '';

    TheCount:=ParamCount+1;
    IF (ParamCount>=2) THEN
    BEGIN
         s:=ParamStr(2);
         //IF ((pos(':\',s)<>0) OR (pos('.\',s)<>0)) THEN
         IF ((pos('+',s)=0) AND (pos('-',s)=0)) THEN
         BEGIN
              Params.out:=FExpand(s);
              IF ParamCount>=3 THEN
              BEGIN
                   s:=ParamStr(3);
                   //IF ((pos(':\',s)<>0) OR (pos('.\',s)<>0)) THEN
                   IF ((pos('+',s)=0) AND (pos('-',s)=0)) THEN
                   BEGIN
                        Params.lib:=FExpand(s);
                        IF ParamCount>=4 THEN
                        BEGIN
                             s:=ParamStr(4);
                             //IF ((pos(':\',s)<>0) OR (pos('.\',s)<>0)) THEN
                             IF ((pos('+',s)=0) AND (pos('-',s)=0)) THEN
                             BEGIN
                                  Params.IncSrcDir:=FExpand(s);
                                  TheCount:=5;
                                  IF ParamCount>=5 THEN
                                  BEGIN
                                       Params.params:=ParamStr(5);
                                       TheCount:=6;
                                  END;
                             END
                             ELSE
                             BEGIN
                                  Params.params:=s;
                                  TheCount:=5;
                             END;
                        END;
                   END
                   ELSE
                   BEGIN
                        Params.params:=s;
                        TheCount:=4;
                   END;
              END;
         END
         ELSE
         BEGIN
              Params.params:=s;
              TheCount:=3;
         END;
    END
    ELSE TheCount:=2;

    WHILE TheCount<=ParamCount DO
    BEGIN
         Params.params:=Params.params+ParamStr(TheCount);
         inc(TheCount);
    END;
  END;
  Params.MsgProc := @SetCompilerStatusMessage;
  Params.Version := 201;  //SPC20 owner
  Params.AddResources := NIL;
  Params.ErrorTable := NIL;

  FillChar(Return,sizeof(Return),0);

  CallInvokeCompiler(Params,Return);
END.

