{ O108: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O108;

interface

uses GAMEDATA;

function pO108_0000(a0: word; a1: pointer): pointer;
procedure pO108_00AB(a0: byte; a1: pointer);
procedure pO108_00CB(a0: byte);
function pO108_1009(a0: S40; a1: string; a2: byte; a3: byte): byte;
procedure pO108_167D;
function pO108_1D45
  (a0: S40; a1: string; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: byte; a8: byte;
   a9: pointer; a10: pointer; a11: pointer): byte;
function pO108_2254(a0: S40; a1: byte): byte;
procedure pO108_22B0(a0: word; a1: pointer);
procedure pO108_2363(a0: pointer);

implementation

uses LIT, O111, O135, R142, R47F, R670, R6DD, R716;

type
  E2_byte = record f: byte; _r: array[1..1] of byte end;
  E4_shortint = record f: shortint; _r: array[1..3] of byte end;
  E4_word = record f: word; _r: array[1..2] of byte end;
  R0_byte = record v: byte end;
  R0_integer = record v: integer end;
  R0_longint = record v: longint end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_word = record v: word end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R36_byte = record _p: array[1..36] of byte; v: byte end;
  R37_byte = record _p: array[1..37] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R42_longint = record _p: array[1..42] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  PR0_byte = ^R0_byte;
  PR0_integer = ^R0_integer;
  PR0_longint = ^R0_longint;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_word = ^R0_word;
  PR2_shortint = ^R2_shortint;
  PR33_byte = ^R33_byte;
  PR35_byte = ^R35_byte;
  PR36_byte = ^R36_byte;
  PR37_byte = ^R37_byte;
  PR3_shortint = ^R3_shortint;
  PR41_byte = ^R41_byte;
  PR42_longint = ^R42_longint;
  PR42_pointer = ^R42_pointer;
  PR483_pointer = ^R483_pointer;
var
  a5364_ec3f: array[0..32759] of byte absolute d5364;
  a9EF1_2fb8: array[0..8189] of E4_shortint absolute d9EF1;
  a9EF2_2fb8: array[0..8189] of E4_shortint absolute d9EF2;
  aAA16_ec3f: array[0..32759] of byte absolute dAA16;
  aAAEC_ec3f: array[0..32759] of byte absolute dAAEC;
  aAB0E_71c0: array[0..16379] of E2_byte absolute dAB0E;
  aAB0F_71c0: array[0..16379] of E2_byte absolute dAB0F;
  b880C: byte absolute d880C;
  bAA08: byte absolute dAA08;
  bAA15: byte absolute dAA15;
  bAA32: byte absolute dAA32;
  bAA33: byte absolute dAA33;
  bAA34: byte absolute dAA34;
  bAADE: byte absolute dAADE;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAAE7: byte absolute dAAE7;
  bAAEC: byte absolute dAAEC;
  bAAED: byte absolute dAAED;
  bAB06: byte absolute dAB06;
  bAB07: byte absolute dAB07;
  bAB08: byte absolute dAB08;
  bAB09: byte absolute dAB09;
  bAB0A: byte absolute dAB0A;
  bAB0B: byte absolute dAB0B;
  bAB0C: byte absolute dAB0C;
  bAB0E: byte absolute dAB0E;
  bAB36: byte absolute dAB36;
  bAB37: byte absolute dAB37;
  bAB38: byte absolute dAB38;
  bAE86: byte absolute dAE86;
  bAEE7: byte absolute dAEE7;
  bAEE9: byte absolute dAEE9;
  bC584: byte absolute dC584;
  bC591: byte absolute dC591;
  bC5C3: byte absolute dC5C3;
  bC5C5: byte absolute dC5C5;
  bC60C: byte absolute dC60C;
  iAAE3: integer absolute dAAE3;
  l9CEE: longint absolute d9CEE;
  lAAE8: longint absolute dAAE8;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CF6: pointer absolute d9CF6;
  pA6E0: pointer absolute dA6E0;
  pAADF: pointer absolute dAADF;
  s0C7E: string absolute d0C7E;
  s0C89: string absolute d0C89;
  s0C94: string absolute d0C94;
  s2B64: string absolute d2B64;
  sbAB06: shortint absolute dAB06;
  sbAB07: shortint absolute dAB07;
  sbAEE5: shortint absolute dAEE5;
  sbAEE6: shortint absolute dAEE6;
  wAAE3: word absolute dAAE3;

function pO108_0067(a0: pointer): word; far; forward;

{ 0000 }
function pO108_0000(a0: word; a1: pointer): pointer;
var
  v8p: pointer;
  v10w: word;
begin
  {@0006-000B}
  v10w := 0;
  {@000B-0017}
  v8p := a1;
  {@0017-003D}
  while (v8p <> nil) and (v10w <> a0) do
  begin
    {@0027-0038}
    v8p := PR42_pointer(v8p)^.v;
    {@0038-003B}
    Inc(v10w);
  end;
  {@003D-0053}
  if v10w = a0 then
  begin
    {@0045-0051}
    pO108_0000 := v8p;
    {@0051-0053}
    Exit;
  end;
  asm
  db 49,192,137,70,252,137,70,254
  end;
end;

{ 0067 }
function pO108_0067(a0: pointer): word;
var
  v6p: pointer;
  v8w: word;
begin
  {@006D-0072}
  v8w := 0;
  {@0072-007E}
  v6p := a0;
  {@007E-009C}
  while v6p <> nil do
  begin
    {@0086-0089}
    Inc(v8w);
    {@0089-009A}
    v6p := PR42_pointer(v6p)^.v;
  end;
  {@009C-00A2}
  pO108_0067 := v8w;
end;

{ 00AB }
procedure pO108_00AB(a0: byte; a1: pointer);
begin
  {@00AE-00C1}
  aAB0E_71c0[PR0_byte(a1)^.v].f := a0;
  {@00C1-00C7}
  Inc(PR0_byte(a1)^.v);
end;

{ 00CB }
procedure pO108_00CB(a0: byte);
var
  v1b: byte;
begin
  {@00D1-00E2}
  FillChar(bAB0E, 40, 255);
  for v1b := 0 to a0 do
    aAB0E_71c0[v1b].f := v1b;
end;

{ 1009 }
function pO108_1009(a0: S40; a1: string; a2: byte; a3: byte): byte;
var
  v302l: longint;
  _f1: array[1..2] of byte;
c322: record case byte of 0: (v322l: longint); 1: (_p1: array[1..2] of byte;
      v320a: array[0..3] of E4_word) end;
  v326l: longint;
  v327b: byte;
  v328b: byte;
  v330i: integer;
  v332i: integer;
  v333b: byte;
  _f2: array[1..1] of byte;
  v335b: byte;
  v336b: byte;
  v337b: byte;
  _f3: array[1..39] of byte;
c379: record case byte of 0: (v379a: array[0..0] of E2_byte); 1: (v379b: byte);
      2: (_p2: array[1..1] of byte; v378a: array[0..0] of E2_byte); 3: (_p3: array[1..1] of byte;
      v378b: byte); 4: (_p4: array[1..2] of byte; v377b: byte) end;
  v383p: pointer;
  v385w: word;
  v387w: word;
  v389w: word;
  v390b: byte;
  v391b: byte;
  v392b: byte;
  v648a: array[0..255] of byte;
  v649b: byte;
  v650b: byte;
  v648a2: string absolute v648a;
  v648b: byte absolute v648a;
  v389b: byte absolute v389w;
  v387b: byte absolute v387w;
  v385b: byte absolute v385w;
  v332w: word absolute v332i;
  v330w: word absolute v330i;
  v330b: byte absolute v330i;
  v328a: char absolute v328b;
  { 0135 }
  procedure pO108_0135;
  var
    w1b: byte;
    w2b: byte;
    w3b: byte;
  begin
    if false then begin
      if LSV = [48..57, 65..90] then;
    end;
    {@013B-014D}
    XR670_046E(@c379.v377b, 40);
    {@014D-0151}
    w1b := 1;
    {@0151-015C}
    w3b := v648b;
    for w2b := 1 to w3b do
    begin
      {@0174-020A}
      if v648a[w2b] in [48..57, 65..90] then
      begin
        {@0190-01EB}
        if c379.v379a[w1b].f = 0 then
          c379.v379a[w1b].f := w2b
        else
        begin
          {@01BA-01D4}
          c379.v378a[w1b].f := w2b - 2;
          {@01D4-01D7}
          Inc(w1b);
          {@01D7-01EB}
          c379.v379a[w1b].f := w2b;
        end;
      end
      else
      begin
        {@01ED-020A}
        if v648a[w2b] = 64 then
          v392b := w1b;
      end;
    end;
    {@0215-0229}
    c379.v378a[w1b].f := w3b;
    {@0229-0234}
    c379.v378b := w1b;
  end;

  { 025A }
  procedure pO108_025A(b0: byte);
  var
    w1b: byte;
    w2b: byte;
    w3b: byte;
  begin
    if false then begin
      if LSV = [48..57, 65..90] then;
    end;
    {@0260-0265}
    pR6DD_0051;
    {@0265-0269}
    w1b := 1;
    {@0269-0274}
    w2b := v391b;
    if v336b > 0 then
      for w3b := 1 to v336b do
      begin
        {@029F-03E8}
        if v648a[w3b] = 64 then
        begin
          {@02B1-02D6}
          pR142_0217(v337b + w1b - 1, w2b, 39, w2b);
          {@02D6-02D9}
          Inc(w2b);
          {@02D9-02DD}
          w1b := 1;
        end
        else
        begin
          {@02E0-03E5}
          if (c379.v379a[b0].f <= w3b) and (c379.v378a[b0].f >= w3b) and (bAB38 <> 0) then
            pR47F_01DF(v337b + w1b - 1, w2b, 0, bAB38, 1, v648a[w3b], 1)
          else
          begin
            {@0351-03E5}
            if v648a[w3b] in [48..57, 65..90] then
              pR47F_01DF(v337b + w1b - 1, w2b, bAB38, 0, 1, v648a[w3b], 1)
            else
              pR47F_01DF(v337b + w1b - 1, w2b, bAB36, 0, 1, v648a[w3b], 1);
          end;
          {@03E5-03E8}
          Inc(w1b);
        end;
      end;
    {@03F3-0431}
    if (v337b + w1b - 1) <= 39 then
      pR142_0217(v337b + w1b - 1, w2b, 39, w2b);
    {@0431-0436}
    pR6DD_0030;
  end;

  { 043C }
  procedure pO108_043C;
  begin
    {@043F-0444}
    bAAE6 := 0;
    {@0444-0469}
    v328b := v648a[c379.v379a[bAAE5].f];
    if v328b = 0 then
      v328b := 13;
    {@047D-0486}
    v335b := 1;
  end;

  { 048A }
  function pO108_048A: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@0490-0503}
  pO108_048A := Ord((bC5C3 <> 0) and ((b880C <> 3) or (PR35_byte(p87F8)^.v <> 1)) and ((bC591 = 0)
        or (b880C <> 4)) and (b880C <> 5) and (bAB08 <= v330i) and (bAB09 >= v330i) and (bAB0A <= v332i)
        and (bAB0B >= v332i));
  end;

  { 050C }
  procedure pO108_050C;
  var
    w1b: byte;
  begin
    {@0512-052B}
    v333b := v332w - bAB0A;
    {@052B-053F}
    v383p := p9CF2;
    for w1b := 1 to v333b do
    begin
      {@0559-0587}
      if v383p <> nil then
        v383p := PR483_pointer(v383p)^.v;
    end;
    {@058F-062B}
    if (v383p <> nil) and ((v383p <> p9CEE) and (bAADE = 0) or (v383p <> pAADF) and (bAADE <> 0)) then
    begin
      {@05E1-0612}
      if bAADE <> 0 then
        pAADF := v383p
      else
        p9CF6 := v383p;
      {@0612-061B}
      v328b := 72;
      {@061B-0620}
      bAAE6 := 1;
      {@0620-0629}
      v335b := 1;
      {@0629-062B}
      Exit;
    end;
    {@062B-0673}
    if (v383p <> nil) and ((v383p = p9CEE) or (v383p = pAADF)) then
      pO108_043C;
  end;

  { 0679 }
  function pO108_0679: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@067F-06C9}
  pO108_0679 := Ord(((bAEE9 <> 0) or (bAEE7 <> 0)) and (b880C = 5) and (v330i >= 1) and (v330i <= 21)
        and (v332i >= 1) and (v332i <= 21));
  end;

  { 06D2 }
  procedure pO108_06D2;
  begin
    {@06D5-06DA}
    bAAE6 := 1;
    if bAEE7 <> 0 then
    begin
      {@06E1-06FB}
      v387w := sbAEE5 - PR2_shortint(pA6E0)^.v + 1;
      {@06FB-0715}
      v389w := sbAEE6 - PR3_shortint(pA6E0)^.v + 1;
    end
    else
    begin
      {@0717-072C}
      v333b := pO135_0D1A(l9CEE);
      {@072C-0757}
      v387w := a9EF1_2fb8[v333b].f - PR2_shortint(pA6E0)^.v + 1;
      {@0757-0782}
      v389w := a9EF2_2fb8[v333b].f - PR3_shortint(pA6E0)^.v + 1;
    end;
    asm
    db 139,126,6,54,255,181,125,254,139,126,6,54,255,181,123,254,139,126,6,54,139,133,182,254,153,185,3,0
    db 247,249,64,80,139,126,6,54,139,133,180,254,153,185,3,0,247,249,64,80
    call pR6DD_0167
    db 139,126,6,54,136,133,184,254
    end;
    {@07BF-07C8}
    v335b := 1;
  end;

  { 07CC }
  function pO108_07CC: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@07D2-0815}
  pO108_07CC := Ord((bC591 <> 0) and (v330i >= 3) and (v330i <= 13) and (v332i >= 3) and (v332i <= 13)
        and (b880C = 4));
  end;

  { 081E }
  procedure pO108_081E;
  var loc: array[1..4] of byte;
  begin
    asm
      db 198,6,230,170,1,128,62,242,169,0,117,3,233,217,0,160,243,169,152,45,5,0,136,70,255,160,244,169
      db 152,45,5,0,136,70,254,128,126,255,0,125,4,198,70,255,0,128,126,255,5,126,4,198,70,255,5,128
      db 126,254,0,125,4,198,70,254,0,128,126,254,5,126,4,198,70,254,5,138,70,255,152,139,208,160,243,169
      db 152,43,194,5,3,0,136,70,255,138,70,254,152,139,208,160,244,169,152,43,194,5,3,0,136,70,254,138
      db 70,255,152,80,138,70,254,152,80,139,126,6,54,255,181,182,254,139,126,6,54,255,181,180,254
      call pO135_1602
      db 48,228,209,232,136,70,253,160,245,169,48,228,209,232,136,70,252,138,70,255,152,139,126,6,54,59,133,182
      db 254,117,25,138,70,254,152,139,126,6,54,59,133,180,254,117,11,139,126,6,54,198,133,184,254,72,235,32
      db 138,70,253,48,228,139,208,138,70,252,48,228,139,248,209,231,209,231,3,250,138,133,160,12,139,126,6,54
      db 136,133,184,254,235,35,139,126,6,54,139,141,182,254,139,126,6,184,11,0,54,247,165,180,254,139,248,3
      db 249,138,133,73,83,139,126,6,54,136,133,184,254,139,126,6,54,198,133,177,254,1
    end;
  end;

  { 093E }
  function pO108_093E: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@0944-099D}
  pO108_093E := Ord((bC591 <> 0) and (PR35_byte(p87F8)^.v = 1) and (PR33_byte(p87F8)^.v = 0) and (b880C = 3)
        and (v330i >= 1) and (v330i <= 38) and (v332i >= 1) and (v332i <= 15));
  end;

  { 09A6 }
  procedure pO108_09A6;
  begin
    {@09A9-09AE}
    bAAE6 := 1;
    {@09AE-09E3}
    v328b := pR6DD_0167(PR36_byte(p87F8)^.v + 1, PR37_byte(p87F8)^.v + 1, v330w, v332w);
    {@09E3-09EC}
    v335b := 1;
  end;

  { 09F0 }
  function pO108_09F0: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@09F6-0A1E}
    pO108_09F0 := Ord((v391b <= v332i) and (v335b = 0));
  end;

  { 0A29 }
  procedure pO108_0A29;
  var
    w1b: byte;
  begin
    if false then begin
      if LV = '@' then;
    end;
    {@0A2F-0A37}
    Inc(v330w);
    {@0A37-0A4E}
    if v337b >= v330i then
      Exit;
    {@0A4E-0A6C}
    v330w := v330w - v337b;
    if v390b <> 0 then
    begin
      {@0A77-0AC8}
      if v391b < v332i then
        Inc(v330w, Pos('@', v648a2))
      else
      begin
        {@0AA8-0AC8}
        if Pos('@', v648a2) <= v330i then
          Exit;
      end;
    end;
    {@0AC8-0B7E}
    for w1b := 1 to c379.v378b do
    begin
      {@0AE5-0B73}
      if (c379.v379a[w1b].f <= v330i) and (c379.v378a[w1b].f >= v330i) then
      begin
        {@0B1F-0B44}
        v328b := v648a[c379.v379a[w1b].f];
        if w1b = bAAE5 then
          bAAE7 := 0
        else
          bAAE7 := 1;
        {@0B59-0B5F}
        bAAE5 := w1b;
        {@0B5F-0B6A}
        pO108_025A(bAAE5);
        {@0B6A-0B73}
        v335b := 1;
      end;
    end;
  end;

  { 0B84 }
  function pO108_0B84: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@0B8A-0BA5}
    pO108_0B84 := Ord((bAE86 <> 0) and (v335b = 0));
  end;

  { 0BAE }
  procedure pO108_0BAE;
  begin
    {@0BB1-0BBA}
    v335b := 1;
    case v332i of
      1: begin
        {@0BC7-0BE2}
        if (v330i >= 1) and (v330i <= 16) then
          bAB0C := 6;
      end;
      3: begin
        {@0BE9-0C04}
        if (v330i >= 31) and (v330i <= 33) then
          bAB0C := 7;
      end;
      9..14: begin
        {@0C10-0C34}
        if (v330i >= 5) and (v330i <= 9) then
          bAB0C := v332w - 9;
      end;
    else
      {@0C36-0C3F}
      v335b := 0;
    end;
    {@0C3F-0C44}
    bAAE6 := 1;
    {@0C44-0C4D}
    v328b := 71;
  end;

  { 0C51 }
  function pO108_0C51: byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@0C57-0C87}
    pO108_0C51 := Ord((v335b = 0) and (sbAB06 <= v330i) and (sbAB07 >= v330i));
  end;

  { 0C90 }
  procedure pO108_0C90;
  begin
    {@0C93-0C9C}
    v333b := 1;
    {@0C9C-0CA1}
    bAAE7 := 1;
    {@0CA1-0CF9}
    while (v333b <= 25) and (aAAEC_ec3f[v333b] <> 255) and (v335b = 0) do
    begin
      {@0CCA-0CEF}
      if aAAEC_ec3f[v333b] <= v332i then
        v335b := 1;
      {@0CEF-0CF7}
      Inc(v333b);
    end;
    {@0CF9-0D0B}
    if v335b <> 0 then
      pO108_043C;
  end;

  { 0D0F }
  procedure pO108_0D0F;
  begin
    {@0D12-0D2A}
    if bAAE5 = 1 then
      bAAE5 := c379.v378b
    else
      Dec(bAAE5);
    {@0D2A-0D35}
    pO108_025A(bAAE5);
    {@0D35-0D3E}
    v335b := 0;
  end;

  { 0D42 }
  procedure pO108_0D42;
  begin
    {@0D45-0D5D}
    if bAAE5 = c379.v378b then
      bAAE5 := 1
    else
      Inc(bAAE5);
    {@0D5D-0D68}
    pO108_025A(bAAE5);
    {@0D68-0D71}
    v335b := 0;
  end;

  { 0D75 }
  procedure pO108_0D75;
  begin
    {@0D78-0DCF}
    if bAAE5 <= v392b then
    begin
      {@0D85-0D91}
      Inc(bAAE5, v392b);
      if bAAE5 > c379.v378b then
        bAAE5 := c379.v378b;
    end
    else
    begin
      {@0DAB-0DB7}
      Dec(bAAE5, v392b);
      if bAAE5 > v392b then
        bAAE5 := v392b;
    end;
    {@0DCF-0DDA}
    pO108_025A(bAAE5);
    {@0DDA-0DE3}
    v335b := 0;
  end;

  { 0E07 }
  procedure pO108_0E07;
  var
    _f1: array[1..1] of byte;
    w2b: byte;
    w3b: byte;
    _f2: array[1..1] of byte;
    w5b: byte;
    w6b: byte;
    w7b: byte;
  begin
    if false then begin
      if LSV = [48..57, 65..90] then;
    end;
    {@0E0E-0E19}
    w7b := Length(a1);
    {@0E19-0E22}
    v648b := 0;
    {@0E22-0E26}
    w6b := 0;
    {@0E26-0E2A}
    w2b := 0;
    {@0E2A-0E2E}
    w5b := 1;
    {@0E2E-0F22}
    while w5b <= w7b do
    begin
      {@0E39-0F1F}
      if Ord(a1[w5b]) in [48..57, 65..90] then
      begin
        {@0E58-0F17}
        if aAB0E_71c0[w6b].f = w2b then
        begin
          {@0E6D-0E89}
          aAB0F_71c0[w6b].f := Ord(a1[w5b]);
          {@0E89-0E8F}
          w3b := w5b;
          {@0E8F-0E92}
          Inc(w5b);
          {@0E92-0EBB}
          while not (Ord(a1[w5b]) in [48..57, 65..90]) and (w5b <= w7b) do
            Inc(w5b);
          {@0EBB-0F0F}
          v648a2 := v648a2 + Copy(a1, w3b, w5b - w3b);
          {@0F0F-0F12}
          Inc(w6b);
        end
        else
          Inc(w5b);
        {@0F17-0F1A}
        Inc(w2b);
      end
      else
        Inc(w5b);
    end;
    {@0F22-0F2D}
    w7b := v648b;
    if v648a[w7b] = 32 then
      Delete(v648a2, w7b, 1);
  end;

  { 0F5D }
  function pO108_0F5D: byte;
  var
    w2b: byte;
  begin
    {@0F63-0F77}
    if bAAE6 <> 0 then
    begin
      {@0F6A-0F75}
      pO108_0F5D := v328b;
      {@0F75-0F77}
      Exit;
    end;
    {@0F77-0F7B}
    w2b := 0;
    {@0F7B-0F9D}
    while (w2b < 20) and (aAB0F_71c0[w2b].f <> v328b) do
      Inc(w2b);
    {@0F9D-0FB5}
    if w2b < 20 then
    begin
      {@0FA3-0FB3}
      pO108_0F5D := aAB0E_71c0[w2b].f;
      {@0FB3-0FB5}
      Exit;
    end;
    {@0FB5-0FB9}
    pO108_0F5D := 255;
  end;

