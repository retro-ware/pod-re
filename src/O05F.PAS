{ O05F: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O05F;

interface

uses GAMEDATA;

procedure pO05F_010E;

implementation

uses LIT, Crt, O062, O065, O0A1, O0AA, O0B2, O0BB, O0E2, O0EC, O102, O108, O135, O13E, R142, R1C3, R47F, R670;

type
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R0_string = record v: string end;
  R13_byte = record _p: array[1..13] of byte; v: byte end;
  R14_byte = record _p: array[1..14] of byte; v: byte end;
  R16_byte = record _p: array[1..16] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R45_byte = record _p: array[1..45] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R493_shortint = record _p: array[1..493] of byte; v: shortint end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R496_byte = record _p: array[1..496] of byte; v: byte end;
  R4_pointer = record _p: array[1..4] of byte; v: pointer end;
  R5_byte = record _p: array[1..5] of byte; v: byte end;
  R6_byte = record _p: array[1..6] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  R9_pointer = record _p: array[1..9] of byte; v: pointer end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
W16_281_03E1 = record case byte of 0: (_w281_0string: string); 1: (_p1: array[1..173] of byte;
      _w281_173shortint: shortint); 2: (_p2: array[1..176] of byte; _w281_176word: word);
      3: (_p3: array[1..358] of byte; _w281_358byte: byte) end;
W18_281_03E1 = record case byte of 0: (_w281_0string: string); 1: (_p1: array[1..173] of byte;
      _w281_173shortint: shortint); 2: (_p2: array[1..176] of byte; _w281_176word: word);
      3: (_p3: array[1..358] of byte; _w281_358byte: byte) end;
W20_281_03E1 = record case byte of 0: (_w281_0string: string); 1: (_p1: array[1..173] of byte;
      _w281_173shortint: shortint); 2: (_p2: array[1..176] of byte; _w281_176word: word);
      3: (_p3: array[1..358] of byte; _w281_358byte: byte) end;
W22_281_03E1 = record case byte of 0: (_w281_0string: string); 1: (_p1: array[1..173] of byte;
      _w281_173shortint: shortint); 2: (_p2: array[1..176] of byte; _w281_176word: word);
      3: (_p3: array[1..358] of byte; _w281_358byte: byte) end;
  PR0_byte = ^R0_byte;
  PR0_string = ^R0_string;
  PR13_byte = ^R13_byte;
  PR14_byte = ^R14_byte;
  PR16_byte = ^R16_byte;
  PR17_byte = ^R17_byte;
  PR18_byte = ^R18_byte;
  PR1_byte = ^R1_byte;
  PR2_shortint = ^R2_shortint;
  PR327_byte = ^R327_byte;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR422_byte = ^R422_byte;
  PR45_byte = ^R45_byte;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR493_byte = ^R493_byte;
  PR493_shortint = ^R493_shortint;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR496_byte = ^R496_byte;
  PR4_pointer = ^R4_pointer;
  PR5_byte = ^R5_byte;
  PR6_byte = ^R6_byte;
  PR8_byte = ^R8_byte;
  PR9_pointer = ^R9_pointer;
  PRA30_byte = ^RA30_byte;
  PW16_281_03E1 = ^W16_281_03E1;
  PW18_281_03E1 = ^W18_281_03E1;
  PW20_281_03E1 = ^W20_281_03E1;
  PW22_281_03E1 = ^W22_281_03E1;
var
  a08E2_2fc5: array[0..16379] of word absolute d08E2;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aAEED_9f8b: array[0..8189] of pointer absolute dAEED;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  b880E: byte absolute d880E;
  b8815: byte absolute d8815;
  b9CFE: byte absolute d9CFE;
  b9DC0: byte absolute d9DC0;
  bA7CE: byte absolute dA7CE;
  bA7CF: byte absolute dA7CF;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bAE8D: byte absolute dAE8D;
  bAE8E: byte absolute dAE8E;
  bAEDA: byte absolute dAEDA;
  bAEE0: byte absolute dAEE0;
  bAEE9: byte absolute dAEE9;
  bAEEF: byte absolute dAEEF;
  bAEF0: byte absolute dAEF0;
  bAEF1: byte absolute dAEF1;
  bB011: byte absolute dB011;
  bB16D: byte absolute dB16D;
  bC592: byte absolute dC592;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pA6E0: pointer absolute dA6E0;
  pAB3E: pointer absolute dAB3E;
  pAE5D: pointer absolute dAE5D;
  pAEF1: pointer absolute dAEF1;
  s0E12: string absolute d0E12;
  s21F3: string absolute d21F3;
  s221C: string absolute d221C;
  s2245: string absolute d2245;
  s226E: string absolute d226E;
  s29F3: string absolute d29F3;
  s2A6E: string absolute d2A6E;
  s2A97: string absolute d2A97;
  s2F11: string absolute d2F11;
  s2F8C: string absolute d2F8C;
  s2FDD: string absolute d2FDD;
  sbB16D: shortint absolute dB16D;

procedure pO05F_0000; far; forward;
procedure pO05F_03E1; far; forward;
procedure pO05F_0707; far; forward;
procedure pO05F_086F(a0: pointer); far; forward;
procedure pO05F_09C4(a0: pointer); far; forward;
procedure pO05F_0DE4(a0: pointer; a1: pointer); far; forward;
procedure pO05F_0FDC(a0: pointer); far; forward;
procedure pO05F_11D4(a0: pointer; a1: pointer); far; forward;
procedure pO05F_1530(a0: pointer; a1: pointer; a2: pointer); far; forward;
procedure pO05F_15D0; far; forward;
procedure pO05F_16BD(a0: pointer); far; forward;

{ 0000 }
procedure pO05F_0000;
var
  v4p: pointer;
  v8p: pointer;
  _f1: array[1..3] of byte;
  v12b: byte;
  v13b: byte;
  _f2: array[1..1] of byte;
begin
  {@0006-0041}
  while pAE5D <> nil do
  begin
    {@000F-0021}
    v4p := PR4_pointer(pAE5D)^.v;
    {@0021-0032}
    FreeMem(pAE5D, 31);
    {@0032-003F}
    pAE5D := v4p;
  end;
  {@0041-004E}
  v8p := p9CF2;
  {@004E-00B3}
  while v8p <> nil do
  begin
    {@0056-0093}
    if (pO0EC_27C1(v8p, 11, @v12b) <> 0) and (PR493_byte(v8p)^.v = 0) then
    begin
      {@0078-0093}
      if bA7CF > 1 then
        PR493_byte(v8p)^.v := 3
      else
        PR493_byte(v8p)^.v := 0;
    end;
    {@0093-009E}
    pO0E2_15A0(v8p);
    {@009E-00B1}
    v8p := PR483_pointer(v8p)^.v;
  end;
  {@00B3-00C4}
  FreeMem(pA6E0, 1257);
  {@00C4-00CC}
  pA6E0 := nil;
  {@00CC-00D6}
  pR1C3_1A83(@bAEE0);
  {@00D6-00E0}
  pR1C3_1A83(@b9DC0);
  for v13b := 0 to 21 do
    pO13E_0101(v13b + 13);
  {@00FD-010A}
  pAB3E := Pointer(@pO0BB_10E6);
end;

{ 010E }
procedure pO05F_010E;
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v6b: byte absolute v6p;
begin
  {@0114-0118}
  v1b := 0;
  {@0118-011D}
  b880C := 5;
  {@011D-012A}
  pAB3E := Pointer(@pO0A1_1F46);
  {@012A-012F}
  pO0A1_4943;
  {@012F-0134}
  pO065_1C1E;
  {@0134-0138}
  v2b := 0;
  if (bA7CE = 0) or (bA7CF = 0) then
    v2b := 1;
  {@014A-0157}
  v6p := p9CF2;
  {@0157-0181}
  while v6p <> nil do
  begin
    {@015F-016C}
    pO0E2_04DD(24, @v6b);
    {@016C-017F}
    v6p := PR483_pointer(v6p)^.v;
  end;
  {@0181-0261}
  while v2b = 0 do
  begin
    {@018A-018F}
    pO0EC_2A17;
    {@018F-019C}
    v6p := p9CF2;
    {@019C-01C4}
    while v6p <> nil do
    begin
      {@01A4-01AF}
      pO0A1_0000(v6p);
      {@01AF-01C2}
      v6p := PR483_pointer(v6p)^.v;
    end;
    {@01C4-01CD}
    PR45_byte(p87F8)^.v := 0;
    {@01CD-01D1}
    pO05F_0707;
    {@01D1-01DE}
    v6p := pAEF1;
    {@01DE-01E3}
    bB011 := 1;
    {@01E3-0255}
    while (v6p <> nil) and (v2b = 0) do
    begin
      {@01F1-01FB}
      pO05F_086F(v6p);
      {@01FB-01FF}
      Inc(bB011);
      if bB011 > 72 then
        v6p := nil
      else
        v6p := aAEED_9f8b[bB011];
      {@0229-022E}
      pO0EC_2A17;
      if ((bA7CE = 0) or ((bA7CF = 0) or (bAE8D >= bAE8E))) and (v1b = 0) then
      begin
        {@024B-024F}
        v2b := 1;
        {@024F-0253}
        v1b := 1;
      end;
    end;
    {@0255-025E}
    pO05F_0FDC(@v2b);
  end;
  {@0261-026C}
  if b9CFE <> 0 then
    pO05F_03E1;
  {@026C-0270}
  pO05F_0000;
  {@0270-0275}
  b8815 := 1;
end;

{ 03E1 }
procedure pO05F_03E1;
var
c21: record case byte of 0: (v21a2: string[20]); 1: (v21a: string[4]); 2: (_p2: array[1..5] of byte;
      v16b: byte); 3: (_p3: array[1..6] of byte; v15b: byte); 4: (_p4: array[1..7] of byte; v14b: byte);
      5: (_p5: array[1..8] of byte; v13b: byte); 6: (_p6: array[1..9] of byte; v12p: pointer);
      7: (_p7: array[1..13] of byte; v8p: pointer); 8: (_p8: array[1..17] of byte; v4p: pointer) end;
  v277a: string;
begin
  if false then begin
    if LV = 'is looking very old' then;
    if LV = 'The strain of this last battle has worn heavily on ' then;
    if LV = '.  ' then;
    if LV = 'He' then;
    if LV = 'She' then;
    if LV = ' breathes deeply one last time and crumples to the ground.' then;
    if LV = 'dies from age' then;
    if LV = 'Sadly, no party member witnesses the passing of the champion.' then;
    if LV = ' weeps at the loss of such a venerable companion.' then;
    if LV = ' The remaining party members are overcome with grief as they search ' then;
    if LV = '''s body for valuables.' then;
  end;
  {@03E8-03F5}
  c21.v4p := p9CF2;
  {@03F5-06FE}
  while c21.v4p <> nil do
  begin
    {@0400-06E8}
    if (PR493_shortint(c21.v4p)^.v < 6) and (PR18_byte(PR487_pointer(c21.v4p)^.v)^.v <> 1) then
    begin
      {@0420-047A}
      with PW22_281_03E1(c21.v4p)^ do
      begin
        c21.v13b := Ord(a08E2_2fc5[_w281_173shortint] < _w281_176word);
        if c21.v13b = 0 then
          c21.v14b := Ord((a08E2_2fc5[_w281_173shortint] - 10) < _w281_176word);
        {@047A-04A1}
        if c21.v14b <> 0 then
          pO0EC_1B08(c21.v4p, 'is looking very old', 10, 1);
        {@04A1-06E8}
        if c21.v13b <> 0 then
        begin
          {@04AA-04AE}
          c21.v15b := 14;
          {@04AE-04C0}
          pR142_0217(23, c21.v15b, 38, 21);
          {@04C0-0500}
pR47F_0498(23, c21.v15b, 38, 21, 15, 0, 1, 'The strain of this last battle has worn heavily on '
              + _w281_0string + '.  ');
          {@0500-0510}
          pR47F_0B2E(13, 0, s0E12);
          {@0510-0522}
          pR142_0217(23, c21.v15b, 38, 21);
          if _w281_358byte = 0 then
            c21.v21a := 'He'
          else
            c21.v21a := 'She';
          {@0556-058B}
pR47F_0498(23, c21.v15b, 38, 21, 15, 0, 1, c21.v21a2
              + ' breathes deeply one last time and crumples to the ground.');
          {@058B-059B}
          pR47F_0B2E(13, 0, s0E12);
          {@059B-05AD}
          pR142_0217(23, c21.v15b, 38, 21);
          {@05AD-05CB}
          pO0E2_0000(c21.v4p, 8, 'dies from age');
          {@05CB-05D8}
          c21.v8p := p9CF2;
          {@05D8-0625}
          while c21.v8p <> nil do
          begin
            {@05E0-0610}
if (PR494_byte(c21.v8p)^.v = 1) and (PR493_byte(c21.v8p)^.v = 0)
                and (PR495_byte(c21.v8p)^.v <> 1) then
            begin
              {@0601-0604}
              Inc(c21.v16b);
              {@0604-0610}
              c21.v12p := c21.v8p;
            end;
            {@0610-0623}
            c21.v8p := PR483_pointer(c21.v8p)^.v;
          end;
          {@0625-06A5}
          case c21.v16b of
            0: v277a := 'Sadly, no party member witnesses the passing of the champion.';
            1: v277a := PR0_string(c21.v12p)^.v + ' weeps at the loss of such a venerable companion.';
          else
            {@0671-06A5}
v277a := ' The remaining party members are overcome with grief as they search ' + _w281_0string
                + '''s body for valuables.';
          end;
          {@06A5-06B7}
          pR142_0217(23, c21.v15b, 38, 21);
          {@06B7-06D8}
          pR47F_0498(23, c21.v15b, 38, 21, 14, 0, 1, v277a);
          {@06D8-06E8}
          pR47F_0B2E(13, 0, s0E12);
        end;
      end;
    end;
    {@06E8-06FB}
    c21.v4p := PR483_pointer(c21.v4p)^.v;
  end;
  {@06FE-0703}
  b9CFE := 0;
end;

{ 0707 }
procedure pO05F_0707;
var
  v1b: byte;
  v5p: pointer;
  v9p: pointer;
  v13p: pointer;
  v14b: byte;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  _f1: array[1..1] of byte;
  v15sb: shortint absolute v15b;
  v14sb: shortint absolute v14b;
begin
  {@070D-071A}
  v5p := p9CF2;
  {@071A-0728}
  XR670_046E(@bAEF1, 288);
  {@0728-086B}
  while v5p <> nil do
  begin
    {@0733-0737}
    v16b := 1;
    {@0737-073B}
    v1b := 1;
    {@073B-074A}
    v14b := PR3_byte(PR487_pointer(v5p)^.v)^.v;
    {@074A-07B6}
    while (v16b < 65) and (v1b <> 0) do
    begin
      {@0756-078C}
      if aAEED_9f8b[v16b] <> nil then
        v15b := PR3_byte(PR487_pointer(aAEED_9f8b[v16b])^.v)^.v
      else
        v15b := 255;
      {@078C-07B4}
      if (v14sb > v15sb) or (v14b = v15b) and (pO0E2_1374(1, 2) = 1) then
        v1b := 0
      else
        Inc(v16b);
    end;
    {@07B6-07CF}
    v9p := aAEED_9f8b[v16b];
    {@07CF-07E8}
    aAEED_9f8b[v16b] := v5p;
    if v9p <> nil then
    begin
      {@07F0-07F6}
      v17b := v16b;
      {@07F6-07FA}
      v1b := 1;
      {@07FA-0855}
      while (v17b < 72) and (v1b <> 0) do
      begin
        {@0806-0809}
        Inc(v17b);
        {@0809-0822}
        v13p := aAEED_9f8b[v17b];
        {@0822-083B}
        aAEED_9f8b[v17b] := v9p;
        {@083B-0847}
        v9p := v13p;
        if v13p = nil then
          v1b := 0;
      end;
    end;
    {@0855-0868}
    v5p := PR483_pointer(v5p)^.v;
  end;
end;

{ 086F }
procedure pO05F_086F(a0: pointer);
var
  _f1: array[1..2] of byte;
begin
  {@0875-0882}
  PR14_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@0882-088F}
  PR17_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@088F-089C}
  PR6_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@089C-08A9}
  pO0E2_04DD(7, @PV4_0_byte(a0).v);
  {@08A9-08BB}
  if PR3_shortint(PR487_pointer(a0)^.v)^.v <= 0 then
    Exit;
  {@08BB-08D7}
  if PR3_byte(PR487_pointer(a0)^.v)^.v = 20 then
    PR3_byte(PR487_pointer(a0)^.v)^.v := 19;
  {@08D7-08E4}
  p9CEE := a0;
  {@08E4-090A}
  bAEF0 := Ord((PR495_byte(a0)^.v = 0) or (pO135_0805(longint(a0), 0) <> 0));
  {@090A-091B}
  pO135_141F(longint(a0), 2, 1);
  {@091B-0926}
  pO0EC_0EBF(pointer(a0));
  {@0926-092B}
  bAEEF := 1;
  {@092B-0936}
  pO0EC_0C95(pointer(a0));
  {@0936-0943}
  pO0E2_04DD(15, @PV4_0_byte(a0).v);
  if PR0_byte(PR487_pointer(a0)^.v)^.v = 0 then
    pO0E2_04DD(21, @PV4_0_byte(a0).v);
  {@095E-098F}
  if PR3_shortint(PR487_pointer(a0)^.v)^.v > 0 then
  begin
    {@096D-098F}
    if PR496_byte(a0)^.v <> 0 then
      pO062_000F(pointer(a0))
    else
      pO05F_09C4(pointer(a0));
  end;
  {@098F-09AC}
  pO135_0429(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)));
