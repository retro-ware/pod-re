{ O0B5: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0B5;

interface

uses GAMEDATA;

function pO0B5_005E(a0: pointer; a1: longint; a2: pointer): byte;
procedure pO0B5_0453;
procedure pO0B5_0567;
procedure pO0B5_0B93;
function pO0B5_0AF2(a0: string; a1: pointer): byte;
function pO0B5_019B(a0: longint; a1: S40; a2: byte): longint;
procedure pO0B5_0368(a0: pointer; a1: pointer; a2: longint; a3: shortint);
procedure pO0B5_0966(a0: pointer; a1: longint; a2: shortint);
procedure pO0B5_0E45(a0: pointer; a1: pointer);
procedure pO0B5_0EB7(a0: pointer);

implementation

uses LIT, O0E2, O0EC, O108, R142, R47F, R670;

type
  E4_word = record f: word; _r: array[1..2] of byte end;
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R331_byte = record _p: array[1..331] of byte; v: byte end;
  R331_word = record _p: array[1..331] of byte; v: word end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R481_word = record _p: array[1..481] of byte; v: word end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  RA331_word = record _p: array[1..331] of byte; a: array[0..16000] of word end;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR327_byte = ^R327_byte;
  PR331_byte = ^R331_byte;
  PR331_word = ^R331_word;
  PR41_byte = ^R41_byte;
  PR42_pointer = ^R42_pointer;
  PR481_word = ^R481_word;
  PR483_pointer = ^R483_pointer;
  PRA331_word = ^RA331_word;
var
  a1123_31ca: array[0..2977] of string[10] absolute d1123;
  aA7BE_b676: array[0..8189] of longint absolute dA7BE;
  aA7C0_c52f: array[0..8189] of E4_word absolute dA7C0;
  b880C: byte absolute d880C;
  bAAE6: byte absolute dAAE6;
  bAE62: byte absolute dAE62;
  lA7BE: longint absolute dA7BE;
  lA7CA: longint absolute dA7CA;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  s1523: string absolute d1523;
  s154C: string absolute d154C;
  s1575: string absolute d1575;
  s166B: string absolute d166B;
  s2B8D: string absolute d2B8D;

function pO0B5_0000(a0: longint): word; far; forward;
procedure pO0B5_0020(a0: pointer; a1: longint); far; forward;
procedure pO0B5_003F(a0: pointer; a1: longint); far; forward;
procedure pO0B5_010D(a0: word); far; forward;
function pO0B5_050D: byte; far; forward;
procedure pO0B5_09F5(a0: pointer; a1: longint; a2: byte); far; forward;

{ 0000 }
function pO0B5_0000(a0: longint): word;
begin
  {@0006-0017}
  pO0B5_0000 := pO0EC_178D(pointer(pointer(a0))) + 1500;
end;

{ 0020 }
procedure pO0B5_0020(a0: pointer; a1: longint);
begin
  {@0023-003B}
  PR481_word(a0)^.v := LongInt(PR481_word(a0)^.v) - a1;
end;

{ 003F }
procedure pO0B5_003F(a0: pointer; a1: longint);
begin
  {@0042-005A}
  PR481_word(a0)^.v := LongInt(PR481_word(a0)^.v) + a1;
end;

{ 005E }
function pO0B5_005E(a0: pointer; a1: longint; a2: pointer): byte;
var
  v3w: word;
  _f1: array[1..1] of byte;
begin
  {@0064-0071}
  v3w := pO0B5_0000(longint(a0));
  if (LongInt(PR481_word(a0)^.v) + a1) > v3w then
  begin
    {@0094-0098}
    pO0B5_005E := 1;
    if PR481_word(a0)^.v > v3w then
      PR0_longint(a2)^.v := 0
    else
      PR0_longint(a2)^.v := v3w - PR481_word(a0)^.v;
    {@00CA-00CC}
    Exit;
  end;
  {@00CC-00D0}
  pO0B5_005E := 0;
  {@00D0-00DC}
  PR0_longint(a2)^.v := 0;
end;

{ 010D }
procedure pO0B5_010D(a0: word);
var
  v4l: longint;
  v4w: word absolute v4l;
  v4b: byte absolute v4l;
begin
  if false then begin
    if LV = 'Overloaded.  Money will be put in Pool.' then;
  end;
  {@0113-0176}
  if pO0B5_005E(p9CEE, longint(a0), @v4b) <> 0 then
  begin
    {@012F-0143}
    pO0EC_1AAC('Overloaded.  Money will be put in Pool.');
    {@0143-014F}
    Inc(PR331_word(p9CEE)^.v, v4w);
    {@014F-0161}
    pO0B5_003F(p9CEE, v4l);
    {@0161-0174}
    Inc(lA7BE, LongInt(a0) - v4l);
    {@0174-0176}
    Exit;
  end;
  {@0176-0182}
  Inc(PR331_word(p9CEE)^.v, a0);
  {@0182-0195}
  pO0B5_003F(p9CEE, longint(a0));
end;

{ 019B }
function pO0B5_019B(a0: longint; a1: S40; a2: byte): longint;
var
c61: record case byte of 0: (v61a2: string[15]); 1: (v61a: string[6]); 2: (v61b: byte);
      3: (_p3: array[1..7] of byte; v54a2: string[8]); 4: (_p4: array[1..7] of byte; v54a: string[5]);
      5: (_p5: array[1..7] of byte; v54b: byte); 6: (_p6: array[1..13] of byte; v48b: byte);
      7: (_p7: array[1..15] of byte; v46b: byte) end;
  v62b: byte;
  v66l: longint;
  v68i: integer;
  v72l: longint;
  v62a: char absolute v62b;
begin
  {@01B5-01C6}
  pR47F_030B(0, 24, 0, 40);
  {@01C6-01DD}
  pR47F_0354(0, 24, a2, 0, a1);
  {@01DD-01E3}
  c61.v48b := Length(a1);
  {@01E3-01E9}
  c61.v46b := c61.v48b;
  {@01E9-0200}
  Str(a0, c61.v54a);
  {@0200-0204}
  c61.v61b := 0;
  {@0204-030F}
  repeat
    {@0204-020C}
    v62b := pR670_0187;
    case v62b of
      48..57: begin
        {@021D-024F}
        c61.v61a := Concat(c61.v61a2, v62a);
        {@024F-0264}
        Val(c61.v61a2, v66l, v68i);
        if v66l <= a0 then
          Inc(c61.v46b)
        else
        begin
          {@027B-028E}
          c61.v61a := c61.v54a2;
          {@028E-029F}
          c61.v46b := c61.v48b + c61.v54b;
        end;
        {@029F-02B6}
        pR47F_0354(c61.v48b, 24, 15, 0, c61.v61a2);
      end;
      8: begin
        {@02BC-0300}
        if c61.v61b > 0 then
        begin
          {@02C2-02EB}
          c61.v61a := Copy(c61.v61a2, 1, c61.v61b - 1);
          {@02EB-02EE}
          Dec(c61.v46b);
          {@02EE-0300}
          pR47F_030B(c61.v46b, 24, 0, 1);
        end;
      end;
    end;
  until (v62b = 13) or (v62b = 27);
  {@030F-0320}
  pR47F_030B(0, 24, 0, 40);
  if v62b = 27 then
    v72l := 0
  else
    Val(c61.v61a2, v72l, v68i);
  {@0345-0351}
  pO0B5_019B := v72l;
end;

{ 0368 }
procedure pO0B5_0368(a0: pointer; a1: pointer; a2: longint; a3: shortint);
begin
  if false then begin
    if LV = 'Overloaded' then;
  end;
  {@036E-042F}
  if (LongInt(PR481_word(PR0_pointer(a1)^.v)^.v) + a2) <= pO0B5_0000(longint(PR0_pointer(a1)^.v)) then
  begin
    {@03A5-03D5}
    PRA331_word(PR0_pointer(a0)^.v)^.a[a3] := Word(LongInt(PRA331_word(PR0_pointer(a0)^.v)^.a[a3]) - a2);
    {@03D5-03E9}
    pO0B5_0020(pointer(PR0_pointer(a0)^.v), longint(a2));
    {@03E9-0419}
    PRA331_word(PR0_pointer(a1)^.v)^.a[a3] := Word(LongInt(PRA331_word(PR0_pointer(a1)^.v)^.a[a3]) + a2);
    {@0419-042D}
    pO0B5_003F(pointer(PR0_pointer(a1)^.v), longint(a2));
    {@042D-042F}
    Exit;
  end;
  {@042F-0443}
  pO0EC_1AAC('Overloaded');
  {@0443-0448}
  pR47F_0D1A;
  {@0448-044D}
  pR670_0311;
end;

{ 0453 }
procedure pO0B5_0453;
var
  v4p: pointer;
  _f1: array[1..1] of byte;
  v6b: byte;
  v6sb: shortint absolute v6b;
begin
  {@0459-0466}
  v4p := p9CF2;
  {@0466-046B}
  bAE62 := 1;
  {@046B-0509}
  while v4p <> nil do
  begin
    {@0476-04F3}
    if (PR327_byte(v4p)^.v = 0) or (PR327_byte(v4p)^.v = 179) then
    begin
      {@048C-04E1}
      for v6b := 0 to 2 do
      begin
        {@0495-04BD}
        Inc(aA7BE_b676[v6sb], PRA331_word(v4p)^.a[v6sb]);
        {@04BD-04DB}
        pO0B5_0020(v4p, longint(PRA331_word(v4p)^.a[v6sb]));
      end;
      {@04E1-04F3}
      XR670_046E(@PR331_byte(v4p)^.v, 6);
    end;
    {@04F3-0506}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 050D }