begin
  if false then begin
    if LV = '@' then;
    if LV = 'Aim:' then;
    if LSV = [50, 56, 72, 80] then;
    if LSV = [49..57, 92] then;
    LP1('@');
  end;
  {@1037-103C}
  v650b := 0;
  {@103C-1041}
  pO108_0E07;
  if Pos('@', v648a2) > 0 then
  begin
    {@1055-105A}
    v390b := 1;
    {@105A-105F}
    v391b := 23;
  end
  else
  begin
    {@1061-1066}
    v390b := 0;
    {@1066-106B}
    v391b := 24;
  end;
  {@106B-1070}
  bAAE6 := 0;
  {@1070-1088}
  c379.v379b := Ord((bAB36 <> 0) or (bAB38 <> 0));
  {@1088-1094}
  v337b := Length(a0) + 0;
  {@1094-1099}
  pO108_0135;
  if (bAAE5 > c379.v378b) or (bAAE5 = 0) then
    bAAE5 := 1;
  {@10AE-10B6}
  v336b := v648b;
  {@10B6-10BB}
  v328b := 0;
  {@10BB-10C0}
  v335b := 0;
  for v333b := 1 to 4 do
  begin
    asm
  call pR47F_0BAD
  db 139,200,139,218,138,134,179,254,48,228,139,248,209,231,209,231,137,139,190,254
    end;
    asm
  db 137,155,192,254
    end;
  end;
  {@10EF-10FC}
  v302l := pR47F_0BAD;
  {@10FC-110F}
  c322.v322l := pR47F_0BAD + 30;
  {@110F-1125}
  v326l := c322.v322l + 50;
  if Length(a0) <> 0 then
    pR47F_0354(0, 24, bAB37, 0, a0);
  {@1142-114B}
  pO108_025A(bAAE5);
  if bAA15 <> 0 then
    a3 := 0;
  {@1156-1183}
  if (a3 <> 0) and (bAA34 > 0) then
  begin
    asm
  db 184,3,0,80,184,3,0,80,138,70,6,80,160,52,170,80
  call pO111_00A8
    end;
    if bAA33 < 2 then
      a3 := 0;
  end;
  {@1183-1611}
  repeat
    {@1183-1214}
    if (a3 <> 0) and (bAA33 > 0) and ((aAA16_ec3f[bAA34] * 10) <= (pR47F_0BAD - v302l)) then
    begin
      {@11C4-11C8}
      Inc(bAA34);
      if bAA34 > bAA33 then
        bAA34 := bAA32;
      asm
  db 184,3,0,80,184,3,0,80,138,70,6,80,160,52,170,80
  call pO111_00A8
      end;
      {@11EC-11F9}
      v302l := pR47F_0BAD;
      {@11F9-1214}
      a3 := Ord(Ord(aAA16_ec3f[bAA34] = 99) = 0);
    end;
    {@1214-1335}
    if bAA08 <> 0 then
      for v333b := 1 to 4 do
      begin
        asm
  db 128,62,192,146,2,117,107,138,134,179,254,48,228,139,248,209,231,209,231,255,179,192,254,255,179,190,254
  call pR47F_0BAD
  db 89,91,43,193,27,211,139,200,139,218,138,134,179,254,48,228,139,248,139,247,209,231,1,247,138,133,8,170
  db 48,228,139,240,209,224,209,224,1,240,153,59,211,124,6,127,25,59,193,115,21,138,134,179,254,48,228,139
  db 248,139,247,209,231,1,247,128,189,8,170,0,117,4,176,0,235,2,176,1,136,134,185,254,235,98,138,134
  db 179,254,48,228,139,248,209,231,209,231,255,179,192,254,255,179,190,254
  call pR47F_0BAD
  db 89,91,43,193,27,211,139,200,139,218,138,134,179,254,48,228,139,248,139,247,209,231,1,247,138,133,8,170
  db 48,228,49,210,59,211,124,6,127,25,59,193,115,21,138,134,179,254,48,228,139,248,139,247,209,231,1,247
  db 128,189,8,170,0,117,4,176,0,235,2,176,1,136,134,185,254
        end;
        {@12FD-132B}
        if v327b <> 0 then
        begin
          {@1304-130E}
          pO111_0BD8(v333b);
          asm
  call pR47F_0BAD
  db 139,200,139,218,138,134,179,254,48,228,139,248,209,231,209,231,137,139,190,254
          end;
          asm
  db 137,155,192,254
          end;
        end;
      end;
    {@1335-1371}
    if (lAAE8 > 0) and ((pR47F_0BAD - v302l) >= lAAE8) then
    begin
      {@1360-1367}
      v649b := bAAEC;
      {@1367-136C}
      v650b := 1;
      {@136C-1371}
      v335b := 1;
    end;
    {@1371-1607}
    if pR670_0277 <> 0 then
    begin
      {@137D-1386}
      v328b := pR670_0187;
      if v328b = 0 then
      begin
        {@138D-1396}
        v328b := pR670_0187;
        {@1396-139B}
        bAAE6 := 1;
        {@139B-13A0}
        v335b := 1;
        if c379.v378b > 1 then
          case v328b of
            75: pO108_0D0F;
            77: pO108_0D42;
            72, 80: begin
              {@13C9-13D5}
              if v390b <> 0 then
                pO108_0D75;
            end;
          end;
      end
      else
      begin
        {@13D8-13DD}
        bAAE6 := 0;
        case v328b of
          27: begin
            {@13E5-13EA}
            bAAE6 := 1;
            {@13EA-13EF}
            v335b := 1;
          end;
          13: begin
            {@13F9-14EE}
            if bC5C5 <> 0 then
            begin
              asm
  db 161,201,197,153,185,8,0,247,249,137,134,180,254
              end;
              asm
  db 161,199,197,153,185,8,0,247,249,137,134,182,254
              end;
              if pO108_048A <> 0 then
                pO108_050C
              else
              begin
                {@142E-14E7}
                if pO108_0679 <> 0 then
                  pO108_06D2
                else
                begin
                  {@143F-14E7}
                  if pO108_07CC <> 0 then
                    pO108_081E
                  else
                  begin
                    {@1450-14E7}
                    if pO108_093E <> 0 then
                      pO108_09A6
                    else
                    begin
                      {@1461-14E7}
                      if pO108_09F0 <> 0 then
                        pO108_0A29
                      else
                      begin
                        {@1471-14E7}
                        if pO108_0B84 <> 0 then
                          pO108_0BAE
                        else
                        begin
                          {@1481-14E7}
                          if pO108_0C51 <> 0 then
                            pO108_0C90
                          else
                          begin
                            {@1491-14E7}
                            if (b880C = 5) and (v332i <= 22) then
                            begin
                              {@149F-14CD}
                              if v390b <> 0 then
                              begin
                                {@14A6-14AB}
                                v328b := 84;
                                {@14AB-14B0}
                                v335b := 1;
                              end
                              else
                              begin
                                {@14B2-14CD}
                                if a0 = 'Aim:' then
                                begin
                                  {@14C3-14C8}
                                  v328b := 77;
                                  {@14C8-14CD}
                                  v335b := 1;
                                end;
                              end;
                            end
                            else
                            begin
                              {@14CF-14E7}
                              if c379.v378b > 1 then
                              begin
                                {@14D6-14DB}
                                bAAE6 := 1;
                                {@14DB-14E0}
                                v328b := 27;
                              end
                              else
                                v335b := 1;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
              end;
            end
            else
              pO108_043C;
          end;
        else
          {@14F1-14FF}
          v328b := Ord(UpCase(v328a));
          {@14FF-1508}
          v649b := pO108_0F5D;
          if v649b <> 255 then
            for v333b := 1 to v336b do
            begin
              {@1529-156C}
              if v648a[v333b] = v328b then
              begin
                {@153B-1540}
                v335b := 1;
                {@1540-1546}
                v330w := 1;
                {@1546-155C}
                while v333b <> c379.v379a[v330w].f do
                  Inc(v330w);
                {@155C-1563}
                bAAE5 := v330b;
                {@1563-156C}
                pO108_025A(bAAE5);
              end;
            end;
          {@1576-15BD}
          if (v335b = 0) and (c379.v378b > 1) then
          begin
            {@1584-15BD}
            if v328b = 52 then
              pO108_0D0F
            else
            begin
              {@1592-15BD}
              if v328b = 54 then
                pO108_0D42
              else
              begin
                {@15A0-15BD}
                if (v328b in [50, 56, 72, 80]) and (v390b <> 0) then
                  pO108_0D75;
              end;
            end;
          end;
          {@15BD-1607}
          if (a2 <> 0) and (v328b in [49..57, 92]) then
          begin
            {@15D4-15F5}
            if v328b = 92 then
              v328b := 55
            else
              v328b := a5364_ec3f[v328b - 49];
            {@15F5-15FD}
            v649b := v328b;
            {@15FD-1602}
            bAAE6 := 1;
            {@1602-1607}
            v335b := 1;
          end;
        end;
      end;
    end;
  until v335b <> 0;
  {@1611-1629}
  if v650b <> 0 then
    pO108_1009 := v649b
  else
    pO108_1009 := pO108_0F5D;
  {@1629-162E}
  pR670_0311;
  if bC5C5 <> 0 then
  begin
    {@1635-1653}
    repeat
      {@1635-164C}
      pR6DD_0072(@v385b, @v387b, @v389b);
    until v385w = 0;
    {@1653-1655}
    Exit;
  end;
  {@1655-1674}
  if bC60C <> 0 then
    repeat
      {@165C-166D}
      pR716_018D(@v385b, @v333b);
    until v385w = 0;
