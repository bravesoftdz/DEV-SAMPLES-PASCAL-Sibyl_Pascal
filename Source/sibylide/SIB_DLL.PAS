
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

UNIT SIB_DLL;

INTERFACE


FUNCTION LoadDLL(Name:STRING):LONGWORD;
FUNCTION FreeDLL(VAR Handle:LONGWORD):BOOLEAN;
FUNCTION GetDLLProcAddress(Handle:LONGWORD;CONST ProcName:STRING):POINTER;


IMPLEMENTATION

{$IFDEF OS2}
USES BseDos;
{$ENDIF}
{$IFDEF Win32}
USES WinBase;
{$ENDIF}


FUNCTION LoadDLL(Name:STRING):LONGWORD;
{$IFDEF OS2}
VAR  c:CSTRING;
{$ENDIF}
BEGIN
     {$IFDEF OS2}
     IF DosLoadModule(c,255,Name,Result) <> 0 THEN Result := 0;
     {$ENDIF}
     {$IFDEF Win32}
     Result := LoadLibrary(Name);
     {$ENDIF}
END;


FUNCTION FreeDLL(VAR Handle:LONGWORD):BOOLEAN;
BEGIN
     Result := FALSE;
     {$IFDEF OS2}
     IF Handle <> 0 THEN Result := DosFreeModule(Handle) = 0;
     {$ENDIF}
     {$IFDEF Win32}
     IF Handle <> 0 THEN Result := FreeLibrary(Handle);
     {$ENDIF}
     IF Result THEN Handle := 0;
END;


FUNCTION GetDLLProcAddress(Handle:LONGWORD;CONST ProcName:STRING):POINTER;
VAR  c:CSTRING;
BEGIN
     c := ProcName;
     {$IFDEF OS2}
     IF DosQueryProcAddr(Handle,0,c,Result) <> 0 THEN Result := NIL;
     {$ENDIF}
     {$IFDEF Win32}
     Result := GetProcAddress(Handle,c);
     {$ENDIF}
END;



INITIALIZATION
END.

