{ R6C9: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R6C9;

interface

uses GAMEDATA;

procedure pR6C9_0000(a0: word);
procedure pR6C9_00CC;

implementation

uses LIT;


{$L R6C9A.OBJ}
procedure XR6C9_00D6(a0: word); far; external;
procedure XR6C9_00F5; far; external;
procedure XR6C9_00FF; far; external;


{ 0000 }
procedure pR6C9_0000(a0: word);
var
  _f1: array[1..4] of byte;
begin
  asm
  db 131,126,6,1,119,3,233,183,0,131,126,6,13,114,3,233,174,0
  push cs
  call near ptr XR6C9_00FF
  db 8,192,117,3,233,163,0
  push cs
  call near ptr XR6C9_00F5
  db 8,192,116,2,235,246,191,106,251,30,87,184,12,0,80,176,0,80,154,127,26,37,8,196,62,98,251,6
  db 87,184,40,35,80,176,0,80,154,127,26,37,8,199,6,116,251,40,35,139,70,6,72,139,248,209,231,139
  db 247,209,231,1,247,139,133,26,251,49,210,163,110,251,139,70,6,72,139,248,209,231,139,247,209,231,1,247
  db 196,189,28,251,6,87,196,62,98,251,6,87,139,70,6,72,139,248,209,231,139,247,209,231,1,247,255,181
  db 26,251,154,92,26,37,8,161,98,251,139,22,100,251,137,70,252,137,86,254,141,126,252,22,87,191,106,251
  db 30,87,184,4,0,80,154,92,26,37,8,191,106,251,87
  push cs
  call near ptr XR6C9_00D6
  end;
end;

{ 00CC }
procedure pR6C9_00CC;
begin
end;

{ 00D1 }
begin
end.

