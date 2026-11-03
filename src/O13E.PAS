{ O13E: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O13E;

interface

uses GAMEDATA;

procedure pO13E_0022(a0: string; a1: byte; a2: byte; a3: byte);
procedure pO13E_0101(a0: byte);
procedure pO13E_0182(a0: string; a1: byte; a2: byte);
procedure pO13E_04B3(a0: shortint; a1: shortint; a2: byte; a3: byte; a4: byte);

implementation

uses LIT, R1C3, R670;

type
  E8_longint = record f: longint; _r: array[1..4] of byte end;
  E8_pointer = record f: pointer; _r: array[1..4] of byte end;
  R18_word = record _p: array[1..18] of byte; v: word end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  RA27_byte = record _p: array[1..27] of byte; a: array[0..32000] of byte end;
  W2_8_04B3 = record case byte of 0: (_w8_0word: word); 1: (_p1: array[1..2] of byte; _w8_2word: word) end;
  PR18_word = ^R18_word;
  PR22_byte = ^R22_byte;
  PR27_byte = ^R27_byte;
  PRA27_byte = ^RA27_byte;
  PW2_8_04B3 = ^W2_8_04B3;
var
  a9DC4_4bfb: array[0..4094] of array[0..7] of byte absolute d9DC4;
  a9DC4_556f: array[0..4094] of E8_longint absolute d9DC4;
  a9DC4_7c92: array[0..4094] of E8_pointer absolute d9DC4;
  a9DC4_9f5c: array[0..4094, 0..1] of longint absolute d9DC4;
  a9DC4_b6a1: array[0..4094, 0..1] of pointer absolute d9DC4;
  a9DC8_4bfb: array[0..4094] of array[0..7] of byte absolute d9DC8;
  a9DC8_556f: array[0..4094] of E8_longint absolute d9DC8;
  a9DC8_7c92: array[0..4094] of E8_pointer absolute d9DC8;
  bCF1E: byte absolute dCF1E;
  g3DC8_1297: B16 absolute d3DC8;
  g3DD8_1297: B16 absolute d3DD8;
  l8836: longint absolute d8836;
  p9DC0: pointer absolute d9DC0;


{ 0022 }
procedure pO13E_0022(a0: string; a1: byte; a2: byte; a3: byte);
var
  v260p: pointer;
  v262w: word;
  v264w: word;
  v260b: byte absolute v260p;
begin
  if false then begin
    if LV = 'Start range error in Load24x24Set' then;
  end;
  {@003D-0067}
  if a2 > 39 then
  begin
    {@0043-0048}
    pR1C3_00AC;
    {@0048-005F}
    WriteLn(Output, 'Start range error in Load24x24Set');
    {@005F-0067}
    pR670_0000(0);
  end;
  {@0067-0071}
  v260p := nil;
  {@0071-008C}
  pR1C3_0352(a0, a1, 0, 0, @v260b);
  {@008C-009D}
  v262w := a3 * PR18_word(v260p)^.v;
  {@009D-00AE}
  v264w := a2 * PR18_word(v260p)^.v;
  if p9DC0 <> nil then
    Move(PR27_byte(v260p)^.v, PRA27_byte(p9DC0)^.a[v264w], v262w);
  {@00DA-00EB}
  pR1C3_1E9D(32, 32, @bCF1E);
  {@00EB-00F6}
  pR1C3_1A83(@v260b);
  {@00F6-00FB}
  pR670_0311;
end;

{ 0101 }
procedure pO13E_0101(a0: byte);
var
  _f1: array[1..2] of byte;
begin
  {@0107-0132}
  if a9DC4_556f[a0].f <> 0 then
    pR1C3_1A83(@a9DC4_4bfb[a0]);
  {@0132-015D}
  if a9DC8_556f[a0].f <> 0 then
    pR1C3_1A83(@a9DC8_4bfb[a0]);
end;

{ 0182 }
procedure pO13E_0182(a0: string; a1: byte; a2: byte);
var
  v258a: string[1];
  _f1: array[1..1] of byte;
  v258a2: string[1] absolute v258a;
  v258b: byte absolute v258a;
begin
  if false then begin
    if LV = 'CHEAD' then;
    if LV = 'CBODY' then;
    if LV = 'COMSPR' then;
    if LV = 'ICON' then;
    if LV = 'CPIC' then;
    if LV = '1' then;
  end;
  {@019D-04A8}
  if (Copy(a0, 1, 5) = 'CHEAD') or (Copy(a0, 1, 5) = 'CBODY') then
  begin
    {@01EA-0204}
    if Ord(UpCase(Chr(Ord(a0[Length(a0)])))) = 84 then
      Inc(a1, 64);
    {@0204-0230}
    a0 := Copy(a0, 1, Length(a0) - 1);
    {@0230-0256}
    pR1C3_0352(a0, a1, 1, 8, @a9DC4_4bfb[a2]);
    if a0 = 'CHEAD' then
      pR1C3_0352(a0, a1, 1, 8, @a9DC8_4bfb[a2])
    else
      pR1C3_0352(a0, a1 + 128, 1, 8, @a9DC8_4bfb[a2]);
  end
  else
  begin
    {@02BE-04A8}
    if (a0 = 'COMSPR') or (a0 = 'ICON') or (a0 = 'CPIC') then
    begin
      {@02F7-0324}
      if a0 = 'CPIC' then
        v258a := '1'
      else
        v258b := 0;
      {@0324-0360}
      pR1C3_0352(a0 + v258a2, a1, 1, 8, @a9DC4_4bfb[a2]);
      {@0360-03A1}
      pR1C3_0352(a0 + v258a2, a1 + 128, 1, 8, @a9DC8_4bfb[a2]);
      if a0 = 'CPIC' then
        pR1C3_1E9D(144, 112, @bCF1E);
    end
    else
    begin
      {@03C7-03DB}
      v258a := '1';
      {@03DB-0417}
      pR1C3_0352(a0 + v258a2, a1, 1, 0, @a9DC4_4bfb[a2]);
      {@0417-043F}
      pR1C3_1421(g3DC8_1297, g3DD8_1297, 0, 0, pointer(a9DC4_7c92[a2].f));
      {@043F-0480}
      pR1C3_0352(a0 + v258a2, a1 + 128, 1, 0, @a9DC8_4bfb[a2]);
      {@0480-04A8}
      pR1C3_1421(g3DC8_1297, g3DD8_1297, 0, 0, pointer(a9DC8_7c92[a2].f));
    end;
  end;
  {@04A8-04AD}
  pR670_0311;
end;

{ 04B3 }
procedure pO13E_04B3(a0: shortint; a1: shortint; a2: byte; a3: byte; a4: byte);
var
  v4p: pointer;
  v4b: byte absolute v4p;
begin
  {@04B9-04DE}
  if a9DC4_b6a1[a4, a3] = nil then
    Exit;
  {@04DE-05B4}
  with PW2_8_04B3(a9DC4_b6a1[a4, a3])^ do
  begin
    if a2 > 3 then
    begin
      {@0509-0527}
      pR1C3_19A4(_w8_0word, _w8_2word, 1, 1, @v4b);
      {@0527-054E}
      PR22_byte(v4p)^.v := PR22_byte(a9DC4_b6a1[a4, a3])^.v;
      {@054E-0579}
      pR1C3_0A0C(pointer(a9DC4_9f5c[a4, a3]), v4p);
      {@0579-05A8}
      pR1C3_08C0(a0 * 3, a1 * 3, 0, 1, v4p, l8836);
      {@05A8-05B2}
      pR1C3_1A83(@v4b);
      {@05B2-05B4}
      Exit;
    end;
  end;
  {@05B4-05FD}
  pR1C3_08C0(a0 * 3, a1 * 3, 0, 1, pointer(a9DC4_9f5c[a4, a3]), l8836);
end;

{ 0603 }
begin
end.

