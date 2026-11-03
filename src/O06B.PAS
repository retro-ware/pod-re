{ O06B: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O06B;

interface

uses GAMEDATA;

procedure pO06B_2829(a0: pointer);
procedure pO06B_04F2;

implementation

uses LIT, O06E, O075, O0AA, O0B2, O0BB, O0E2, O0EC, O108, R142, R47F, R670;

type
  AS9_3 = array[0..2] of string[2];
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E16_shortint = record f: shortint; _r: array[1..15] of byte end;
  R0_byte = record v: byte end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R171_byte = record _p: array[1..171] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R339_byte = record _p: array[1..339] of byte; v: byte end;
  R340_byte = record _p: array[1..340] of byte; v: byte end;
  R341_byte = record _p: array[1..341] of byte; v: byte end;
  R380_byte = record _p: array[1..380] of byte; v: byte end;
  R381_byte = record _p: array[1..381] of byte; v: byte end;
  R383_byte = record _p: array[1..383] of byte; v: byte end;
  R384_byte = record _p: array[1..384] of byte; v: byte end;
  R385_byte = record _p: array[1..385] of byte; v: byte end;
  R386_byte = record _p: array[1..386] of byte; v: byte end;
  R387_byte = record _p: array[1..387] of byte; v: byte end;
  R38_byte = record _p: array[1..38] of byte; v: byte end;
  R391_byte = record _p: array[1..391] of byte; v: byte end;
  R402_byte = record _p: array[1..402] of byte; v: byte end;
  R404_byte = record _p: array[1..404] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_byte = record _p: array[1..42] of byte; v: byte end;
  R42_longint = record _p: array[1..42] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R43_byte = record _p: array[1..43] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  RA178_byte = record _p: array[1..178] of byte; a: array[0..32000] of byte end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA59_byte = record _p: array[1..59] of byte; a: array[0..32000] of byte end;
  RB380_9_byte = record _p: array[1..380] of byte; a: array[0..6623, 0..8] of byte end;
  TPV_ = procedure;
W0_11_189F = record case byte of 0: (_p0: array[1..181] of byte; _w11_181byte: byte);
      1: (_p1: array[1..214] of byte; _w11_214byte: byte); 2: (_p2: array[1..215] of byte;
      _w11_215byte: byte); 3: (_p3: array[1..221] of byte; _w11_221byte: byte);
      4: (_p4: array[1..236] of byte; _w11_236byte: byte); 5: (_p5: array[1..245] of byte;
      _w11_245byte: byte); 6: (_p6: array[1..249] of byte; _w11_249byte: byte);
      7: (_p7: array[1..253] of byte; _w11_253byte: byte); 8: (_p8: array[1..267] of byte;
      _w11_267byte: byte); 9: (_p9: array[1..283] of byte; _w11_283byte: byte);
      10: (_p10: array[1..291] of byte; _w11_291byte: byte); 11: (_p11: array[1..381] of byte;
      _w11_381byte: byte); 12: (_p12: array[1..383] of byte; _w11_383byte: byte);
      13: (_p13: array[1..384] of byte; _w11_384byte: byte); 14: (_p14: array[1..385] of byte;
      _w11_385byte: byte); 15: (_p15: array[1..386] of byte; _w11_386byte: byte);
      16: (_p16: array[1..401] of byte; _w11_401byte: byte); 17: (_p17: array[1..404] of byte;
      _w11_404byte: byte) end;
W0_7_1807 = record case byte of 0: (_p0: array[1..337] of byte; _w7_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..351] of byte; _w7_351abyte: array[0..32000] of byte) end;
W4_11_189F = record case byte of 0: (_p0: array[1..181] of byte; _w11_181byte: byte);
      1: (_p1: array[1..214] of byte; _w11_214byte: byte); 2: (_p2: array[1..215] of byte;
      _w11_215byte: byte); 3: (_p3: array[1..221] of byte; _w11_221byte: byte);
      4: (_p4: array[1..236] of byte; _w11_236byte: byte); 5: (_p5: array[1..245] of byte;
      _w11_245byte: byte); 6: (_p6: array[1..249] of byte; _w11_249byte: byte);
      7: (_p7: array[1..253] of byte; _w11_253byte: byte); 8: (_p8: array[1..267] of byte;
      _w11_267byte: byte); 9: (_p9: array[1..283] of byte; _w11_283byte: byte);
      10: (_p10: array[1..291] of byte; _w11_291byte: byte); 11: (_p11: array[1..381] of byte;
      _w11_381byte: byte); 12: (_p12: array[1..383] of byte; _w11_383byte: byte);
      13: (_p13: array[1..384] of byte; _w11_384byte: byte); 14: (_p14: array[1..385] of byte;
      _w11_385byte: byte); 15: (_p15: array[1..386] of byte; _w11_386byte: byte);
      16: (_p16: array[1..401] of byte; _w11_401byte: byte); 17: (_p17: array[1..404] of byte;
      _w11_404byte: byte) end;
W6_11_189F = record case byte of 0: (_p0: array[1..181] of byte; _w11_181byte: byte);
      1: (_p1: array[1..214] of byte; _w11_214byte: byte); 2: (_p2: array[1..215] of byte;
      _w11_215byte: byte); 3: (_p3: array[1..221] of byte; _w11_221byte: byte);
      4: (_p4: array[1..236] of byte; _w11_236byte: byte); 5: (_p5: array[1..245] of byte;
      _w11_245byte: byte); 6: (_p6: array[1..249] of byte; _w11_249byte: byte);
      7: (_p7: array[1..253] of byte; _w11_253byte: byte); 8: (_p8: array[1..267] of byte;
      _w11_267byte: byte); 9: (_p9: array[1..283] of byte; _w11_283byte: byte);
      10: (_p10: array[1..291] of byte; _w11_291byte: byte); 11: (_p11: array[1..381] of byte;
      _w11_381byte: byte); 12: (_p12: array[1..383] of byte; _w11_383byte: byte);
      13: (_p13: array[1..384] of byte; _w11_384byte: byte); 14: (_p14: array[1..385] of byte;
      _w11_385byte: byte); 15: (_p15: array[1..386] of byte; _w11_386byte: byte);
      16: (_p16: array[1..401] of byte; _w11_401byte: byte); 17: (_p17: array[1..404] of byte;
      _w11_404byte: byte) end;
W8_11_189F = record case byte of 0: (_p0: array[1..181] of byte; _w11_181byte: byte);
      1: (_p1: array[1..214] of byte; _w11_214byte: byte); 2: (_p2: array[1..215] of byte;
      _w11_215byte: byte); 3: (_p3: array[1..221] of byte; _w11_221byte: byte);
      4: (_p4: array[1..236] of byte; _w11_236byte: byte); 5: (_p5: array[1..245] of byte;
      _w11_245byte: byte); 6: (_p6: array[1..249] of byte; _w11_249byte: byte);
      7: (_p7: array[1..253] of byte; _w11_253byte: byte); 8: (_p8: array[1..267] of byte;
      _w11_267byte: byte); 9: (_p9: array[1..283] of byte; _w11_283byte: byte);
      10: (_p10: array[1..291] of byte; _w11_291byte: byte); 11: (_p11: array[1..381] of byte;
      _w11_381byte: byte); 12: (_p12: array[1..383] of byte; _w11_383byte: byte);
      13: (_p13: array[1..384] of byte; _w11_384byte: byte); 14: (_p14: array[1..385] of byte;
      _w11_385byte: byte); 15: (_p15: array[1..386] of byte; _w11_386byte: byte);
      16: (_p16: array[1..401] of byte; _w11_401byte: byte); 17: (_p17: array[1..404] of byte;
      _w11_404byte: byte) end;
  X14 = array[0..13] of byte;
  PR0_byte = ^R0_byte;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR171_byte = ^R171_byte;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR178_byte = ^R178_byte;
  PR17_byte = ^R17_byte;
  PR1_byte = ^R1_byte;
  PR21_byte = ^R21_byte;
  PR25_byte = ^R25_byte;
  PR31_byte = ^R31_byte;
  PR323_pointer = ^R323_pointer;
  PR339_byte = ^R339_byte;
  PR340_byte = ^R340_byte;
  PR341_byte = ^R341_byte;
  PR380_byte = ^R380_byte;
  PR381_byte = ^R381_byte;
  PR383_byte = ^R383_byte;
  PR384_byte = ^R384_byte;
  PR385_byte = ^R385_byte;
  PR386_byte = ^R386_byte;
  PR387_byte = ^R387_byte;
  PR38_byte = ^R38_byte;
  PR391_byte = ^R391_byte;
  PR402_byte = ^R402_byte;
  PR404_byte = ^R404_byte;
  PR41_byte = ^R41_byte;
  PR423_pointer = ^R423_pointer;
  PR42_byte = ^R42_byte;
  PR42_longint = ^R42_longint;
  PR42_pointer = ^R42_pointer;
  PR43_byte = ^R43_byte;
  PR483_pointer = ^R483_pointer;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR508_byte = ^R508_byte;
  PR5_pointer = ^R5_pointer;
  PRA178_byte = ^RA178_byte;
  PRA30_byte = ^RA30_byte;
  PRA337_byte = ^RA337_byte;
  PRA59_byte = ^RA59_byte;
  PRB380_9_byte = ^RB380_9_byte;
  PW0_11_189F = ^W0_11_189F;
  PW0_7_1807 = ^W0_7_1807;
  PW4_11_189F = ^W4_11_189F;
  PW6_11_189F = ^W6_11_189F;
  PW8_11_189F = ^W8_11_189F;
