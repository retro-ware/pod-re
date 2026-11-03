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
var
  l92CB: longint absolute d92CB;
  w92CF: word absolute d92CF;
  w92D1: word absolute d92D1;
begin
  b92C0 := 2;
  if boolean(a0 and $0F) then
    Halt;
  Inc(a0, (a0 and $FFF0) shl 12);
  a0 := a0 and $FFFF0000;
  Inc(a0, $100);
  Dec(a0, $100000);
  l92CB := a0;
  Move(a1, w92CF, 4);
  w87F2 := pR6B9_0000(0, w92CF, w92D1);
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

