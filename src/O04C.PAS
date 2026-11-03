{ O04C: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O04C;

interface

uses GAMEDATA;

procedure pO04C_0B3C;

implementation

uses LIT, O0AA, O0BB, O0E2, O0EC, O108, R142, R47F, R670;

type
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  TPV_ = procedure;
W15_16_0921 = record case byte of 0: (_p0: array[1..337] of byte; _w16_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w16_351abyte: array[0..32000] of byte) end;
W17_16_0921 = record case byte of 0: (_p0: array[1..337] of byte; _w16_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w16_351abyte: array[0..32000] of byte) end;
W19_16_0921 = record case byte of 0: (_p0: array[1..337] of byte; _w16_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w16_351abyte: array[0..32000] of byte) end;
W1_7_05A9 = record case byte of 0: (_p0: array[1..337] of byte; _w7_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w7_351abyte: array[0..32000] of byte) end;
W9_16_0921 = record case byte of 0: (_p0: array[1..337] of byte; _w16_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w16_351abyte: array[0..32000] of byte) end;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR178_byte = ^R178_byte;
  PR41_byte = ^R41_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR483_pointer = ^R483_pointer;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR508_byte = ^R508_byte;
  PR54_byte = ^R54_byte;
  PW15_16_0921 = ^W15_16_0921;
  PW17_16_0921 = ^W17_16_0921;
  PW19_16_0921 = ^W19_16_0921;
  PW1_7_05A9 = ^W1_7_05A9;
  PW9_16_0921 = ^W9_16_0921;
var
  a08CB_ec3f: array[0..32759] of byte absolute d08CB;
  a4011_ec3f: array[0..32759] of byte absolute d4011;
  a53CD_9a87: array[0..935] of string[34] absolute d53CD;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  bA7BE: byte absolute dA7BE;
  bA7D5: byte absolute dA7D5;
  bA7DB: byte absolute dA7DB;
  bAAE6: byte absolute dAAE6;
  bAE62: byte absolute dAE62;
  bC578: byte absolute dC578;
  gAC6A_dfee: TPV_ absolute dAC6A;
  gACD6_dfee: TPV_ absolute dACD6;
  gACE2_dfee: TPV_ absolute dACE2;
  l9CEE: longint absolute d9CEE;
  lAD3B: longint absolute dAD3B;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pAD3B: pointer absolute dAD3B;
  s2577: string absolute d2577;
  s25F2: string absolute d25F2;
  s2644: string absolute d2644;
  s266D: string absolute d266D;
  s2696: string absolute d2696;
  s26E8: string absolute d26E8;
  s2711: string absolute d2711;
  s273A: string absolute d273A;
  s2763: string absolute d2763;
  s278C: string absolute d278C;
  s3144: string absolute d3144;
  s316D: string absolute d316D;

function pO04C_0000(a0: string): byte; far; forward;
procedure pO04C_0053; far; forward;
procedure pO04C_00C4; far; forward;
procedure pO04C_0199(a0: byte); far; forward;
procedure pO04C_02FD; far; forward;
procedure pO04C_03DE; far; forward;
procedure pO04C_04B0; far; forward;
procedure pO04C_054E; far; forward;
procedure pO04C_05A9; far; forward;
procedure pO04C_062E; far; forward;
procedure pO04C_0921; far; forward;

{ 0000 }
function pO04C_0000(a0: string): byte;
var
  _f1: array[1..1] of byte;
begin
  {@001B-0034}
  pO0EC_1B08(p9CEE, a0, 0, 0);
  {@0034-0045}
  pO04C_0000 := pO108_2254(s2577, b5363);
  {@0045-004A}
  pO0EC_1BEF;
end;

{ 0053 }
procedure pO04C_0053;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  _f2: array[1..256] of byte;
  v261b: byte;
  _f3: array[1..1] of byte;
begin
  {@005A-0061}
  v261b := b5362;
  if pO0EC_27C1(p9CEE, 33, @v4b) = 0 then
    v261b := pO04C_0000(s25F2);
  {@0087-00A7}
  if v261b = b5362 then
    pO0E2_0104(p9CEE, 33, nil);
end;

{ 00C4 }
procedure pO04C_00C4;
var
c47: record case byte of 0: (v47a2: string[46]); 1: (v47a: string[40]); 2: (_p2: array[1..41] of byte;
      v6b: byte); 3: (_p3: array[1..42] of byte; v5b: byte); 4: (_p4: array[1..43] of byte; v4b: byte) end;
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LV = 'is not Diseased' then;
    if LV = 'is cured' then;
  end;
  {@00CA-00CE}
  c47.v6b := 0;
  for c47.v5b := 1 to 4 do
  begin
    {@00D7-0101}
    if pO0EC_27C1(p9CEE, a4011_ec3f[c47.v5b], @c47.v4b) <> 0 then
    begin
      {@00F9-00FD}
      c47.v6b := 1;
      {@00FD-0101}
      c47.v5b := 4;
    end;
  end;
  {@0107-017D}
  if c47.v6b = 0 then
    c47.v47a := 'is not Diseased'
  else
  begin
    {@0122-0127}
    bA7DB := 1;
    for c47.v5b := 1 to 4 do
      pO0E2_0104(p9CEE, a4011_ec3f[c47.v5b], nil);
    {@0155-0165}
    pO0E2_186E(p9CEE, 0);
    {@0165-016A}
    bA7DB := 0;
    {@016A-017D}
    c47.v47a := 'is cured';
  end;
  {@017D-0195}
  pO0EC_1B08(p9CEE, c47.v47a2, 0, 1);
end;

{ 0199 }
procedure pO04C_0199(a0: byte);
var
  v1b: byte;
  _f1: array[1..2] of byte;
  v4b: byte;
begin
  {@019F-02F7}
  case a0 of
    1: begin
      {@01A6-01B4}
      v1b := pO0E2_1374(1, 8);
      {@01B4-01CB}
      v4b := pO0E2_212C(p9CEE, v1b, 0);
    end;
    2: begin
      {@01D2-01E3}
      v1b := pO0E2_1374(2, 8) + 1;
      {@01E3-01FA}
      v4b := pO0E2_212C(p9CEE, v1b, 0);
    end;
    3: begin
      {@0201-0214}
      v1b := pO0E2_1374(3, 8) + 3;
      {@0214-022B}
      v4b := pO0E2_212C(p9CEE, v1b, 0);
    end;
    4: begin
      {@0235-0243}
      v1b := pO0E2_1374(1, 4);
      if (PR508_byte(p9CEE)^.v + v1b) > PR178_byte(p9CEE)^.v then
        v1b := 0
      else
        v1b := PR178_byte(p9CEE)^.v - PR508_byte(p9CEE)^.v - v1b;
      {@0294-02AB}
      v4b := pO0E2_212C(p9CEE, v1b, 0);
      {@02AB-02C1}
      pO0E2_0104(p9CEE, 33, nil);
      {@02C1-02D7}
      pO0E2_0104(p9CEE, 68, nil);
      {@02D7-02E7}
      pO0E2_186E(p9CEE, 1);
      {@02E7-02F7}
      pO0E2_186E(p9CEE, 2);
    end;
  end;
end;

{ 02FD }
procedure pO04C_02FD;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  v6b: byte;
  _f2: array[1..3] of byte;
  v13p: pointer;
  v14b: byte;
  v15b: byte;
  _f3: array[1..1] of byte;
begin
  {@0303-0310}
  v13p := p9CEE;
  {@0310-0314}
  v6b := 0;
  {@0314-0318}
  v15b := 0;
  {@0318-031E}
  v5b := b5362;
  if (PR493_byte(v13p)^.v = 6) or (PR493_byte(v13p)^.v = 1) then
    v6b := 1;
  {@0338-0349}
  v14b := Ord(PR493_byte(v13p)^.v = 8);
  if PR173_shortint(v13p)^.v < 1 then
    v15b := 1;
  {@0358-0398}
  if (v6b = 0) or (v15b <> 0) then
  begin
    {@0364-0398}
    if v15b <> 0 then
      v5b := pO04C_0000(s2644)
    else
    begin
      {@0378-0398}
      if v14b <> 0 then
        v5b := pO04C_0000(s266D)
      else
        v5b := pO04C_0000(s2696);
    end;
  end;
  {@0398-03C9}
  if (v5b = b5362) and (v6b <> 0) and (v15b = 0) and (v14b = 0) then
  begin
    {@03B3-03C0}
    pAD3B := v13p;
    {@03C0-03C5}
    bA7D5 := 75;
    {@03C5-03C9}
    gAC6A_dfee;
  end;
end;

{ 03DE }
procedure pO04C_03DE;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
begin
  if false then begin
    if LV = 'is not poisoned.' then;
  end;
  {@03E4-03E8}
  v6b := 0;
  {@03E8-03EE}
  v5b := b5362;
  if pO0EC_27C1(p9CEE, 55, @v4b) <> 0 then
    v6b := 1;
  {@040B-0427}
  if v6b = 0 then
    v5b := pO04C_0000('is not poisoned.');
  {@0427-04AC}
  if (v5b = b5362) and (v6b <> 0) then
  begin
    {@0436-044C}
    if PR508_byte(p9CEE)^.v = 0 then
      PR508_byte(p9CEE)^.v := 1;
    {@044C-0451}
    bA7DB := 1;
    {@0451-0467}
    pO0E2_0104(p9CEE, 55, nil);
    {@0467-047D}
    pO0E2_0104(p9CEE, 22, nil);
    {@047D-0493}
    pO0E2_0104(p9CEE, 15, nil);
    {@0493-0498}
    bA7DB := 0;
    {@0498-04A2}
    PR494_byte(p9CEE)^.v := 1;
    {@04A2-04AC}
    PR493_byte(p9CEE)^.v := 0;
  end;
end;

{ 04B0 }
procedure pO04C_04B0;
var
  v1b: byte;
  v5p: pointer;
  _f1: array[1..3] of byte;
  v9b: byte;
  v10b: byte;
begin
  {@04B6-04BC}
  v10b := b5362;
  {@04BC-04C0}
  v1b := 0;
  {@04C0-04D4}
  v5p := PR423_pointer(p9CEE)^.v;
  {@04D4-0503}
  while (v5p <> nil) and (v1b = 0) do
  begin
    {@04E2-04F0}
    if PR54_byte(v5p)^.v <> 0 then
      v1b := 1;
    {@04F0-0501}
    v5p := PR42_pointer(v5p)^.v;
  end;
  {@0503-052E}
  if (v1b = 0) and (pO0EC_27C1(p9CEE, 36, @v9b) = 0) then
    v10b := pO04C_0000(s26E8);
  {@052E-054A}
  if v10b = b5362 then
  begin
    {@0537-0545}
    pAD3B := p9CEE;
    {@0545-054A}
    pO0BB_3336;
  end;
end;

{ 054E }
procedure pO04C_054E;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@0554-055A}
  v5b := b5362;
  if PR493_byte(p9CEE)^.v <> 7 then
    v5b := pO04C_0000(s2711);
  {@0572-05A5}
  if (v5b = b5362) and (PR493_byte(p9CEE)^.v = 7) then
  begin
    {@0587-0591}
    PR493_byte(p9CEE)^.v := 0;
    {@0591-059B}
    PR494_byte(p9CEE)^.v := 1;
    {@059B-05A5}
    PR508_byte(p9CEE)^.v := 1;
  end;