var
  a4061_dfae: array[0..861] of string[37] absolute d4061;
  a651A_3981: array[0..2046] of E16_byte absolute d651A;
  a651A_d53e: array[0..2046] of E16_shortint absolute d651A;
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  bA7D5: byte absolute dA7D5;
  bA7DB: byte absolute dA7DB;
  bAAD5: byte absolute dAAD5;
  bAAD6: byte absolute dAAD6;
  bAADE: byte absolute dAADE;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0D: byte absolute dAB0D;
  bAB0E: byte absolute dAB0E;
  bAB10: byte absolute dAB10;
  bAE64: byte absolute dAE64;
  bAE65: byte absolute dAE65;
  bAE88: byte absolute dAE88;
  bAE8A: byte absolute dAE8A;
  bB16D: byte absolute dB16D;
  gAACC_bd31: string[8] absolute dAACC;
  gACD6_dfee: TPV_ absolute dACD6;
  gAE65_551d: X14 absolute dAE65;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pAD3B: pointer absolute dAD3B;
  s199F: string absolute d199F;
  s20FD: string absolute d20FD;
  s2126: string absolute d2126;
  s214F: string absolute d214F;
  s278C: string absolute d278C;
  s29A1: string absolute d29A1;
  s29CA: string absolute d29CA;
  s29F3: string absolute d29F3;
  s2B12: string absolute d2B12;
  s2EE8: string absolute d2EE8;
  s2F11: string absolute d2F11;
  s32A5: string absolute d32A5;
  s32CE: string absolute d32CE;
  s32F7: string absolute d32F7;
  s3320: string absolute d3320;
  sAAC3: string absolute dAAC3;
  wAE67: word absolute dAE67;
  wAE69: word absolute dAE69;
  wAE6B: word absolute dAE6B;
  wAE7B: word absolute dAE7B;

function pO06B_0000(a0: pointer): word; far; forward;
procedure pO06B_0165(a0: pointer); far; forward;
procedure pO06B_01A9(a0: pointer); far; forward;
procedure pO06B_0221; far; forward;
function pO06B_025F(a0: byte; a1: byte; a2: pointer): byte; far; forward;
function pO06B_03BE(a0: byte): byte; far; forward;
function pO06B_05C9: byte; far; forward;
procedure pO06B_07C0(a0: pointer); far; forward;
procedure pO06B_086A; far; forward;
procedure pO06B_0920; far; forward;
procedure pO06B_0B69; far; forward;
procedure pO06B_0EE9; far; forward;
procedure pO06B_10AC(a0: pointer); far; forward;
procedure pO06B_11CE; far; forward;
procedure pO06B_1326; far; forward;
procedure pO06B_1445; far; forward;
procedure pO06B_156E; far; forward;
procedure pO06B_15FA; far; forward;
procedure pO06B_172B; far; forward;
function pO06B_1807(a0: pointer): byte; far; forward;
procedure pO06B_26F2(a0: pointer); far; forward;

{ 0000 }
function pO06B_0000(a0: pointer): word;
var
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v10p: pointer;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  _f1: array[1..1] of byte;
begin
  {@0006-000A}
  v3b := 0;
  {@000A-000E}
  v4b := 0;
  {@000E-0012}
  v5b := 0;
  {@0012-0016}
  v6b := 0;
  for v11b := 0 to 140 do
  begin
    {@001F-006E}
    if (PRA30_byte(a0)^.a[v11b] > 127) and (PR494_byte(a0)^.v <> 0) then
    begin
      {@003B-005A}
      v12b := a651B_3981[PRA30_byte(a0)^.a[v11b] and 127].f;
      if v12b > v3b then
        v3b := v12b;
      {@0068-006E}
      Inc(v5b, v12b);
    end;
  end;
  {@0074-0087}
  v10p := PR423_pointer(a0)^.v;
  {@0087-0104}
  while v10p <> nil do
  begin
    {@008F-00F1}
    if pO0BB_6C36(v10p) <> 0 then
      for v11b := 1 to 3 do
      begin
        {@00A7-00EB}
        if PRA59_byte(v10p)^.a[v11b] > 127 then
        begin
          {@00B8-00D7}
          v12b := a651B_3981[PRA59_byte(v10p)^.a[v11b] and 127].f;
          if v12b > v4b then
            v4b := v12b;
          {@00E5-00EB}
          Inc(v6b, v12b);
        end;
      end;
    {@00F1-0102}
    v10p := PR42_pointer(v10p)^.v;
  end;
  {@0104-0108}
  v13b := 0;
  if (v5b > 0) or (v6b > 0) then
    v13b := 4;
  {@0118-0128}
  if (v3b > 2) or (v4b > 2) then
    v13b := 6;
  {@0128-0133}
  PR171_byte(a0)^.v := v13b;
  {@0133-015C}
  pO06B_0000 := v13b * 60 + v5b * 15 + v6b * 15;
end;

{ 0165 }
procedure pO06B_0165(a0: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@016B-019A}
  for v1b := 0 to 140 do
  begin
    {@0174-0194}
    if PRA30_byte(a0)^.a[v1b] > 127 then
      PRA30_byte(a0)^.a[v1b] := 0;
  end;
  {@019A-01A3}
  PR171_byte(a0)^.v := 0;
end;

{ 01A9 }
procedure pO06B_01A9(a0: pointer);
var
  v1b: byte;
  v5p: pointer;
  _f1: array[1..1] of byte;
begin
  {@01AF-01C2}
  v5p := PR423_pointer(a0)^.v;
  {@01C2-021B}
  while v5p <> nil do
  begin
    {@01CA-0208}
    if pO0BB_6C36(v5p) <> 0 then
      for v1b := 1 to 3 do
        PRA59_byte(v5p)^.a[v1b] := PRA59_byte(v5p)^.a[v1b] and 127;
    {@0208-0219}
    v5p := PR42_pointer(v5p)^.v;
  end;
end;

{ 0221 }
procedure pO06B_0221;
var
  v4p: pointer;
begin
  {@0227-0234}
  v4p := p9CF2;
  {@0234-025B}
  while v4p <> nil do
  begin
    {@023C-0246}
    pO06B_01A9(v4p);
    {@0246-0259}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 025F }
function pO06B_025F(a0: byte; a1: byte; a2: pointer): byte;
var loc: array[1..7] of byte;
begin
  asm
    db 196,62,238,156,137,126,249,140,70,251,198,70,254,0,198,70,253,0,235,3,254,70,253,138,70,253,48,228
    db 196,126,249,3,248,38,128,125,30,0,118,69,138,70,253,48,228,196,126,249,3,248,38,138,69,30,36,127
    db 48,228,139,248,177,4,211,231,138,133,27,101,58,70,12,117,36,138,70,253,48,228,196,126,249,3,248,38
    db 138,69,30,36,127,48,228,139,248,177,4,211,231,138,133,26,101,58,70,10,117,3,254,70,254,128,126,253
    db 140,117,161,138,70,254,196,126,6,38,136,5,138,70,12,48,228,139,200,138,70,10,152,186,9,0,247,226
    db 196,126,249,3,248,3,249,38,138,133,124,1,58,70,254,115,31,138,70,12,48,228,139,200,138,70,10,152
    db 186,9,0,247,226,196,126,249,3,248,3,249,38,138,133,124,1,136,70,254,138,70,254,48,228,139,216,138
    db 70,12,48,228,139,200,138,70,10,152,186,9,0,247,226,196,126,249,3,248,3,249,38,138,133,124,1,48
    db 228,43,195,136,70,255
  end;
end;

{ 03BE }
function pO06B_03BE(a0: byte): byte;
var
  v42a: string[40];
  v42a2: string[40] absolute v42a;
  v42b: byte absolute v42a;
