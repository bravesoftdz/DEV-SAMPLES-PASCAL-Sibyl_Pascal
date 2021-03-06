
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

UNIT TreeList;

INTERFACE

USES SysUtils,Classes;


CONST
    InvalidIndex=MaxLongInt;


TYPE
    ETreeListError=CLASS(Exception);
    ETreeIndexError=CLASS(ETreeListError);
    ETreeNodeError=CLASS(ETreeListError);

    TAttachMode=(oaAdd, oaAddChild, oaInsert);

    TTreeNode=CLASS;
    TTreeList=CLASS;

    TTreeNode=CLASS
      PRIVATE
         FData:POINTER;
         FTreeList:TTreeList;
         FParent:TTreeNode;
         FSubNodes:TList;
         FUNCTION GetNode(idx:LONGINT):TTreeNode;
         FUNCTION GetNodeCount:LONGINT;
         FUNCTION InsertNode(OldNode,NewNode:TTreeNode):LONGINT;
         FUNCTION AddNode(NewNode:TTreeNode):LONGINT;
         FUNCTION HasChildren:BOOLEAN;
         FUNCTION GetLevel:LONGINT;
         FUNCTION GetList:TList;
         FUNCTION GetRootNode:TTreeNode;
         PROCEDURE Clear;
      PROTECTED
         PROPERTY RootNode:TTreeNode read GetRootNode;
      PUBLIC
         CONSTRUCTOR Create(Owner:TTreeList);
         DESTRUCTOR Destroy;OVERRIDE;
         PROPERTY Data:POINTER read FData write FData;
         PROPERTY Parent:TTreeNode read FParent;
         PROPERTY SubNodes:TList read FSubNodes;
         PROPERTY Items[idx:LONGINT]:TTreeNode read GetNode;
         PROPERTY ItemCount:LONGINT read GetNodeCount;
         PROPERTY HasItems:BOOLEAN read HasChildren;
         PROPERTY Level:LONGINT read GetLevel;
         PROPERTY List:TList read GetList;
    END;

    TNodeClass=CLASS OF TTreeNode;


    TTreeList=CLASS(TComponent)
      PRIVATE
         FRootNode:TTreeNode;
         FGoodNode:TTreeNode;
         FUpdateCount:LONGINT;
         FNodeClass:TNodeClass;
         FUNCTION AttachNode(Node:TTreeNode;Data:POINTER;Mode:TAttachMode):TTreeNode;
      PROTECTED
         PROCEDURE IndexError;VIRTUAL;
         PROCEDURE NodeError;VIRTUAL;
         FUNCTION GetRootNode:TTreeNode;
         PROCEDURE InitRoot;VIRTUAL;
      PUBLIC
         CONSTRUCTOR Create(AOwner:TComponent);OVERRIDE;
         DESTRUCTOR Destroy;OVERRIDE;
         FUNCTION AddObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
         FUNCTION AddChildObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
         FUNCTION InsertObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
         PROCEDURE DeleteNode(Node:TTreeNode);
         PROCEDURE Clear;
         PROCEDURE BeginUpdate;
         PROCEDURE EndUpdate;
         PROPERTY Root:TTreeNode read GetRootNode;
         PROPERTY NodeClass:TNodeClass read FNodeClass write FNodeClass;
    END;



IMPLEMENTATION


PROCEDURE TTreeList.IndexError;
BEGIN
     Raise ETreeIndexError.Create('Invalid tree list index');
END;


PROCEDURE TTreeList.NodeError;
BEGIN
     Raise ETreeNodeError.Create('Invalid tree node (NIL)');
END;


CONSTRUCTOR TTreeList.Create(AOwner:TComponent);
BEGIN
     FNodeClass := TTreeNode;

     Inherited Create(AOwner);

     FUpdateCount := 0;
     FRootNode := NIL;
     FGoodNode := NIL;
END;


PROCEDURE TTreeList.InitRoot;
BEGIN
     FRootNode := FNodeClass.Create(SELF);
     FRootNode.FData := NIL;
     FRootNode.FParent := NIL;
     FGoodNode := FRootNode;
END;


DESTRUCTOR TTreeList.Destroy;
BEGIN
     Clear;
     Inherited Destroy;
END;


FUNCTION TTreeList.AddObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
BEGIN
     IF Node <> NIL THEN
     BEGIN
          IF Node = FRootNode THEN Result := AddChildObjectNode(Node,Data)
          ELSE Result := AttachNode(Node,Data,oaAdd);
     END
     ELSE NodeError;
END;


