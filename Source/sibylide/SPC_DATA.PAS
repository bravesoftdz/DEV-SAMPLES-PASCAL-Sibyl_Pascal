
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

UNIT SPC_Data;

INTERFACE

CONST
    errLineNumber    = 1;   //SourceFile,Line,Column valid
    errNone          = 2;   //NotifyStr valid
    errWarning       = 3;   //all parameters valid
    errError         = 4;   //all parameters valid
    errFatalError    = 5;   //all parameters valid


TYPE
    PMemoryList=^TMemoryList;
    TMemoryList=RECORD
        Name:CSTRING;
        Adresse:POINTER;
        Len:longword;
        Modified:LONGBOOL;
        Next:PMemoryList;
    END;

    PAddResources=^TAddResources;
    TAddResources=RECORD
        TotalDataLen:LONGINT; //length of structure for freemem
        Data:POINTER;         //pointer to full names of language SRF files that should be installed
                              //each item is a pascal string, end is a zero length string
        TotalNameLen:LONGINT; //length of structure for freemem
        Names:POINTER;        //pointer to names of languages that should be included.
                              //each item is a pascal string, end is a zero length string
    END;

    PPasParams=^TPasParams;
    TPasParams=RECORD
        Language:LONGWORD;       {1=German}
        Version:LONGWORD;        {1=Old IDE,2=Sibyl}
        MsgProc:POINTER;
        AddResources:PAddResources;
        ErrorTable:^Char;
        ApplicationIcon:POINTER;
        ApplicationIconLen:LongWord;
        InMemory:PMemoryList;
        Quell:CSTRING;           {File to Compile}
        Lib:CSTRING;             {Library directory}
        Out:CSTRING;             {Output directory}
        ExeOut:CSTRING;          {Output f�r die Exe - nur f�r CompLib}
        LibSrc:CSTRING;          {Library sources - for build}
        Params:CSTRING;          {Command line parameters}
        Defines:CSTRING;         {Conditional defines}
        IncSrcDir:CSTRING;
        SCUDir:CSTRING;
        Reserved3:POINTER;
    END;

    TRetFilesArray=ARRAY[0..249] OF CSTRING;
    PRetFilesArray=^TRetFilesArray;

    PPasReturn=^TPasReturn;
    TPasReturn=RECORD
        Error:LONGBOOL;
        RetFiles:PRetFilesArray;
        RetFilesCount:LONGINT;
        RetType:LONGINT;
    END;

// References were to SPDLL25 - AaronL
{$IFDEF OS2}
IMPORTS
       PROCEDURE InvokeSPC(VAR Params:TPasParams;VAR Return:TPasReturn);
              APIENTRY; 'SPDLL20' index 1;
       PROCEDURE BreakCompiler;
              APIENTRY; 'SPDLL20' index 2;
END;
{$ENDIF}
{$IFDEF Win32}
IMPORTS
       PROCEDURE InvokeSPC(VAR Params:TPasParams;VAR Return:TPasReturn);
              APIENTRY; 'SPDLL20' name 'InvokeSPC';
       PROCEDURE BreakCompiler;
              APIENTRY; 'SPDLL20' name 'BreakCompiler';
END;
{$ENDIF}


IMPLEMENTATION

END.