begin
  if false then begin
    if LV = 'cannot cast spells in this area' then;
    if LV = 'is in no condition to ' then;
    if LV = 'cast any spells' then;
    if LV = 'memorize spells' then;
    if LV = 'scribe any scrolls' then;
  end;
  {@03C5-03C9}
  v42b := 0;
  if (a0 = 1) and (PR1_byte(p87F8)^.v > 0) then
    v42a := 'cannot cast spells in this area'
  else
  begin
    {@03F0-04A9}
    if (PR493_byte(p9CEE)^.v = 1) or (PR494_byte(p9CEE)^.v = 0) then
    begin
      {@040B-041E}
      v42a := 'is in no condition to ';
      case a0 of
        1: v42a := v42a2 + 'cast any spells';
        2: v42a := v42a2 + 'memorize spells';
        3: v42a := v42a2 + 'scribe any scrolls';
      end;
    end;
  end;
  {@04A9-04B5}
  if v42b = 0 then
  begin
    {@04AF-04B3}
    pO06B_03BE := 1;
    {@04B3-04B5}
    Exit;
  end;
  {@04B5-04B9}
  pO06B_03BE := 0;
  {@04B9-04D1}
  pO0EC_1B08(p9CEE, v42a2, 10, 1);
end;

{ 04F2 }
procedure pO06B_04F2;
var
  v2w: word;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v2b: byte absolute v2w;
begin
  if false then begin
    if LV = 'has no spells memorized' then;
  end;
  {@04F8-04FC}
  v4b := 0;
  {@04FC-0501}
  v2w := 65535;
  {@0501-0506}
  bAAE5 := 1;
  if pO06B_03BE(1) <> 0 then
    repeat
      {@0514-052C}
      v6b := pO0AA_30F3(0, 1, @v2b, @v3b);
      if v6b <> 0 then
      begin
        {@0532-0536}
        v4b := 1;
        {@0536-0547}
        pR142_0217(1, 17, 38, 22);
        {@0547-055B}
        pO0BB_121C(v6b, 0, 1, @v5b);
      end
      else
      begin
        {@055D-058B}
        if v3b <> 0 then
          v4b := 1
        else
          pO0EC_1B08(p9CEE, 'has no spells memorized', 10, 1);
      end;
    until v6b = 0;
  {@0591-059C}
  if v4b <> 0 then
    pO0EC_2ED1;
end;

{ 05C9 }
function pO06B_05C9: byte;
var
  v42a: string[40];
  v123a: array[1..9] of AS9_3;
  v126a: array[0..2] of byte;
  v127b: byte;
  v128b: byte;
  v129b: byte;
  v130b: byte;
  v131b: byte;
  _f1: array[1..2] of byte;
  v134b: byte;
  v127sb: shortint absolute v127b;
  v42a2: string[40] absolute v42a;
begin
  if false then begin
    if LV = ' ' then;
    if LV = '    Cleric :' then;
    if LV = '     Druid :' then;
    if LV = 'Magic-User :' then;
  end;
  {@05D0-05D5}
  bAE8A := 0;
  {@05D5-05DA}
  v131b := 0;
  for v127b := 0 to 2 do
  begin
    {@05E3-05ED}
    v126a[v127sb] := 0;
    for v128b := 1 to 9 do
    begin
      {@05F6-063D}
      v123a[v128b, v127sb] := pR47F_0FB2(pO06B_025F(v128b, v127b, @v134b));
      if PRB380_9_byte(p9CEE)^.a[v127sb, v128b] = 0 then
        v123a[v128b, v127sb] := ' '
      else
      begin
        {@068D-0697}
        v126a[v127sb] := 1;
        {@0697-069C}
        v131b := 1;
      end;
    end;
  end;
  {@06AE-07B2}
  if v131b <> 0 then
  begin
    {@06B8-06C9}
    pR142_0217(1, 17, 38, 22);
    {@06C9-06CE}
    v130b := 1;
    for v127b := 0 to 2 do
    begin
      {@06D7-07A9}
      if v126a[v127sb] <> 0 then
      begin
        {@06E6-0732}
        case v127b of
          0: v42a := '    Cleric :';
          1: v42a := '     Druid :';
          2: v42a := 'Magic-User :';
        end;
        {@0732-074F}
        pR47F_0354(1, v130b + 17, 10, 0, v42a2);
        {@074F-0754}
        v129b := 13;
        for v128b := 1 to 9 do
        begin
          {@075D-079A}
          pR47F_0354(v129b + 1, v130b + 17, 10, 0, v123a[v128b, v127sb]);
          {@079A-079F}
          Inc(v129b, 3);
        end;
        {@07A5-07A9}
        Inc(v130b);
      end;
    end;
  end;
  {@07B2-07B9}
  pO06B_05C9 := v131b;
end;

{ 07C0 }
procedure pO06B_07C0(a0: pointer);
var
  v4p: pointer;
  v6w: word;
  v8w: word;
  _f1: array[1..2] of byte;
begin
  {@07C6-07CB}
  v6w := 0;
  {@07CB-07D8}
  v4p := p9CF2;
  {@07D8-0810}
  while v4p <> nil do
  begin
    {@07E0-07ED}
    v8w := pO06B_0000(v4p);
    if v6w < v8w then
      v6w := v8w;
    {@07FB-080E}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@0810-081D}
  wAE6B := v6w div 60;
  {@081D-0835}
  wAE69 := (v6w - 60 * wAE6B) div 10;
  {@0835-0843}
  wAE67 := v6w mod 10;
  {@0843-0851}
  PR0_byte(a0)^.v := pO0B2_0B81(1);
  {@0851-085F}
  XR670_046E(@bAE65, 14);
  {@085F-0864}
  pO0EC_301C;
end;

{ 086A }
procedure pO06B_086A;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@0870-0901}
  for v1b := 0 to 139 do
    for v2b := v1b to 140 do
    begin
      {@0888-08F2}
      if (PRA30_byte(p9CEE)^.a[v1b] and 127) > (PRA30_byte(p9CEE)^.a[v2b] and 127) then
      begin
        {@08B0-08C2}
        v3b := PRA30_byte(p9CEE)^.a[v1b];
        {@08C2-08E0}
        PRA30_byte(p9CEE)^.a[v1b] := PRA30_byte(p9CEE)^.a[v2b];
        {@08E0-08F2}
        PRA30_byte(p9CEE)^.a[v2b] := v3b;
      end;
    end;
end;

{ 0920 }
procedure pO06B_0920;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v7w: word;
  v8b: byte;
  v7b: byte absolute v7w;
begin
  if false then begin
    if LV = 'cannot memorize any spells' then;
  end;
  {@0926-0AC0}
  if pO06B_03BE(2) <> 0 then
  begin
    {@0934-0938}
    v1b := 0;
    {@0938-093D}
    v7w := 65535;
    {@093D-0942}
    bAAE5 := 1;
    {@0942-095A}
    v4b := pO0AA_30F3(5, 5, @v7b, @v2b);
    {@095A-095E}
    v3b := 1;
    if v2b <> 0 then
    begin
      {@0964-097C}
      if v4b = 0 then
        pO06B_0165(p9CEE)
      else
        v1b := 1;
    end
    else
      v3b := 0;
    {@0982-0987}
    v7w := 65535;
    {@0987-0A78}
    while v1b = 0 do
    begin
      {@0990-099E}
      v1b := Ord(pO06B_05C9 = 0);
      if v1b <> 0 then
        pO0EC_1B08(p9CEE, 'cannot memorize any spells', 10, 1)
      else
      begin
        {@09C9-09E1}
        v4b := pO0AA_30F3(1, 2, @v7b, @v2b);
        {@09E1-09E5}
        v3b := 1;
        if v4b = 0 then
          v1b := 1
        else
        begin
          {@09F2-0A75}
if (pO06B_025F(a651B_3981[v4b].f, a651A_3981[v4b].f, @v8b) > 0) or (a651A_3981[v4b].f = 2)
              and (bAE8A > 0) then
          begin
            {@0A38-0A3D}
            bAE88 := 0;
            {@0A3D-0A41}
            v5b := 0;
            {@0A41-0A58}
            while PRA30_byte(p9CEE)^.a[v5b] <> 0 do
              Inc(v5b);
            {@0A58-0A71}
            PRA30_byte(p9CEE)^.a[v5b] := v4b + 128;
            {@0A71-0A75}
            pO06B_086A;
          end;
        end;
      end;
    end;
    {@0A78-0AB3}
    if v7w <> 65535 then
    begin
      {@0A7E-0A83}
      v7w := 65535;
      {@0A83-0A9B}
      v4b := pO0AA_30F3(5, 5, @v7b, @v2b);
      if (v2b <> 0) and (v4b = 0) then
        pO06B_0165(p9CEE);
    end;
    {@0AB3-0ABE}
    if v3b <> 0 then
      pO0EC_2ED1;
    {@0ABE-0AC0}
    Exit;
  end;
  {@0AC0-0AEE}
  if PR494_byte(p9CEE)^.v <> 0 then
    pO0EC_1B08(p9CEE, 'cannot memorize any spells', 10, 1);