FUNCTION TTreeList.AddChildObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
BEGIN
     IF Node <> NIL THEN
     BEGIN
          Result := AttachNode(Node,Data,oaAddChild);
     END
     ELSE NodeError;
END;


FUNCTION TTreeList.InsertObjectNode(Node:TTreeNode;Data:POINTER):TTreeNode;
BEGIN
     IF Node <> NIL THEN
     BEGIN
          IF Node = FRootNode THEN Result := AddChildObjectNode(Node,Data)
          ELSE Result := AttachNode(Node,Data,oaInsert);
     END
     ELSE NodeError;
END;


PROCEDURE TTreeList.DeleteNode(Node:TTreeNode);
BEGIN
     IF Node <> NIL THEN
     BEGIN
          IF Node <> FRootNode THEN Node.Destroy
          ELSE Clear;
     END
     ELSE NodeError;
END;


FUNCTION TTreeList.AttachNode(Node:TTreeNode;Data:POINTER;Mode:TAttachMode):TTreeNode;
VAR  NewNode:TTreeNode;
BEGIN
     IF Node = NIL THEN NodeError;

     IF FRootNode = NIL THEN InitRoot;

     NewNode := FNodeClass.Create(SELF);
     NewNode.Data := Data;

     CASE Mode OF
       oaAddChild: Node.AddNode(NewNode);
       oaAdd:      Node.Parent.AddNode(NewNode);
       oaInsert:   Node.Parent.InsertNode(Node,NewNode);
     END;
     Result := NewNode;
END;


PROCEDURE TTreeList.Clear;
BEGIN
     IF FRootNode <> NIL THEN FRootNode.Destroy;
     FRootNode := NIL;
     FGoodNode := NIL;
END;


PROCEDURE TTreeList.BeginUpdate;
BEGIN
     inc(FUpdateCount);
END;


PROCEDURE TTreeList.EndUpdate;
BEGIN
     dec(FUpdateCount);
END;


FUNCTION TTreeList.GetRootNode:TTreeNode;
BEGIN
     IF FRootNode = NIL THEN InitRoot;
     Result := FRootNode;
END;


///////////////////////////////////////////////////////////////////////////


CONSTRUCTOR TTreeNode.Create(Owner:TTreeList);
BEGIN
     Inherited Create;

     IF not (Owner IS TTreeList) THEN
     BEGIN
          Raise ETreeListError.Create('Invalid tree node Parent');
     END;

     FTreeList := TTreeList(Owner);
END;


FUNCTION TTreeNode.GetNode(idx:LONGINT):TTreeNode;
BEGIN
     Result := FSubNodes.Items[idx];
END;


FUNCTION TTreeNode.GetNodeCount;
BEGIN
     IF FSubNodes <> NIL THEN Result := FSubNodes.Count
     ELSE Result := 0;
END;


FUNCTION TTReeNode.GetRootNode:TTreeNode;
BEGIN
     Result := FTreeList.FRootNode;
END;


FUNCTION TTreeNode.HasChildren:BOOLEAN;
BEGIN
     Result := GetNodeCount > 0;
END;


FUNCTION TTreeNode.GetLevel:LONGINT;
BEGIN
     IF SELF = RootNode THEN Result := 0
     ELSE Result := Parent.GetLevel + 1;
END;


FUNCTION TTreeNode.GetList:TList;
BEGIN
     IF FSubNodes = NIL THEN FSubNodes.Create;
     Result := FSubNodes;
END;


FUNCTION TTreeNode.InsertNode(OldNode,NewNode:TTreeNode):LONGINT;
VAR  i:LONGINT;
BEGIN
     NewNode.FParent := SELF;

     i := List.IndexOf(OldNode);
     List.Insert(i, NewNode);

     Result := InvalidIndex;
END;


FUNCTION TTreeNode.AddNode(NewNode:TTreeNode):LONGINT;
BEGIN
     NewNode.FParent := SELF;

     List.Add(NewNode);

     Result := InvalidIndex;
END;


PROCEDURE TTreeNode.Clear;
VAR  t:LONGINT;
BEGIN
     IF FSubNodes = NIL THEN exit;
     FOR t := FSubNodes.Count-1 DOWNTO 0 DO
     BEGIN
          Items[t].FParent := NIL;
          Items[t].Destroy;
     END;

     FSubNodes.Destroy;
     FSubNodes := NIL;
END;


DESTRUCTOR TTreeNode.Destroy;
BEGIN
     Clear;

     IF SELF <> RootNode THEN
     BEGIN
          IF FParent <> NIL THEN
            IF Parent.FSubNodes <> NIL THEN Parent.FSubNodes.Remove(SELF);
     END;

     Inherited Destroy;
END;



BEGIN
END.
