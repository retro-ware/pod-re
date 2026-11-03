{ R5A0: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R5A0;

interface

uses GAMEDATA;

procedure pR5A0_0000(a0: word);
procedure pR5A0_001B;
procedure pR5A0_0031(a0: word);
procedure pR5A0_0098;
procedure pR5A0_00CC;
procedure pR5A0_018F(a0: byte);

implementation

uses LIT, R5C0, R5C3, R670, R6B9, R6C9;

type
  R0_byte = record v: byte end;
  PR0_byte = ^R0_byte;
var
  b92A8: byte absolute d92A8;
  b92B7: byte absolute d92B7;
  b92BD: byte absolute d92BD;
  b92C0: byte absolute d92C0;
  b92C1: byte absolute d92C1;
  b92CA: byte absolute d92CA;
  l92B3: longint absolute d92B3;
  l92B9: longint absolute d92B9;
  p92B3: pointer absolute d92B3;
  p92B9: pointer absolute d92B9;
  p92C2: pointer absolute d92C2;
  p92C6: pointer absolute d92C6;
  w3DE8: word absolute d3DE8;
  w92B7: word absolute d92B7;
  w92BD: word absolute d92BD;


{ 0000 }
procedure pR5A0_0000(a0: word);
begin
  {@0003-000F}
  if b92C0 = 2 then
    pR6B9_00D6;
  {@000F-0017}
  pR6C9_0000(a0);
end;

{ 001B }
procedure pR5A0_001B;
begin
  {@001E-002A}
  if b92C0 = 2 then
    pR6B9_00D6;
  {@002A-002F}
  pR6C9_00CC;
end;

{ 0031 }
procedure pR5A0_0031(a0: word);
begin
  {@0034-003D}
  if b92A8 = 5 then
    Exit;
  {@003D-004D}
  if b92C0 = 1 then
    pR6C9_0000(w3DE8);
  {@004D-0063}
  if (b92CA <> a0) and (b92C0 = 2) then
    pR6B9_00D6;
  {@0063-008C}
  if b92C0 = 0 then
  begin
    {@006A-0070}
    b92CA := a0;
    asm
  db 255,118,6
  push cs
  call near ptr pR5A0_018F
    end;
    {@0077-008C}
    pR6B9_001F(l92B3, l92B9);
  end;
  {@008C-0094}
  pR6B9_00B6(0);
end;

{ 0098 }
procedure pR5A0_0098;
begin
  {@009B-00A7}
  if b92C0 = 2 then
    pR6B9_00D6;
end;

{ 00CC }
procedure pR5A0_00CC;
var
  v4p: pointer;
  _f1: array[1..128] of byte;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'MUSIC' then;
    if LV = '.dax' then;
    if LV = 'unable to load com file' then;
  end;
  {@00D3-00DB}
  v4p := nil;
  {@00DB-00F7}
  pR5C3_0915('MUSIC', '.dax', 0, @b92B7, @v4b);
  if w92B7 = 0 then
  begin
    {@00FE-0115}
    WriteLn(Output, 'unable to load com file');
    {@0115-011D}
    pR670_0000(0);
  end;
  {@011D-012C}
  XR670_046E(@PR0_byte(p92C2)^.v, 13000);
  {@012C-013A}
  p92B3 := p92C2;
  asm
  db 161,179,146,139,22,181,146,37,15,0,129,226,0,0,8,192,116,12,131,6,179,146,1,131,22,181,146,0
  db 235,226
  end;
  {@0158-016C}
  Move(PR0_byte(v4p)^.v, PR0_byte(p92B3)^.v, w92B7);
  {@016C-017B}
  pR5C0_0000(v4p, w92B7);
  {@017B-0180}
  b92C1 := 1;
end;

{ 018F }
procedure pR5A0_018F(a0: byte);
var
  v4p: pointer;
  _f1: array[1..130] of byte;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'MUSIC' then;
    if LV = '.dax' then;
  end;
  {@0196-01B3}
  pR5C3_0915('MUSIC', '.dax', a0, @b92BD, @v4b);
  {@01B3-01C2}
  XR670_046E(@PR0_byte(p92C6)^.v, 6144);
  {@01C2-01D0}
  p92B9 := p92C6;
  {@01D0-01E4}
  Move(PR0_byte(v4p)^.v, PR0_byte(p92B9)^.v, w92BD);
  {@01E4-01F3}
  pR5C0_0000(v4p, w92BD);
end;

{ 01F9 }
begin
end.