end;

{ 09C4 }
procedure pO05F_09C4(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  _f1: array[1..6] of byte;
  v13b: byte;
  v14b: byte;
begin
  if false then begin
    if LV = 'That doesn''t work' then;
  end;
  {@09CA-0DAF}
  if PR494_byte(a0)^.v <> 0 then
  begin
    {@09D8-0DAD}
    if PR0_byte(PR487_pointer(a0)^.v)^.v > 0 then
    begin
      {@09E6-09F4}
      v14b := PR0_byte(PR487_pointer(a0)^.v)^.v;
      {@09F4-0A00}
      PR0_byte(PR487_pointer(a0)^.v)^.v := 0;
      {@0A00-0A14}
      pO0BB_121C(v14b, 0, 1, @v2b);
      {@0A14-0A22}
      v2b := pO0EC_2CF6(pointer(a0));
    end
    else
    begin
      {@0A25-0A29}
      v2b := 0;
      {@0A29-0DAD}
      while v2b = 0 do
      begin
        {@0A32-0A37}
        bAAE5 := 1;
        {@0A37-0A46}
        pO05F_0DE4(pointer(a0), @v1b);
        if bAAE6 = 0 then
          case v1b of
            0: pO05F_11D4(pointer(a0), @v2b);
            1: pO0A1_3713(pointer(a0), 255, 1, 0, 1, @v2b, @v13b);
            2: begin
              {@0A95-0A9A}
              bAAE5 := 2;
              {@0A9A-0AA4}
              pO0AA_1067(@v2b);
              {@0AA4-0AAF}
              pO0A1_0E67(pointer(a0));
              if v2b = 0 then
                pO0EC_324C;
            end;
            3: pO0A1_24CD(0, 0, @v2b);
            4: begin
              {@0AD8-0B27}
if ((pO102_1276(pointer(a0), 0) > 0) or (pO102_1276(pointer(a0), 3) > 2))
                  and (PR16_byte(PR487_pointer(a0)^.v)^.v < bC592) then
              begin
                {@0B0E-0B19}
                pO0A1_10D8(pointer(a0));
                {@0B19-0B27}
                v2b := pO0EC_2CF6(pointer(a0));
              end;
            end;
            5: v2b := pO0EC_2D45(pointer(a0));
            6: begin
              {@0B43-0B4D}
              pO05F_16BD(pointer(a0));
              {@0B4D-0B52}
              pO108_167D;
              {@0B52-0B57}
              pR670_0311;
              {@0B57-0B60}
              Delay(200);
              {@0B60-0B64}
              v2b := 1;
              {@0B64-0B6F}
              pO062_000F(pointer(a0));
            end;
            7: begin
              {@0B79-0B86}
              PR3_byte(PR487_pointer(a0)^.v)^.v := 1;
              {@0B86-0B8C}
              bB16D := bB011;
              {@0B8C-0BA5}
              v6p := aAEED_9f8b[sbB16D + 1];
              {@0BA5-0BEB}
              while (v6p <> nil) and (sbB16D < 72) do
              begin
                {@0BB4-0BCC}
                aAEED_9f8b[sbB16D] := v6p;
                {@0BCC-0BD0}
                Inc(bB16D);
                {@0BD0-0BE9}
                v6p := aAEED_9f8b[sbB16D + 1];
              end;
              {@0BEB-0C03}
              aAEED_9f8b[sbB16D] := a0;
              {@0C03-0C07}
              Dec(bB011);
              {@0C07-0C0B}
              v2b := 1;
            end;
            8: begin
              {@0C11-0C1C}
              v2b := pO0EC_33E6(1);
              {@0C1C-0C2A}
              v2b := pO0EC_2CF6(pointer(a0));
            end;
            9: begin
              {@0C30-0C3A}
              pO0AA_0C9D(@v2b);
              {@0C3A-0C45}
              pO0A1_0E67(pointer(a0));
              if v2b = 0 then
                pO0EC_324C;
            end;
            10: pO05F_15D0;
            11: v2b := pO0EC_2CF6(pointer(a0));
          end
        else
          case v1b of
            32: begin
              {@0C78-0C85}
              v6p := p9CF2;
              {@0C85-0CB6}
              while v6p <> nil do
              begin
                {@0C8D-0CA1}
                if PR327_byte(v6p)^.v < 128 then
                  PR496_byte(v6p)^.v := 0;
                {@0CA1-0CB4}
                v6p := PR483_pointer(v6p)^.v;
              end;
            end;
            50: begin
              {@0CBD-0CCA}
              bAEDA := Ord(bAEDA = 0);
              if bAEDA <> 0 then
                pO0EC_1AAC(s21F3)
              else
                pO0EC_1AAC(s221C);
            end;
            16, 30: begin
              {@0CF2-0CF6}
              Dec(bB011);
              {@0CF6-0D03}
              PR3_byte(PR487_pointer(a0)^.v)^.v := 20;
              {@0D03-0D10}
              v6p := p9CF2;
              {@0D10-0D37}
              while v6p <> nil do
              begin
                {@0D18-0D22}
                pO05F_16BD(v6p);
                {@0D22-0D35}
                v6p := PR483_pointer(v6p)^.v;
              end;
              {@0D37-0D3C}
              pO108_167D;
              {@0D3C-0D45}
              Delay(200);
              {@0D45-0D49}
              v2b := 1;
            end;
            45: begin
              {@0D4F-0D83}
              if pO0A1_3D7E <> 0 then
              begin
                {@0D58-0D69}
                pO135_141F(longint(a0), 3, 0);
                {@0D69-0D6D}
                v2b := 1;
              end
              else
                pO0EC_1AAC('That doesn''t work');
            end;
          end;
        {@0D83-0DAA}
        if v2b = 0 then
        begin
          {@0D89-0D9A}
          pO135_141F(longint(a0), 2, 1);
          {@0D9A-0D9F}
          bAEEF := 1;
          {@0D9F-0DAA}
          pO0EC_0C95(pointer(a0));
        end;
      end;
    end;
    {@0DAD-0DAF}
    Exit;
  end;
  {@0DAF-0DBD}
  v2b := pO0EC_2CF6(pointer(a0));
end;

{ 0DE4 }
procedure pO05F_0DE4(a0: pointer; a1: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LSV = [16, 19, 30, 32, 45, 50] then;
  end;
  {@0DEA-0DEE}
  v1b := 0;
  if PR5_byte(PR487_pointer(a0)^.v)^.v > 0 then
    pO108_00AB(0, @v1b);
  {@0E0A-0E17}
  pO108_00AB(1, @v1b);
  if PR422_byte(a0)^.v > 0 then
    pO108_00AB(2, @v1b);
  {@0E2F-0E33}
  v3b := 0;
  for v2b := 0 to 140 do
  begin
    {@0E3C-0E54}
    if (PRA30_byte(a0)^.a[v2b] and 127) > 0 then
      v3b := 1;
  end;
  {@0E5A-0E87}
  if (v3b <> 0) and (PR1_byte(PR487_pointer(a0)^.v)^.v <> 0) and (PR1_byte(p87F8)^.v = 0) then
    pO108_00AB(3, @v1b);
  {@0E87-0ECA}
if ((pO102_1276(pointer(a0), 0) > 0) or (pO102_1276(pointer(a0), 3) > 2))
      and (PR16_byte(PR487_pointer(a0)^.v)^.v < bC592) then
    pO108_00AB(4, @v1b);
  {@0ECA-0EF5}
  if (pO0EC_3280(pointer(a0)) = 0) or (pO0EC_32C3(pointer(a0)) <> 0) then
    pO108_00AB(5, @v1b);
  {@0EF5-0F02}
  pO108_00AB(6, @v1b);
  {@0F02-0F0F}
  pO108_00AB(7, @v1b);
  if pO0EC_33E6(0) <> 0 then
    pO108_00AB(8, @v1b);
  {@0F28-0F45}
  for v2b := 9 to 11 do
    pO108_00AB(v2b, @v1b);
  {@0F45-0FAE}
  repeat
    {@0F45-0F6A}
    PR0_byte(a1)^.v := pO108_1009('', s2F8C, 1, 0);
    if (bAAE6 <> 0) and not (PR0_byte(a1)^.v in [16, 19, 30, 32, 45, 50]) then
      PR0_byte(a1)^.v := 255;
  until (PR0_byte(a1)^.v < 12) or (bAAE6 <> 0) and (PR0_byte(a1)^.v in [16, 19, 30, 32, 45, 50]);
  {@0FAE-0FBF}
  pR142_0217(0, 23, 39, 24);
end;

{ 0FDC }
procedure pO05F_0FDC(a0: pointer);
var
  v4p: pointer;
  _f1: array[1..1] of byte;
  v6b: byte;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'Your Teammate is Dying' then;
  end;
  {@0FE2-0FED}
  pO0B2_02E7(1, 1);
  {@0FED-0FF5}
  pO0E2_237B(0);
  {@0FF5-0FF9}
  Inc(bAE8D);
  {@0FF9-0FFE}
  pO0A1_2939;
  {@0FFE-100B}
  v4p := p9CF2;
  {@100B-100F}
  v6b := 1;
  {@100F-107C}
  while v4p <> nil do
  begin
    {@1017-1024}
    pO0E2_04DD(19, @v4b);
    {@1024-1035}
    pO0E2_0CAF(v4p, 0, 1);
    if PR493_byte(v4p)^.v = 5 then
    begin
      {@1040-104C}
      Inc(PR13_byte(PR487_pointer(v4p)^.v)^.v);
      if PR13_byte(PR487_pointer(v4p)^.v)^.v > 9 then
        PR493_byte(v4p)^.v := 6;
    end;
    {@1064-1067}
    Inc(v6b);
    {@1067-107A}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@107C-109C}
  if pO0EC_33E6(0) <> 0 then
    pO0EC_1AAC('Your Teammate is Dying');
  {@109C-10A1}
  pO0EC_2A17;
  {@10A1-10C6}
  pO135_0A4D(PR2_shortint(pA6E0)^.v + 3, PR3_shortint(pA6E0)^.v + 3, 255, 8);
  if (bA7CE = 0) or (bA7CF = 0) or (bAE8D >= bAE8E) then
    PR0_byte(a0)^.v := 1;
  {@10E4-1114}
  if (bA7CE > 0) and (bA7CF = 0) and (b880E = 0) and (Byte(pO108_2254(s2A6E, b5363)) = b5362) then
    PR0_byte(a0)^.v := 0;
end;

{ 11D4 }
procedure pO05F_11D4(a0: pointer; a1: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..2] of byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  { 111A }
  procedure pO05F_111A;
  begin
    {@111D-1134}
    PR5_byte(PR487_pointer(a0)^.v)^.v := v1b;
    {@1134-1150}
    pO135_067C(0, 0, pO135_0D1A(longint(a0)));
    {@1150-1184}
    PR0_byte(a1)^.v := Ord(pO135_122B(pointer(a0), v3b, v4b, 0) = 0);
    {@1184-11B1}
    pO135_0A4D(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), 0, 8);
    {@11B1-11C8}
    PR8_byte(PR487_pointer(a0)^.v)^.v := v2b;
    {@11C8-11D0}
    v7b := 8;
  end;