function pO0B5_050D: byte;
var
  v5p: pointer;
  v6b: byte;
begin
  {@0513-0520}
  v5p := p9CF2;
  {@0520-0524}
  v6b := 0;
  {@0524-055A}
  while v5p <> nil do
  begin
    {@052C-0545}
    if (PR327_byte(v5p)^.v = 0) or (PR327_byte(v5p)^.v = 179) then
      Inc(v6b);
    {@0545-0558}
    v5p := PR483_pointer(v5p)^.v;
  end;
  {@055A-0560}
  pO0B5_050D := v6b;
end;

{ 0567 }
procedure pO0B5_0567;
var
  v4p: pointer;
  _f1: array[1..4] of byte;
  v9b: byte;
  v10b: byte;
  v14l: longint;
  v20a: array[0..2] of word;
  v26a: array[0..2] of word;
  v27b: byte;
  _f2: array[1..1] of byte;
  v27sb: shortint absolute v27b;
  v26b: byte absolute v26a;
  v20b: byte absolute v20a;
  v14b: byte absolute v14l;
  v4l: longint absolute v4p;
begin
  {@056D-057A}
  v4p := p9CF2;
  {@057A-057E}
  v10b := 0;
  {@057E-0585}
  v9b := pO0B5_050D;
  {@0585-0593}
  XR670_046E(@v20b, 6);
  {@0593-05A1}
  XR670_046E(@v26b, 6);
  for v27b := 0 to 2 do
  begin
    {@05AA-0642}
    if aA7BE_b676[v27sb] > 0 then
    begin
      {@05C4-05F3}
      v20a[v27sb] := Word(aA7BE_b676[v27sb] div LongInt(v9b));
      {@05F3-0626}
      v26a[v27sb] := Word(aA7BE_b676[v27sb] mod LongInt(v9b));
    end
    else
    begin
      {@0628-0635}
      v20a[v27sb] := 0;
      {@0635-0642}
      v26a[v27sb] := 0;
    end;
  end;
  {@064B-07C9}
  while v4p <> nil do
  begin
    {@0656-07B3}
    if PR327_byte(v4p)^.v < 128 then
      for v27b := 2 downto 0 do
      begin
        {@066D-07AA}
        if pO0B5_005E(v4p, longint(v20a[v27sb]), @v14b) = 0 then
        begin
          {@0692-06C1}
          PRA331_word(v4p)^.a[v27sb] := v20a[v27sb] + PRA331_word(v4p)^.a[v27sb];
          {@06C1-06DA}
          pO0B5_003F(v4p, longint(v20a[v27sb]));
          if (v26a[v27sb] > 0) and (pO0B5_005E(v4p, 1, @v14b) = 0) then
          begin
            {@0702-0725}
            PRA331_word(v4p)^.a[v27sb] := PRA331_word(v4p)^.a[v27sb] + 1;
            {@0725-0736}
            pO0B5_003F(v4p, 1);
            {@0736-0741}
            Dec(v26a[v27sb]);
          end;
        end
        else
        begin
          {@0743-076D}
          PRA331_word(v4p)^.a[v27sb] := Word(LongInt(PRA331_word(v4p)^.a[v27sb]) + v14l);
          {@076D-079A}
          v26a[v27sb] := Word(LongInt(v26a[v27sb] + v20a[v27sb]) - v14l);
          {@079A-07AA}
          pO0B5_003F(v4p, v14l);
        end;
      end;
    {@07B3-07C6}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@07C9-0912}
  for v27b := 2 downto 0 do
  begin
    {@07D2-0909}
    if v26a[v27sb] > 0 then
    begin
      {@07E3-07F0}
      v4p := p9CF2;
      {@07F0-0909}
      while v4p <> nil do
      begin
        {@07FB-0815}
        v14l := pO0B5_0000(v4l) - PR481_word(v4p)^.v;
        if v14l > 0 then
        begin
          {@0829-08F3}
          if v26a[v27sb] > v14l then
          begin
            {@0842-086C}
            PRA331_word(v4p)^.a[v27sb] := Word(LongInt(PRA331_word(v4p)^.a[v27sb]) + v14l);
            {@086C-087C}
            pO0B5_003F(v4p, v14l);
            {@087C-089C}
            v26a[v27sb] := Word(LongInt(v26a[v27sb]) - v14l);
          end
          else
          begin
            {@089E-08CD}
            PRA331_word(v4p)^.a[v27sb] := PRA331_word(v4p)^.a[v27sb] + v26a[v27sb];
            {@08CD-08E6}
            pO0B5_003F(v4p, longint(v26a[v27sb]));
            {@08E6-08F3}
            v26a[v27sb] := 0;
          end;
        end;
        {@08F3-0906}
        v4p := PR483_pointer(v4p)^.v;
      end;
    end;
  end;
  {@0912-0917}
  bAE62 := 0;
  for v27b := 0 to 2 do
  begin
    asm
