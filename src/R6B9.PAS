{ R6B9: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R6B9;

interface

uses GAMEDATA;

function pR6B9_0000(a0: word; a1: word; a2: word): word;
procedure pR6B9_001F(a0: longint; a1: longint);
procedure pR6B9_00B6(a0: word);
procedure pR6B9_00D6;

implementation

uses LIT;

type
  TPV_word_word_word = procedure(p0: word; p1: word; p2: word);
var
  b92C0: byte absolute d92C0;
  g92CB_1d3d: TPV_word_word_word absolute d92CB;
  w87F2: word absolute d87F2;


{ 0000 }
function pR6B9_0000(a0: word; a1: word; a2: word): word;
begin
  {@0006-0013}
  g92CB_1d3d(a2, a1, a0);
  asm
  db 137,70,254
  end;
end;

{ 001F }
procedure pR6B9_001F(a0: longint; a1: longint);
begin
  asm
    db 198,6,192,146,2,139,70,10,139,86,12,37,15,0,129,226,0,0,8,192,116,7,49,192,154,233,0,37
    db 8,139,70,10,139,86,12,37,240,255,129,226,0,0,185,12,0,49,219,154,84,10,37,8,1,70,10,17
    db 86,12,139,70,10,139,86,12,37,0,0,129,226,255,255,137,70,10,137,86,12,129,70,10,0,1,131,86
    db 12,0,131,110,10,0,131,94,12,16,139,70,10,139,86,12,163,203,146,137,22,205,146,141,126,6,22,87
    db 191,207,146,30,87,184,4,0,80,154,92,26,37,8,49,192,80,255,54,207,146,255,54,209,146
    push cs
    call near ptr pR6B9_0000
    db 163,242,135
  end;
end;

{ 00B6 }
procedure pR6B9_00B6(a0: word);
begin
  {@00B9-00C1}
  if a0 <> 0 then
    Exit;
  {@00C1-00D2}
  w87F2 := pR6B9_0000(1, 0, 0);
end;

{ 00D6 }
procedure pR6B9_00D6;
begin
  {@00D9-00F6}
  if b92C0 = 2 then
  begin
    {@00E0-00E5}
    b92C0 := 0;
    {@00E5-00F6}
    w87F2 := pR6B9_0000(3, 0, 0);
  end;
end;

{ 00F8 }
begin
end.

