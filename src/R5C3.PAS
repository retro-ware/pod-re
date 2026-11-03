{ R5C3: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R5C3;

interface

uses GAMEDATA;

procedure pR5C3_0000;
procedure pR5C3_0020;
procedure pR5C3_0037(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte);
procedure pR5C3_008C(a0: byte; a1: byte; a2: byte; a3: string);
procedure pR5C3_00FC(a0: byte; a1: byte; a2: byte; a3: byte);
procedure pR5C3_011A(a0: byte; a1: S40);
procedure pR5C3_0174(a0: S80);
procedure pR5C3_01C3(a0: S80; a1: S80);
procedure pR5C3_0252;
function pR5C3_02A3(a0: S2): string;
function pR5C3_0336(a0: S80; a1: S80; a2: byte; a3: pointer): byte;
function pR5C3_055E(a0: S80): byte;
function pR5C3_05A8(a0: string; a1: string): string;
function pR5C3_0677(a0: string): S80;
procedure pR5C3_0761(a0: pointer; a1: pointer; a2: pointer);
function pR5C3_0821(a0: S20; a1: S20; a2: pointer; a3: pointer; a4: pointer): byte;
procedure pR5C3_08FA(a0: pointer; a1: pointer);
procedure pR5C3_0915(a0: S80; a1: S80; a2: byte; a3: pointer; a4: pointer);

implementation

uses LIT, Dos, R670, R6C9;

type
  R0_byte = record v: byte end;
  R0_file = record v: file end;
  R0_pointer = record v: pointer end;
  R0_word = record v: word end;
  RA0_byte = record a: array[0..32000] of byte end;
  PR0_byte = ^R0_byte;
  PR0_file = ^R0_file;
  PR0_pointer = ^R0_pointer;
  PR0_word = ^R0_word;
  PRA0_byte = ^RA0_byte;
var
  a0E07_ec3f: array[0..32759] of byte absolute d0E07;
  b8818: byte absolute d8818;
  b8819: byte absolute d8819;
  b881A: byte absolute d881A;
  b881B: byte absolute d881B;
  b881E: byte absolute d881E;
  b881F: byte absolute d881F;
  b92BF: byte absolute d92BF;
  b92C0: byte absolute d92C0;
  b94D4: byte absolute d94D4;
  g8750_45dd: string[79] absolute d8750;
  g87A0_45dd: string[79] absolute d87A0;
  g87F0_579f: char absolute d87F0;
  g8818_6095: Registers absolute d8818;
  g9D03_3610: file absolute d9D03;
  s3E0A: string absolute d3E0A;
  s8750: string absolute d8750;
  s87A0: string absolute d87A0;
  w3DE8: word absolute d3DE8;
  w881C: word absolute d881C;


{ 0000 }
procedure pR5C3_0000;
begin
  {@0003-0009}
  b92BF := b92C0;
  if b92C0 = 1 then
  begin
    {@0010-0019}
    pR6C9_0000(w3DE8);
    {@0019-001E}
    b92C0 := 0;
  end;
end;

{ 0020 }
procedure pR5C3_0020;
begin
  {@0023-0029}
  b92C0 := b92BF;
  if b92C0 = 1 then
    pR6C9_00CC;
end;

{ 0037 }
procedure pR5C3_0037(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte);
begin
  {@003A-003F}
  b8819 := 2;
  {@003F-0044}
  b881B := 0;
  {@0044-004A}
  b881F := a1;
  {@004A-0050}
  b881E := a0;
  {@0050-005D}
  Intr(16, g8818_6095);
  {@005D-0062}
  b8819 := 9;
  {@0062-0068}
  b8818 := a4;
  {@0068-006D}
  b881B := 0;
  {@006D-0073}
  b881A := a2;
  {@0073-007B}
  w881C := a3;
  {@007B-0088}
  Intr(16, g8818_6095);
end;

{ 008C }
procedure pR5C3_008C(a0: byte; a1: byte; a2: byte; a3: string);
var
  v257b: byte;
  v258b: byte;
begin
  {@00A7-00AF}
  v257b := Length(a3);
  for v258b := 1 to v257b do
  begin
    {@00C9-00E9}
    pR5C3_0037(a0, a1, a2, 1, Ord(a3[v258b]));
    {@00E9-00EC}
    Inc(a0);
  end;
end;

{ 00FC }
procedure pR5C3_00FC(a0: byte; a1: byte; a2: byte; a3: byte);
begin
  {@00FF-0116}
  pR5C3_0037(a0, a1, a2, a3, 219);
end;

{ 011A }
procedure pR5C3_011A(a0: byte; a1: S40);
var
  v42b: byte;
begin
  {@0133-0143}
  pR5C3_00FC(0, 24, 0, 40);
  {@0143-0156}
  pR5C3_008C(0, 24, a0, a1);
  {@0156-015E}
  v42b := pR670_0187;
  {@015E-016E}
  pR5C3_00FC(0, 24, 0, 40);
end;

{ 0174 }
procedure pR5C3_0174(a0: S80);
var
  _f1: array[1..1] of byte;
begin
  {@018D-01BD}
  if pR5C3_055E(a0) <> 0 then
  begin
    {@019A-01A9}
    Assign(g9D03_3610, a0);
    {@01A9-01B3}
    Close(g9D03_3610);
    {@01B3-01BD}
    Erase(g9D03_3610);
  end;
end;

{ 01C3 }
procedure pR5C3_01C3(a0: S80; a1: S80);
begin
  {@01F1-0227}
  if pR5C3_055E(a0) <> 0 then
  begin
    {@01FE-020D}
    Assign(g9D03_3610, a0);
    {@020D-0217}
    Close(g9D03_3610);
    asm
  db 191,3,157,30,87,141,190,94,255,22,87,154,13,26,37,8
    end;
  end;
end;

{ 0252 }
procedure pR5C3_0252;
var loc: array[1..12] of byte;
begin
  if false then begin
    if LV = 'game.ovr' then;
    if LV = 'Please insert overlay disk.' then;
  end;
  asm
    db 141,126,245,22,87,191,45,2,14,87,154,111,10,37,8
    push cs
    call near ptr pR5C3_055E
    db 136,70,254,128,126,254,0,117,31,191,144,252,30,87,191,54,2,14,87,49,192,80,154,196,8,37,8,154
    db 245,7,37,8
    call pR670_0187
    db 136,70,255,128,126,254,0,116,191
  end;
end;

{ 02A3 }
function pR5C3_02A3(a0: S2): string;
var loc: array[1..299] of byte;
begin
  if false then begin
    if LV = ':\*.*' then;
  end;
  asm
    db 141,126,240,22,87,184,13,0,80
    call XR670_046E
    db 141,190,210,254,22,87,141,126,253,22,87,154,111,10,37,8,191,157,2,14,87,154,252,10,37,8,184,8
    db 0,80,141,126,210,22,87
    call FindFirst
    db 141,126,240,22,87,196,126,10,6,87,184,40,0,80,154,137,10,37,8
  end;
end;

{ 0336 }
function pR5C3_0336(a0: S80; a1: S80; a2: byte; a3: pointer): byte;
var
c326: record case byte of 0: (v326a2: string[162]); 1: (_p1: array[1..5] of byte; v321a2: string[157]);
      2: (_p2: array[1..14] of byte; v312a3: string[148]); 3: (_p3: array[1..14] of byte;
      v312a2: string[67]); 4: (_p4: array[1..14] of byte; v312b: byte); 5: (_p5: array[1..15] of byte;
      v311b: byte); 6: (_p6: array[1..82] of byte; v244a2: string[80]); 7: (_p7: array[1..82] of byte;
      v244a: string[79]); 8: (_p8: array[1..162] of byte; v164b: byte); 9: (_p9: array[1..14] of byte;
      v312a: DirStr); 10: (_p10: array[1..5] of byte; v321a: NameStr); 11: (v326a: ExtStr) end;
begin
  if false then begin
    if LV = ': <ENTER>' then;
    if LV = 'Couldn''t find ' then;
    if LV = '. Check install.' then;
  end;
  {@0364-0380}
  FSplit(a0, c326.v312a, c326.v321a, c326.v326a);
  if c326.v312b = 0 then
    c326.v312a2 := s8750;
  {@039B-0508}
  repeat
    {@039B-03CA}
    c326.v164b := pR5C3_055E(c326.v312a3 + c326.v321a2 + c326.v326a2);
    if (c326.v164b = 0) and (c326.v312a3 = s8750) then
    begin
      {@03E9-03FD}
      c326.v244a := s8750;
      {@03FD-0410}
      g8750_45dd := s87A0;
      {@0410-0424}
      g87A0_45dd := c326.v244a2;
      {@0424-0438}
      c326.v312a2 := s8750;
      {@0438-0467}
      c326.v164b := pR5C3_055E(c326.v312a3 + c326.v321a2 + c326.v326a2);
    end;
    {@0467-04F8}
    if (c326.v164b = 0) and (a2 = 0) then
    begin
      {@047A-04F8}
      if c326.v311b < 67 then
        pR5C3_011A(14, a1 + g87F0_579f + ': <ENTER>')
      else
      begin
        {@04B9-04F0}
        pR5C3_011A(14, 'Couldn''t find ' + c326.v321a2 + c326.v326a2 + '. Check install.');
        {@04F0-04F8}
        pR670_0000(0);
      end;
    end;
  until (c326.v164b <> 0) or (a2 <> 0);
  {@0508-054E}
  if c326.v164b <> 0 then
  begin
    {@050F-0540}
    Assign(PR0_file(a3)^.v, c326.v312a3 + c326.v321a2 + c326.v326a2);
    {@0540-054E}
    Reset(PR0_file(a3)^.v, 1);
  end;
  {@054E-0555}
  pR5C3_0336 := c326.v164b;
end;

{ 055E }
function pR5C3_055E(a0: S80): byte;
var
  v125a: SearchRec;
  _f1: array[1..1] of byte;
begin
  {@0577-0589}
  FindFirst(a0, 0, v125a);
  {@0589-059F}
  pR5C3_055E := Ord((word(Doserror) = 0) and (Length(a0) <> 0));
end;

{ 05A8 }
function pR5C3_05A8(a0: string; a1: string): string;
var
  v513b: byte;
  v514b: byte;
  v515b: byte;
begin
  {@05D7-05DF}
  v514b := Length(a1);
  {@05DF-05F4}
  v513b := Length(a0) - v514b + 1;
  for v515b := 1 to v513b do
  begin
    {@060E-0653}
    if Copy(a0, v515b, v514b) = a1 then
      Delete(a0, v515b, v514b);
  end;
  {@065D-0671}
  pR5C3_05A8 := a0;
end;

{ 0677 }
function pR5C3_0677(a0: string): S80;
var
  v257b: byte;
begin
  {@0692-06DB}
  for v257b := 1 to 10 do
    a0 := pR5C3_05A8(a0, Chr(a0E07_ec3f[v257b]));
  {@06DB-0703}
  a0 := Copy(a0, 1, 8);
  for v257b := 1 to Length(a0) do
    a0[v257b] := Chr(Ord(UpCase(Chr(Ord(a0[v257b])))));
  {@0747-075B}
  pR5C3_0677 := a0;
end;

{ 0761 }
procedure pR5C3_0761(a0: pointer; a1: pointer; a2: pointer);
var
  v2w: word;
  v4w: word;
  v5b: byte;
  v6b: byte;
  _f1: array[1..512] of byte;
  v520w: word;
  v5sb: shortint absolute v5b;
begin
  {@0768-076D}
  v2w := 0;
  {@076D-0772}
  v4w := 0;
  {@0772-081B}
  repeat
    {@0772-0789}
    BlockRead(PR0_file(a2)^.v, v5b, 1);
    case v5sb of
      0..126: begin
        {@0794-07B7}
        BlockRead(PR0_file(a2)^.v, PRA0_byte(PR0_pointer(a0)^.v)^.a[v4w], v5sb + 1, v520w);
        {@07B7-07BF}
        Inc(v4w, v5sb + 1);
      end;
      -127..-1: begin
        {@07C9-07D2}
        v5b := -v5sb;
        {@07D2-07EB}
        BlockRead(PR0_file(a2)^.v, v6b, 1, v520w);
        {@07EB-0806}
        FillChar(PRA0_byte(PR0_pointer(a0)^.v)^.a[v4w], v5sb, v6b);
        {@0806-080D}
        Inc(v4w, v5sb);
      end;
    end;
  until v4w >= PR0_word(a1)^.v;
end;

{ 0821 }
function pR5C3_0821(a0: S20; a1: S20; a2: pointer; a3: pointer; a4: pointer): byte;
var
  v45w: word;
  _f1: array[1..2] of byte;
begin
  {@084E-08ED}
  if pR5C3_0336(a0 + a1, s3E0A, b94D4, @PR0_byte(a3)^.v) <> 0 then
  begin
    {@087E-08B4}
    if pR5C3_0336(a0 + a1, s3E0A, b94D4, @PR0_byte(a4)^.v) = 0 then
    begin
      {@08AE-08B2}
      pR5C3_0821 := 0;
      {@08B2-08B4}
      Exit;
    end;
    {@08B4-08CC}
    BlockRead(PR0_file(a4)^.v, PR0_byte(a2)^.v, 2, v45w);
    {@08CC-08D3}
    Inc(PR0_word(a2)^.v, 2);
    {@08D3-08E7}
    Seek(PR0_file(a3)^.v, PR0_word(a2)^.v);
    {@08E7-08EB}
    pR5C3_0821 := 1;
    {@08EB-08ED}
    Exit;
  end;
  {@08ED-08F1}
  pR5C3_0821 := 0;
end;

{ 08FA }
procedure pR5C3_08FA(a0: pointer; a1: pointer);
begin
  {@08FD-0907}
  Close(PR0_file(a0)^.v);
  {@0907-0911}
  Close(PR0_file(a1)^.v);
end;

{ 0915 }
procedure pR5C3_0915(a0: S80; a1: S80; a2: byte; a3: pointer; a4: pointer);
var
  _f1: array[1..1] of byte;
  v164b: byte;
  v168l: longint;
  v169b: byte;
  v171w: word;
  v299a: file;
  v427a: file;
  v429w: word;
  _f2: array[1..9] of byte;
  v429b: byte absolute v429w;
  v427b: byte absolute v427a;
  v299b: byte absolute v299a;
  v168b: byte absolute v168l;
begin
  {@0943-0947}
  pR5C3_0000;
  if pR5C3_0821(a0, a1, @v429b, @v299b, @v427b) = 0 then
  begin
    {@096C-0974}
    PR0_word(a3)^.v := 0;
    {@0974-0980}
    PR0_pointer(a4)^.v := nil;
    {@0980-0984}
    pR5C3_0020;
    {@0984-0987}
    Exit;
  end;
  {@0987-0A20}
  repeat
    {@0987-09A2}
    BlockRead(v427a, v169b, 1, v171w);
    {@09A2-09BD}
    BlockRead(v427a, v168b, 4, v171w);
    {@09BD-09D7}
    BlockRead(v427a, PR0_byte(a3)^.v, 2, v171w);
    {@09D7-09F2}
    BlockRead(v427a, v164b, 2, v171w);
  until (v169b = a2) or (v429w <= FilePos(v427a));
  {@0A20-0A53}
  if v169b <> a2 then
  begin
    {@0A29-0A31}
    PR0_word(a3)^.v := 0;
    {@0A31-0A3D}
    PR0_pointer(a4)^.v := nil;
    {@0A3D-0A4D}
    pR5C3_08FA(@v299b, @v427b);
    {@0A4D-0A51}
    pR5C3_0020;
    {@0A51-0A53}
    Exit;
  end;
  {@0A53-0A68}
  GetMem(PR0_pointer(a4)^.v, PR0_word(a3)^.v);
  {@0A68-0A7E}
  FillChar(PR0_byte(PR0_pointer(a4)^.v)^.v, PR0_word(a3)^.v, 0);
  {@0A7E-0A99}
  Seek(v299a, LongInt(v429w) + v168l);
  {@0A99-0AAD}
  pR5C3_0761(@PR0_byte(a4)^.v, @PR0_byte(a3)^.v, @v299b);
  {@0AAD-0ABD}
  pR5C3_08FA(@v299b, @v427b);
  {@0ABD-0AC1}
  pR5C3_0020;
end;

{ 0AC7 }
begin
end.