end;

{ 05A9 }
procedure pO04C_05A9;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v3sb: shortint absolute v3b;
begin
  {@05AF-05B3}
  v2b := 0;
  {@05B3-05B9}
  v1b := b5362;
  with PW1_7_05A9(p9CEE)^ do
  begin
    for v3b := 0 to 6 do
    begin
      {@05CC-05F0}
      if _w7_337abyte[v3sb] < _w7_351abyte[v3sb] then
        v2b := 1;
    end;
  end;
  {@05F6-0608}
  if v2b = 0 then
    v1b := pO04C_0000(s273A);
  {@0608-0628}
  if v1b = b5362 then
  begin
    {@0611-061F}
    lAD3B := l9CEE;
    {@061F-0624}
    bA7D5 := 102;
    {@0624-0628}
    gACD6_dfee;
  end;
end;

{ 062E }
procedure pO04C_062E;
var
c66: record case byte of 0: (v66a2: string[65]); 1: (v66a: string[10]); 2: (v66b: byte);
      3: (_p3: array[1..11] of byte; v55b: byte); 4: (_p4: array[1..12] of byte; v54a2: string[53]);
      5: (_p5: array[1..12] of byte; v54a: string[40]); 6: (_p6: array[1..53] of byte; v13b: byte);
      7: (_p7: array[1..54] of byte; v12w: word); 8: (_p8: array[1..54] of byte; v12b: byte);
      9: (_p9: array[1..56] of byte; v10b: byte); 10: (_p10: array[1..57] of byte; v9b: byte);
      11: (_p11: array[1..58] of byte; v8p: pointer); 12: (_p12: array[1..58] of byte; v8b: byte);
      13: (_p13: array[1..62] of byte; v4p: pointer); 14: (_p14: array[1..62] of byte; v4b: byte) end;
  v67b: byte;
  v68b: byte;