end;

{ 0B69 }
procedure pO06B_0B69;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..1] of byte;
  v6b: byte;
  v8w: word;
  v12p: pointer;
  v13b: byte;
  v8b: byte absolute v8w;
begin
  if false then begin
    if LV = 'has no copyable scrolls' then;
    if LV = 'You already know that spell' then;
    if LV = 'You are already scribing that spell' then;
    if LV = 'You can not scribe that spell.' then;
  end;
  {@0B6F-0B7D}
  if pO06B_03BE(3) = 0 then
    Exit;
  {@0B7D-0B81}
  v1b := 0;
  {@0B81-0B86}
  v8w := 65535;
  {@0B86-0B9E}
  v4b := pO0AA_30F3(6, 0, @v8b, @v2b);
  {@0B9E-0BA2}
  v3b := 1;
  if v2b <> 0 then
  begin
    {@0BA8-0BCE}
    if Byte(pO108_2254(s29A1, b5362)) = b5363 then
      pO06B_01A9(p9CEE)
    else
      v1b := 1;
  end
  else
    v3b := 0;
  {@0BD4-0BD9}
  v8w := 65535;
  {@0BD9-0DD4}
  while v1b = 0 do
  begin
    {@0BE2-0BFA}
    v4b := pO0AA_30F3(3, 3, @v8b, @v2b);
    if v4b = 0 then
    begin
      {@0C00-0C04}
      v1b := 1;
      if v2b = 0 then
        pO0EC_1B08(p9CEE, 'has no copyable scrolls', 10, 1)
      else
        v3b := 1;
    end
    else
    begin
      {@0C35-0C39}
      v3b := 1;
      if PRA178_byte(p9CEE)^.a[v4b] <> 0 then
        pO0EC_1AAC('You already know that spell')
      else
      begin
        {@0C63-0C77}
        v12p := PR423_pointer(p9CEE)^.v;
        {@0C77-0C7B}
        v13b := 0;
        {@0C7B-0CF8}
        while (v12p <> nil) and (v13b = 0) do
        begin
          {@0C89-0CE5}
          if pO0BB_6C36(v12p) <> 0 then
            for v6b := 1 to 3 do
            begin
              {@0CA1-0CDF}
              if (PRA59_byte(v12p)^.a[v6b] > 127) and ((PRA59_byte(v12p)^.a[v6b] and 127) = v4b) then
              begin
                {@0CC7-0CDB}
                pO0EC_1AAC('You are already scribing that spell');
                {@0CDB-0CDF}
                v13b := 1;
              end;
            end;
          {@0CE5-0CF6}
          v12p := PR42_pointer(v12p)^.v;
        end;
        {@0CF8-0DD1}
        if v13b = 0 then
        begin
          {@0D01-0DD1}
          if PRB380_9_byte(p9CEE)^.a[a651A_d53e[v4b].f, a651B_3981[v4b].f] > 0 then
          begin
            {@0D3C-0D50}
            v12p := PR423_pointer(p9CEE)^.v;
            {@0D50-0DBB}
            while (v12p <> nil) and (v13b = 0) do
            begin
              {@0D5E-0D62}
              v6b := 1;
              {@0D62-0DA8}
              repeat
                {@0D62-0D99}
                if PRA59_byte(v12p)^.a[v6b] = v4b then
                begin
                  {@0D75-0D95}
                  PRA59_byte(v12p)^.a[v6b] := PRA59_byte(v12p)^.a[v6b] or 128;
                  {@0D95-0D99}
                  v13b := 1;
                end;
                {@0D99-0D9C}
                Inc(v6b);
              until (v6b > 3) or (v13b <> 0);
              {@0DA8-0DB9}
              v12p := PR42_pointer(v12p)^.v;
            end;
          end
          else
            pO0EC_1AAC('You can not scribe that spell.');
        end;
      end;
    end;
  end;
  {@0DD4-0E1D}
  if v8w <> 65535 then
  begin
    {@0DDA-0DDF}
    v8w := 65535;
    {@0DDF-0DF7}
    v4b := pO0AA_30F3(6, 0, @v8b, @v2b);
    if (v2b <> 0) and (Byte(pO108_2254(s29A1, b5362)) = b5363) then
      pO06B_01A9(p9CEE);
  end;
  {@0E1D-0E28}
  if v3b <> 0 then
    pO0EC_2ED1;
end;

{ 0EE9 }
procedure pO06B_0EE9;
var
c64: record case byte of 0: (v64a2: string[63]); 1: (v64a: string[40]); 2: (_p2: array[1..41] of byte;
      v23b: byte); 3: (_p3: array[1..42] of byte; v22b: byte); 4: (_p4: array[1..45] of byte; v19b: byte);
      5: (_p5: array[1..47] of byte; v17b: byte); 6: (_p6: array[1..48] of byte; v16p: pointer);
      7: (_p7: array[1..52] of byte; v12p: pointer); 8: (_p8: array[1..52] of byte; v12b: byte);
      9: (_p9: array[1..56] of byte; v8p: pointer); 10: (_p10: array[1..56] of byte; v8b: byte);
      11: (_p11: array[1..60] of byte; v4p: pointer) end;
  v66w: word;
  v67b: byte;
  v66b: byte absolute v66w;
  { 0E2C }
  procedure pO06B_0E2C(b0: byte; b1: S40);
  var
    _f1: array[1..1] of byte;
  begin
    {@0E45-0E5D}
    GetMem(PR42_pointer(c64.v12p)^.v, 46);
    {@0E5D-0E77}
    c64.v12p := PR42_pointer(c64.v12p)^.v;
    {@0E77-0E88}
    PR42_pointer(c64.v12p)^.v := nil;
    {@0E88-0E9F}
    PR0_string_40_(c64.v12p)^.v := b1;
    {@0E9F-0EAD}
    PR41_byte(c64.v12p)^.v := b0;
  end;

begin
  if false then begin
    if LV = ' ' then;
    if LSV = [1..2, 4..6, 8..10, 12..17, 19..21, 23..25, 28..29, 32..39, 41..42, 45..46, 49..50, 54..57, 61..63, 68..69,
      71, 74..75, 78, 89, 92..93, 98, 115, 119, 121..123, 126] then;
    if LV = ' <No Spell Effects>' then;
  end;
  {@0EF0-0EFF}
  GetMem(c64.v8p, 46);
  {@0EFF-0F0B}
  c64.v12p := c64.v8p;
  {@0F0B-0F13}
  PR41_byte(c64.v12p)^.v := 1;
  {@0F13-0F26}
  PR0_string_40_(c64.v12p)^.v := ' ';
  {@0F26-0F33}
  PR42_longint(c64.v12p)^.v := 0;
  {@0F33-0F40}
  c64.v16p := p9CF2;
  {@0F40-1046}
  while c64.v16p <> nil do
  begin
    {@0F4B-0F4F}
    c64.v19b := 0;
    {@0F4F-0F5C}
    pO06B_0E2C(1, PR0_string(c64.v16p)^.v);
    {@0F5C-0F6F}
    c64.v4p := PR323_pointer(c64.v16p)^.v;
    {@0F6F-0FFC}
    while c64.v4p <> nil do
    begin
      {@0F7A-0F7E}
      c64.v22b := 1;
      {@0F7E-0F87}
      c64.v17b := PR0_byte(c64.v4p)^.v;
if c64.v17b in [1..2, 4..6, 8..10, 12..17, 19..21, 23..25, 28..29, 32..39, 41..42, 45..46, 49..50, 54..57,
          61..63, 68..69, 71, 74..75, 78, 89, 92..93, 98, 115, 119, 121..123, 126] then
        c64.v64a := a4061_dfae[c64.v17b]
      else
        c64.v22b := 0;
      {@0FBD-0FE8}
      if c64.v22b <> 0 then
      begin
        {@0FC3-0FC6}
        Inc(c64.v19b);
        {@0FC6-0FE8}
        pO06B_0E2C(0, ' ' + c64.v64a2);
      end;
      {@0FE8-0FF9}
      c64.v4p := PR5_pointer(c64.v4p)^.v;
    end;
    {@0FFC-1019}
    if c64.v19b = 0 then
      pO06B_0E2C(0, ' <No Spell Effects>');
    {@1019-1030}
    pO06B_0E2C(1, ' ');
    {@1030-1043}
    c64.v16p := PR483_pointer(c64.v16p)^.v;
  end;
  {@1046-104A}
  c64.v23b := 1;
  {@104A-104F}
  v66w := 0;
  {@104F-1057}
  pR142_00D4(0);
  {@1057-105F}
  pO108_00CB(0);
  {@105F-1098}
  v67b := pO108_1D45(s278C, s2B12, 1, 4, 38, 22, c64.v8p, 1, 255, @c64.v23b, @v66b, @c64.v12b);
  {@1098-10A2}
  pO108_2363(@c64.v8b);
  {@10A2-10A7}
  pO0EC_2ED1;