db 138,70,229,152,139,248,209,231,139,67,230,49,210,139,200,139,218,138,70,229,152,139,248,209,231,209,231,137
  db 141,190,167
    end;
    asm
  db 137,157,192,167
    end;
    if aA7BE_b676[v27sb] <> 0 then
      bAE62 := 1;
  end;
end;

{ 0966 }
procedure pO0B5_0966(a0: pointer; a1: longint; a2: shortint);
begin
  {@0969-0993}
  PRA331_word(a0)^.a[a2] := Word(LongInt(PRA331_word(a0)^.a[a2]) - a1);
  {@0993-09A3}
  pO0B5_0020(pointer(a0), longint(a1));
  if (b880C = 6) or (b880C = 1) or (b880C = 10) then
  begin
    asm
  db 138,70,6,152,139,248,209,231,209,231,139,133,190,167,139,149,192,167,3,70,8,19,86,10,139,200,139,218
  db 138,70,6,152,139,248,209,231,209,231,137,141,190,167
    end;
    asm
  db 137,157,192,167
    end;
  end;
end;

{ 09F5 }
procedure pO0B5_09F5(a0: pointer; a1: longint; a2: byte);
var
  _f1: array[1..3] of byte;
  v4b: byte;
begin
  if false then begin
    if LV = 'Overloaded' then;
    LP1('Overloaded');
  end;
  {@09FB-0A35}
  if pO0B5_005E(pointer(a0), longint(a1), @v4b) <> 0 then
  begin
    {@0A14-0A28}
    pO0EC_1AAC('Overloaded');
    asm
  call pR47F_0D1A
    end;
    asm
  call pR670_0311
    end;
    asm
  db 233,158,0
    end;
  end;
  asm
  db 138,70,6,152,139,248,209,231,209,231,139,133,190,167,139,149,192,167,59,86,10,124,7,127,29,59,70,8
  db 115,24,138,70,6,152,139,248,209,231,209,231,139,133,190,167,139,149,192,167,137,70,8,137,86,10
  end;
  asm
  db 138,70,6,152,139,248,209,231,209,231,139,133,190,167,139,149,192,167,43,70,8,27,86,10,139,200,139,218
  db 138,70,6,152,139,248,209,231,209,231,137,141,190,167
  end;
  asm
  db 137,157,192,167
  end;
  asm
  db 138,70,6,152,209,224,196,126,12,3,248,38,139,133,75,1,49,210,3,70,8,19,86,10,139,208,138,70
  db 6,152,209,224,196,126,12,3,248,38,137,149,75,1
  end;
  asm
  db 255,118,14,255,118,12,255,118,10,255,118,8
  push cs
  call near ptr pO0B5_003F
  end;