begin
  if false then begin
    if LV = '/' then;
  end;
  {@0635-0639}
  c66.v13b := 0;
  {@0639-0641}
  c66.v4p := nil;
  {@0641-0649}
  c66.v8p := nil;
  {@0649-0657}
  pO108_22B0(11, @c66.v4b);
  {@0657-0663}
  c66.v8p := c66.v4p;
  {@0663-0667}
  c66.v10b := 1;
  {@0667-06B5}
  while c66.v4p <> nil do
  begin
    {@066F-0697}
    PR0_string_40_(c66.v4p)^.v := a53CD_9a87[a08CB_ec3f[c66.v10b]];
    {@0697-069F}
    PR41_byte(c66.v4p)^.v := 0;
    {@069F-06B0}
    c66.v4p := PR42_pointer(c66.v4p)^.v;
    {@06B0-06B3}
    Inc(c66.v10b);
  end;
  {@06B5-06C1}
  c66.v4p := c66.v8p;
  {@06C1-06D2}
  pR47F_0F07(0, 24, 39, 24);
  {@06D2-06D6}
  c66.v9b := 1;
  {@06D6-06DB}
  pR142_0137;
  {@06DB-06E0}
  c66.v12w := 0;
  {@06E0-0901}
  repeat
    {@06E0-06F1}
    pR47F_0F07(1, 19, 38, 19);
    {@06F1-0708}
    pR47F_0354(1, 19, 15, 0, PR0_string(p9CEE)^.v);
    {@0708-072D}
    c66.v66a := pO0EC_146B(PR508_byte(p9CEE)^.v);
    {@072D-0733}
    v67b := c66.v66b;
    if PR508_byte(p9CEE)^.v <> PR178_byte(p9CEE)^.v then
      v68b := 13
    else
      v68b := 15;
    {@0751-0768}
    pR47F_0354(18, 19, v68b, 0, c66.v66a2);
    {@0768-07A2}
    c66.v66a := '/' + pO0EC_146B(PR178_byte(p9CEE)^.v);
    {@07A2-07BE}
    pR47F_0354(v67b + 18, 19, 15, 0, c66.v66a2);
    {@07BE-07E7}
    c66.v54a := PR0_string(p9CEE)^.v + s2763;
    {@07E7-07FD}
    pR47F_0354(1, 1, 15, 0, c66.v54a2);
    {@07FD-0805}
    pO108_00CB(0);
    {@0805-083E}
    c66.v55b := pO108_1D45(s278C, s3144, 2, 3, 38, 15, c66.v4p, 1, 0, @c66.v9b, @c66.v12b, @c66.v8b);
    if bAAE6 <> 0 then
    begin
      {@0845-084F}
      if c66.v55b = 27 then
        c66.v13b := 1;
    end
    else
      case c66.v55b of
        0: case c66.v12w of
            0: pO04C_0053;
            1: pO04C_00C4;
            2: pO04C_0199(1);
            3: pO04C_0199(2);
            4: pO04C_0199(3);
            5: pO04C_0199(4);
            6: pO04C_03DE;
            7: pO04C_02FD;
            8: pO04C_04B0;
            9: pO04C_054E;
            10: pO04C_05A9;
            11: c66.v13b := 1;
          end;
        1: c66.v13b := 1;
      end;
  until c66.v13b <> 0;
  {@0901-090B}
  pO108_2363(@c66.v4b);
  {@090B-0910}
  pO0EC_2ED1;
  {@0910-091D}
  pO0EC_07C0(p9CEE);