end;

{ 10AC }
procedure pO06B_10AC(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@10B2-10B6}
  v3b := 255;
  {@10B6-10BA}
  v4b := 1;
  {@10BA-11C8}
  while (PR0_byte(a0)^.v = 0) and (v3b <> 5) and ((bAAE6 = 0) or (v3b <> 27)) do
  begin
    {@10DF-10F0}
    FillChar(bAB0E, 40, 255);
    {@10F0-10F4}
    v2b := 0;
    for v1b := 0 to 5 do
    begin
      {@10FD-1127}
      if (v1b <> 4) or (PR43_byte(p87F8)^.v < 100) or (PR42_byte(p87F8)^.v <> 1) then
        pO108_00AB(v1b, @v2b);
    end;
    {@112D-1133}
    bAAE5 := v4b;
    {@1133-1155}
    v3b := pO108_1009('', s32CE, 1, 1);
    {@1155-115B}
    v4b := bAAE5;
    if bAAE6 <> 0 then
    begin
      {@1162-1172}
      pO0EC_0987(p9CEE, 0);
      {@1172-117B}
      pO0AA_2F7B(v3b);
      {@117B-118B}
      pO0EC_0987(p9CEE, 1);
    end
    else
      case v3b of
        0: pO06B_04F2;
        1: pO06B_0920;
        2: pO06B_0B69;
        3: pO06B_0EE9;
        4: pO06B_07C0(@PR0_byte(a0)^.v);
      end;
  end;
end;

{ 11CE }
procedure pO06B_11CE;
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
begin
  {@11D4-11E1}
  v8p := p9CF2;
  {@11E1-11E9}
  v4p := nil;
  if v8p = p9CEE then
    while PR483_pointer(v8p)^.v <> nil do
      v8p := PR483_pointer(v8p)^.v
  else
    while PR483_pointer(v8p)^.v <> p9CEE do
    begin
      {@123A-1246}
      v4p := v8p;
      {@1246-1259}
      v8p := PR483_pointer(v8p)^.v;
    end;
  {@125B-126F}
  v12p := PR483_pointer(p9CEE)^.v;
  if p9CF2 = p9CEE then
  begin
    {@1282-1297}
    if v12p <> nil then
      p9CF2 := v12p;
    {@1297-12AB}
    PR483_pointer(v8p)^.v := p9CEE;
    {@12AB-12BB}
    PR483_pointer(p9CEE)^.v := nil;
    {@12BB-12BD}
    Exit;
  end;
  {@12BD-12D0}
  PR483_pointer(v8p)^.v := v12p;
  {@12D0-12E4}
  PR483_pointer(p9CEE)^.v := v8p;
  if (v8p = p9CF2) or (v4p = nil) then
  begin
    {@12FE-130C}
    p9CF2 := p9CEE;
    {@130C-130E}
    Exit;
  end;
  {@130E-1322}
  PR483_pointer(v4p)^.v := p9CEE;
end;

{ 1326 }
procedure pO06B_1326;
var
  v4p: pointer;
  v8p: pointer;
begin
  {@132C-1339}
  v4p := p9CF2;
  if v4p <> p9CEE then
    while PR483_pointer(v4p)^.v <> p9CEE do
      v4p := PR483_pointer(v4p)^.v;
  {@1379-138D}
  v8p := PR483_pointer(p9CEE)^.v;
  if v8p = nil then
  begin
    {@1395-13AA}
    PR483_pointer(p9CEE)^.v := p9CF2;
    {@13AA-13B8}
    p9CF2 := p9CEE;
    {@13B8-13CB}
    PR483_pointer(v4p)^.v := v8p;
    {@13CB-13CD}
    Exit;
  end;
  {@13CD-13E8}
  PR483_pointer(p9CEE)^.v := PR483_pointer(v8p)^.v;
  if p9CF2 = p9CEE then
    p9CF2 := v8p;
  {@1408-142D}
  if v4p <> p9CEE then
    PR483_pointer(v4p)^.v := v8p;
  {@142D-1441}
  PR483_pointer(v8p)^.v := p9CEE;
end;

{ 1445 }
procedure pO06B_1445;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
begin
  {@144B-144F}
  v1b := 0;
  {@144F-1453}
  v3b := 255;
  {@1453-1457}
  v4b := 1;
  {@1457-1565}
  while (v3b <> 2) and ((bAAE6 = 0) or (v3b <> 27)) do
  begin
    {@1470-1481}
    FillChar(bAB0E, 40, 255);
    if v1b <> 0 then
      bAB0E := 1
    else
      bAB0E := 0;
    {@1493-1498}
    bAB10 := 2;
    {@1498-149E}
    bAAE5 := v4b;
    {@149E-14B6}
    v3b := pO108_1009(s29CA, s2EE8, 1, 1);
    {@14B6-14BC}
    v4b := bAAE5;
    if bAAE6 <> 0 then
    begin
      {@14C3-151C}
      if v1b = 0 then
      begin
        {@14C9-14D9}
        pO0EC_0987(p9CEE, 0);
        {@14D9-14E2}
        pO0AA_2F7B(v3b);
        {@14E2-14F2}
        pO0EC_0987(p9CEE, 1);
      end
      else
      begin
        {@14F4-14FA}
        v2b := v3b;
        case v2b of
          72: pO06B_11CE;
          80: pO06B_1326;
        end;
        {@150F-151C}
        pO0EC_07C0(p9CEE);
      end;
    end
    else
    begin
      {@151E-1562}
      if (v3b < 2) or (bAAE6 <> 0) and (v3b = 27) then
      begin
        {@1531-153D}
        v1b := Ord(v1b = 0);
        if v1b <> 0 then
          pO0EC_1B08(p9CEE, s20FD, 10, 0)
        else
          pO0EC_1BEF;
      end;
    end;
  end;
  {@1565-156A}
  bAADE := 0;
end;

{ 156E }
procedure pO06B_156E;
var
  v1b: byte;
  v2b: byte;
begin
  {@1574-157F}
  v2b := PR38_byte(p87F8)^.v;
  {@157F-1584}
  bAB0D := 255;
  {@1584-158A}
  bAAE5 := v2b;
  {@158A-1592}
  pO108_00CB(4);
  {@1592-15AA}
  v1b := pO108_1009(s278C, s3320, 0, 1);
  if bAAE6 <> 0 then
  begin
    {@15B1-15C1}
    pO0EC_0987(p9CEE, 0);
    {@15C1-15CA}
    pO0AA_2F7B(v1b);
    {@15CA-15DA}
    pO0EC_0987(p9CEE, 1);
  end
  else
  begin
    {@15DC-15EB}
    if v1b < 5 then
      v2b := v1b + 1;
  end;
  {@15EB-15F6}
  PR38_byte(p87F8)^.v := v2b;
end;

{ 15FA }
procedure pO06B_15FA;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
begin
  {@1601-1605}
  v3b := 1;
  {@1605-1721}
  repeat
    {@1605-163F}
    pR47F_0354(1, 18, 10, 0, s2126 + pR47F_0FB2(PR17_byte(p87F8)^.v));
    {@163F-1650}
    FillChar(bAB0E, 40, 255);
    {@1650-1654}
    v1b := 0;
    if PR17_byte(p87F8)^.v > 0 then
      pO108_00AB(0, @v1b);
    {@166C-1684}
    if PR17_byte(p87F8)^.v < 9 then
      pO108_00AB(1, @v1b);
    {@1684-1691}
    pO108_00AB(2, @v1b);
    {@1691-1697}
    bAAE5 := v3b;
    {@1697-16AF}
    v2b := pO108_1009(s29F3, s2F11, 1, 1);
    {@16AF-16B5}
    v3b := bAAE5;
    if bAAE6 <> 0 then
      case v2b of
        80: begin
          {@16C3-16D6}
          if PR17_byte(p87F8)^.v > 0 then
            Dec(PR17_byte(p87F8)^.v);
        end;
        72: begin
          {@16DC-16EF}
          if PR17_byte(p87F8)^.v < 9 then
            Inc(PR17_byte(p87F8)^.v);
        end;
        27: v2b := 2;
      end
    else
      case v2b of
        0: Dec(PR17_byte(p87F8)^.v);
        1: Inc(PR17_byte(p87F8)^.v);
      end;
  until v2b = 2;
  {@1721-1726}
  pO0EC_1BEF;
end;