end;

{ 167D }
procedure pO108_167D;
begin
  {@1680-1691}
  pR47F_030B(0, 24, 0, 40);
end;

{ 1D45 }
function pO108_1D45
  (a0: S40; a1: string; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: byte; a8: byte;
   a9: pointer; a10: pointer; a11: pointer): byte;
var
  v299b: byte;
  v300b: byte;
  v302i: integer;
  v304i: integer;
  v305b: byte;
  v306b: byte;
  v562a: string;
  v563b: byte;
  v564b: byte;
  v568p: pointer;
  v570w: word;
  v572w: word;
  v573b: byte;
  v574b: byte;
  v575b: byte;
  v576b: byte;
  v577b: byte;
  v578b: byte;
  v579b: byte;
  v580b: byte;
  v581b: byte;
  v572i: integer absolute v572w;
  v570i: integer absolute v570w;
  v304w: word absolute v304i;
  v302w: word absolute v302i;
  { 1693 }
  function pO108_1693(b0: integer; b1: pointer): pointer;
  var
    w8p: pointer;
    w12p: pointer;
    w14w: word;
    w14i: integer absolute w14w;
  begin
    {@1699-169E}
    w14w := 0;
    {@169E-16AA}
    w8p := b1;
    {@16AA-16B2}
    w12p := nil;
    {@16B2-16EE}
    while (w8p <> nil) and (w14i < b0) do
    begin
      {@16C2-16D8}
      if PR41_byte(w8p)^.v <> 0 then
        w12p := w8p;
      {@16D8-16E9}
      w8p := PR42_pointer(w8p)^.v;
      {@16E9-16EC}
      Inc(w14w);
    end;
    {@16EE-170E}
    if (w12p = nil) and (PR41_byte(b1)^.v <> 0) then
    begin
      {@1700-170C}
      pO108_1693 := b1;
      {@170C-170E}
      Exit;
    end;
    {@170E-171A}
    pO108_1693 := w12p;
  end;

  { 1726 }
  procedure pO108_1726(b0: word);
  var
    w4p: pointer;
    w8l: longint;
    w9b: byte;
    _f1: array[1..1] of byte;
    w9sb: shortint absolute w9b;
  begin
    {@172C-173D}
    FillChar(bAAED, 25, 255);
    {@173D-1762}
    pR142_0217(a2, a3, a4, a5);
    {@1762-1767}
    pR6DD_0051;
    {@1767-177F}
    w4p := pO108_0000(b0, pointer(a6));
    {@177F-179A}
    w8l := LongInt(pO108_1693(b0, pointer(a6)));
    {@179A-17A4}
    w9b := a3;
    {@17A4-17AD}
    v300b := 1;
    {@17AD-1890}
    while (w4p <> nil) and (w9sb <= shortint(a5)) do
    begin
      {@17C7-17DA}
      aAAEC_ec3f[v300b] := w9b;
      if PR41_byte(w4p)^.v <> 0 then
        pR47F_0354(a2, w9b, bAB37, 0, PR0_string(w4p)^.v)
      else
        pR47F_0354(a2, w9b, bAB36, 0, PR0_string(w4p)^.v);
      {@1820-1871}
      if PR0_byte(w4p)^.v < v299b then
        pR47F_01DF(shortint(a2) + PR0_byte(w4p)^.v, w9b, 0, 0, v299b - PR0_byte(w4p)^.v, 32, 1);
      {@1871-1882}
      w4p := PR42_pointer(w4p)^.v;
      {@1882-1885}
      Inc(w9b);
      {@1885-188D}
      Inc(v300b);
    end;
    {@1890-1895}
    pR6DD_0030;
  end;

  { 189B }
  function pO108_189B(b0: S40): byte;
  var
    w43b: byte;
    w44b: byte;
  begin
    {@18B4-18B8}
    w43b := 1;
    {@18B8-18BE}
    w44b := Length(b0);
    {@18BE-18D8}
    while (w43b < w44b) and (Ord(b0[w43b]) = 32) do
      Inc(w43b);
    {@18D8-18DE}
    pO108_189B := w43b;
  end;

  { 18E7 }
  function pO108_18E7(b0: S40): byte;
  var
    w43b: byte;
    _f1: array[1..1] of byte;
  begin
    {@1900-1906}
    w43b := Length(b0);
    {@1906-191E}
    while (w43b > 1) and (Ord(b0[w43b]) = 32) do
      Dec(w43b);
    {@191E-1924}
    pO108_18E7 := w43b;
  end;

  { 192D }
  procedure pO108_192D(b0: word);
  var
    w4p: pointer;
    w5b: byte;
    w6b: byte;
  begin
    {@1934-194C}
    w4p := pO108_0000(b0, pointer(a6));
    {@194C-195B}
    w5b := pO108_189B(PR0_string(w4p)^.v);
    {@195B-1976}
    w6b := pO108_18E7(PR0_string(w4p)^.v) - w5b + 1;
    {@1976-19C5}
  pR47F_0354(shortint(a2) + w5b - 1, shortint(a3) + Integer(b0 - wAAE3), 0, bAB38, Copy(PR0_string(w4p)^.v,
        w5b, w6b));
  end;

  { 19CB }
  procedure pO108_19CB(b0: word);
  var
    w4p: pointer;
    w5b: byte;
    w6b: byte;
  begin
    {@19D2-19EA}
    w4p := pO108_0000(b0, pointer(a6));
    {@19EA-19F9}
    w5b := pO108_189B(PR0_string(w4p)^.v);
    {@19F9-1A14}
    w6b := pO108_18E7(PR0_string(w4p)^.v) - w5b + 1;
    if PR41_byte(w4p)^.v <> 0 then
    begin
      {@1A1E-1A6D}
  pR47F_0354(shortint(a2) + w5b - 1, shortint(a3) + Integer(b0 - wAAE3), bAB36, 0, Copy(PR0_string(w4p)^.v,
          w5b, w6b));
      {@1A6D-1A6F}
      Exit;
    end;
    {@1A6F-1ABE}
  pR47F_0354(shortint(a2) + w5b - 1, shortint(a3) + Integer(b0 - wAAE3), bAB36, 0, Copy(PR0_string(w4p)^.v,
        w5b, w6b));
  end;

  { 1AC4 }
  procedure pO108_1AC4(b0: byte);
  var
    w2w: word;
    w2i: integer absolute w2w;
  begin
    {@1ACA-1ACF}
    w2w := 0;
    if b0 <> 0 then
    begin
      asm
    db 139,70,254,139,126,6,54,59,133,208,254,125,118,139,126,6,54,196,125,10,38,255,53,139,126,6,54,255
    db 117,24,54,255,117,22
    push cs
    call near ptr pO108_0000
    db 9,208,116,36,139,126,6,54,196,125,10,38,255,53,139,126,6,54,255,117,24,54,255,117,22
    push cs
    call near ptr pO108_0000
    db 137,199,142,194,38,128,125,41,0,116,53,255,70,254,139,126,6,54,196,125,10,38,255,5,161,227,170,139
    db 126,6,54,3,133,208,254,72,139,126,6,54,196,125,10,38,59,5,125,13,161,227,170,139,126,6,54,196
    db 125,10,38,137,5,233,125,255
      end;
      {@1B5B-1B5E}
      Exit;
    end;
    {@1B5E-1BE2}
    while w2i < v304i do
    begin
      {@1B6B-1BAC}
      if pO108_0000(PR0_word(a10)^.v, pointer(a6)) <> nil then
        asm
    db 139,126,6,54,196,125,10,38,255,53,139,126,6,54,255,117,24,54,255,117,22
    push cs
    call near ptr pO108_0000
    db 137,199,142,194,38,128,125,41,0,116,54
        end;
      {@1BAC-1BAF}
      Inc(w2w);
      {@1BAF-1BB9}
      Dec(PR0_word(a10)^.v);
      if PR0_integer(a10)^.v < iAAE3 then
        PR0_word(a10)^.v := wAAE3 + v304w - 1;
    end;
  end;

  { 1BE8 }
  procedure pO108_1BE8(b0: byte);
  var
    w2w: word;
  begin
    {@1BEE-1BFF}
    w2w := PR0_word(a10)^.v - wAAE3;
    if b0 <> 0 then
    begin
      {@1C05-1C11}
      Inc(wAAE3, v304w);
      if (v302i - v304i) < iAAE3 then
        wAAE3 := v302w - v304w;
    end
    else
    begin
      {@1C3C-1C48}
      Dec(wAAE3, v304w);
      if iAAE3 < 0 then
        wAAE3 := 0;
    end;
    {@1C54-1C64}
    PR0_word(a10)^.v := wAAE3 + w2w;
    {@1C64-1C6F}
    pO108_1AC4(b0);
    {@1C6F-1C7A}
    pO108_1726(wAAE3);
  end;

  { 1C80 }
  procedure pO108_1C80(b0: byte);
  var
    _f1: array[1..8] of byte;
  begin
    {@1C86-1CED}
    if b0 <> 0 then
    begin
      {@1C8C-1C96}
      Inc(PR0_word(a10)^.v);
      if (iAAE3 + v304i - 1) < PR0_integer(a10)^.v then
        PR0_word(a10)^.v := wAAE3;
    end
    else
    begin
      {@1CBD-1CC7}
      Dec(PR0_word(a10)^.v);
      if PR0_integer(a10)^.v < iAAE3 then
        PR0_word(a10)^.v := wAAE3 + v304w - 1;
    end;
    {@1CED-1CF8}
    pO108_1AC4(b0);
  end;

  { 1CFE }
  procedure pO108_1CFE;
  begin
    {@1D01-1D28}
    PR0_longint(a11)^.v := LongInt(pO108_0000(PR0_word(a10)^.v, pointer(a6)));
    asm
    db 139,126,6,54,138,133,207,254,139,126,6,54,136,69,255
    end;
    {@1D37-1D3C}
    bAB06 := 127;
    {@1D3C-1D41}
    bAB07 := 128;
  end;