begin
  {@11DB-11E0}
  bAEE9 := 1;
  {@11E0-11EF}
  v1b := PR5_byte(PR487_pointer(a0)^.v)^.v;
  {@11EF-11FE}
  v2b := PR8_byte(PR487_pointer(a0)^.v)^.v;
  {@11FE-120C}
  v3b := pO135_0CA2(longint(a0));
  {@120C-121A}
  v4b := pO135_0CCA(longint(a0));
  {@121A-121E}
  v10b := 255;
  {@121E-1225}
  PR0_byte(a1)^.v := 0;
  {@1225-1229}
  v7b := 8;
  {@1229-14F4}
  repeat
    {@1229-14E2}
    while (v10b <> 0) and (v10b <> 27) and (PR0_byte(a1)^.v = 0) do
    begin
      {@1247-124F}
      pO108_00CB(0);
      {@124F-1260}
      pR142_0217(24, 24, 39, 24);
      if v10b = 255 then
        v10b := pO108_1009(s2A97 + pO0EC_142F(PR5_byte(PR487_pointer(a0)^.v)^.v shr 1), s2FDD, 1, 0);
      {@12AA-12AE}
      v7b := 8;
      if bAAE6 <> 0 then
        case v10b of
          27: pO05F_111A;
          72: v7b := 0;
          73: v7b := 1;
          77: v7b := 2;
          81: v7b := 3;
          80: v7b := 4;
          79: v7b := 5;
          75: v7b := 6;
          71: v7b := 7;
        end;
      {@1311-14C1}
      if v7b < 8 then
      begin
        {@131A-132F}
        pO135_0BAF(pointer(a0), v7b, 0, 0);
        {@132F-134D}
        pO135_0D94(longint(a0), v7b, @v8b, @v9b, @v12b);
        if v8b > 0 then
          pO05F_1530(pointer(a0), pointer(aA583_9f8b[v8b]), @PR0_byte(a1)^.v)
        else
        begin
          {@1378-14C1}
          if v9b = 0 then
            case pO108_2254(s2245, b5363) of
              0: PR0_byte(a1)^.v := pO0A1_0DAA(pointer(a0));
              1: PR0_byte(a1)^.v := 0;
            end
          else
          begin
            {@13B1-13EA}
            if Odd(v7b) then
              v11b := a3EBA_2a50[v9b].f * 3
            else
              v11b := a3EBA_2a50[v9b].f * 2;
            {@13EA-1400}
            if a3EBA_2a50[v9b].f = 255 then
              v11b := 255;
            {@1400-14C1}
            if v11b > PR5_byte(PR487_pointer(a0)^.v)^.v then
              pO0EC_1AAC(s226E)
            else
            begin
              {@141E-142D}
              pO0A1_0979(pointer(a0), v7b);
              if PR494_byte(a0)^.v = 0 then
                PR0_byte(a1)^.v := pO0EC_2CF6(pointer(a0))
              else
              begin
                {@144B-1469}
                if PR5_byte(PR487_pointer(a0)^.v)^.v > 0 then
                  pO0A1_076D(pointer(a0), v7b);
                {@1469-1485}
                if PR494_byte(a0)^.v = 0 then
                  PR0_byte(a1)^.v := pO0EC_2CF6(pointer(a0));
                {@1485-1496}
                pO0E2_0CAF(pointer(a0), 0, 0);
                if (pO0EC_0E7A(pointer(a0)) <> 0) or (PR494_byte(a0)^.v = 0) then
                  PR0_byte(a1)^.v := pO0EC_2CF6(pointer(a0));
              end;
            end;
          end;
        end;
      end;
      {@14C1-14DF}
      if ((v10b <> 27) or (bAAE6 = 0)) and ((bAAE6 <> 0) or (v10b <> 0)) then
        v10b := 255;
    end;
  until (v10b <> 255) or (PR0_byte(a1)^.v <> 0);
  {@14F4-1510}
  if PR5_byte(PR487_pointer(a0)^.v)^.v < 2 then
    PR5_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@1510-1515}
  bAEE9 := 0;