{ 172B }
procedure pO06B_172B;
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@1731-1735}
  v1b := 255;
  {@1735-1739}
  v3b := 1;
  {@1739-173E}
  bAAE5 := 1;
  {@173E-1803}
  while v1b <> 5 do
  begin
    {@1747-174F}
    pO108_00CB(5);
    {@174F-1771}
    v1b := pO108_1009('', s32F7, 1, 1);
    {@1771-1777}
    v3b := bAAE5;
    if bAAE6 <> 0 then
    begin
      {@177E-17B3}
      if v1b = 27 then
        v1b := 5
      else
      begin
        {@178A-179A}
        pO0EC_0987(p9CEE, 0);
        {@179A-17A3}
        pO0AA_2F7B(v1b);
        {@17A3-17B3}
        pO0EC_0987(p9CEE, 1);
      end;
    end
    else
    begin
      {@17B5-17FA}
      case v1b of
        0: pO06B_1445;
        1: begin
          {@17C6-17D6}
          if PR31_byte(p87F8)^.v > 1 then
            pO075_23CA;
        end;
        2: pO06B_15FA;
        3: begin
          {@17E6-17EB}
          pO075_3D36;
          {@17EB-17F0}
          pO0EC_2ED1;
        end;
        4: pO06B_156E;
      end;
      {@17FA-1800}
      bAAE5 := v3b;
    end;
  end;
end;