end;

{ 0921 }
procedure pO04C_0921;
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  v8b: byte;
  _f1: array[1..3] of byte;
  v12b: byte;
  v7sb: shortint absolute v7b;
begin
  {@0927-0934}
  v6p := p9CF2;
  {@0934-0B38}
  while v6p <> nil do
  begin
    {@093F-0953}
    pO0E2_0104(v6p, 68, nil);
    {@0953-0967}
    pO0E2_0104(v6p, 33, nil);
    for v1b := 1 to 4 do
      pO0E2_0104(v6p, a4011_ec3f[v1b], nil);
    {@0993-0A16}
    if pO0EC_27C1(v6p, 55, @v12b) <> 0 then
    begin
      {@09AA-09BE}
      if PR508_byte(v6p)^.v = 0 then
        PR508_byte(v6p)^.v := 1;
      {@09BE-09C3}
      bA7DB := 1;
      {@09C3-09D7}
      pO0E2_0104(v6p, 55, nil);
      {@09D7-09EB}
      pO0E2_0104(v6p, 22, nil);
      {@09EB-09FF}
      pO0E2_0104(v6p, 15, nil);
      {@09FF-0A04}
      bA7DB := 0;
      {@0A04-0A0D}
      PR494_byte(v6p)^.v := 1;
      {@0A0D-0A16}
      PR493_byte(v6p)^.v := 0;
    end;
    {@0A16-0A4D}
    if (PR493_byte(v6p)^.v = 6) and (PR493_byte(v6p)^.v <> 8) and (PR173_byte(v6p)^.v <> 0) then
    begin
      {@0A37-0A44}
      pAD3B := v6p;
      {@0A44-0A49}
      bA7D5 := 105;
      {@0A49-0A4D}
      gACE2_dfee;
    end;
    {@0A4D-0A6A}
    if PR493_byte(v6p)^.v = 7 then
    begin
      {@0A58-0A61}
      PR493_byte(v6p)^.v := 0;
      {@0A61-0A6A}
      PR494_byte(v6p)^.v := 1;
    end;
    {@0A6A-0ACC}
    repeat
      {@0A6A-0A6E}
      v8b := 0;
      with PW19_16_0921(v6p)^ do
      begin
        for v7b := 0 to 6 do
        begin
          {@0A80-0AA4}
          if _w16_337abyte[v7sb] < _w16_351abyte[v7sb] then
            v8b := 1;
        end;
      end;
      {@0AAA-0AC6}
      if v8b <> 0 then
      begin
        {@0AB0-0ABD}
        pAD3B := v6p;
        {@0ABD-0AC2}
        bA7D5 := 102;
        {@0AC2-0AC6}
        gACD6_dfee;
      end;
    until v8b = 0;
    {@0ACC-0AEA}
    for v2b := 0 to 5 do
      pO0E2_186E(v6p, v2b);
    {@0AEA-0B05}
    if PR493_byte(v6p)^.v <> 8 then
      PR508_byte(v6p)^.v := PR178_byte(v6p)^.v;
    {@0B05-0B22}
    if PR493_byte(v6p)^.v = 4 then
    begin
      {@0B10-0B19}
      PR493_byte(v6p)^.v := 0;
      {@0B19-0B22}
      PR494_byte(v6p)^.v := 1;
    end;
    {@0B22-0B35}
    v6p := PR483_pointer(v6p)^.v;
  end;