begin
  {@1D73-1DA0}
  if a6 = nil then
  begin
    {@1D7B-1D83}
    PR0_word(a10)^.v := 0;
    {@1D83-1D8F}
    PR0_longint(a11)^.v := 0;
    {@1D8F-1D94}
    bAB06 := 127;
    {@1D94-1D99}
    bAB07 := 128;
    {@1D99-1D9D}
    pO108_1D45 := 0;
    {@1D9D-1DA0}
    Exit;
  end;
  {@1DA0-1DA6}
  bAB06 := a2;
  {@1DA6-1DAC}
  bAB07 := a4;
  {@1DAC-1DBD}
  v299b := shortint(a4) - shortint(a2) + 1;
  {@1DBD-1DCB}
  v302w := pO108_0067(pointer(a6));
  {@1DCB-1DDC}
  v304w := shortint(a5) - shortint(a3) + 1;
  {@1DDC-1DEA}
  v568p := a6;
  {@1DEA-1DF0}
  v570w := 0;
  {@1DF0-1E1F}
  while (v568p <> nil) and (PR41_byte(v568p)^.v <> 0) do
  begin
    {@1E05-1E19}
    v568p := PR42_pointer(v568p)^.v;
    {@1E19-1E1D}
    Inc(v570w);
  end;
  {@1E1F-1E2D}
  v568p := a6;
  {@1E2D-1E33}
  v572w := 0;
  {@1E33-1E57}
  while v568p <> nil do
  begin
    {@1E3D-1E51}
    v568p := PR42_pointer(v568p)^.v;
    {@1E51-1E55}
    Inc(v572w);
  end;
  {@1E57-1E66}
  if v572i <= v304i then
    wAAE3 := 0;
  {@1E66-1E81}
  if iAAE3 > PR0_integer(a10)^.v then
  begin
    {@1E71-1E7A}
    wAAE3 := PR0_word(a10)^.v;
    {@1E7A-1E81}
    PR0_byte(a9)^.v := 1;
  end;
  {@1E81-1E96}
  if iAAE3 > v572i then
  begin
    {@1E8A-1E8F}
    wAAE3 := 0;
    {@1E8F-1E96}
    PR0_byte(a9)^.v := 1;
  end;
  {@1E96-1E9C}
  Inc(PR0_word(a10)^.v);
  {@1E9C-1EA4}
  pO108_1C80(0);
  if PR0_byte(a9)^.v <> 0 then
    pO108_1726(wAAE3);
  {@1EB6-1EBD}
  PR0_byte(a9)^.v := 0;
  {@1EBD-1EC2}
  v575b := 0;
  if a8 <> 255 then
    for v300b := 0 to 19 do
    begin
      {@1ED3-1EE8}
      if aAB0E_71c0[v300b].f <> 255 then
        Inc(v575b);
    end;
  {@1EEF-224B}
  while true do
  begin
    {@1EEF-1EF4}
    bAAE7 := 0;
    {@1EF4-1EFF}
    pO108_192D(PR0_word(a10)^.v);
    {@1EFF-1F14}
    v562a := a1;
    {@1F14-1F19}
    v563b := 0;
    {@1F19-1F1E}
    v564b := 0;
    {@1F1E-1F26}
    v576b := v575b;
    {@1F26-1F2F}
    v577b := shortint(a8) + 1;
    if (v563b = 0) and (v564b <> 0) and (bAAE5 > 1) then
      Inc(bAAE5);
    {@1F48-1FA0}
    if (v302i - v304i) > iAAE3 then
    begin
      {@1F56-1F80}
      v562a := v562a + s0C7E;
      {@1F80-1F88}
      v579b := v577b;
      {@1F88-1F97}
      pO108_00AB(v577b, @v576b);
      {@1F97-1F9B}
      Inc(v577b);
      {@1F9B-1FA0}
      v563b := 1;
    end;
    {@1FA0-1FF3}
    if iAAE3 > v570i then
    begin
      {@1FA9-1FD3}
      v562a := v562a + s0C94;
      {@1FD3-1FDB}
      v578b := v577b;
      {@1FDB-1FEA}
      pO108_00AB(v577b, @v576b);
      {@1FEA-1FEE}
      Inc(v577b);
      {@1FEE-1FF3}
      v564b := 1;
    end;
    {@1FF3-203E}
    if a7 <> 0 then
    begin
      {@1FF9-2023}
      v562a := v562a + s0C89;
      {@2023-202B}
      v580b := v577b;
      {@202B-203A}
      pO108_00AB(v577b, @v576b);
      {@203A-203E}
      Inc(v577b);
    end;
    {@203E-2057}
    v305b := pO108_1009(a0, v562a, 1, 0);
    {@2057-205F}
    v306b := v305b;
    if (bAAE6 = 0) and (v305b > (v575b - 1)) then
    begin
      {@2079-207E}
      bAAE6 := 1;
      if (v305b = v579b) and (v563b <> 0) then
        v306b := 81
      else
      begin
        {@2096-20C4}
        if (v305b = v578b) and (v564b <> 0) then
          v306b := 73
        else
        begin
          {@20AE-20C4}
          if v305b = v580b then
            v306b := 27
          else
            bAAE6 := 0;
        end;
      end;
    end;
    {@20C4-20CF}
    pO108_19CB(PR0_word(a10)^.v);
    if bAAE6 <> 0 then
      case v306b of
        72: pO108_1C80(0);
        80: pO108_1C80(1);
        73: begin
          {@20FD-210C}
          if v564b <> 0 then
            pO108_1BE8(0);
        end;
        81: begin
          {@2112-2121}
          if v563b <> 0 then
            pO108_1BE8(1);
        end;
        80: pO108_1BE8(0);
        78: pO108_1BE8(1);
        27, 69, 0: begin
          {@214B-2157}
          PR0_longint(a11)^.v := 0;
          {@2157-215B}
          pO108_1D45 := 27;
          {@215B-2160}
          bAB06 := 127;
          {@2160-2165}
          bAB07 := 128;
          {@2165-2168}
          Exit;
        end;
      end
    else
    begin
      {@216B-2248}
      if (bC5C5 <> 0) and (bAAE7 <> 0) then
      begin
        asm
  db 161,201,197,153,185,8,0,247,249,136,134,194,253
        end;
        asm
  db 161,199,197,153,185,8,0,247,249,136,134,195,253
        end;
        if (v573b >= sbAB06) and (v573b <= sbAB07) then
        begin
          {@21BF-21C4}
          v300b := 1;
          {@21C4-223F}
          while (v300b <= 25) and (aAAEC_ec3f[v300b] <> 255) do
          begin
            {@21DA-2239}
            if aAAEC_ec3f[v300b] = v574b then
            begin
              {@21EC-21FB}
              v581b := v300b - 1 + wAAE3;
              if v581b = PR0_word(a10)^.v then
              begin
                {@2209-220E}
                pO108_1CFE;
                {@220E-2210}
                Exit;
              end
              else
              begin
                {@2212-221D}
                pO108_19CB(PR0_word(a10)^.v);
                {@221D-222E}
                PR0_word(a10)^.v := v300b - 1 + wAAE3;
                {@222E-2239}
                pO108_192D(PR0_word(a10)^.v);
              end;
            end;
            {@2239-223D}
            Inc(v300b);
          end;
        end;
      end
      else
      begin
        {@2241-2246}
        pO108_1CFE;
        {@2246-2248}
        Exit;
      end;
    end;
  end;