{ 1807 }
function pO06B_1807(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v3sb: shortint absolute v3b;
begin
  {@180D-1811}
  v2b := 0;
  with PW0_7_1807(a0)^ do
  begin
    for v3b := 0 to 6 do
    begin
      {@1823-186A}
      if _w7_337abyte[v3sb] < _w7_351abyte[v3sb] then
        Inc(v2b, _w7_351abyte[v3sb] - _w7_337abyte[v3sb]);
    end;
  end;
  {@1870-1876}
  pO06B_1807 := v2b;
end;

{ 26F2 }
procedure pO06B_26F2(a0: pointer);
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  v10w: word;
  _f1: array[1..1] of byte;
  v13w: word;
  v15w: word;
  v17w: word;
  v19w: word;
  v21w: word;
  v23w: word;
  v25w: word;
  v27w: word;
  v29w: word;
  v31w: word;
  v33w: word;
  v35w: word;
  v37w: word;
  v39w: word;
  v41w: word;
  _f2: array[1..13] of byte;
  _v55: byte;
  _f3: array[1..1] of byte;
  v10b: byte absolute v10w;
  v8b: byte absolute v8w;
  v6b: byte absolute v6w;
  v4b: byte absolute v4w;
  v55a: X14 absolute _v55;
  { 187F }
  function pO06B_187F(b0: pointer): byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@1885-1896}
    pO06B_187F := Ord(PR493_byte(b0)^.v = 0);
  end;

  { 189F }
  procedure pO06B_189F;
  var
    w2w: word;
    _f1: array[1..1] of byte;
    w7p: pointer;
  begin
    {@18A5-18AA}
    w2w := 0;
    {@18AA-18B7}
    w7p := p9CF2;
    {@18B7-1A3E}
    while w7p <> nil do
    begin
      {@18C2-1A28}
      if pO06B_187F(w7p) <> 0 then
      begin
        {@18D6-18FC}
        with PW8_11_189F(w7p)^ do
        begin
          if _w11_181byte <> 0 then
            Inc(w2w, _w11_381byte * 9);
          {@18FC-1919}
          if _w11_236byte <> 0 then
            Inc(w2w, _w11_384byte * 17);
          {@1919-1936}
          if _w11_249byte <> 0 then
            Inc(w2w, _w11_385byte * 27);
          {@1936-1964}
          if _w11_214byte <> 0 then
          begin
            {@1941-1953}
            Inc(w2w, _w11_386byte * 50);
            {@1953-1964}
            Inc(v27w, _w11_386byte);
          end;
          {@1964-1980}
          if _w11_245byte <> 0 then
            Inc(v31w, _w11_384byte);
          {@1980-199C}
          if _w11_253byte <> 0 then
            Inc(v15w, _w11_385byte);
          {@199C-19B8}
          if _w11_221byte <> 0 then
            Inc(v19w, _w11_383byte);
          {@19B8-19D4}
          if _w11_267byte <> 0 then
            Inc(v19w, _w11_401byte);
          {@19D4-19F0}
          if _w11_291byte <> 0 then
            Inc(v35w, _w11_404byte);
          {@19F0-1A0C}
          if _w11_215byte <> 0 then
            Inc(v23w, _w11_383byte);
          {@1A0C-1A28}
          if _w11_283byte <> 0 then
            Inc(v13w, _w11_386byte);
        end;
      end;
      {@1A28-1A3B}
      w7p := PR483_pointer(w7p)^.v;
    end;
    {@1A3E-1A48}
    Inc(v2w, w2w);
  end;

  { 1A4E }
  procedure pO06B_1A4E;
  var
    w2w: word;
    w3b: byte;
  begin
    {@1A54-1A59}
    w2w := 0;
    for w3b := 1 to v4b do
      Inc(w2w, pO0E2_1374(1, 8));
    {@1A8A-1ABC}
    for w3b := 1 to v6b do
      Inc(w2w, pO0E2_1374(2, 8) + 1);
    {@1ABC-1AF0}
    for w3b := 1 to v8b do
      Inc(w2w, pO0E2_1374(3, 8) + 3);
    {@1AF0-1B24}
    for w3b := 1 to v10b do
      Inc(w2w, pO0E2_1374(4, 8) + 3);
    {@1B24-1B2E}
    Inc(v2w, w2w);
  end;

  { 1B34 }
  function pO06B_1B34: word;
  var
    w4w: word;
    w8p: pointer;
  begin
    {@1B3A-1B3F}
    w4w := 0;
    {@1B3F-1B4C}
    w8p := p9CF2;
    {@1B4C-1B84}
    while w8p <> nil do
    begin
      {@1B54-1B6F}
      Inc(w4w, PR178_byte(w8p)^.v - PR508_byte(w8p)^.v);
      {@1B6F-1B82}
      w8p := PR483_pointer(w8p)^.v;
    end;
    {@1B84-1B8A}
    pO06B_1B34 := w4w;
  end;

  { 1B93 }
  procedure pO06B_1B93;
  var
    w4p: pointer;
    w6w: word;
    w8w: word;
    w10w: word;
    w12w: word;
    w14w: word;
    w16w: word;
    w18w: word;
    w20w: word;
    w22w: word;
  begin
    {@1B99-1BA6}
    w4p := p9CF2;
    {@1BA6-1BAB}
    w8w := 0;
    {@1BAB-1BB0}
    w10w := 0;
    {@1BB0-1BB5}
    w12w := 0;
    {@1BB5-1BBA}
    w14w := 0;
    {@1BBA-1BBF}
    w16w := 0;
    {@1BBF-1BC8}
    v4w := 0;
    {@1BC8-1BD1}
    v6w := 0;
    {@1BD1-1BDA}
    v8w := 0;
    {@1BDA-1BE3}
    v10w := 0;
    {@1BE3-1BE8}
    w6w := 0;
    {@1BE8-1CF8}
    while w4p <> nil do
    begin
      {@1BF3-1BF8}
      w18w := 0;
      if (pO06B_187F(w4p) <> 0) and (PR21_byte(w4p)^.v > 3) then
      begin
        {@1C19-1C26}
        w20w := PR381_byte(w4p)^.v;
        {@1C26-1C30}
        Inc(v4w, w20w);
        {@1C30-1C39}
        w8w := 15 * w20w;
        {@1C39-1C46}
        w20w := PR391_byte(w4p)^.v;
        {@1C46-1C50}
        Inc(v4w, w20w);
        {@1C50-1C59}
        w10w := 30 * w20w;
        {@1C59-1C6A}
        Inc(v6w, PR384_byte(w4p)^.v);
        {@1C6A-1C7C}
        w12w := PR384_byte(w4p)^.v * 60;
        {@1C7C-1C8D}
        Inc(v8w, PR385_byte(w4p)^.v);
        {@1C8D-1C9F}
        w14w := PR385_byte(w4p)^.v * 75;
        {@1C9F-1CB0}
        Inc(v10w, PR386_byte(w4p)^.v);
        {@1CB0-1CC2}
        w16w := PR386_byte(w4p)^.v * 90;
      end;
      {@1CC2-1CD4}
      Inc(w18w, w8w + w10w + w12w + w14w + w16w);
      if w6w < w18w then
        w6w := w18w;
      {@1CE2-1CF5}
      w4p := PR483_pointer(w4p)^.v;
    end;
    {@1CF8-1D2A}
    if pO06B_1B34 < v2w then
    begin
      {@1D08-1D1F}
      w22w := v2w div pO06B_1B34;
      {@1D1F-1D2A}
      w6w := w6w div w22w;
    end;
    {@1D2A-1D37}
    wAE6B := w6w div 60;
    {@1D37-1D4F}
    wAE69 := (w6w - 60 * wAE6B) div 10;
    {@1D4F-1D5D}
    wAE67 := w6w mod 10;
  end;

  { 1D63 }
  procedure pO06B_1D63;
  var
    w4p: pointer;
    w6w: word;
    _f1: array[1..2] of byte;
  begin
    {@1D69-1D76}
    w4p := p9CF2;
    {@1D76-1E44}
    while w4p <> nil do
    begin
      {@1D81-1E2E}
      if pO06B_187F(w4p) <> 0 then
      begin
        {@1D95-1DA6}
        Inc(v39w, PR387_byte(w4p)^.v);
        {@1DA6-1DB7}
        Inc(v13w, PR387_byte(w4p)^.v);
        {@1DB7-1DC8}
        Inc(v27w, PR386_byte(w4p)^.v);
        {@1DC8-1DD9}
        Inc(v35w, PR404_byte(w4p)^.v);
        {@1DD9-1DEA}
        Inc(v15w, PR385_byte(w4p)^.v);
        {@1DEA-1DFB}
        Inc(v31w, PR384_byte(w4p)^.v);
        {@1DFB-1E0C}
        Inc(v19w, PR402_byte(w4p)^.v);
        {@1E0C-1E1D}
        Inc(v19w, PR383_byte(w4p)^.v);
        {@1E1D-1E2E}
        Inc(v23w, PR383_byte(w4p)^.v);
      end;
      {@1E2E-1E41}
      w4p := PR483_pointer(w4p)^.v;
    end;
    {@1E44-1E49}
    w6w := 0;
    {@1E49-1E67}
    w6w := pO0AA_3C48(v39w, v41w) * 105 + w6w;
    {@1E67-1E85}
    w6w := pO0AA_3C48(v13w, v17w) * 105 + w6w;
    {@1E85-1EA3}
    w6w := pO0AA_3C48(v27w, v29w) * 90 + w6w;
    {@1EA3-1EC1}
    w6w := pO0AA_3C48(v35w, v37w) * 90 + w6w;
    if v13w = 0 then
    begin
      {@1ECB-1EE9}
      w6w := pO0AA_3C48(v15w, v17w) * 75 + w6w;
      {@1EE9-1EF2}
      v15w := 0;
    end;
    {@1EF2-1F10}
    w6w := pO0AA_3C48(v31w, v33w) * 60 + w6w;
    {@1F10-1F2E}
    w6w := pO0AA_3C48(v23w, v25w) * 45 + w6w;
    {@1F2E-1F4C}
    w6w := pO0AA_3C48(v19w, v21w) * 45 + w6w;
    {@1F4C-1F59}
    wAE6B := w6w div 60;
    {@1F59-1F71}
    wAE69 := (w6w - 60 * wAE6B) div 10;
    {@1F71-1F7F}
    wAE67 := w6w mod 10;
  end;

  { 1F85 }
  procedure pO06B_1F85;
  var
    w4p: pointer;
    w6w: word;
    w6b: byte absolute w6w;
  begin
    {@1F8B-1F98}
    w4p := p9CF2;
    {@1F98-2039}
    while w4p <> nil do
    begin
      {@1FA3-2023}
      if PR178_byte(w4p)^.v > PR508_byte(w4p)^.v then
      begin
        {@1FB5-1FD0}
        w6w := PR178_byte(w4p)^.v - PR508_byte(w4p)^.v;
        if w6w > v2w then
          w6w := v2w;
        {@1FE6-1FF1}
        if w6w < 1 then
          w6w := 0;
        {@1FF1-2023}
        if (w6w > 0) and (pO0E2_212C(w4p, w6b, 0) <> 0) and (w6w <= v2w) then
          Dec(v2w, w6w);
      end;
      {@2023-2036}
      w4p := PR483_pointer(w4p)^.v;
    end;
  end;

  { 20C8 }
  procedure pO06B_20C8;
  var
    w4p: pointer;
    _f1: array[1..3] of byte;
    w8b: byte;
    _f2: array[1..1] of byte;
    w10b: byte;
    w11b: byte;
    w12b: byte;
    w13b: byte;
    w13sb: shortint absolute w13b;
  begin
    if false then begin
      if LV = 'is healed' then;
      if LV = 'is changed back to flesh' then;
      if LV = 'is detoxified' then;
      if LV = 'has been ressurected' then;
      if LV = 'has been raised from the dead' then;
      if LV = 'is relieved of a curse' then;
      if LV = 'regains sight' then;
    end;
    {@20CE-20DB}
    w4p := p9CF2;
    {@20DB-25B7}
    while w4p <> nil do
    begin
      {@20E6-20EA}
      w10b := 0;
      {@20EA-2121}
      while (pO06B_1807(w4p) > 0) and (v39w > 0) do
      begin
        {@2102-210F}
        pAD3B := w4p;
        {@210F-2114}
        bA7D5 := 102;
        {@2114-2118}
        gACD6_dfee;
        {@2118-211F}
        Dec(v39w);
      end;
      {@2121-21CE}
      if (v27w > 0) and (pO0EC_27C1(w4p, 68, @w8b) <> 0) then
      begin
        {@2148-215C}
        pO0E2_0104(w4p, 68, nil);
        if pO0EC_27C1(w4p, 33, @w8b) <> 0 then
          pO0E2_0104(w4p, 33, nil);
        {@2187-218B}
        w10b := 1;
        {@218B-21AB}
        pO0EC_1B08(w4p, 'is healed', 10, 1);
        {@21AB-21B2}
        Dec(v27w);
        {@21B2-21C0}
        pO0E2_186E(w4p, 1);
        {@21C0-21CE}
        pO0E2_186E(w4p, 2);
      end;
      {@21CE-2225}
      if (v35w > 0) and (PR493_byte(w4p)^.v = 7) then
      begin
        {@21E3-21EC}
        PR493_byte(w4p)^.v := 0;
        {@21EC-21F5}
        PR494_byte(w4p)^.v := 1;
        {@21F5-21FE}
        PR508_byte(w4p)^.v := 1;
        {@21FE-221E}
        pO0EC_1B08(w4p, 'is changed back to flesh', 10, 1);
        {@221E-2225}
        Dec(v35w);
      end;
      {@2225-22DF}
      if (v31w > 0) and (pO0EC_27C1(w4p, 55, @w8b) <> 0) then
      begin
        {@224C-2260}
        if PR508_byte(w4p)^.v = 0 then
          PR508_byte(w4p)^.v := 1;
        {@2260-2265}
        bA7DB := 1;
        {@2265-2279}
        pO0E2_0104(w4p, 55, nil);
        {@2279-228D}
        pO0E2_0104(w4p, 22, nil);
        {@228D-22A1}
        pO0E2_0104(w4p, 15, nil);
        {@22A1-22A6}
        bA7DB := 0;
        {@22A6-22AF}
        PR494_byte(w4p)^.v := 1;
        {@22AF-22B8}
        PR493_byte(w4p)^.v := 0;
        {@22B8-22D8}
        pO0EC_1B08(w4p, 'is detoxified', 10, 1);
        {@22D8-22DF}
        Dec(v31w);
      end;
      {@22DF-24E8}
      if ((v13w > 0) or (v15w > 0)) and (PR493_byte(w4p)^.v = 6) and (PR173_byte(w4p)^.v <> 0) then
      begin
        {@2312-2317}
        bA7DB := 1;
        {@2317-232B}
        pO0E2_0104(w4p, 55, nil);
        {@232B-2330}
        bA7DB := 0;
        {@2330-2339}
        PR508_byte(w4p)^.v := 1;
        {@2339-2342}
        PR493_byte(w4p)^.v := 0;
        {@2342-234B}
        PR494_byte(w4p)^.v := 1;
        if v13w > 0 then
        begin
          {@2355-235E}
          v15w := 0;
          {@235E-237E}
          pO0EC_1B08(w4p, 'has been ressurected', 10, 1);
          {@237E-2385}
          Dec(v13w);
        end
        else
        begin
          {@2388-23A3}
          if (PR25_byte(w4p)^.v > 0) and (v15w > 0) then
            Dec(PR25_byte(w4p)^.v);
          {@23A3-23D6}
          if PR178_byte(w4p)^.v > PR380_byte(w4p)^.v then
            w11b := PR178_byte(w4p)^.v - PR380_byte(w4p)^.v
          else
            w11b := 0;
          {@23D6-23DA}
          w12b := 0;
          if PR25_byte(w4p)^.v >= 14 then
          begin
            {@23E7-2473}
            for w13b := 0 to 6 do
            begin
              {@23F0-246A}
              if PRA337_byte(w4p)^.a[w13sb] > 0 then
              begin
                {@2401-246A}
                if (w13b = 2) or (w13b = 3) or (w13b = 4) then
                  Inc(w12b, (PR25_byte(w4p)^.v - 14) * PRA337_byte(w4p)^.a[w13sb])
                else
                begin
                  {@2438-246A}
                  if PR25_byte(w4p)^.v > 15 then
                    Inc(w12b, PRA337_byte(w4p)^.a[w13sb] * 2)
                  else
                    Inc(w12b, PRA337_byte(w4p)^.a[w13sb]);
                end;
              end;
            end;
            {@2473-248B}
            if w12b > 0 then
              w11b := Byte(w11b div w12b);
            {@248B-24C1}
  if (PR25_byte(w4p)^.v < 17) or (PR339_byte(w4p)^.v > 0) or (PR341_byte(w4p)^.v > 0)
                or (PR340_byte(w4p)^.v > 0) then
              Dec(PR178_byte(w4p)^.v, w11b);
          end;
          {@24C1-24E1}
          pO0EC_1B08(w4p, 'has been raised from the dead', 10, 1);
          {@24E1-24E8}
          Dec(v15w);
        end;
      end;
      {@24E8-2542}
      if (v19w > 0) and (pO0EC_27C1(w4p, 36, @w8b) <> 0) then
      begin
        {@2509-2516}
        pAD3B := w4p;
        {@2516-251B}
        pO0BB_3336;
        {@251B-253B}
        pO0EC_1B08(w4p, 'is relieved of a curse', 10, 1);
        {@253B-2542}
        Dec(v19w);
      end;
      {@2542-25A1}
      if (w10b = 0) and (v23w > 0) and (pO0EC_27C1(w4p, 33, @w8b) <> 0) then
      begin
        {@2569-257F}
        pO0E2_0104(p9CEE, 33, nil);
        {@257F-25A1}
        pO0EC_1B08(p9CEE, 'regains sight', 10, 1);
      end;
      {@25A1-25B4}
      w4p := PR483_pointer(w4p)^.v;
    end;
  end;

  { 25BD }
  procedure pO06B_25BD;
  var
    w4p: pointer;
    _f1: array[1..3] of byte;
    w8b: byte;
  begin
    {@25C3-25CC}
    v41w := 0;
    {@25CC-25D5}
    v17w := 0;
    {@25D5-25DE}
    v21w := 0;
    {@25DE-25E7}
    v25w := 0;
    {@25E7-25F0}
    v29w := 0;
    {@25F0-25F9}
    v33w := 0;
    {@25F9-2602}
    v37w := 0;
    {@2602-260F}
    w4p := p9CF2;
    {@260F-26EC}
    while w4p <> nil do
    begin
      {@261A-262D}
      Inc(v41w, pO06B_1807(w4p));
      if (PR493_byte(w4p)^.v = 6) and (PR173_shortint(w4p)^.v > 0) then
        Inc(v17w);
      {@264A-265C}
      if PR493_byte(w4p)^.v = 7 then
        Inc(v37w);
      {@265C-267A}
      if pO0EC_27C1(w4p, 36, @w8b) <> 0 then
        Inc(v21w);
      {@267A-2698}
      if pO0EC_27C1(w4p, 55, @w8b) <> 0 then
        Inc(v33w);
      {@2698-26D6}
      if pO0EC_27C1(w4p, 68, @w8b) <> 0 then
        Inc(v29w)
      else
      begin
        {@26B8-26D6}
        if pO0EC_27C1(w4p, 33, @w8b) <> 0 then
          Inc(v25w);
      end;
      {@26D6-26E9}
      w4p := PR483_pointer(w4p)^.v;
    end;
  end;