end;

{ 0AF2 }
function pO0B5_0AF2(a0: string; a1: pointer): byte;
var
  v258b: byte;
begin
  if false then begin
    if LV = 'Gems ' then;
    if LV = 'Platinum ' then;
    if LV = 'Jewelry ' then;
  end;
  {@0B0D-0B12}
  v258b := 1;
  {@0B12-0B27}
  while Ord(a0[v258b]) = 32 do
    Inc(v258b);
  {@0B27-0B88}
  case Ord(a0[v258b]) of
    71: begin
      {@0B37-0B3B}
      pO0B5_0AF2 := 1;
      {@0B3B-0B4E}
      PR0_string(a1)^.v := 'Gems ';
    end;
    80: begin
      {@0B54-0B67}
      PR0_string(a1)^.v := 'Platinum ';
      {@0B67-0B6B}
      pO0B5_0AF2 := 0;
    end;
    74: begin
      {@0B71-0B84}
      PR0_string(a1)^.v := 'Jewelry ';
      {@0B84-0B88}
      pO0B5_0AF2 := 2;
    end;
  end;
end;

{ 0B93 }
procedure pO0B5_0B93;
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..2] of byte;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v18w: word;
  v20w: word;
  v276a: string;
  v278w: word;
  v279b: byte;
  v280b: byte;
  v281b: byte;
  v276b: byte absolute v276a;
  v20b: byte absolute v20w;
  v16b: byte absolute v16p;
  v12b: byte absolute v12p;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@0B9A-0BA2}
  pR142_00D4(1);
  {@0BA2-0BA7}
  v20w := 0;
  {@0BA7-0E41}
  repeat
    {@0BA7-0BAC}
    v280b := 1;
    {@0BAC-0BB4}
    v8p := nil;
    {@0BB4-0BBC}
    v12p := nil;
    for v1b := 0 to 2 do
    begin
      {@0BC5-0CA5}
      if aA7BE_b676[v1sb] > 0 then
      begin
        {@0BE5-0BE8}
        Inc(v18w);
        if v8p = nil then
        begin
          {@0BF0-0BFF}
          GetMem(v8p, 46);
          {@0BFF-0C0C}
          PR42_pointer(v8p)^.v := nil;
        end
        else
        begin
          {@0C0E-0C1A}
          v12p := v8p;
          {@0C1A-0C29}
          GetMem(v8p, 46);
          {@0C29-0C3A}
          PR42_pointer(v8p)^.v := v12p;
        end;
        {@0C3A-0C5E}
        Str(aA7BE_b676[v1sb], v276a);
        {@0C5E-0C9D}
        PR0_string_40_(v8p)^.v := a1123_31ca[v1sb] + ' ' + v276a;
        {@0C9D-0CA5}
        PR41_byte(v8p)^.v := 0;
      end;
    end;
    {@0CAE-0CBA}
    v12p := v8p;
    {@0CBA-0CC6}
    v16p := v8p;
    {@0CC6-0CCE}
    pO108_00CB(1);
    {@0CCE-0D09}
    v281b := pO108_1D45(s166B, s2B8D, 2, 2, 15, 8, v8p, 1, 0, @v280b, @v20b, @v12b);
    if (v12p = nil) or (v281b = 1) or (bAAE6 <> 0) and (v281b = 27) then
      v279b := 1
    else
    begin
      {@0D2E-0D33}
      v279b := 0;
      {@0D33-0D45}
      v2b := pO0B5_0AF2(PR0_string(v12p)^.v, @v276b);
      if v2b = 1 then
        v276a := s1523 + v276a + s154C
      else
        v276a := s1575 + v276a + s154C;
      {@0DB5-0DD8}
      v278w := pO0B5_019B(longint(aA7BE_b676[v2sb]), v276a, 10);
      {@0DD8-0DF0}
      pO0B5_09F5(p9CEE, longint(v278w), v2b);
      {@0DF0-0DFA}
      pO108_2363(@v16b);
      {@0DFA-0DFF}
      bAE62 := 0;
      {@0DFF-0E04}
      v279b := 1;
      for v1b := 0 to 2 do
      begin
        {@0E0D-0E31}
        if aA7BE_b676[v1sb] > 0 then
        begin
          {@0E27-0E2C}
          bAE62 := 1;
          {@0E2C-0E31}
          v279b := 0;
        end;
      end;
    end;
  until v279b <> 0;