end;

{ 1530 }
procedure pO05F_1530(a0: pointer; a1: pointer; a2: pointer);
begin
  if false then begin
    if LV = 'Not with that weapon' then;
  end;
  {@1536-156A}
  if (pO0EC_3280(pointer(a0)) <> 0) and (pO0EC_32C3(pointer(a0)) = 0) then
  begin
    {@1554-1568}
    pO0EC_1AAC('Not with that weapon');
    {@1568-156A}
    Exit;
  end;
  {@156A-15C5}
  if pO0A1_2A57(pointer(a0), pointer(a1)) <> 0 then
  begin
    {@157F-1595}
    PR9_pointer(PR487_pointer(a0)^.v)^.v := a1;
    {@1595-15A6}
    pO0A1_182A(longint(a0), pointer(a1));
    {@15A6-15C5}
    pO0A1_18B9(pointer(a0), pointer(a1), 0, nil, @PR0_byte(a2)^.v);
  end;
end;

{ 15D0 }
procedure pO05F_15D0;
var
  v41a: string[40];
  v42b: byte;
  v43b: byte;
  v41a2: string[40] absolute v41a;
begin
  if false then begin
    if LV = '(' then;
    if LV = ') ' then;
  end;
  {@15D7-15DB}
  v43b := 255;
  {@15DB-16B9}
  while v43b <> 2 do
  begin
    {@15E4-162F}
    v41a := Concat(s29F3 + '(', pO0EC_142F(PR17_byte(p87F8)^.v)) + ') ';
    {@162F-1640}
    FillChar(bAB0E, 40, 255);
    {@1640-1644}
    v42b := 0;
    if PR17_byte(p87F8)^.v > 0 then
      pO108_00AB(0, @v42b);
    {@165C-1674}
    if PR17_byte(p87F8)^.v < 9 then
      pO108_00AB(1, @v42b);
    {@1674-1681}
    pO108_00AB(2, @v42b);
    {@1681-1699}
    v43b := pO108_1009(v41a2, s2F11, 0, 0);
    case v43b of
      0: Dec(PR17_byte(p87F8)^.v);
      1: Inc(PR17_byte(p87F8)^.v);
    end;
  end;
end;

{ 16BD }
procedure pO05F_16BD(a0: pointer);
begin
  {@16C0-16C9}
  PR496_byte(a0)^.v := 1;
if (PR9_pointer(PR487_pointer(a0)^.v)^.v <> nil)
      and (PR495_byte(PR9_pointer(PR487_pointer(a0)^.v)^.v)^.v = PR495_byte(a0)^.v) then
    PR9_pointer(PR487_pointer(a0)^.v)^.v := nil;
end;

{ 170C }
begin
end.