begin
  {@26F8-2706}
  if PR1_byte(p87F8)^.v <> 0 then
    Exit;
  {@2706-270B}
  v15w := 0;
  {@270B-2710}
  v19w := 0;
  {@2710-2715}
  v23w := 0;
  {@2715-271A}
  v27w := 0;
  {@271A-271F}
  v31w := 0;
  {@271F-2724}
  v35w := 0;
  {@2724-2729}
  v13w := 0;
  {@2729-272E}
  v39w := 0;
  {@272E-2735}
  PR0_byte(a0)^.v := 0;
  {@2735-273A}
  v2w := 0;
  {@273A-2746}
  if pO06B_1B34 = 0 then
    Exit;
  {@2746-274B}
  pO06B_189F;
  {@274B-275E}
  v55a := gAE65_551d;
  {@275E-2763}
  pO06B_1B93;
  {@2763-2768}
  bAE64 := 1;
  {@2768-2776}
  PR0_byte(a0)^.v := pO0B2_0B81(0);
  {@2776-277B}
  bAE64 := 0;
  {@277B-2787}
  if PR0_byte(a0)^.v <> 0 then
    Exit;
  {@2787-278C}
  pO06B_1A4E;
  {@278C-2791}
  pO06B_20C8;
  {@2791-2796}
  pO06B_1F85;
  {@2796-27A3}
  pO0EC_07C0(p9CEE);
  {@27A3-27A8}
  pO0EC_301C;
  {@27A8-27BB}
  gAE65_551d := v55a;
  {@27BB-27CE}
  v55a := gAE65_551d;
  {@27CE-27D3}
  pO06B_25BD;
  {@27D3-27D8}
  pO06B_1D63;
  {@27D8-27DD}
  bAE64 := 1;
  {@27DD-27EB}
  PR0_byte(a0)^.v := pO0B2_0B81(0);
  {@27EB-27F0}
  bAE64 := 0;
  if PR0_byte(a0)^.v = 0 then
  begin
    {@27F9-27FE}
    pO06B_20C8;
    {@27FE-280B}
    pO0EC_07C0(p9CEE);
    {@280B-2810}
    pO0EC_301C;
    {@2810-2823}
    gAE65_551d := v55a;
  end;
end;

{ 2829 }
procedure pO06B_2829(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..1] of byte;
begin
  {@282F-2835}
  v1b := b880C;
  {@2835-283A}
  b880C := 2;
  {@283A-283F}
  wAE7B := 0;
  {@283F-284D}
  XR670_046E(@bAE65, 14);
  {@284D-2860}
  gAACC_bd31 := sAAC3;
  {@2860-2866}
  bAAD6 := bAAD5;
  {@2866-286B}
  pO0EC_2ED1;
  {@286B-287C}
  pR142_0217(1, 17, 38, 22);
  {@287C-2892}
  pR47F_0354(1, 18, 10, 0, s214F);
  {@2892-2896}
  pO06B_0221;
  {@2896-289D}
  PR0_byte(a0)^.v := 0;
  {@289D-28A1}
  v2b := 255;
  {@28A1-28A5}
  v5b := 1;
  {@28A5-29ED}
  while (PR0_byte(a0)^.v = 0) and (v2b <> 6) do
  begin
    {@28BA-28CB}
    FillChar(bAB0E, 40, 255);
    {@28CB-28CF}
    v4b := 0;
    for bB16D := 0 to 6 do
    begin
      {@28DA-290C}
      if (bB16D <> 3) and (bB16D <> 5) or (PR43_byte(p87F8)^.v < 100) or (PR42_byte(p87F8)^.v <> 1) then
        pO108_00AB(bB16D, @v4b);
    end;
    {@2913-2919}
    bAAE5 := v5b;
    {@2919-2931}
    v2b := pO108_1009(s278C, s32A5, 1, 1);
    {@2931-2937}
    v5b := bAAE5;
    if bAAE6 <> 0 then
    begin
      {@293E-2973}
      if v2b = 27 then
        v2b := 6
      else
      begin
        {@294A-295A}
        pO0EC_0987(p9CEE, 0);
        {@295A-2963}
        pO0AA_2F7B(v2b);
        {@2963-2973}
        pO0EC_0987(p9CEE, 1);
      end;
    end
    else
      case v2b of
        0: begin
          {@297C-2987}
          pO06E_2989(0, 0);
          if Byte(pO108_2254(s199F, b5363)) = b5362 then
            pR670_0000(0);
        end;
        1: pO0AA_0C9D(@v3b);
        2: pO06B_10AC(@PR0_byte(a0)^.v);
        3: pO06B_07C0(@PR0_byte(a0)^.v);
        4: pO06B_172B;
        5: pO06B_26F2(@PR0_byte(a0)^.v);
      end;
  end;
  {@29ED-29F1}
  pO06B_0221;
  {@29F1-29F7}
  b880C := v1b;
  {@29F7-29FC}
  pO0EC_301C;
  {@29FC-2A01}
  pO0EC_1BEF;
  {@2A01-2A06}
  pO108_167D;
end;

{ 2A0C }
begin
end.