end;

{ 2254 }
function pO108_2254(a0: S40; a1: byte): byte;
var
  v43b: byte;
  _f1: array[1..1] of byte;
begin
  {@226D-2276}
  bAAE5 := a1 + 1;
  {@2276-227D}
  pO108_00CB(1);
  {@227D-22A1}
  repeat
    {@227D-229B}
    repeat
      {@227D-2295}
      v43b := pO108_1009(a0, s2B64, 0, bC584);
    until v43b >= 0;
  until v43b < 2;
  {@22A1-22A7}
  pO108_2254 := v43b;
end;

{ 22B0 }
procedure pO108_22B0(a0: word; a1: pointer);
var
  v4p: pointer;
  v6i: integer;
begin
  {@22B6-22C9}
  GetMem(PR0_pointer(a1)^.v, 46);
  {@22C9-22D9}
  PR42_longint(PR0_pointer(a1)^.v)^.v := 0;
  {@22D9-22E4}
  PR41_byte(PR0_pointer(a1)^.v)^.v := 0;
  {@22E4-22EE}
  PR0_byte(PR0_pointer(a1)^.v)^.v := 0;
  {@22EE-22FE}
  v4p := PR0_pointer(a1)^.v;
  for v6i := 2 to a0 do
  begin
    {@2314-2328}
    GetMem(PR42_pointer(v4p)^.v, 46);
    {@2328-2339}
    v4p := PR42_pointer(v4p)^.v;
    {@2339-2346}
    PR42_pointer(v4p)^.v := nil;
    {@2346-234E}
    PR41_byte(v4p)^.v := 0;
    {@234E-2355}
    PR0_byte(v4p)^.v := 0;
  end;
end;

{ 2363 }
procedure pO108_2363(a0: pointer);
var
  v4p: pointer;
  v8p: pointer;
begin
  {@2369-2379}
  v4p := PR0_pointer(a0)^.v;
  {@2379-23AF}
  while v4p <> nil do
  begin
    {@2381-238D}
    v8p := v4p;
    {@238D-239E}
    v4p := PR42_pointer(v4p)^.v;
    {@239E-23AD}
    FreeMem(v8p, 46);
  end;
end;

{ 23B5 }
begin
end.

