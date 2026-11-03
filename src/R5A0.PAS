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
procedure pR5A0_018F(a0: word);

implementation

uses LIT, R5C0, R5C3, R670, R6B9, R6C9;



{ 0000 }
procedure pR5A0_0000(a0: word);
begin
  asm
    db 128,62,192,146,2,117,5
    call pR6B9_00D6
    db 255,118,6
    call pR6C9_0000
  end;
end;

{ 001B }
procedure pR5A0_001B;
begin
  asm
    db 128,62,192,146,2,117,5
    call pR6B9_00D6
    call pR6C9_00CC
  end;
end;

{ 0031 }
procedure pR5A0_0031(a0: word);
begin
  asm
    db 128,62,168,146,5,117,2,235,87,128,62,192,146,1,117,9,255,54,232,61
    call pR6C9_0000
    db 160,202,146,48,228,59,70,6,116,12,128,62,192,146,2,117,5
    call pR6B9_00D6
    db 128,62,192,146,0,117,34,138,70,6,162,202,146,255,118,6
    push cs
    call near ptr pR5A0_018F
    db 255,54,181,146,255,54,179,146,255,54,187,146,255,54,185,146
    call pR6B9_001F
    db 49,192,80
    call pR6B9_00B6
  end;
end;

{ 0098 }
procedure pR5A0_0098;
begin
  asm
    db 128,62,192,146,2,117,5
    call pR6B9_00D6
  end;
end;

{ 00CC }
procedure pR5A0_00CC;
var loc: array[1..132] of byte;
begin
  if false then begin
    if LV = 'MUSIC' then;
    if LV = '.dax' then;
    if LV = 'unable to load com file' then;
  end;
  asm
    db 49,192,137,70,252,137,70,254,191,169,0,14,87,191,175,0,14,87,176,0,80,191,183,146,30,87,141,126
    db 252,22,87
    call pR5C3_0915
    db 131,62,183,146,0,117,31,191,144,252,30,87,191,180,0,14,87,49,192,80,154,196,8,37,8,154,245,7
    db 37,8,176,0,80
    call pR670_0000
    db 196,62,194,146,6,87,184,200,50,80
    call XR670_046E
    db 161,194,146,139,22,196,146,163,179,146,137,22,181,146,161,179,146,139,22,181,146,37,15,0,129,226,0,0
    db 8,192,116,12,131,6,179,146,1,131,22,181,146,0,235,226,196,126,252,6,87,196,62,179,146,6,87,255
    db 54,183,146,154,92,26,37,8,255,118,254,255,118,252,255,54,183,146
    call pR5C0_0000
    db 198,6,193,146,1
  end;
end;

{ 018F }
procedure pR5A0_018F(a0: word);
var loc: array[1..134] of byte;
begin
  if false then begin
    if LV = 'MUSIC' then;
    if LV = '.dax' then;
  end;
  asm
    db 191,132,1,14,87,191,138,1,14,87,138,70,6,80,191,189,146,30,87,141,126,252,22,87
    call pR5C3_0915
    db 196,62,198,146,6,87,184,0,24,80
    call XR670_046E
    db 161,198,146,139,22,200,146,163,185,146,137,22,187,146,196,126,252,6,87,196,62,185,146,6,87,255,54,189
    db 146,154,92,26,37,8,255,118,254,255,118,252,255,54,189,146
    call pR5C0_0000
  end;
end;

{ 01F9 }
begin
  asm
  end;
end.

