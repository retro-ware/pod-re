{ R6DD: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R6DD;

interface

uses GAMEDATA;

procedure pR6DD_0000;
procedure pR6DD_0030;
procedure pR6DD_0051;
procedure pR6DD_0072(a0: pointer; a1: pointer; a2: pointer);
procedure pR6DD_00C9(a0: word; a1: word);
procedure pR6DD_0107(a0: word; a1: word; a2: pointer);
procedure pR6DD_0146;
function pR6DD_0167(a0: integer; a1: integer; a2: integer; a3: integer): byte;

implementation

uses LIT, Dos;

type
  R0_word = record v: word end;
  PR0_word = ^R0_word;
var
  b881A: byte absolute d881A;
  bC5C2: byte absolute dC5C2;
  bC5C4: byte absolute dC5C4;
  bC5C6: byte absolute dC5C6;
  g8818_6095: Registers absolute d8818;
  w8818: word absolute d8818;
  w881A: word absolute d881A;
  w881C: word absolute d881C;
  w881E: word absolute d881E;


{ 0000 }
procedure pR6DD_0000;
begin
  {@0003-0008}
  w8818 := 0;
  {@0008-0015}
  Intr(51, g8818_6095);
  if w8818 = 65535 then
  begin
    {@001C-0022}
    bC5C6 := b881A;
    {@0022-0027}
    bC5C4 := 1;
    {@0027-0029}
    Exit;
  end;
  {@0029-002E}
  bC5C4 := 0;
end;

{ 0030 }
procedure pR6DD_0030;
begin
  {@0033-003C}
  if bC5C4 = 0 then
    Exit;
  {@003C-0042}
  w8818 := 1;
  {@0042-004F}
  Intr(51, g8818_6095);
end;

{ 0051 }
procedure pR6DD_0051;
begin
  {@0054-005D}
  if bC5C4 = 0 then
    Exit;
  {@005D-0063}
  w8818 := 2;
  {@0063-0070}
  Intr(51, g8818_6095);
end;

{ 0072 }
procedure pR6DD_0072(a0: pointer; a1: pointer; a2: pointer);
begin
  asm
  db 128,62,196,197,0,117,2,235,71
  end;
  asm
  db 199,6,24,136,3,0
  end;
  asm
  db 176,51,80,191,24,136,30,87
  call Intr
  end;
  asm
  db 161,26,136,196,126,14,38,137,5
  end;
  asm
  db 161,28,136,196,126,10,38,137,5
  end;
  if bC5C2 = 0 then
    PR0_word(a1)^.v := PR0_word(a1)^.v div 2;
  {@00BC-00C5}
  PR0_word(a2)^.v := w881E;
end;

{ 00C9 }
procedure pR6DD_00C9(a0: word; a1: word);
begin
  {@00CC-00D5}
  if bC5C4 = 0 then
    Exit;
  {@00D5-00DB}
  w8818 := 4;
  if bC5C2 = 0 then
    a0 := a0 * 2;
  {@00EA-00F0}
  w881C := a0;
  {@00F0-00F6}
  w881E := a1;
  {@00F6-0103}
  Intr(51, g8818_6095);
end;

{ 0107 }
procedure pR6DD_0107(a0: word; a1: word; a2: pointer);
begin
  {@010A-0113}
  if bC5C4 = 0 then
    Exit;
  {@0113-0119}
  w8818 := 9;
  {@0119-011F}
  w881A := a0;
  {@011F-0125}
  w881C := a1;
  asm
  db 196,126,6,140,192,163,40,136,196,126,6,137,248,163,30,136,176,51,80,191,24,136,30,87
  call Intr
  end;
end;

{ 0146 }
procedure pR6DD_0146;
begin
  {@0149-0152}
  if bC5C4 = 0 then
    Exit;
  {@0152-0158}
  w8818 := 33;
  {@0158-0165}
  Intr(51, g8818_6095);
end;

{ 0167 }
function pR6DD_0167(a0: integer; a1: integer; a2: integer; a3: integer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v6i: integer;
  v8i: integer;
begin
  asm
  db 139,70,8,43,70,12,153,49,208,41,208,137,70,250
  end;
  asm
  db 139,70,6,43,70,10,153,49,208,41,208,137,70,248
  end;
  {@0189-018D}
  v2b := 0;
  {@018D-0191}
  v3b := 0;
  {@0191-0371}
  while v3b = 0 do
  begin
    {@019A-0365}
    case v2b of
      0: begin
        {@01A1-01C3}
        v3b := Ord((a3 <= a1) and ((618 * v6i div 256) <= v8i));
        {@01C3-01C7}
        v4b := 72;
      end;
      2: begin
        {@01CE-01F0}
        v3b := Ord((a2 >= a0) and ((106 * v6i div 256) >= v8i));
        {@01F0-01F4}
        v4b := 77;
      end;
      4: begin
        {@01FB-021D}
        v3b := Ord((a3 >= a1) and ((618 * v6i div 256) <= v8i));
        {@021D-0221}
        v4b := 80;
      end;
      6: begin
        {@0228-024A}
        v3b := Ord((a2 <= a0) and ((106 * v6i div 256) >= v8i));
        {@024A-024E}
        v4b := 75;
      end;
      1: begin
        {@0255-0290}
        v3b := Ord((a3 < a1) and (a2 > a0) and ((618 * v6i div 256) >= v8i) and ((106 * v6i div 256) <= v8i));
        {@0290-0294}
        v4b := 73;
      end;
      3: begin
        {@029B-02D6}
        v3b := Ord((a3 > a1) and (a2 > a0) and ((618 * v6i div 256) >= v8i) and ((106 * v6i div 256) <= v8i));
        {@02D6-02DA}
        v4b := 81;
      end;
      5: begin
        {@02E1-031C}
        v3b := Ord((a3 > a1) and (a2 < a0) and ((618 * v6i div 256) >= v8i) and ((106 * v6i div 256) <= v8i));
        {@031C-0320}
        v4b := 79;
      end;
      7: begin
        {@0326-0361}
        v3b := Ord((a3 < a1) and (a2 < a0) and ((618 * v6i div 256) >= v8i) and ((106 * v6i div 256) <= v8i));
        {@0361-0365}
        v4b := 71;
      end;
    end;
    {@0365-036E}
    if v3b = 0 then
      Inc(v2b);
  end;
  {@0371-0377}
  pR6DD_0167 := v4b;
end;

{ 0380 }
begin
end.