end;

{ 0B3C }
procedure pO04C_0B3C;
var
  _f1: array[1..2] of byte;
  v3b: byte;
  v4b: byte;
  _f2: array[1..6] of byte;
begin
  {@0B42-0B47}
  b880C := 1;
  {@0B47-0B4C}
  bC578 := 0;
  {@0B4C-0B51}
  pO0EC_2ED1;
  {@0B51-0B56}
  bC578 := 1;
  {@0B56-0B63}
  pO0EC_07C0(p9CEE);
  {@0B63-0B71}
  XR670_046E(@bA7BE, 12);
  {@0B71-0B76}
  bAE62 := 0;
  {@0B76-0B7A}
  v4b := 0;
  {@0B7A-0C08}
  repeat
    {@0B7A-0B82}
    pO108_00CB(3);
    {@0B82-0B9A}
    v3b := pO108_1009(s278C, s316D, 1, 0);
    if bAAE6 <> 0 then
      case v3b of
        27: v3b := 3;
        72, 80: begin
          {@0BB6-0BBF}
          pO0AA_2F7B(v3b);
          {@0BBF-0BC3}
          v3b := 255;
        end;
      end;
    {@0BC3-0BF2}
    case v3b of
      0: pO04C_062E;
      1: pO0AA_0C9D(@bAAE6);
      2: pO04C_0921;
      3: v4b := 1;
    end;
    {@0BF2-0BFF}
    pO0EC_07C0(p9CEE);
  until v4b <> 0;
end;

{ 0C0C }
begin
end.

