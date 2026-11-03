{ O03D: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O03D;

interface

uses GAMEDATA;

procedure pO03D_00FC;

implementation

uses LIT, O111, R1C3, R47F, R5A0, R670, R6DD;


function pO03D_0000(a0: word): byte; far; forward;
procedure pO03D_007E; far; forward;
procedure pO03D_008E; far; forward;

{ 0000 }
function pO03D_0000(a0: word): byte;
var loc: array[1..9] of byte;
begin
  asm
    call pR670_0311
    call pR47F_0BAD
    db 137,70,251,137,86,253,184,100,0,247,102,6,49,210,3,70,251,19,86,253,137,70,247,137,86,249
    call pR670_0277
    db 8,192,117,34
    call pR47F_0BAD
    db 59,86,249,127,24,124,5,59,70,247,115,17
    call pR47F_0BAD
    db 59,86,253,124,7,127,218,59,70,251,115,213
    call pR47F_0BAD
    db 59,86,249,127,7,124,11,59,70,247,114,6,198,70,255,0,235,4,198,70,255,1
    call pR670_0311
  end;
end;

{ 007E }
procedure pO03D_007E;
begin
  asm
    call pR6DD_0030
  end;
end;

{ 008E }
procedure pO03D_008E;
var loc: array[1..6] of byte;
begin
  if false then begin
    if LV = 'title' then;
  end;
  asm
    db 141,126,250,22,87,191,136,0,14,87,154,111,10,37,8,176,3,80,176,0,80,176,0,80,191,225,125,30
    db 87
    call pR1C3_0352
    db 49,192,80,184,0,1,80,191,30,213,30,87
    call pR1C3_1F24
    db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
    call pR1C3_0EEB
    db 191,225,125,30,87
    call pR1C3_1A83
    db 184,20,0,80
    push cs
    call near ptr pO03D_0000
    db 8,192,116,2,235,0
  end;
end;

{ 00FC }
procedure pO03D_00FC;
var loc: array[1..8] of byte;
begin
  if false then begin
    if LV = 'title' then;
  end;
  asm
    db 49,192,163,225,125,163,227,125
    call pO111_096E
    call pR6DD_0051
    call pR47F_0C27
    db 184,1,0,80
    call pR5A0_0031
    db 141,126,249,22,87,191,246,0,14,87,154,111,10,37,8,176,1,80,176,0,80,176,0,80,191,225,125,30
    db 87
    call pR1C3_0352
    db 49,192,80,184,0,1,80,191,30,213,30,87
    call pR1C3_1F24
    db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
    call pR1C3_0EEB
    db 191,225,125,30,87
    call pR1C3_1A83
    db 184,5,0,80
    push cs
    call near ptr pO03D_0000
    db 8,192,116,10
    push cs
    call near ptr pO03D_008E
    push cs
    call near ptr pO03D_007E
    db 235,117,141,126,249,22,87,191,246,0,14,87,154,111,10,37,8,176,2,80,176,0,80,176,0,80,191,225
    db 125,30,87
    call pR1C3_0352
    call pR47F_0C27
    db 49,192,80,184,0,1,80,191,30,213,30,87
    call pR1C3_1F24
    db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
    call pR1C3_0EEB
    db 191,225,125,30,87
    call pR1C3_1A83
    db 184,5,0,80
    push cs
    call near ptr pO03D_0000
    db 8,192,116,10
    push cs
    call near ptr pO03D_008E
    push cs
    call near ptr pO03D_007E
    db 235,10
    push cs
    call near ptr pO03D_008E
    push cs
    call near ptr pO03D_007E
    db 235,0
  end;
end;

{ 0201 }
begin
  asm
  end;
end.