end;

{ 0E45 }
procedure pO0B5_0E45(a0: pointer; a1: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v1sb: shortint absolute v1b;
begin
  {@0E4B-0E52}
  PR0_byte(a0)^.v := 0;
  {@0E52-0E59}
  PR0_byte(a1)^.v := 0;
  for v1b := 0 to 2 do
  begin
    {@0E62-0E7D}
    if aA7BE_b676[v1sb] <> 0 then
      PR0_byte(a0)^.v := 1;
  end;
  {@0E83-0E93}
  if lA7CA <> 0 then
    PR0_byte(a1)^.v := 1;
end;

{ 0EB7 }
procedure pO0B5_0EB7(a0: pointer);
type
  PItem = ^TItem;
  TItem = record
    _p: array[0..$29] of byte;
    next: PItem;
    f2e, f2f, f30, f31: byte;
    _p2: array[$32..$33] of byte;
    f34, f35: byte;
    _p3: byte;
    f37: word;
    _p4: byte;
    f3a: word;
  end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_pitem = record _p: array[1..423] of byte; v: PItem end;
  PR333_word = ^R333_word;
  R333_word = record _p: array[1..333] of byte; v: word end;
  PR335_word = ^R335_word;
  R335_word = record _p: array[1..335] of byte; v: word end;
var
  s1: string[40];
  s2: string[40];
  key: byte;
  _f1: array[$54..$A5] of byte;
  v166: byte;
  val: longint;
  arr: array[1..4] of byte;
  cur: PItem;
  newp: PItem;
  done: byte;
  _f2: byte;
  flag: byte;
  b: byte;
  s15F0: string absolute d15F0;
  s1619: string absolute d1619;
  s1642: string absolute d1642;
  s278C: string absolute d278C;
  s2830: string absolute d2830;
  s2CD5: string absolute d2CD5;
  s2CFE: string absolute d2CFE;
  bAB10: byte absolute dAB10;
  bAB0E: byte absolute dAB0E;
  s159E: string absolute d159E;
  s15C7: string absolute d15C7;
begin
  if false then begin
    if LV = 'No Gems or Jewelry' then;
    if LV = ' platinum.' then;
  end;
  PR0_byte(a0)^.v := 1;
  if (PR333_word(p9CEE)^.v = 0) and (PR335_word(p9CEE)^.v = 0) then
  begin
    pO0EC_1AAC('No Gems or Jewelry');
    PR0_byte(a0)^.v := 0;
    exit;
  end;
  repeat
    if (PR333_word(p9CEE)^.v = 0) and (PR335_word(p9CEE)^.v = 0) then
      done := 1
    else
    begin
      done := 0;
      Str(PR333_word(p9CEE)^.v, s1);
      Str(PR335_word(p9CEE)^.v, s2);
      s1 := s159E + s1;
      s2 := s15C7 + s2;
      pR47F_0F07(1, 1, 38, 22);
      pO0EC_1C22(p9CEE, 1, 1, 0);
      pR47F_0354(1, 7, 15, 0, s15F0);
      pR47F_0354(1, 9, 15, 0, s1);
      pR47F_0354(1, 10, 15, 0, s2);
      FillChar(bAB0E, 40, 255);
      b := 0;
      if PR333_word(p9CEE)^.v <> 0 then pO108_00AB(0, @b);
      if PR335_word(p9CEE)^.v <> 0 then pO108_00AB(1, @b);
      pO108_00AB(2, @b);
      key := pO108_1009(s2830, s2CD5, 1, 0);
      if (bAAE6 <> 0) and (key = 27) then key := 2;
      case key of
        0:
          if PR333_word(p9CEE)^.v <> 0 then
          begin
            Dec(PR333_word(p9CEE)^.v);
            v166 := pO0E2_1374(1, 100);
            case v166 of
              1..25: val := 5;
              26..50: val := 25;
              51..70: val := 50;
              71..90: val := 250;
              91..99: val := 500;
              100: val := 2500;
            end;
            Str(val, s1);
            s1 := s1619 + s1 + ' platinum.';
            pR47F_0354(1, 12, 15, 0, s1);
            FillChar(bAB0E, 40, 255);
            bAB0E := 0;
            if (pO0B5_005E(p9CEE, 1, @arr) <> 0) or (R422_byte(p9CEE^).v >= 16) then
              flag := 1
            else
            begin
              bAB10 := 1;
              flag := 0;
            end;
            key := pO108_1009(s278C, s2CFE, 0, 0);
            if (key = 1) and (flag = 0) then
            begin
              newp := pR670_037F;
              XR670_046E(@newp^, 63);
              newp^.next := nil;
              newp^.f34 := 0;
              newp^.f31 := 122;
              newp^.f30 := 0;
              newp^.f2f := 0;
              newp^.f2e := 47;
              newp^.f3a := val;
              newp^.f37 := 1;
              newp^.f35 := 0;
              cur := R423_pitem(p9CEE^).v;
              if cur = nil then
                cur := newp
              else
              begin
                while cur^.next <> nil do
                  cur := cur^.next;
                cur^.next := newp;
              end;
            end
            else
              pO0B5_010D(val);
          end;
        1:
          if PR335_word(p9CEE)^.v <> 0 then
          begin
            Dec(PR335_word(p9CEE)^.v);
            v166 := pO0E2_1374(1, 100);
            case v166 of
              1..10: val := Trunc(Random(450)) + 50;
              11..20: val := Trunc(Random(500)) + 100;
              21..40: val := Trunc(Random(750)) + 150;
              41..50: val := Trunc(Random(1250)) + 250;
              51..70: val := Trunc(Random(2500)) + 500;
              71..90: val := Trunc(Random(3000)) + 1000;
              91..100: val := Trunc(Random(5000)) + 1000;
            end;
            Str(val, s2);
            s2 := s1642 + s2 + ' platinum.';
            pR47F_0354(1, 12, 15, 0, s2);
            FillChar(bAB0E, 40, 255);
            bAB0E := 0;
            if (pO0B5_005E(p9CEE, 1, @arr) <> 0) or (R422_byte(p9CEE^).v >= 16) then
              flag := 1
            else
            begin
              bAB10 := 1;
              flag := 0;
            end;
            key := pO108_1009(s278C, s2CFE, 0, 0);
            if (key = 1) and (flag = 0) then
            begin
              newp := pR670_037F;
              XR670_046E(@newp^, 63);
              newp^.next := nil;
              newp^.f34 := 0;
              newp^.f31 := 123;
              newp^.f30 := 0;
              newp^.f2f := 0;
              newp^.f2e := 47;
              newp^.f3a := val;
              newp^.f37 := 1;
              newp^.f35 := 0;
              cur := R423_pitem(p9CEE^).v;
              if cur = nil then
                cur := newp
              else
              begin
                while cur^.next <> nil do
                  cur := cur^.next;
                cur^.next := newp;
              end;
            end
            else
              pO0B5_010D(val);
          end;
        2: done := 1;
      end;
      pO0EC_0EBF(p9CEE);
    end;
  until done <> 0;
end;

{ 1670 }
begin
end.

