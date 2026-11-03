{ R716: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R716;

interface

uses GAMEDATA;

procedure pR716_0000;
function pR716_003B(a0: byte): byte;
function pR716_0107(a0: byte; a1: byte): byte;
procedure pR716_018D(a0: pointer; a1: pointer);
procedure XR716_01DC;

implementation

uses LIT;

type
  R0_byte = record v: byte end;
  R0_word = record v: word end;
  PR0_byte = ^R0_byte;
  PR0_word = ^R0_word;
var
  a7D4E_c768: array[0..5459, 0..5] of byte absolute d7D4E;
  aC5B8_97dd: array[0..1169, 0..13] of word absolute dC5B8;
  aC5C6_97dd: array[0..1169, 0..13] of word absolute dC5C6;
  bB16D: byte absolute dB16D;
  bC5D4: byte absolute dC5D4;
  bC60C: byte absolute dC60C;
  sbB16D: shortint absolute dB16D;

{$L R716A.OBJ}
procedure XR716_01DC; external;


{ 0000 }
procedure pR716_0000;
var
  _f1: array[1..6] of byte;
begin
  {@0006-0017}
  FillChar(bC5D4, 56, 0);
  if bC60C <> 0 then
    asm
  db 176,1,80,141,126,254,22,87,141,126,252,22,87,141,126,251,22,87
  push cs
  call near ptr XR716_01DC
  db 162,12,198
    end;
end;

{ 003B }
function pR716_003B(a0: byte): byte;
var
  v3w: word;
  v5w: word;
  v7w: word;
  v9w: word;
  _f1: array[1..3] of byte;
begin
  {@0041-0045}
  pR716_003B := 8;
  {@0045-004F}
  if bC60C = 0 then
    Exit;
  asm
  db 138,70,6,80,141,126,253,22,87,141,126,251,22,87,141,126,246,22,87
  push cs
  call near ptr XR716_01DC
  db 8,192,117,3,233,145,0
  end;
  {@006D-0072}
  v7w := 0;
  for bB16D := 1 to 5 do
  begin
    {@007D-00A3}
    if aC5B8_97dd[a0, sbB16D] < v3w then
      v7w := sbB16D;
  end;
  {@00AA-00AF}
  v9w := 0;
  for bB16D := 1 to 5 do
  begin
    {@00BA-00E0}
    if aC5C6_97dd[a0, sbB16D] < v5w then
      v9w := sbB16D;
  end;
  {@00E7-00FE}
  pR716_003B := a7D4E_c768[v9w, v7w];
end;

{ 0107 }
function pR716_0107(a0: byte; a1: byte): byte;
var loc: array[1..7] of byte;
begin
  asm
    db 198,70,255,0,128,62,12,198,0,117,2,235,106,198,70,254,0,198,70,249,0,138,70,8,80,141,126,252
    db 22,87,141,126,250,22,87,141,126,249,22,87
    push cs
    call near ptr XR716_01DC
    db 8,192,116,55,138,70,8,60,1,117,23,138,70,6,60,1,117,6,198,70,254,1,235,8,60,2,117,4
    db 198,70,254,2,235,25,60,2,117,21,138,70,6,60,1,117,6,198,70,254,4,235,8,60,2,117,4,198
    db 70,254,8,138,70,249,34,70,254,8,192,176,0,118,1,64,136,70,255
  end;
end;

{ 018D }
procedure pR716_018D(a0: pointer; a1: pointer);
begin
  {@0190-0198}
  PR0_word(a0)^.v := 0;
  if pR716_0107(1, 2) <> 0 then
    PR0_word(a0)^.v := 2
  else
  begin
    {@01B0-01C6}
    if pR716_0107(1, 1) <> 0 then
      PR0_word(a0)^.v := 1;
  end;
  {@01C6-01D3}
  PR0_byte(a1)^.v := pR716_003B(1);
end;

{ 01D7 }
begin
end.

