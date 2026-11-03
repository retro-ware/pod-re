{ O0A1: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0A1;

interface

uses GAMEDATA;

procedure pO0A1_0000(a0: pointer);
procedure pO0A1_076D(a0: pointer; a1: byte);
procedure pO0A1_0979(a0: pointer; a1: byte);
function pO0A1_0DAA(a0: pointer): byte;
procedure pO0A1_0E67(a0: pointer);
function pO0A1_0FAE(a0: pointer; a1: pointer; a2: byte): byte;
procedure pO0A1_10D8(a0: pointer);
function pO0A1_1329(a0: pointer; a1: pointer; a2: pointer): byte;
procedure pO0A1_182A(a0: longint; a1: pointer);
procedure pO0A1_18B9(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: pointer);
procedure pO0A1_1F46(a0: byte; a1: word; a2: pointer);
procedure pO0A1_24CD(a0: byte; a1: byte; a2: pointer);
function pO0A1_2A57(a0: pointer; a1: pointer): byte;
procedure pO0A1_3713(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte; a5: pointer; a6: pointer);
procedure pO0A1_2939;
function pO0A1_29D4(a0: pointer): byte;
function pO0A1_3B4F(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte): byte;
function pO0A1_3D7E: byte;
function pO0A1_41EF(a0: pointer; a1: byte): byte;
procedure pO0A1_4943;
procedure pO0A1_4C33(a0: pointer; a1: word; a2: word; a3: word);

implementation

uses LIT, Crt, O0AA, O0BB, O0E2, O0EC, O102, O108, O130, O135, R142, R47F, R5A0, R670;

type
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R0_pointer = record v: pointer end;
  R0_shortint = record v: shortint end;
  R14_byte = record _p: array[1..14] of byte; v: byte end;
  R15_byte = record _p: array[1..15] of byte; v: byte end;
  R16_byte = record _p: array[1..16] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R305_byte = record _p: array[1..305] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R314_byte = record _p: array[1..314] of byte; v: byte end;
  R314_shortint = record _p: array[1..314] of byte; v: shortint end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R360_byte = record _p: array[1..360] of byte; v: byte end;
  R361_byte = record _p: array[1..361] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R420_byte = record _p: array[1..420] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R427_pointer = record _p: array[1..427] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R435_longint = record _p: array[1..435] of byte; v: longint end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R491_byte = record _p: array[1..491] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R496_byte = record _p: array[1..496] of byte; v: byte end;
  R4_byte = record _p: array[1..4] of byte; v: byte end;
  R500_byte = record _p: array[1..500] of byte; v: byte end;
  R501_byte = record _p: array[1..501] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R53_byte = record _p: array[1..53] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_byte = record _p: array[1..5] of byte; v: byte end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R6_byte = record _p: array[1..6] of byte; v: byte end;
  R7_byte = record _p: array[1..7] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  R9_longint = record _p: array[1..9] of byte; v: longint end;
  R9_pointer = record _p: array[1..9] of byte; v: pointer end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA501_byte = record _p: array[1..501] of byte; a: array[0..32000] of byte end;
  RA503_byte = record _p: array[1..503] of byte; a: array[0..32000] of byte end;
  RA505_shortint = record _p: array[1..505] of byte; a: array[0..32000] of shortint end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
W13_7_0000 = record case byte of 0: (_w7_0byte: byte); 1: (_p1: array[1..1] of byte; _w7_1byte: byte);
      2: (_p2: array[1..2] of byte; _w7_2byte: byte); 3: (_p3: array[1..3] of byte; _w7_3byte: byte);
      4: (_p4: array[1..3] of byte; _w7_3shortint: shortint); 5: (_p5: array[1..4] of byte; _w7_4byte: byte);
      6: (_p6: array[1..7] of byte; _w7_7byte: byte) end;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR0_pointer = ^R0_pointer;
  PR0_shortint = ^R0_shortint;
  PR14_byte = ^R14_byte;
  PR15_byte = ^R15_byte;
  PR16_byte = ^R16_byte;
  PR173_shortint = ^R173_shortint;
  PR178_byte = ^R178_byte;
  PR17_byte = ^R17_byte;
  PR19_byte = ^R19_byte;
  PR1_byte = ^R1_byte;
  PR27_byte = ^R27_byte;
  PR2_shortint = ^R2_shortint;
  PR305_byte = ^R305_byte;
  PR312_byte = ^R312_byte;
  PR314_byte = ^R314_byte;
  PR314_shortint = ^R314_shortint;
  PR327_byte = ^R327_byte;
  PR360_byte = ^R360_byte;
  PR361_byte = ^R361_byte;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR420_byte = ^R420_byte;
  PR421_byte = ^R421_byte;
  PR427_pointer = ^R427_pointer;
  PR42_pointer = ^R42_pointer;
  PR435_longint = ^R435_longint;
  PR46_byte = ^R46_byte;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR491_byte = ^R491_byte;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR496_byte = ^R496_byte;
  PR4_byte = ^R4_byte;
  PR500_byte = ^R500_byte;
  PR501_byte = ^R501_byte;
  PR508_byte = ^R508_byte;
  PR52_byte = ^R52_byte;
  PR53_byte = ^R53_byte;
  PR57_byte = ^R57_byte;
  PR5_byte = ^R5_byte;
  PR61_byte = ^R61_byte;
  PR6_byte = ^R6_byte;
  PR7_byte = ^R7_byte;
  PR8_byte = ^R8_byte;
  PR9_longint = ^R9_longint;
  PR9_pointer = ^R9_pointer;
  PRA30_byte = ^RA30_byte;
  PRA501_byte = ^RA501_byte;
  PRA503_byte = ^RA503_byte;
  PRA505_shortint = ^RA505_shortint;
  PRB7_50_byte = ^RB7_50_byte;
  PW13_7_0000 = ^W13_7_0000;
var
  a09FB_dd99: array[0..2977, 0..10] of byte absolute d09FB;
  a3EAC_ec3f: array[0..32759] of byte absolute d3EAC;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ec3f: array[0..32759] of byte absolute d3EB5;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  a6520_3981: array[0..2046] of E16_byte absolute d6520;
  a6524_3981: array[0..2046] of E16_byte absolute d6524;
  a6525_3981: array[0..2046] of E16_byte absolute d6525;
  a6526_3981: array[0..2046] of E16_byte absolute d6526;
  a6528_3981: array[0..2046] of E16_byte absolute d6528;
  a94DB_3981: array[0..2046] of E16_byte absolute d94DB;
  a9EF1_2a50: array[0..8189] of E4_byte absolute d9EF1;
  a9EF2_2a50: array[0..8189] of E4_byte absolute d9EF2;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aAE8E_ec3f: array[0..32759] of byte absolute dAE8E;
  aAEED_9f8b: array[0..8189] of pointer absolute dAEED;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b9D93: byte absolute d9D93;
  bA7D2: byte absolute dA7D2;
  bA7D3: byte absolute dA7D3;
  bA7DA: byte absolute dA7DA;
  bA7E8: byte absolute dA7E8;
  bAD3A: byte absolute dAD3A;
  bAE5B: byte absolute dAE5B;
  bAE5C: byte absolute dAE5C;
  bAE8C: byte absolute dAE8C;
  bAE8D: byte absolute dAE8D;
  bAED7: byte absolute dAED7;
  bAED9: byte absolute dAED9;
  bAEDB: byte absolute dAEDB;
  bAEE7: byte absolute dAEE7;
  bAEEF: byte absolute dAEEF;
  bAEF0: byte absolute dAEF0;
  bB011: byte absolute dB011;
  iA7D8: integer absolute dA7D8;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CFA: pointer absolute d9CFA;
  pA6E0: pointer absolute dA6E0;
  pA7CA: pointer absolute dA7CA;
  s21A1: string absolute d21A1;
  w3DFE: word absolute d3DFE;
  wA7D8: word absolute dA7D8;

procedure pO0A1_019C(a0: pointer; a1: longint; a2: byte); far; forward;
procedure pO0A1_0321(a0: word; a1: word; a2: pointer; a3: byte; a4: word; a5: word; a6: byte); far; forward;
procedure pO0A1_067F(a0: pointer); far; forward;
function pO0A1_0F85(a0: byte): byte; far; forward;
procedure pO0A1_1403(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: longint); far; forward;
procedure pO0A1_1C3E(a0: pointer; a1: word; a2: word; a3: pointer); far; forward;
function pO0A1_1E3E(a0: byte; a1: byte; a2: byte; a3: pointer): byte; far; forward;
function pO0A1_2720(a0: pointer; a1: pointer): byte; far; forward;
procedure pO0A1_27FA(a0: word; a1: word; a2: longint; a3: pointer); far; forward;
function pO0A1_2ABB
  (a0: longint; a1: word; a2: word; a3: word; a4: word; a5: word; a6: word; a7: word; a8: word;
   a9: word): byte; far; forward;
procedure pO0A1_2CA5(a0: word; a1: word; a2: longint; a3: byte; a4: pointer; a5: pointer); far; forward;
procedure pO0A1_2DE8
  (a0: longint; a1: longint; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: pointer;
   a8: pointer; a9: byte; a10: byte); far; forward;
function pO0A1_3E58(a0: pointer; a1: byte; a2: byte): byte; far; forward;
function pO0A1_4334(a0: byte; a1: pointer): byte; far; forward;

{ 0000 }
procedure pO0A1_0000(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
begin
  {@0006-0079}
  with PW13_7_0000(PR487_pointer(a0)^.v)^ do
  begin
    _w7_0byte := 0;
    pO135_0D94(longint(a0), 8, @v2b, @v2b, @v3b);
    _w7_1byte := 0;
    for v1b := 0 to 140 do
    begin
      {@0049-0073}
      if (PRA30_byte(a0)^.a[v1b] > 0) and (PRA30_byte(a0)^.a[v1b] < 128) then
        _w7_1byte := 1;
    end;
    {@0079-009D}
    _w7_1byte := Ord((_w7_1byte <> 0) and (Ord(v3b = 0) <> 0));
    {@009D-00AD}
    _w7_2byte := Ord(v3b = 0);
    {@00AD-00B5}
    _w7_7byte := 0;
    {@00B5-00BD}
    _w7_4byte := 2;
    {@00BD-00C7}
    pO0A1_0E67(pointer(a0));
    {@00C7-00D2}
    bA7D3 := PR361_byte(a0)^.v;
    {@00D2-00D7}
    bA7E8 := 0;
    {@00D7-00E4}
    pO0E2_04DD(18, @PV4_0_byte(a0).v);
    {@00E4-00F4}
    PR501_byte(a0)^.v := pO0A1_0F85(bA7D3);
    if PR494_byte(a0)^.v <> 0 then
    begin
      {@00FF-0123}
      _w7_3byte := pO0E2_1374(1, 6) + pO0EC_1560(pointer(a0));
      if _w7_3shortint < 1 then
        _w7_3byte := 1;
      asm
  db 196,126,6,38,138,133,239,1,152,64,139,208,196,62,248,135,38,138,69,45,48,228,35,194,8,192,116,8
  db 196,126,249,38,128,109,3,6
      end;
      {@0159-0175}
      if (_w7_3shortint < 0) or (_w7_3shortint > 20) then
        _w7_3byte := 0;
    end
    else
      _w7_3byte := 0;
  end;
  {@017F-0196}
  PR5_byte(PR487_pointer(a0)^.v)^.v := pO0EC_12E6(pointer(a0));
end;

{ 019C }
procedure pO0A1_019C(a0: pointer; a1: longint; a2: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@01A2-01E5}
wA7D8 := LongInt(PRA505_shortint(a0)^.a[a2]) + LongInt(pO0E2_13BF(PRA501_byte(a0)^.a[a2],
      PRA503_byte(a0)^.a[a2]));
  if iA7D8 < 0 then
    wA7D8 := 0;
  {@01F1-01FE}
  pO0E2_04DD(4, @PV4_0_byte(a0).v);
  {@01FE-020B}
  pO0E2_04DD(5, @PV4_0_byte(a1).v);
  if pO0A1_2720(pointer(a0), pointer(pointer(a1))) <> 0 then
  begin
    {@021F-0239}
    v1b := (pO102_1276(pointer(a0), 6) - 1) shr 1 shr 1 + 2;
    if v1b > 5 then
      v1b := 5;
    {@0243-024F}
    wA7D8 := v1b * wA7D8;
  end;
  {@024F-0254}
  bA7D2 := 0;
end;

{ 0321 }
procedure pO0A1_0321(a0: word; a1: word; a2: pointer; a3: byte; a4: word; a5: word; a6: byte);
var
c82: record case byte of 0: (v82a2: string[81]); 1: (v82a: string[80]); 2: (v82b: byte);
      3: (_p3: array[1..81] of byte; v1b: byte) end;
  v83b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = '-Backstabs-' then;
    if LV = 'slays helpless' then;
    if LV = 'Attacks' then;
    if LV = '(from behind) ' then;
    if LV = 'with one cruel blow' then;
    if LV = 'Hitting for ' then;
    if LV = ' point ' then;
    if LV = ' points ' then;
    if LV = 'of damage' then;
    if LV = 'and Misses' then;
    if LV = 'lost a spell' then;
    if LV = 'goes down' then;
    if LV = 'and is Dying' then;
    if LSV = [6..8] then;
    if LV = 'is killed' then;
    LM3_7(FS, 'Hitting for ', 'with one cruel blow', [LB], [LB], [LB], [LB], [LB], [LB],
    [LB]);
  end;
  {@0328-0370}
  case a3 of
    2: c82.v82a := '-Backstabs-';
    3: c82.v82a := 'slays helpless';
  else
    {@035D-0370}
    c82.v82a := 'Attacks';
  end;
  asm
  db 255,118,20,255,118,18,141,126,174,22,87,176,10,80,176,0,80
  call pO0EC_1B08
  end;
  {@0386-038A}
  c82.v1b := 12;
  {@038A-039F}
  pO0EC_1C22(pointer(a2), 23, c82.v1b, 0);
  {@039F-03A2}
  Inc(c82.v1b);
  if a3 = 1 then
    c82.v82a := '(from behind) '
  else
    c82.v82b := 0;
  {@03C1-04DA}
  if a6 <> 0 then
  begin
    asm
  db 128,126,12,3,117,22,191,140,2,14,87,141,126,174,22,87,184,80,0,80,154,137,10,37,8,233,188,0
  db 141,190,173,254,22,87,141,126,174,22,87,154,111,10,37,8,191,160,2,14,87,154,252,10,37,8,141,190
  db 173,253,22,87,138,70,8,80
  call pO0EC_142F
  db 154,252,10,37,8,141,126,174,22,87,184,80,0,80,154,137,10,37,8,131,126,8,1,117,42,141,190,173
  db 254,22,87,141,126,174,22,87,154,111,10,37,8,191,173,2,14,87,154,252,10,37,8,141,126,174,22,87
  db 184,80,0,80,154,137,10,37,8,235,40,141,190,173,254,22,87,141,126,174,22,87,154,111,10,37,8,191
  db 181,2,14,87,154,252,10,37,8,141,126,174,22,87,184,80,0,80,154,137,10,37,8,141,190,173,254,22
  db 87,141,126,174,22,87,154,111,10,37,8,191,190,2,14,87,154,252,10,37,8,141,126,174,22,87,184,80
  db 0,80,154,137,10,37,8
    end;
    {@04A2-04B0}
    pO0EC_2851(pointer(a2), a4);
  end
  else
    c82.v82a := c82.v82a2 + 'and Misses';
  {@04DA-050B}
  if PR493_byte(a2)^.v <> 8 then
    pR47F_0498(23, c82.v1b, 38, c82.v1b + 3, 10, 0, 1, c82.v82a2);
  {@050B-0514}
  c82.v1b := b9D93 + 1;
  if a4 > 0 then
  begin
    {@051A-0527}
    PR1_byte(PR487_pointer(a2)^.v)^.v := 0;
    if PR0_byte(PR487_pointer(a2)^.v)^.v > 0 then
    begin
      {@0535-053A}
      pR47F_0D1A;
      {@053A-055A}
      pO0EC_1B08(pointer(a2), 'lost a spell', 12, 1);
      {@055A-0571}
      pO0EC_186D(pointer(a2), PR0_byte(PR487_pointer(a2)^.v)^.v);
      {@0571-057F}
      v83b := pO0EC_2CF6(pointer(a2));
    end
    else
      pR47F_0D1A;
  end
  else
    pR47F_0D1A;
  {@058D-0674}
  if PR494_byte(a2)^.v = 0 then
  begin
    {@059B-05BC}
    pO0EC_1B08(pointer(a2), 'goes down', c82.v1b, 0);
    if (PR421_byte(a2)^.v and 8) = 0 then
    begin
      {@05CA-05CE}
      Inc(c82.v1b, 2);
      if PR493_byte(a2)^.v = 5 then
        pR47F_0354(23, c82.v1b, 10, 0, 'and is Dying');
      {@05FA-0630}
      if PR493_byte(a2)^.v in [6..8] then
        pO0EC_1B08(pointer(a2), 'is killed', c82.v1b, 0);
      {@0630-0634}
      Inc(c82.v1b, 2);
    end;
    {@0634-063F}
    pO0E2_15A0(pointer(a2));
    {@063F-064C}
    pO0E2_04DD(13, @PV4_0_byte(a2).v);
    if (PR494_byte(a2)^.v = 0) and (PR493_byte(a2)^.v <> 10) then
      pO135_0F14(pointer(a2))
    else
      pR47F_0D1A;
  end;
  {@0674-0679}
  pO0EC_1BEF;
end;

{ 067F }
procedure pO0A1_067F(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  _f1: array[1..1] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for _fb := _fb to _fb do ;
  end;
  {@0685-0699}
  v1b := pO0EC_2A6F(pointer(a0), 1, 0);
  for v2b := 1 to v1b do
  begin
    {@06B1-075C}
    if PR494_byte(a0)^.v <> 0 then
    begin
      {@06BF-06E0}
      v6p := aA583_9f8b[aAE8E_ec3f[v2b]];
      if (PR6_byte(PR487_pointer(v6p)^.v)^.v <> 0) and (pO0EC_0E7A(v6p) = 0) then
        asm
  db 255,118,8,255,118,6
  call pO135_0CA2
  db 80,255,118,8,255,118,6
  call pO135_0CCA
  db 80,176,2,80,176,8,80
  call pO135_0A4D
  db 196,126,250,38,196,189,231,1,38,198,69,6,0,255,118,252,255,118,250,255,118,8,255,118,6
  push cs
  call near ptr pO0A1_182A
  db 255,118,252,255,118,250,255,118,8,255,118,6,176,0,80,49,192,49,210,82,80,141,126,249,22,87
  push cs
  call near ptr pO0A1_18B9
        end;
    end;
  end;
end;

{ 076D }
procedure pO0A1_076D(a0: pointer; a1: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  _f1: array[1..2] of byte;
  v6sb: shortint absolute v6b;
  v5sb: shortint absolute v5b;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
begin
  {@0773-0781}
  v2b := pO135_0D1A(longint(a0));
  {@0781-0793}
  v5b := a9EF1_2a50[v2b].f;
  {@0793-07A5}
  v6b := a9EF2_2a50[v2b].f;
  {@07A5-07BC}
  v3b := v5sb + a3EAC_ff2a[a1];
  {@07BC-07D3}
  v4b := v6sb + a3EB5_ff2a[a1];
  if Odd(a1) then
    v1b := a3EBA_2a50[PRB7_50_byte(pA6E0)^.a[v4sb, v3sb]].f * 3
  else
    v1b := a3EBA_2a50[PRB7_50_byte(pA6E0)^.a[v4sb, v3sb]].f * 2;
  {@083C-086B}
  if v1b > PR5_byte(PR487_pointer(a0)^.v)^.v then
    PR5_byte(PR487_pointer(a0)^.v)^.v := 0
  else
    Dec(PR5_byte(PR487_pointer(a0)^.v)^.v, v1b);
  {@086B-086F}
  v1b := 1;
  if PR496_byte(a0)^.v <> 0 then
  begin
    {@087A-087E}
    v1b := 3;
    if (pO135_07D4(v3sb - PR2_shortint(pA6E0)^.v, v4sb - PR3_shortint(pA6E0)^.v) = 0) and (bAEF0 <> 0) then
      pO135_0A4D(v5b, v6b, 2, 8);
  end;
  {@08C5-08DB}
  if bAEF0 <> 0 then
    pO135_067C(0, 0, v2b);
  {@08DB-08ED}
  a9EF1_2a50[v2b].f := v3b;
  {@08ED-08FF}
  a9EF2_2a50[v2b].f := v4b;
  {@08FF-0904}
  pO135_04F4;
  if bAEF0 <> 0 then
    pO135_0A4D(v3b, v4b, v1b, 8);
  {@091F-092C}
  PR14_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@092C-0939}
  PR17_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@0939-0942}
  pR5A0_0000(w3DFE);
  {@0942-094C}
  pO0A1_067F(pointer(a0));
  if (PR494_byte(a0)^.v = 0) or (pO0EC_0E7A(pointer(a0)) <> 0) then
    PR5_byte(PR487_pointer(a0)^.v)^.v := 0;
end;

{ 0979 }
procedure pO0A1_0979(a0: pointer; a1: byte);
var
  v13a: array[0..12] of byte;
  _f1: array[1..3] of byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  _f2: array[1..1] of byte;
  v21b: byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  _f3: array[1..2] of byte;
  v27b: byte;
  v31p: pointer;
  _f4: array[1..4] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for a1 := a1 to a1 do for _fw := _fw to _fw do ;
  end;
  {@097F-098D}
  v19b := pO135_0D1A(longint(a0));
  {@098D-09A1}
  v21b := pO0EC_2A6F(pointer(a0), 1, 0);
  {@09A1-09AA}
  if v21b = 0 then
    Exit;
  asm
  db 141,126,244,22,87,184,12,0,80
  call XR670_046E
  db 198,70,232,1,138,70,235,136,70,220,176,1,58,70,220,118,3,233,158,0,136,70,233,235,3,254,70,233
  db 138,70,233,48,228,139,248,138,133,142,174,48,228,139,248,209,231,209,231,255,181,133,165,255,181,131,165
  call pO0EC_0E7A
  db 8,192,117,103,138,70,233,48,228,139,248,138,133,142,174,48,228,139,248,209,231,209,231,196,189,131,165,38
  db 196,189,231,1,38,128,125,15,0,117,68,138,70,233,48,228,139,248,138,133,142,174,48,228,139,248,209,231
  db 209,231,255,181,133,165,255,181,131,165,176,27,80,141,126,240,22,87
  call pO0EC_27C1
  db 8,192,117,24,138,70,233,48,228,139,248,138,149,142,174,138,70,232,48,228,139,248,136,83,243,254,70,232
  db 138,70,233,58,70,220,116,3,233,103,255
  end;
  {@0A6A-0A73}
  v21b := v24b - 1;
  {@0A73-0A8D}
  Inc(a9EF1_2a50[v19b].f, a3EAC_ec3f[a1]);
  {@0A8D-0AA7}
  Inc(a9EF2_2a50[v19b].f, a3EB5_ec3f[a1]);
  {@0AA7-0ABB}
  v22b := pO0EC_2A6F(pointer(a0), 1, 0);
  {@0ABB-0AD5}
  Dec(a9EF1_2a50[v19b].f, a3EAC_ec3f[a1]);
  {@0AD5-0AEF}
  Dec(a9EF2_2a50[v19b].f, a3EB5_ec3f[a1]);
  for v24b := 1 to v21b do
  begin
    {@0B04-0B08}
    v17b := 0;
    for v23b := 1 to v22b do
    begin
      {@0B1D-0B3A}
      if aAE8E_ec3f[v23b] = v13a[v24b] then
        v17b := 1;
    end;
    {@0B42-0B53}
    if v17b <> 0 then
      v13a[v24b] := 0;
  end;
  {@0B5B-0D89}
  for v24b := 1 to v21b do
  begin
    {@0B73-0D7E}
    if (v13a[v24b] > 0) and (PR494_byte(a0)^.v <> 0) then
    begin
      {@0B91-0B96}
      bAEEF := 1;
      {@0B96-0B9B}
      bAEF0 := 1;
      {@0B9B-0B9F}
      v18b := 0;
      {@0B9F-0BBF}
      v31p := aA583_9f8b[v13a[v24b]];
      if (pO0A1_0FAE(v31p, pointer(a0), 0) <> 0) and ((pO0EC_3280(v31p) = 0) or (pO0EC_32C3(v31p) <> 0)) then
        for v27b := PR8_byte(PR487_pointer(v31p)^.v)^.v + 6 to PR8_byte(PR487_pointer(v31p)^.v)^.v + 10 do
        begin
          {@0C2F-0D73}
          if v18b = 0 then
            asm
  db 196,126,225,38,196,189,231,1,38,128,125,3,0,127,88,196,126,225,38,196,189,231,1,38,128,125,14,0
  db 116,73,255,118,227,255,118,225
  call pO135_0CA2
  db 80,255,118,227,255,118,225
  call pO135_0CCA
  db 80,255,118,10,255,118,8
  call pO135_0CA2
  db 80,255,118,10,255,118,8
  call pO135_0CCA
  db 80,138,70,229,48,228,153,185,8,0,247,241,146,80
  call pO130_0549
  db 8,192,117,3,233,212,0,198,70,230,1,196,126,225,38,128,189,104,1,0,117,4,198,70,230,2,198,70
  db 231,1,235,3,254,70,231,138,70,231,48,228,196,126,225,3,248,38,128,189,243,1,0,118,6,138,70,231
  db 136,70,230,128,126,231,2,117,223,138,70,230,48,228,196,126,225,3,248,38,128,189,243,1,0,117,16,138
  db 70,230,48,228,196,126,225,3,248,38,198,133,243,1,1,138,70,230,196,126,225,38,196,189,231,1,38,136
  db 69,4,196,126,225,38,196,189,231,1,38,139,69,9,38,139,85,11,137,70,221,137,86,223,255,118,227,255
  db 118,225,255,118,10,255,118,8,176,1,80,49,192,49,210,82,80,191,219,174,30,87
  push cs
  call near ptr pO0A1_18B9
  db 198,70,238,1,139,70,221,139,86,223,196,126,225,38,196,189,231,1,38,137,69,9,38,137,85,11,196,126
  db 8,38,128,189,238,1,0,116,16,198,6,239,174,1,255,118,10,255,118,8
  call pO0EC_0C95
            end;
        end;
    end;
  end;
end;

{ 0DAA }
function pO0A1_0DAA(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
begin
  if false then begin
    if LV = 'Got Away' then;
    if LV = 'Escape is blocked' then;
  end;
  {@0DB0-0DB4}
  v2b := 0;
  if pO0EC_2A6F(pointer(a0), 255, 0) = 0 then
    v2b := 1
  else
  begin
    {@0DCF-0DE1}
    v4b := pO0EC_12E6(pointer(a0)) shr 1;
    {@0DE1-0DEE}
    v3b := pO0A1_29D4(pointer(a0));
    if v3b < v4b then
      v2b := 1
    else
    begin
      {@0DFC-0E17}
      if (v3b = v4b) and (pO0E2_1374(1, 2) = 1) then
        v2b := 1;
    end;
  end;
  {@0E17-0E50}
  if v2b <> 0 then
    pO0E2_149C(pointer(a0), 3, 'Got Away')
  else
    pO0EC_1AAC('Escape is blocked');
  {@0E50-0E5E}
  pO0A1_0DAA := pO0EC_2CF6(pointer(a0));
end;

{ 0E67 }
procedure pO0A1_0E67(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v9p: pointer;
  _f1: array[1..1] of byte;
  v9b: byte absolute v9p;
begin
  {@0E6D-0E71}
  v5b := 0;
  {@0E71-0E7C}
  v2b := PR500_byte(a0)^.v;
  {@0E7C-0E8C}
  PR500_byte(a0)^.v := PR360_byte(a0)^.v;
  if (pO0EC_3280(pointer(a0)) <> 0) and (pO0EC_330E(pointer(a0), @v9b) <> 0) then
  begin
    {@0EAF-0EB3}
    v5b := 1;
    {@0EB3-0ECE}
    v4b := a94DB_3981[PR46_byte(PR427_pointer(a0)^.v)^.v].f;
    if v4b < 2 then
      v4b := 2;
    {@0ED8-0EDE}
    bA7D3 := v4b;
  end
  else
    bA7D3 := PR500_byte(a0)^.v;
  {@0EEB-0EF0}
  bA7E8 := 0;
  {@0EF0-0EFD}
  pO0E2_04DD(18, @PV4_0_byte(a0).v);
  {@0EFD-0F08}
  v1b := pO0A1_0F85(bA7D3);
  if (v5b <> 0) and (v9p <> nil) then
  begin
    {@0F16-0F1A}
    v3b := 1;
    if (v9p <> nil) and (PR57_byte(v9p)^.v > v3b) then
      v3b := PR57_byte(v9p)^.v;
    {@0F38-0F50}
    if (v3b < v1b) and (PR57_byte(v9p)^.v > 0) then
      v1b := v3b;
  end;
  {@0F50-0F74}
  if (PR7_byte(PR487_pointer(a0)^.v)^.v = 0) or (v1b < v2b) then
  begin
    {@0F67-0F72}
    PR500_byte(a0)^.v := v1b;
    {@0F72-0F74}
    Exit;
  end;
  {@0F74-0F7F}
  PR500_byte(a0)^.v := v2b;
end;

{ 0F85 }
function pO0A1_0F85(a0: byte): byte;
var
  v2b: byte;
begin
  {@0F8B-0F91}
  v2b := a0;
  if Odd(bAE8D) then
    Inc(v2b);
  {@0F9B-0FA5}
  pO0A1_0F85 := v2b shr 1;
end;

{ 0FAE }
function pO0A1_0FAE(a0: pointer; a1: pointer; a2: byte): byte;
var
  v5p: pointer;
  v9p: pointer;
  _f1: array[1..1] of byte;
begin
  {@0FB4-0FB8}
  pO0A1_0FAE := 0;
  {@0FB8-0FC3}
  if a1 = nil then
    Exit;
  {@0FC3-0FDA}
  if a0 = a1 then
  begin
    {@0FD3-0FD7}
    pO0A1_0FAE := 1;
    {@0FD7-0FDA}
    Exit;
  end;
  {@0FDA-0FDF}
  bA7DA := 0;
  {@0FDF-0FEC}
  v5p := p9CEE;
  {@0FEC-0FF9}
  p9CEE := a0;
  {@0FF9-1006}
  pO0E2_04DD(1, @PV4_0_byte(a1).v);
  {@1006-1013}
  p9CEE := v5p;
  if (bA7DA = 0) and ((PR495_byte(a1)^.v <> PR495_byte(a0)^.v) or (a2 <> 0)) then
  begin
    {@1032-1048}
    v9p := PR9_pointer(PR487_pointer(a0)^.v)^.v;
    {@1048-105E}
    PR9_pointer(PR487_pointer(a0)^.v)^.v := a1;
    {@105E-106B}
    pO0E2_04DD(0, @PV4_0_byte(a0).v);
    {@106B-1081}
    PR9_pointer(PR487_pointer(a0)^.v)^.v := v9p;
  end
  else
    bA7DA := 1;
  {@1088-1095}
  pO0A1_0FAE := Ord(bA7DA = 0);
end;

{ 10D8 }
procedure pO0A1_10D8(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v10p: pointer;
  v11b: byte;
  v12b: byte;
  v11sb: shortint absolute v11b;
  v10l: longint absolute v10p;
  v10b: byte absolute v10p;
  v4sb: shortint absolute v4b;
begin
  if false then begin
    if LV = 'turns undead...' then;
    if LV = 'is turned' then;
    if LV = 'Is destroyed' then;
    if LV = 'Nothing Happens...' then;
  end;
  {@10DE-10FE}
  pO0EC_1B08(pointer(a0), 'turns undead...', 10, 0);
  {@10FE-1103}
  pO108_167D;
  {@1103-1108}
  pR47F_0D1A;
  {@1108-110C}
  v5b := 0;
  {@110C-1110}
  v6b := 0;
  {@1110-111C}
  Inc(PR16_byte(PR487_pointer(a0)^.v)^.v);
  {@111C-1120}
  v12b := 13;
  {@1120-1124}
  v3b := 6;
  {@1124-1132}
  v1b := pO0E2_1374(1, 20);
  {@1132-1143}
  v11b := pO102_1276(pointer(a0), 0);
  if v11sb < (pO102_1276(pointer(a0), 3) - 2) then
    v11b := pO102_1276(pointer(a0), 3) - 2;
  {@1174-118A}
  if v11sb > 8 then
  begin
    {@117A-118A}
    if v11sb < 14 then
      v11b := 9
    else
      v11b := 10;
  end;
  {@118A-11AF}
  if PR14_byte(p87F8)^.v > v11sb then
    v11b := 0
  else
    Dec(v11b, PR14_byte(p87F8)^.v);
  {@11AF-11B3}
  v2b := 255;
  {@11B3-12F1}
  while (pO0A1_1329(pointer(a0), @v10b, @v12b) <> 0) and (v2b > 0) do
  begin
    {@11D7-11F6}
    v4b := a09FB_dd99[PR314_shortint(v10p)^.v, v11sb];
    if v2b = 255 then
    begin
      {@11FC-1225}
      if v4sb < 0 then
        v2b := pO0E2_1374(1, 6) + 6
      else
        v2b := pO0E2_1374(1, 12);
    end;
    {@1225-12EE}
    if v1b >= Abs(v4sb) then
    begin
      {@123C-1240}
      v5b := 1;
      {@1240-1251}
      pO135_141F(v10l, 3, 0);
      {@1251-1256}
      bAEEF := 1;
      {@1256-1261}
      pO0EC_0C95(v10p);
      if v4sb > 0 then
        pO0E2_149C(v10p, 3, 'is turned')
      else
      begin
        {@1286-12A6}
        pO0EC_1B08(v10p, 'Is destroyed', 10, 0);
        {@12A6-12B1}
        pO135_0F14(v10p);
        {@12B1-12BA}
        PR493_byte(v10p)^.v := 8;
        {@12BA-12C3}
        PR494_byte(v10p)^.v := 0;
      end;
      {@12C3-12CC}
      if v3b > 0 then
        Dec(v3b);
      {@12CC-12CF}
      Dec(v2b);
      if (v2b = 0) and (v3b > 0) and (v4sb < 0) then
        Inc(v2b);
      {@12E4-12E9}
      pO0EC_1BEF;
    end
    else
      Dec(v12b);
  end;
  {@12F1-130B}
  if v5b = 0 then
    pO0EC_1AAC('Nothing Happens...');
  {@130B-1310}
  pO0EC_2A17;
  {@1310-131E}
  bAEDB := pO0EC_2CF6(pointer(a0));
  {@131E-1323}
  pO0EC_1BEF;
end;

{ 1329 }
function pO0A1_1329(a0: pointer; a1: pointer; a2: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v8p: pointer;
  v4sb: shortint absolute v4b;
begin
  {@132F-1333}
  v4b := 0;
  {@1333-133F}
  PR0_pointer(a1)^.v := nil;
  {@133F-1353}
  v2b := pO0EC_2A6F(pointer(a0), 255, 0);
  {@1353-1357}
  pO0A1_1329 := 0;
  for v3b := 1 to v2b do
  begin
    {@136F-1390}
    v8p := aA583_9f8b[aAE8E_ec3f[v3b]];
if (PR15_byte(PR487_pointer(v8p)^.v)^.v = 0) and (PR314_shortint(v8p)^.v > 0)
        and (PR314_shortint(v8p)^.v > v4sb) and (PR314_shortint(v8p)^.v <= PR0_shortint(a2)^.v) then
    begin
      {@13C7-13D2}
      v4b := PR314_byte(v8p)^.v;
      {@13D2-13E2}
      PR0_pointer(a1)^.v := v8p;
      {@13E2-13E6}
      pO0A1_1329 := 1;
    end;
  end;
  {@13F1-13FA}
  PR0_byte(a2)^.v := v4b;
end;

{ 1403 }
procedure pO0A1_1403(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: longint);
var
  _f1: array[1..24] of byte;
begin
  asm
  db 138,70,14,136,70,237,196,126,10,38,198,5,0,198,6,223,167,0,198,6,224,167,0,198,6,215,174,0
  db 198,6,216,174,0,198,70,239,0,198,70,238,0,49,192,163,216,167,196,126,20,38,196,189,231,1,38,198
  db 69,7,1,255,118,18,255,118,16
  call pO0EC_0E7A
  db 8,192,117,3,233,153,0,255,54,248,61
  call pR5A0_0000
  db 196,126,20,38,196,189,231,1,38,138,69,4,48,228,196,126,20,3,248,38,128,189,243,1,0,117,14,196
  db 126,20,38,196,189,231,1,38,254,77,4,235,215,196,126,20,38,196,189,231,1,38,138,69,4,48,228,139
  db 248,254,133,214,174,255,118,22,255,118,20,255,118,18,255,118,16,176,3,80,196,126,16,38,138,133,252,1
  db 48,228,5,5,0,80,184,1,0,80,176,1,80
  push cs
  call near ptr pO0A1_0321
  db 255,118,22,255,118,20
  call pO0E2_1568
  db 196,126,20,38,198,133,244,1,0,196,126,20,38,198,133,245,1,0,198,70,239,1,196,126,10,38,198,5
  db 1,233,9,3,196,126,20,38,139,133,171,1,38,11,133,173,1,116,120,196,126,16,38,128,189,49,1,128
  db 119,14,196,126,16,38,138,133,49,1,36,7,60,1,118,95,196,126,20,38,196,189,171,1,38,138,69,46
  db 48,228,139,248,177,4,211,231,129,199,214,148,30,87,141,126,240,22,87,184,16,0,80,154,163,9,37,8
  db 138,70,242,196,126,20,38,136,133,246,1,138,70,243,196,126,20,38,136,133,248,1,138,70,244,152,139,200
  db 138,70,251,152,139,208,196,126,20,38,138,133,250,1,152,43,194,3,193,196,126,20,38,136,133,250,1,255
  db 118,18,255,118,16
  call pO0EC_0EBF
  db 176,11,80,141,126,16,22,87
  call pO0E2_04DD
  db 198,70,232,0,255,118,22,255,118,20,255,118,18,255,118,16
  push cs
  call near ptr pO0A1_2720
  db 8,192,116,18,196,126,16,38,138,133,243,1,48,228,45,4,0,136,70,236,235,92,196,126,16,38,196,189
  db 231,1,38,128,125,14,1,118,50,255,118,22,255,118,20,255,118,18,255,118,16
  call pO0EC_36C5
  db 196,126,16,38,196,189,231,1,38,58,69,8,117,19,196,126,16,38,196,189,231,1,38,128,125,17,4,118
  db 4,198,70,237,1,128,126,237,0,116,4,198,70,232,1,138,70,232,152,196,126,16,3,248,38,138,133,242
  db 1,136,70,236,255,118,22,255,118,20,255,118,18,255,118,16,141,126,236,22,87
  push cs
  call near ptr pO0A1_1C3E
  db 198,70,233,0,128,126,237,0,116,4,198,70,233,1,255,118,22,255,118,20,255,118,18,255,118,16
  push cs
  call near ptr pO0A1_2720
  db 8,192,116,4,198,70,233,2,196,126,20,38,196,189,231,1,38,138,69,4,136,70,234,138,70,234,60,1
  db 115,3,233,45,1,136,70,235,235,3,254,78,235,138,70,235,48,228,196,126,20,3,248,38,128,189,243,1
  db 0,119,3,233,7,1,128,126,238,0,116,3,233,254,0,138,70,235,48,228,196,126,20,3,248,38,254,141
  db 243,1,138,70,235,196,126,20,38,196,189,231,1,38,136,69,4,138,70,235,48,228,139,248,254,133,214,174
  db 255,118,22,255,118,20,255,118,18,255,118,16,138,70,236,80
  call pO0E2_11C2
  db 8,192,117,18,255,118,18,255,118,16
  call pO0EC_0E7A
  db 8,192,117,3,233,167,0,138,70,235,48,228,139,248,254,133,222,167,255,54,248,61
  call pR5A0_0000
  db 198,70,239,1,255,118,22,255,118,20,255,118,18,255,118,16,138,70,235,80
  push cs
  call near ptr pO0A1_019C
  db 196,126,16,38,128,189,238,1,0,116,31,255,118,22,255,118,20,255,118,18,255,118,16,138,70,233,80,255
  db 54,216,167,255,54,216,167,176,1,80
  push cs
  call near ptr pO0A1_0321
  db 196,126,16,38,128,189,238,1,0,116,24,131,62,216,167,0,126,17,138,70,235,48,228,64,80,141,126,20
  db 22,87
  call pO0E2_04DD
  db 196,126,16,38,128,189,238,1,0,117,4,198,70,238,1,196,126,20,38,128,189,238,1,0,117,20,198,70
  db 234,0,138,70,235,48,228,196,126,20,3,248,38,198,133,243,1,0,233,228,254,128,126,235,1,116,3,233
  db 216,254,128,126,239,0,117,46,139,70,6,11,70,8,117,9,255,54,252,61
  call pR5A0_0000
  db 255,118,22,255,118,20,255,118,18,255,118,16,138,70,233,80,49,192,80,49,192,80,176,0,80
  push cs
  call near ptr pO0A1_0321
  db 196,126,10,38,198,5,1,198,70,235,1,235,3,254,70,235,138,70,235,48,228,196,126,20,3,248,38,128
  db 189,243,1,0,118,7,196,126,10,38,198,5,0,128,126,235,2,117,222
  end;
  {@17F8-180A}
  if PR494_byte(a0)^.v = 0 then
    PR0_byte(a3)^.v := 1;
  {@180A-1824}
  if PR0_byte(a3)^.v <> 0 then
    PR0_byte(a3)^.v := pO0EC_2CF6(pointer(a0));
end;

{ 182A }
procedure pO0A1_182A(a0: longint; a1: pointer);
var loc: array[1..2] of byte;
begin
  asm
    db 196,126,6,38,196,189,231,1,38,254,69,14,255,118,8,255,118,6,255,118,12,255,118,10
    call pO0EC_36C5
    db 136,70,254,196,126,6,38,196,189,231,1,38,138,69,8,48,228,139,208,138,70,254,48,228,43,194,5,8
    db 0,153,185,8,0,247,241,146,136,70,255,128,126,255,4,118,15,138,70,255,48,228,139,208,184,8,0,43
    db 194,136,70,255,138,70,255,48,228,139,208,196,126,6,38,196,189,231,1,38,138,69,17,48,228,3,194,153
    db 185,8,0,247,241,146,196,126,6,38,196,189,231,1,38,136,69,17
  end;
end;

{ 18B9 }
procedure pO0A1_18B9(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v13b: byte;
  _f1: array[1..1] of byte;
begin
  asm
  db 198,6,240,174,1,198,6,239,174,1,160,141,174,48,228,5,15,0,162,142,174,196,126,16,38,196,189,231
  db 1,38,128,125,14,2,115,55,128,126,14,0,117,49,255,118,18,255,118,16,255,118,22,255,118,20
  call pO0EC_36C5
  db 136,70,243,138,70,243,48,228,5,4,0,153,185,8,0,247,241,146,196,126,16,38,196,189,231,1,38,136
  db 69,8,235,66,255,118,18,255,118,16,176,0,80
  call pO135_0805
  db 8,192,116,48,196,126,16,38,196,189,231,1,38,138,69,8,136,70,243,128,126,14,0,117,27,138,70,243
  db 48,228,5,4,0,153,185,8,0,247,241,146,196,126,16,38,196,189,231,1,38,136,69,8
  end;
  {@195C-1983}
  if pO135_0805(longint(a1), 0) <> 0 then
    pO135_0BAF(pointer(a1), v13b, 0, 0);
  asm
  db 255,118,22,255,118,20,255,118,18,255,118,16
  call pO0EC_36C5
  db 136,70,243,255,118,22,255,118,20
  call pO0EC_0C95
  db 255,118,22,255,118,20,138,70,243,80,176,1,80,176,0,80
  call pO135_0BAF
  db 139,70,16,139,86,18,196,126,20,38,196,189,231,1,38,137,69,9,38,137,85,11,184,100,0,80
  call Delay
  db 139,70,10,11,70,12,116,22,255,118,22,255,118,20,255,118,18,255,118,16,255,118,12,255,118,10
  push cs
  call near ptr pO0A1_27FA
  end;
  {@19F4-1A2F}
  if (PR46_byte(PR427_pointer(a0)^.v)^.v = 28) or (PR46_byte(PR427_pointer(a0)^.v)^.v = 29) then
    asm
  db 255,118,22,255,118,20,255,118,18,255,118,16,196,126,20,38,255,181,173,1,38,255,181,171,1
  push cs
  call near ptr pO0A1_27FA
    end;
  {@1A2F-1A36}
  PR0_byte(a4)^.v := 1;
  if (PR500_byte(a0)^.v > 0) or (PR501_byte(a0)^.v > 0) then
  begin
    {@1A4F-1A5C}
    v12p := p9CEE;
    {@1A5C-1A69}
    p9CEE := a0;
    {@1A69-1A88}
    pO0A1_1403(pointer(a0), pointer(a1), a2, @PR0_byte(a4)^.v, longint(a3));
    if a3 <> nil then
    begin
      {@1A93-1AA7}
      if PR57_byte(a3)^.v > 0 then
        Dec(PR57_byte(a3)^.v, bAED7);
      {@1AA7-1BB8}
      if PR57_byte(a3)^.v = 0 then
      begin
        {@1AB4-1BB8}
        if (pO0EC_32C3(pointer(a0)) <> 0) and (PR61_byte(a3)^.v <> 23) then
        begin
          {@1AD3-1AE2}
          GetMem(v4p, 63);
          {@1AE2-1AF5}
          Move(PR0_byte(a3)^.v, PR0_byte(v4p)^.v, 63);
          {@1AF5-1B02}
          v8p := pA7CA;
          if v8p = nil then
          begin
            {@1B0A-1B17}
            pA7CA := v4p;
            {@1B17-1B24}
            PR42_pointer(v4p)^.v := nil;
          end
          else
          begin
            {@1B26-1B58}
            while (PR42_pointer(v8p)^.v <> nil) and (v8p <> p9CFA) do
              v8p := PR42_pointer(v8p)^.v;
            {@1B58-1B6E}
            PR42_pointer(v4p)^.v := PR42_pointer(v8p)^.v;
            {@1B6E-1B7F}
            PR42_pointer(v8p)^.v := v4p;
          end;
          {@1B7F-1B87}
          PR52_byte(v4p)^.v := 0;
          {@1B87-1B98}
          pO0EC_18EF(pointer(a0), pointer(a3));
          {@1B98-1BA5}
          p9CFA := v4p;
        end
        else
          pO0EC_18EF(pointer(a0), pointer(a3));
      end;
    end;
    {@1BB8-1BC3}
    pO0EC_0EBF(pointer(a0));
    {@1BC3-1BD0}
    p9CEE := v12p;
  end;
  {@1BD0-1BEA}
  if PR0_byte(a4)^.v <> 0 then
    PR0_byte(a4)^.v := pO0EC_2CF6(pointer(a0));
  {@1BEA-1C38}
  if pO135_0805(longint(a0), 0) <> 0 then
  begin
    {@1BFC-1C1A}
    pO135_0BAF(pointer(a0), PR8_byte(PR487_pointer(a0)^.v)^.v, 1, 1);
    {@1C1A-1C38}
    pO135_0BAF(pointer(a0), PR8_byte(PR487_pointer(a0)^.v)^.v, 0, 0);
  end;
end;

{ 1C3E }
procedure pO0A1_1C3E(a0: pointer; a1: word; a2: word; a3: pointer);
var
  v1sb: shortint;
  v2sb: shortint;
  v2b: byte absolute v2sb;
begin
  asm
  db 255,118,16,255,118,14,255,118,12,255,118,10
  call pO0EC_2C22
  db 136,70,254,255,118,16,255,118,14
  call pO0EC_3280
  db 8,192,116,38,196,126,14,38,196,189,171,1,38,138,69,46,48,228,139,248,177,4,211,231,138,133,226,148
  db 48,228,72,153,185,3,0,247,241,136,70,255,235,6,138,70,254,136,70,255
  end;
  {@1C93-1CC2}
  if (v2sb - v1sb) > 0 then
  begin
    {@1CA3-1CB2}
    v2b := v2sb - v1sb;
    {@1CB2-1CC2}
    PR0_byte(a3)^.v := PR0_byte(a3)^.v + 2;
  end;
  {@1CC2-1CF2}
  if (v2sb - v1sb) > 0 then
  begin
    {@1CD2-1CE1}
    v2b := v2sb - v1sb;
    {@1CE1-1CF2}
    PR0_byte(a3)^.v := PR0_byte(a3)^.v + 3;
  end;
end;

{ 1E3E }
function pO0A1_1E3E(a0: byte; a1: byte; a2: byte; a3: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v7p: pointer;
  _f1: array[1..1] of byte;
  v9b: byte;
  v10b: byte;
  { 1CF8 }
  function pO0A1_1CF8: byte;
  var
    w2b: byte;
    w3b: byte;
    _f1: array[1..1] of byte;
  begin
    {@1CFE-1D02}
    w2b := 0;
    {@1D02-1D0A}
    v3b := 1;
    {@1D0A-1D26}
    w3b := Ord(a6528_3981[a0].f = 0);
    if pO0A1_3B4F(p9CEE, pO0BB_0D5B(a0), 0, 1, w3b) <> 0 then
    begin
      {@1D51-1D6D}
      v7p := PR9_pointer(PR487_pointer(p9CEE)^.v)^.v;
      if w3b <> 0 then
        v10b := PR495_byte(p9CEE)^.v
      else
        v10b := pO0EC_29F3(p9CEE);
      asm
    db 139,126,6,54,255,117,251,54,255,117,249,139,126,6,54,138,69,14,80,139,126,6,54,138,69,246,80
    push cs
    call near ptr pO0A1_3E58
    db 8,192,176,0,126,1,64,139,126,6,54,136,69,253
      end;
      if v3b <> 0 then
      begin
        {@1DD0-1DEF}
        PR0_pointer(a3)^.v := PR9_pointer(PR487_pointer(p9CEE)^.v)^.v;
        {@1DEF-1E0D}
        PR4_byte(a3)^.v := pO135_0CA2(longint(PR0_pointer(a3)^.v));
        asm
    db 139,126,6,54,196,125,6,38,255,117,2,38,255,53
    call pO135_0CCA
    db 139,126,6,54,196,125,6,38,136,69,5,198,70,254,1
        end;
      end;
    end;
    {@1E2F-1E35}
    pO0A1_1CF8 := w2b;
  end;

begin
  {@1E44-1E48}
  v2b := 0;
  if a1 = 0 then
  begin
    {@1E4E-1E5A}
    v9b := Ord(a0 <> 83);
    {@1E5A-1E85}
    pO0A1_3713(p9CEE, pO0BB_0D5B(a0), 0, a2, v9b, @v2b, @PR0_byte(a3)^.v);
    {@1E85-1EA0}
    PR9_longint(PR487_pointer(p9CEE)^.v)^.v := PR0_longint(a3)^.v;
  end
  else
  begin
    {@1EA2-1EDE}
    if a2 = 0 then
      v2b := pO0A1_1CF8
    else
    begin
      {@1EB2-1EDE}
      if a6520_3981[a0].f = 8 then
        v2b := pO0A1_1CF8
      else
        v2b := pO0A1_4334(a0, @PR0_byte(a3)^.v);
    end;
  end;
  {@1EDE-1EFE}
  if v2b <> 0 then
  begin
    {@1EE4-1EE8}
    pO0A1_1E3E := 1;
    {@1EE8-1EF2}
    bAE5B := PR4_byte(a3)^.v;
    {@1EF2-1EFC}
    bAE5C := PR5_byte(a3)^.v;
    {@1EFC-1EFE}
    Exit;
  end;
  {@1EFE-1F02}
  pO0A1_1E3E := 0;
  asm
  db 196,126,6,6,87,184,7,0,80
  call XR670_046E
  end;
end;

{ 1F46 }
procedure pO0A1_1F46(a0: byte; a1: word; a2: pointer);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'Already been targeted' then;
    if LV = 'Cannot target yourself' then;
    LP1('Cannot target yourself');
  end;
  asm
  db 191,59,173,30,87,184,32,1,80
  call XR670_046E
  db 196,126,6,38,198,5,1,198,6,58,173,0,198,6,220,167,0,255,54,240,156,255,54,238,156
  call pO135_0CA2
  db 162,91,174,255,54,240,156,255,54,238,156
  call pO135_0CCA
  db 162,92,174,138,70,12,48,228,139,248,177,4,211,231,138,133,32,101,36,15,60,0,117,22,161,238,156,139
  db 22,240,156,163,59,173,137,22,61,173,198,6,58,173,1,233,242,4
  end;
  asm
  db 60,5,116,3,233,174,1,198,70,251,0,198,70,254,0,128,126,12,79,117,16,176,79,80,176,0,80
  call pO0EC_2D90
  db 136,70,252,235,14,176,2,80,176,4,80
  call pO0E2_1374
  db 136,70,252,198,70,242,0,138,70,12,80,138,70,10,80,176,0,80,141,126,244,22,87
  push cs
  call near ptr pO0A1_1E3E
  db 8,192,117,3,233,77,1,198,70,243,0,138,70,254,136,70,241,176,1,58,70,241,119,49,136,70,253,235
  db 3,254,70,253,138,70,253,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,59,86,246,117,9
  db 59,70,244,117,4,198,70,243,1,138,70,253,58,70,241,117,212,128,126,243,0,116,3,233,196,0,254,70
  db 254,139,78,244,139,94,246,138,70,254,48,228,139,248,209,231,209,231,137,141,55,173,137,157,57,173,255,118
  db 246,255,118,244
  call pO135_0CA2
  db 162,91,174,255,118,246,255,118,244
  call pO135_0CCA
  db 162,92,174,254,6,58,173,128,126,12,79,116,59,138,70,254,48,228,139,248,209,231,209,231,196,189,55,173
  db 38,138,133,56,1,60,0,116,4,60,1,117,5,254,70,251,235,24,60,2,117,6,128,70,251,2,235,14
  db 60,3,117,6,128,70,251,4,235,4,128,70,251,8,235,51,138,70,254,48,228,139,248,209,231,209,231,196
  db 189,55,173,38,138,133,49,1,60,1,117,5,254,70,251,235,22,60,2,116,4,60,3,117,6,128,70,251
  db 2,235,8,60,4,117,4,128,70,251,4,128,126,254,1,118,12,138,70,251,58,70,252,118,4,198,70,242
  db 1,235,31,128,126,10,0,116,5,254,78,252,235,20,141,126,220,22,87,191,25,31,14,87,154,111,10,37
  db 8
  call pO0EC_1AAC
  db 255,118,246,255,118,244
  call pO135_0CA2
  db 80,255,118,246,255,118,244
  call pO135_0CCA
  db 80
  call pO135_0429
  db 235,4,198,70,242,1,128,126,242,0,117,9,128,126,252,0,116,3,233,133,254,233,61,3
  end;
  asm
  db 60,8,115,3,233,177,0,60,14,118,3,233,170,0,138,70,12,80,138,70,10,80,176,1,80,141,126,244
  db 22,87
  push cs
  call near ptr pO0A1_1E3E
  db 8,192,117,3,233,133,0,160,91,174,80,160,92,174,80,138,70,12,48,228,139,248,177,4,211,231,138,133
  db 32,101,36,7,48,228,80,176,255,80,176,1,80
  call pO130_08D7
  db 160,228,166,136,70,241,176,1,58,70,241,119,68,136,70,254,235,3,254,70,254,138,70,254,48,228,139,248
db 139,247,209,231,1,247,138,133,226,166,48,228,139,248,209,231,209,231,139,141,131,165,139,157,133,165,138,70
  db 254,48,228,139,248,209,231,209,231,137,141,55,173,137,157,57,173,138,70,254,58,70,241,117,193,160,228,166
  db 162,58,173,198,6,220,167,1,235,7,196,126,6,38,198,5,0,233,133,2
  end;
  asm
  db 60,15,116,3,233,224,0,138,70,12,80,138,70,10,80,176,0,80,141,126,244,22,87
  push cs
  call near ptr pO0A1_1E3E
  db 8,192,117,3,233,187,0,196,62,238,156,38,196,189,231,1,38,139,69,9,38,11,69,11,116,32,196,62
  db 238,156,38,196,189,231,1,38,139,69,9,38,139,85,11,163,59,173,137,22,61,173,198,6,58,173,1,233
  db 134,0,160,91,174,80,160,92,174,80,138,70,12,48,228,139,248,177,4,211,231,138,133,32,101,48,228,185
  db 4,0,211,232,80,176,255,80,176,1,80
  call pO130_08D7
  db 160,228,166,136,70,241,176,1,58,70,241,119,68,136,70,254,235,3,254,70,254,138,70,254,48,228,139,248
db 139,247,209,231,1,247,138,133,226,166,48,228,139,248,209,231,209,231,139,141,131,165,139,157,133,165,138,70
  db 254,48,228,139,248,209,231,209,231,137,141,55,173,137,157,57,173,138,70,254,58,70,241,117,193,160,228,166
  db 162,58,173,198,6,220,167,1,235,7,196,126,6,38,198,5,0,233,158,1
  end;
  {@230A-2321}
  v1b := a6520_3981[a0].f and 3 + 1;
  {@2321-2325}
  v2b := 0;
  {@2325-245D}
  while v1b > 0 do
    asm
  db 138,70,12,80,138,70,10,80,176,0,80,141,126,244,22,87
  push cs
  call near ptr pO0A1_1E3E
  db 8,192,117,3,233,13,1,198,70,243,0,138,70,254,136,70,241,176,1,58,70,241,119,49,136,70,253,235
  db 3,254,70,253,138,70,253,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,59,86,246,117,9
  db 59,70,244,117,4,198,70,243,1,138,70,253,58,70,241,117,212,128,126,12,23,116,6,128,126,12,49,117
  db 22,139,70,244,139,86,246,59,22,240,156,117,10,59,6,238,156,117,4,198,70,243,1,128,126,243,0,117
  db 61,254,70,254,139,78,244,139,94,246,138,70,254,48,228,139,248,209,231,209,231,137,141,55,173,137,157,57
  db 173,254,78,255,255,118,246,255,118,244
  call pO135_0CA2
  db 162,91,174,255,118,246,255,118,244
  call pO135_0CCA
  db 162,92,174,235,71,128,126,10,0,117,62,139,70,244,139,86,246,59,22,240,156,117,28,59,6,238,156,117
  db 22,141,126,219,22,87,191,47,31,14,87,154,111,10,37,8
  call pO0EC_1AAC
  db 235,20,141,126,220,22,87,191,25,31,14,87,154,111,10,37,8
  call pO0EC_1AAC
  db 235,3,254,78,255,255,118,246,255,118,244
  call pO135_0CA2
  db 80,255,118,246,255,118,244
  call pO135_0CCA
  db 80
  call pO135_0429
  db 235,4,198,70,255,0
    end;
  {@245D-2463}
  bAD3A := v2b;
  if v2b = 0 then
  begin
    {@2469-2470}
    PR0_byte(a2)^.v := 0;
    {@2470-2472}
    Exit;
  end;
  asm
  db 138,70,254,48,228,139,248,209,231,209,231,255,181,57,173,255,181,55,173
  call pO135_0CA2
  db 162,91,174
  end;
  asm
  db 138,70,254,48,228,139,248,209,231,209,231,255,181,57,173,255,181,55,173
  call pO135_0CCA
  db 162,92,174
  end;
end;

{ 24CD }
procedure pO0A1_24CD(a0: byte; a1: byte; a2: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  v6w: word;
  v7b: byte;
  v11p: pointer;
  v15p: pointer;
  v11l: longint absolute v11p;
  v6b: byte absolute v6w;
begin
  if false then begin
    if LV = 'Camp Only Spell' then;
    if LV = 'Begins Casting' then;
  end;
  {@24D3-24E0}
  v11p := p9CEE;
  {@24E0-24E4}
  v7b := 1;
  {@24E4-24E9}
  v6w := 65535;
  {@24E9-24F0}
  PR0_byte(a2)^.v := 0;
  {@24F0-24F6}
  v1b := a0;
  if v1b = 0 then
    v1b := pO0AA_30F3(0, 1, @v6b, @v7b);
  {@2514-2544}
  if (v1b > 0) and (a6525_3981[v1b].f = 0) then
  begin
    {@252C-2540}
    pO0EC_1AAC('Camp Only Spell');
    {@2540-2544}
    v1b := 0;
  end;
  {@2544-2575}
  if a1 = 0 then
  begin
    {@254A-254F}
    pO0EC_324C;
    {@254F-2554}
    bAEF0 := 1;
    {@2554-2559}
    bAEEF := 1;
    {@2559-256A}
    pO135_141F(v11l, 3, 1);
    {@256A-2575}
    pO0EC_0C95(v11p);
  end;
  {@2575-257E}
  if v1b <= 0 then
    Exit;
  {@257E-2598}
  v3b := Byte(a6526_3981[v1b].f div 3);
  if v3b = 0 then
  begin
    {@259E-25B3}
    pO0BB_121C(v1b, a1, 1, @PR0_byte(a2)^.v);
    {@25B3-25C4}
    PR0_byte(a2)^.v := pO0EC_2CF6(v11p);
    {@25C4-25C7}
    Exit;
  end;
  {@25C7-25CE}
  PR0_byte(a2)^.v := 1;
  {@25CE-25EE}
  pO0EC_1B08(v11p, 'Begins Casting', 10, 1);
  {@25EE-25FC}
  PR0_byte(PR487_pointer(v11p)^.v)^.v := v1b;
  if PR3_shortint(PR487_pointer(v11p)^.v)^.v > v3b then
    Dec(PR3_byte(PR487_pointer(v11p)^.v)^.v, v3b)
  else
    PR3_byte(PR487_pointer(v11p)^.v)^.v := 1;
  {@2632-2638}
  v4b := bB011;
  {@2638-2652}
  v15p := aAEED_9f8b[v4b + 1];
  {@2652-26D6}
while (v15p <> nil)
      and ((PR3_shortint(PR487_pointer(v15p)^.v)^.v > PR3_shortint(PR487_pointer(v11p)^.v)^.v)
      or (PR3_byte(PR487_pointer(v15p)^.v)^.v = PR3_byte(PR487_pointer(v11p)^.v)^.v) and (pO0E2_1374(1,
      2) = 1)) do
  begin
    {@269D-26B6}
    aAEED_9f8b[v4b] := v15p;
    {@26B6-26B9}
    Inc(v4b);
    {@26B9-26D3}
    v15p := aAEED_9f8b[v4b + 1];
  end;
  {@26D6-26EF}
  aAEED_9f8b[v4b] := v11p;
  {@26EF-26F3}
  Dec(bB011);
  {@26F3-26FA}
  PR0_byte(a2)^.v := 1;
end;

{ 2720 }
function pO0A1_2720(a0: pointer; a1: pointer): byte;
var
  v5p: pointer;
  v9l: longint;
  v10b: byte;
  v11b: byte;
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LSV = [3..4, 17..19, 63, 67] then;
  end;
  {@2726-272A}
  v11b := 0;
  {@272A-273D}
  v5p := PR427_pointer(a0)^.v;
  if v5p <> nil then
    v10b := PR46_byte(v5p)^.v;
  {@274F-2762}
  v9l := PR435_longint(a0)^.v;
  if (pO102_1276(pointer(a0), 6) > 0) and ((v5p = nil) or (v10b in [3..4, 17..19, 63, 67])) then
    v11b := 1;
  {@2790-27ED}
  if (v11b <> 0) and (PR14_byte(PR487_pointer(a1)^.v)^.v > 1) then
    asm
  db 255,118,12,255,118,10,255,118,8,255,118,6
  call pO0EC_2C22
  db 60,2,115,51,196,126,6,38,138,133,49,1,36,127,60,1,119,37,255,118,12,255,118,10,255,118,8,255
  db 118,6
  call pO0EC_36C5
  db 196,126,6,38,196,189,231,1,38,58,69,8,117,6,198,70,255,1,235,4
    end;
  {@27ED-27F1}
  pO0A1_2720 := 0;
end;

{ 27FA }
procedure pO0A1_27FA(a0: word; a1: word; a2: longint; a3: pointer);
var
  _f1: array[1..4] of byte;
begin
  asm
  db 255,118,16,255,118,14,255,118,12,255,118,10
  call pO0EC_36C5
  db 136,70,254,198,70,255,1,198,70,253,10,196,126,6,38,138,69,46,60,5,116,24,60,7,116,20,60,12
  db 116,16,60,30,116,12,60,66,116,8,60,74,116,4,60,4,117,24,138,70,254,80,176,13,80
  call pO0EC_3E76
  db 255,54,2,62
  call pR5A0_0000
  db 233,155,0,60,2,116,8,60,3,116,4,60,6,117,27,176,16,80
  call pO0EC_1E6D
  db 198,70,255,4,198,70,253,50,255,54,252,61
  call pR5A0_0000
  db 235,116,60,28,116,8,60,29,116,4,60,67,117,53,176,20,80,176,0,80,176,0,80,176,0,80
  call pO0EC_1CBC
  db 176,20,80,176,1,80,176,1,80,176,0,80
  call pO0EC_1CBC
  db 198,70,255,2,198,70,253,10,255,54,252,61
  call pR5A0_0000
  db 235,51,176,19,80,176,0,80,176,0,80,176,0,80
  call pO0EC_1CBC
  db 176,19,80,176,1,80,176,1,80,176,0,80
  call pO0EC_1CBC
  db 198,70,255,2,198,70,253,20,255,54,252,61
  call pR5A0_0000
  end;
  asm
  db 255,118,16,255,118,14
  call pO135_0CA2
  db 152,80,255,118,16,255,118,14
  call pO135_0CCA
  db 152,80,255,118,12,255,118,10
  call pO135_0CA2
  db 152,80,255,118,12,255,118,10
  call pO135_0CCA
  db 152,80,138,70,255,80,138,70,253,80
  call pO0EC_1F07
  end;
end;

{ 2939 }
procedure pO0A1_2939;
var
  v2w: word;
  v4w: word;
  v8p: pointer;
begin
  {@293F-2944}
  v2w := 0;
  {@2944-2949}
  v4w := 0;
  {@2949-2956}
  v8p := p9CF2;
  {@2956-29B4}
  while v8p <> nil do
  begin
    {@295E-299F}
    if (PR495_byte(v8p)^.v = 1) and (PR493_byte(v8p)^.v <> 9) then
    begin
      {@2974-298F}
      if PR494_byte(v8p)^.v <> 0 then
        v4w := PR508_byte(v8p)^.v + v4w;
      {@298F-299F}
      v2w := PR178_byte(v8p)^.v + v2w;
    end;
    {@299F-29B2}
    v8p := PR483_pointer(v8p)^.v;
  end;
  {@29B4-29D0}
  if v2w > 0 then
    bAED9 := 20 * v4w div v2w * 5;
end;

{ 29D4 }
function pO0A1_29D4(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v7p: pointer;
  _f1: array[1..1] of byte;
begin
  {@29DA-29DE}
  v2b := 0;
  {@29DE-29EB}
  v7p := p9CF2;
  {@29EB-2A48}
  while v7p <> nil do
  begin
    {@29F3-2A33}
    if (Byte(pO0EC_29F3(pointer(a0))) = PR495_byte(v7p)^.v) and (PR494_byte(v7p)^.v <> 0) then
    begin
      {@2A13-2A25}
      v3b := pO0EC_12E6(v7p) shr 1;
      if v3b > v2b then
        v2b := v3b;
    end;
    {@2A33-2A46}
    v7p := PR483_pointer(v7p)^.v;
  end;
  {@2A48-2A4E}
  pO0A1_29D4 := v2b;
end;

{ 2A57 }
function pO0A1_2A57(a0: pointer; a1: pointer): byte;
var
  _f1: array[1..5] of byte;
begin
  {@2A5D-2A83}
  if (Byte(pO0EC_29F3(pointer(a1))) = PR495_byte(a0)^.v) or (PR496_byte(a0)^.v <> 0) then
  begin
    {@2A7D-2A81}
    pO0A1_2A57 := 1;
    {@2A81-2A83}
    Exit;
  end;
  {@2A83-2A9D}
  if Byte(pO108_2254(s21A1, b5363)) <> b5362 then
  begin
    {@2A97-2A9B}
    pO0A1_2A57 := 0;
    {@2A9B-2A9D}
    Exit;
  end;
  {@2A9D-2AA1}
  pO0A1_2A57 := 1;
  {@2AA1-2AA6}
  bAE8C := 1;
  {@2AA6-2AAF}
  PR53_byte(p87F8)^.v := 1;
end;

{ 2ABB }
function pO0A1_2ABB
  (a0: longint; a1: word; a2: word; a3: word; a4: word; a5: word; a6: word; a7: word; a8: word;
   a9: word): byte;
var loc: array[1..523] of byte;
begin
  if false then begin
    if LV = '  ' then;
  end;
  asm
    db 199,70,247,255,0,196,62,224,166,38,138,69,6,136,70,245,196,62,224,166,38,198,69,6,1,255,118,26
    db 255,118,24
    call pO135_0CA2
    db 80,255,118,26,255,118,24
    call pO135_0CCA
    db 80,141,126,8,22,87,141,126,6,22,87,141,126,247,22,87
    call pO130_03EC
    db 136,70,246,138,70,245,196,62,224,166,38,136,69,6,139,70,247,209,232,137,70,247,128,126,16,0,116,62
    db 176,0,80,176,23,80,176,10,80,176,0,80,141,190,245,253,22,87,191,202,33,30,87,154,111,10,37,8
    db 141,190,245,254,22,87,255,118,247
    call pO0EC_146B
    db 154,252,10,37,8,191,184,42,14,87,154,252,10,37,8
    call pR47F_0354
    db 191,14,171,30,87,184,40,0,80,176,255,80,154,127,26,37,8,198,70,253,0,198,70,254,0,235,3,254
    db 70,254,128,126,254,3,116,3,233,188,0,138,70,18,48,228,59,70,247,115,3,233,173,0,128,126,10,0
    db 117,3,233,164,0,128,126,16,0,117,43,128,126,12,0,116,8,139,70,20,11,70,22,117,14,128,126,14
    db 0,116,21,139,70,20,11,70,22,117,13,176,3,80,141,126,253,22,87
    call pO108_00AB
    db 235,115,139,70,24,139,86,26,59,86,22,117,5,59,70,20,116,99,255,118,26,255,118,24
    call pO0EC_3280
    db 8,192,117,15,176,3,80,141,126,253,22,87
    call pO108_00AB
    db 235,69,255,118,26,255,118,24,141,126,249,22,87
    call pO0EC_330E
    db 8,192,116,49,255,118,26,255,118,24,176,1,80,176,0,80
    call pO0EC_2A6F
    db 8,192,116,15,255,118,26,255,118,24
    call pO0EC_32C3
    db 8,192,116,13,176,3,80,141,126,253,22,87
    call pO108_00AB
    db 235,14,138,70,254,80,141,126,253,22,87
    call pO108_00AB
    db 128,126,254,5,116,3,233,33,255,139,70,20,11,70,22,116,33,255,118,22,255,118,20,176,3,80,176,1
    db 80
    call pO135_141F
    db 198,6,239,174,1,255,118,22,255,118,20
    call pO0EC_0C95
    db 191,28,42,30,87,191,6,48,30,87,176,1,80,176,0,80
    call pO108_1009
    db 136,70,255
  end;
end;

{ 2CA5 }
procedure pO0A1_2CA5(a0: word; a1: word; a2: longint; a3: byte; a4: pointer; a5: pointer);
var loc: array[1..6] of byte;
begin
  asm
    db 49,192,137,70,251,137,70,253,196,126,10,38,198,5,1,128,126,14,1,117,27,255,118,22,255,118,20,255
    db 118,18,255,118,16
    push cs
    call near ptr pO0A1_2A57
    db 8,192,117,7,196,126,10,38,198,5,0,196,126,10,38,128,61,0,117,3,233,234,0,139,70,16,139,86
    db 18,196,126,6,38,137,5,38,137,85,2,255,118,18,255,118,16
    call pO135_0CA2
    db 196,126,6,38,136,69,4,255,118,18,255,118,16
    call pO135_0CCA
    db 196,126,6,38,136,69,5,196,62,224,166,38,198,69,4,0,196,62,224,166,38,138,69,2,152,5,3,0
    db 80,196,62,224,166,38,138,69,3,152,5,3,0,80,176,3,80,176,8,80
    call pO135_0A4D
    db 128,126,14,1,116,3,233,125,0,255,118,22,255,118,20,255,118,18,255,118,16
    push cs
    call near ptr pO0A1_182A
    db 255,118,22,255,118,20
    call pO0EC_3280
    db 8,192,116,64,255,118,22,255,118,20,141,126,251,22,87
    call pO0EC_330E
    db 8,192,116,44,255,118,22,255,118,20
    call pO0EC_32C3
    db 8,192,116,29,255,118,22,255,118,20,255,118,18,255,118,16
    call pO0EC_2C22
    db 60,1,117,8,49,192,137,70,251,137,70,253,255,118,22,255,118,20,255,118,18,255,118,16,176,0,80,255
    db 118,253,255,118,251,196,126,10,6,87
    push cs
    call near ptr pO0A1_18B9
    db 235,14,196,126,6,6,87,184,7,0,80
    call XR670_046E
  end;
end;

{ 2DE8 }
procedure pO0A1_2DE8
  (a0: longint; a1: longint; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: pointer;
   a8: pointer; a9: byte; a10: byte);
var
  _f1: array[1..12] of byte;
  v13b: byte;
  v14b: byte;
  _f2: array[1..514] of byte;
begin
  if false then begin
    if LV = '  ' then;
  end;
  {@2DEF-2DF4}
  bAEE7 := 1;
  {@2DF4-2DFA}
  v13b := a9;
  {@2DFA-2E00}
  v14b := a10;
  asm
  db 138,70,8,162,229,174
  end;
  asm
  db 138,70,6,162,230,174
  end;
  asm
  db 196,126,10,6,87,184,7,0,80
  call XR670_046E
  db 196,62,224,166,38,198,69,4,1,196,62,224,166,38,198,69,5,1,198,70,254,255,198,70,249,8,198,6
  db 108,177,0
  end;
  asm
  db 128,126,254,1,119,3,233,247,4,160,229,174,80,160,230,174,80,176,2,80,138,70,249,80
  call pO135_0A4D
  db 138,70,249,48,228,139,248,138,133,172,62,0,6,229,174,138,70,249,48,228,139,248,138,133,181,62,0,6
  db 230,174,128,62,229,174,0,125,5,198,6,229,174,0,128,62,230,174,0,125,5,198,6,230,174,0,128,62
  db 229,174,49,126,5,198,6,229,174,49,128,62,230,174,24,126,5,198,6,230,174,24,160,229,174,80,160,230
  db 174,80,141,126,245,22,87,141,126,244,22,87
  call pO135_060F
  call pR670_0311
  db 196,126,18,38,198,5,0,199,70,240,255,0,160,229,174,136,70,247,160,230,174,136,70,246,255,118,36,255
  db 118,34
  call pO135_0CA2
  db 80,255,118,36,255,118,34
  call pO135_0CCA
  db 80,141,126,247,22,87,141,126,246,22,87,141,126,240,22,87
  call pO130_03EC
  db 8,192,116,80,196,126,18,38,198,5,1,128,126,26,0,116,65,176,0,80,176,23,80,176,10,80,176,0
  db 80,141,190,240,253,22,87,191,202,33,30,87,154,111,10,37,8,141,190,240,254,22,87,139,70,240,209,232
  db 80
  call pO0EC_146B
  db 154,252,10,37,8,191,229,45,14,87,154,252,10,37,8
  call pR47F_0354
  db 235,23,128,126,26,0,116,17,176,0,80,176,23,80,176,39,80,176,23,80
  call pR142_0217
  db 139,70,240,209,232,137,70,240,49,192,137,70,30,137,70,32,196,126,18,38,128,61,0,117,3,233,138,0
  db 128,126,245,0,118,27,138,70,245,48,228,139,248,209,231,209,231,139,133,131,165,139,149,133,165,137,70,30
  db 137,86,32,235,105,128,126,244,31,117,99,160,223,166,136,70,239,176,1,58,70,239,119,86,136,70,248,235
  db 3,254,70,248,138,70,248,48,228,186,7,0,247,226,139,248,138,133,164,166,58,6,229,174,117,48,138,70
  db 248,48,228,186,7,0,247,226,139,248,138,133,165,166,58,6,230,174,117,26,138,70,248,48,228,186,7,0
  db 247,226,139,248,139,133,160,166,139,149,162,166,137,70,30,137,86,32,138,70,248,58,70,239,117,175,139,70
  db 30,11,70,32,116,18,198,6,239,174,1,255,118,32,255,118,30
  call pO0EC_0C95
  db 235,17,176,23,80,176,1,80,176,38,80,176,21,80
  call pR142_0217
  db 138,70,28,48,228,59,70,240,114,18,138,70,244,48,228,139,248,209,231,209,231,128,189,186,62,255,117,7
  db 196,126,18,38,198,5,0,139,70,30,11,70,32,117,3,233,159,0,255,118,36,255,118,34,255,118,32,255
  db 118,30,176,1,80
  push cs
  call near ptr pO0A1_0FAE
  db 8,192,116,6,128,126,22,0,117,7,196,126,18,38,198,5,0,128,126,26,1,117,115,139,70,34,139,86
  db 36,59,86,32,117,5,59,70,30,116,12,128,126,245,0,117,15,128,126,244,31,117,9,196,126,18,38,198
  db 5,0,235,78,255,118,36,255,118,34
  call pO0EC_3280
  db 8,192,116,63,255,118,36,255,118,34,141,126,250,22,87
  call pO0EC_330E
  db 8,192,116,36,255,118,36,255,118,34,176,1,80,176,0,80
  call pO0EC_2A6F
  db 8,192,118,22,255,118,36,255,118,34
  call pO0EC_32C3
  db 8,192,117,7,196,126,18,38,198,5,0,235,13,128,126,24,0,117,7,196,126,18,38,198,5,0,191,14
  db 171,30,87,184,40,0,80,176,255,80,154,127,26,37,8,198,70,255,0,196,126,18,38,128,61,0,116,15
  db 176,0,80,141,126,255,22,87
  call pO108_00AB
  db 235,13,176,1,80,141,126,255,22,87
  call pO108_00AB
  db 191,69,42,30,87,191,47,48,30,87,176,1,80,176,0,80
  call pO108_1009
  db 136,70,254,128,62,230,170,0,117,3,233,237,0,138,70,254,60,72,117,7,198,70,249,0,233,220,0,60
  db 73,117,7,198,70,249,1,233,209,0,60,77,117,7,198,70,249,2,233,198,0,60,81,117,7,198,70,249
  db 3,233,187,0,60,80,117,7,198,70,249,4,233,176,0,60,79,117,7,198,70,249,5,233,165,0,60,75
  db 117,7,198,70,249,6,233,154,0,60,71,117,7,198,70,249,7,233,143,0,60,32,117,25,160,229,174,80
  db 160,230,174,80,176,0,80,176,8,80
  call pO135_0A4D
  db 198,70,249,8,235,114,60,27,117,106,196,126,14,38,198,5,0,160,229,174,80,160,230,174,80
  call pO135_0429
  db 196,126,10,6,87,184,7,0,80
  call XR670_046E
  db 138,70,243,196,126,10,38,136,69,4,138,70,242,196,126,10,38,136,69,5,138,70,243,80,138,70,242,80
  db 176,0,80,176,8,80
  call pO135_0A4D
  db 196,62,224,166,38,198,69,4,0,138,70,243,80,138,70,242,80
  call pO135_0429
  db 198,6,108,177,0,198,70,254,1,235,4,198,70,249,8,233,211,0,138,70,254,60,0,117,94,196,126,14
  db 38,198,5,1,160,229,174,196,126,10,38,136,69,4,160,230,174,196,126,10,38,136,69,5,139,70,30,11
  db 70,32,116,18,139,70,30,139,86,32,196,126,10,38,137,5,38,137,85,2,235,12,196,126,10,49,192,38
  db 137,5,38,137,69,2,196,62,224,166,38,198,69,4,0,160,229,174,80,160,230,174,80
  call pO135_0429
  db 198,6,108,177,0,235,110,60,1,117,102,196,126,14,38,198,5,0,160,229,174,80,160,230,174,80
  call pO135_0429
  db 196,126,10,6,87,184,7,0,80
  call XR670_046E
  db 138,70,243,196,126,10,38,136,69,4,138,70,242,196,126,10,38,136,69,5,138,70,243,80,138,70,242,80
  db 176,0,80,176,8,80
  call pO135_0A4D
  db 196,62,224,166,38,198,69,4,0,138,70,243,80,138,70,242,80
  call pO135_0429
  db 198,6,108,177,0,235,4,198,70,249,8,233,0,251
  end;
  {@3339-333E}
  bAEE7 := 0;
end;

{ 3713 }
procedure pO0A1_3713(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte; a5: pointer; a6: pointer);
var loc: array[1..238] of byte;
  { 3344 }
  function pO0A1_3344(b0: byte): longint;
  var loc: array[1..8] of byte;
  begin
    asm
      db 139,126,6,54,138,133,37,255,48,228,139,240,209,224,1,240,139,126,6,3,248,54,138,133,37,255,48,228
      db 139,248,209,231,209,231,139,133,131,165,139,149,133,165,137,70,248,137,86,250,139,70,248,11,70,250,117,17
      db 139,126,6,54,139,69,22,54,139,85,24,137,70,248,137,86,250,139,126,6,54,128,189,38,255,1,115,8
      db 176,0,80
      call pR670_0000
      db 139,126,6,54,138,133,37,255,48,228,139,240,209,224,1,240,139,126,6,3,248,54,138,133,37,255,48,228
      db 139,248,209,231,209,231,138,133,241,158,139,126,6,54,136,133,35,255,139,126,6,54,138,133,37,255,48,228
      db 139,240,209,224,1,240,139,126,6,3,248,54,138,133,37,255,48,228,139,248,209,231,209,231,138,133,242,158
      db 139,126,6,54,136,133,34,255,138,70,8,139,126,6,54,0,133,37,255,139,126,6,54,128,189,37,255,0
      db 117,16,139,126,6,54,138,133,38,255,139,126,6,54,136,133,37,255,139,126,6,54,138,133,37,255,139,126
      db 6,54,58,133,38,255,118,9,139,126,6,54,198,133,37,255,1,139,126,6,54,138,133,37,255,48,228,139
      db 240,209,224,1,240,139,126,6,3,248,54,138,133,37,255,48,228,139,248,209,231,209,231,139,133,131,165,139
      db 149,133,165,137,70,244,137,86,246,139,126,6,54,138,133,37,255,48,228,139,240,209,224,1,240,139,126,6
      db 3,248,54,138,133,37,255,48,228,139,248,209,231,209,231,138,133,241,158,139,126,6,54,136,133,33,255,139
      db 126,6,54,138,133,37,255,48,228,139,240,209,224,1,240,139,126,6,3,248,54,138,133,37,255,48,228,139
      db 248,209,231,209,231,138,133,242,158,139,126,6,54,136,133,32,255,139,70,244,11,70,246,116,22,139,126,6
      db 54,128,189,33,255,0,124,11,139,126,6,54,128,189,32,255,0,125,46,139,70,248,139,86,250,137,70,252
      db 137,86,254,139,126,6,54,138,133,35,255,139,126,6,54,136,133,33,255,139,126,6,54,138,133,34,255,139
      db 126,6,54,136,133,32,255,235,95,139,70,244,139,86,246,137,70,252,137,86,254,139,126,6,54,138,133,35
      db 255,152,80,139,126,6,54,138,133,34,255,152,80,139,126,6,54,138,133,33,255,152,80,139,126,6,54,138
      db 133,32,255,152,80,176,1,80,176,0,80
      call pO0EC_1F07
      db 139,126,6,54,138,133,33,255,139,126,6,54,136,133,35,255,139,126,6,54,138,133,32,255,139,126,6,54
      db 136,133,34,255
    end;
  end;

  { 3586 }
  procedure pO0A1_3586;
  var loc: array[1..6] of byte;
  begin
    asm
      db 139,126,6,54,198,133,37,255,1,139,126,6,54,255,117,24,54,255,117,22
      call pO135_0CA2
      db 80,139,126,6,54,255,117,24,54,255,117,22
      call pO135_0CCA
      db 80,184,255,0,80,176,255,80,139,126,6,54,255,117,24,54,255,117,22
      call pO135_0CF2
      db 80
      call pO130_08D7
      db 139,126,6,54,198,133,38,255,0,160,228,166,136,70,250,176,1,58,70,250,118,3,233,195,0,136,70,255
      db 235,3,254,70,255,138,70,255,48,228,139,248,139,247,209,231,1,247,138,133,226,166,48,228,139,248,209,231
      db 209,231,139,133,131,165,139,149,133,165,137,70,251,137,86,253,139,126,6,54,255,117,24,54,255,117,22,255
      db 118,253,255,118,251,176,0,80
      push cs
      call near ptr pO0A1_0FAE
      db 8,192,116,109,139,126,6,54,254,133,38,255,138,70,255,48,228,139,248,139,247,209,231,1,247,129,199,226
      db 166,30,87,139,126,6,54,138,133,38,255,48,228,139,240,209,224,1,240,139,126,6,3,248,129,199,37,255
      db 22,87,184,3,0,80,154,163,9,37,8,139,70,251,139,86,253,139,126,6,54,196,125,22,38,196,189,231
      db 1,38,59,85,11,117,22,38,59,69,9,117,16,139,126,6,54,138,133,38,255,139,126,6,54,136,133,37
      db 255,138,70,255,58,70,250,116,3,233,66,255,176,0,80,255,118,6
      push cs
      call near ptr pO0A1_3344
      db 139,126,6,54,137,133,28,255,54,137,149,30,255,139,126,6,54,139,133,28,255,54,139,149,30,255,139,126
      db 6,54,59,85,24,117,6,54,59,69,22,116,10,198,6,13,171,255,198,6,229,170,4
    end;
  end;

begin
  if false then begin
    if LSV = [0..1, 3] then;
  end;
  asm
    db 198,6,229,170,1,176,28,80,176,0,80,176,0,80,176,0,80
    call pO0EC_1CBC
    db 196,126,6,6,87,184,7,0,80
    call XR670_046E
    db 196,126,10,38,198,5,0,138,70,20,136,134,39,255,128,190,39,255,255,117,50,196,126,22,38,139,133,171
    db 1,38,11,133,173,1,116,30,196,126,22,38,196,189,171,1,38,138,69,46,48,228,139,248,177,4,211,231
    db 138,133,226,148,136,134,39,255,235,5,198,134,39,255,1,128,190,39,255,0,116,7,128,190,39,255,255,117
    db 5,198,134,39,255,1,255,118,24,255,118,22
    call pO135_0CA2
    db 136,134,21,255,255,118,24,255,118,22
    call pO135_0CCA
    db 136,134,20,255,138,134,21,255,80,138,134,20,255,80
    call pO135_0429
    db 85
    push cs
    call near ptr pO0A1_3586
    db 255,182,30,255,255,182,28,255
    call pO135_0CA2
    db 136,134,23,255,255,182,30,255,255,182,28,255
    call pO135_0CCA
    db 136,134,22,255,198,134,26,255,1,198,134,24,255,0,128,190,24,255,0,116,3,233,50,3,255,118,24,255
    db 118,22,255,182,30,255,255,182,28,255,138,134,39,255,80,138,70,18,80,138,70,16,80,138,70,14,80,138
    db 134,26,255,80,138,134,23,255,80,138,134,22,255,80
    push cs
    call near ptr pO0A1_2ABB
    db 136,134,27,255,128,62,230,170,0,116,3,233,116,2,138,134,27,255,60,0,117,24,198,134,26,255,1,176
    db 1,80,85
    push cs
    call near ptr pO0A1_3344
    db 137,134,28,255,137,150,30,255,233,82,2,60,1,117,24,198,134,26,255,1,176,255,80,85
    push cs
    call near ptr pO0A1_3344
    db 137,134,28,255,137,150,30,255,233,54,2,60,2,116,3,233,48,1,255,118,24,255,118,22,255,182,30,255
    db 255,182,28,255,138,134,39,255,80,138,70,18,80,138,70,16,80,138,70,14,80,141,190,26,255,22,87,141
    db 190,25,255,22,87,196,126,6,6,87,138,134,23,255,80,138,134,22,255,80
    push cs
    call near ptr pO0A1_2DE8
    db 196,126,6,38,139,5,38,139,85,2,137,134,28,255,137,150,30,255,196,126,6,38,138,69,4,136,134,23
    db 255,196,126,6,38,138,69,5,136,134,22,255,128,190,26,255,0,117,3,233,153,0,128,190,25,255,0,117
    db 3,233,143,0,198,134,27,255,3,198,134,24,255,1,198,6,229,170,4,139,134,28,255,11,134,30,255,116
    db 20,139,134,28,255,139,150,30,255,196,126,6,38,137,5,38,137,85,2,235,12,196,126,6,49,192,38,137
    db 5,38,137,69,2,196,126,10,38,198,5,1,128,126,18,1,117,32,255,118,24,255,118,22,255,182,30,255
    db 255,182,28,255,138,70,18,80,196,126,10,6,87,196,126,6,6,87
    push cs
    call near ptr pO0A1_2CA5
    db 196,126,10,38,128,61,0,117,30,196,62,224,166,38,198,69,4,0,138,134,23,255,80,138,134,22,255,80
    db 176,0,80,176,8,80
    call pO135_0A4D
    db 235,36,139,70,22,11,70,24,116,23,128,190,25,255,0,117,16,198,6,239,174,1,255,118,24,255,118,22
    call pO0EC_0C95
    db 198,6,229,170,3,233,255,0,60,3,116,3,233,155,0,138,134,23,255,196,126,6,38,136,69,4,138,134
    db 22,255,196,126,6,38,136,69,5,139,134,28,255,11,134,30,255,116,20,139,134,28,255,139,150,30,255,196
    db 126,6,38,137,5,38,137,85,2,235,12,196,126,6,49,192,38,137,5,38,137,69,2,196,126,10,38,198
    db 5,1,128,126,18,1,117,32,255,118,24,255,118,22,255,182,30,255,255,182,28,255,138,70,18,80,196,126
    db 10,6,87,196,126,6,6,87
    push cs
    call near ptr pO0A1_2CA5
    db 196,126,10,38,128,61,0,117,30,196,62,224,166,38,198,69,4,0,138,134,23,255,80,138,134,22,255,80
    db 176,0,80,176,8,80
    call pO135_0A4D
    db 198,134,24,255,1,235,93,60,4,117,50,196,62,224,166,38,198,69,4,1,196,62,224,166,38,198,69,5
    db 1,138,134,23,255,80,138,134,22,255,80,176,0,80,176,8,80
    call pO135_0A4D
    db 196,62,224,166,38,198,69,4,0,235,39,60,5,117,35,196,62,224,166,38,198,69,4,0,138,134,23,255
    db 80,138,134,22,255,80,176,0,80,176,8,80
    call pO135_0A4D
    db 198,134,24,255,1,235,62,128,190,27,255,27,117,55,196,62,224,166,38,198,69,4,0,138,134,23,255,80
    db 138,134,22,255,80
    call pO135_0429
    db 138,134,21,255,80,138,134,20,255,80,176,0,80,176,8,80
    call pO135_0A4D
    db 198,134,27,255,5,198,134,24,255,1,138,134,27,255,80,191,243,54,14,87,154,36,13,37,8,116,44,139
    db 134,28,255,11,134,30,255,116,34,255,182,30,255,255,182,28,255
    call pO135_0CA2
    db 136,134,23,255,255,182,30,255,255,182,28,255
    call pO135_0CCA
    db 136,134,22,255,233,196,252,128,126,18,0,116,17,176,0,80,176,23,80,176,39,80,176,23,80
    call pR142_0217
  end;
end;

{ 3B4F }
function pO0A1_3B4F(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v11p: pointer;
  v15l: longint;
  _f1: array[1..1] of byte;
begin
  {@3B55-3B5D}
  v15l := 0;
  {@3B5D-3B61}
  v7b := 0;
  {@3B61-3B65}
  v6b := 0;
  {@3B65-3B69}
  v5b := 0;
  {@3B69-3B7F}
  v11p := PR9_pointer(PR487_pointer(a0)^.v)^.v;
if (a3 <> 0) or (v11p <> nil) and ((PR495_byte(v11p)^.v = PR495_byte(a0)^.v) or (PR494_byte(v11p)^.v = 0)
      or (pO0A1_0FAE(pointer(a0), v11p, a4) = 0)) then
    PR9_pointer(PR487_pointer(a0)^.v)^.v := nil;
  {@3BD4-3BEA}
  if PR9_pointer(PR487_pointer(a0)^.v)^.v <> nil then
    v6b := 1;
  {@3BEA-3D4D}
  while (v6b = 0) and (v5b = 0) do
  begin
    {@3BFC-3C02}
    v5b := v7b;
    if (v7b <> 0) and (a3 = 0) then
      PR6_byte(pA6E0)^.v := 1;
    {@3C17-3C2D}
    v2b := pO0EC_2A6F(pointer(a0), a1, a4);
    if v2b > 0 then
      v4b := pO0E2_1374(1, v2b);
    {@3C42-3C48}
    v3b := v2b;
    {@3C48-3D40}
    while (v3b > 0) and (v6b = 0) and (v2b > 0) do
    begin
      {@3C63-3C66}
      Dec(v3b);
      if aAE8E_ec3f[v4b] > 0 then
      begin
        {@3C77-3C98}
        v11p := aA583_9f8b[aAE8E_ec3f[v4b]];
        if (a2 <> 0) and (PR6_byte(pA6E0)^.v <> 0) or (pO0A1_0FAE(pointer(a0), v11p, a4) <> 0) then
        begin
          {@3CC1-3CC5}
          v6b := 1;
          {@3CC5-3CDB}
          PR9_pointer(PR487_pointer(a0)^.v)^.v := v11p;
        end
        else
        begin
          {@3CDD-3CE9}
          aAE8E_ec3f[v4b] := 0;
          for v4b := 1 to v2b do
          begin
            {@3CFE-3D10}
            if aAE8E_ec3f[v4b] > 0 then
              v6b := 1;
          end;
          {@3D18-3D28}
          if v6b <> 0 then
            v6b := 0
          else
            v2b := 0;
        end;
      end;
      {@3D28-3D3D}
      if v6b = 0 then
      begin
        {@3D2E-3D31}
        Inc(v4b);
        if v4b > v2b then
          v4b := 1;
      end;
    end;
    {@3D40-3D4A}
    if v7b = 0 then
      v7b := 1;
  end;
  {@3D4D-3D56}
  PR6_byte(pA6E0)^.v := 0;
  {@3D56-3D5C}
  pO0A1_3B4F := v6b;
end;

{ 3D7E }
function pO0A1_3D7E: byte;
var
  v2b: byte;
  v6p: pointer;
  v6l: longint absolute v6p;
begin
  if false then begin
    if LV = 'Helm' then;
    if LV = 'The Gods intervene!' then;
  end;
  {@3D85-3D89}
  pO0A1_3D7E := 0;
  {@3D89-3DA7}
  if ParamStr(3) <> 'Helm' then
    Exit;
  {@3DA7-3DAB}
  pO0A1_3D7E := 1;
  {@3DAB-3DBF}
  pO0EC_1AAC('The Gods intervene!');
  {@3DBF-3DCC}
  v6p := p9CF2;
  {@3DCC-3E2C}
  while v6p <> nil do
  begin
    {@3DD4-3E09}
    if PR495_byte(v6p)^.v = 1 then
    begin
      {@3DDF-3DE8}
      PR494_byte(v6p)^.v := 0;
      {@3DE8-3DF1}
      PR493_byte(v6p)^.v := 6;
      {@3DF1-3E09}
      a9EF4_2a50[pO135_0D1A(v6l)].f := 0;
    end;
    {@3E09-3E17}
    v2b := pO0EC_2CF6(v6p);
    {@3E17-3E2A}
    v6p := PR483_pointer(v6p)^.v;
  end;
  {@3E2C-3E51}
  pO135_0A4D(PR2_shortint(pA6E0)^.v + 3, PR3_shortint(pA6E0)^.v + 3, 255, 8);
end;

{ 3E58 }
function pO0A1_3E58(a0: pointer; a1: byte; a2: byte): byte;
var
  v2b: byte;
  _f1: array[1..3] of byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v2sb: shortint absolute v2b;
begin
  {@3E5E-3E62}
  pO0A1_3E58 := 0;
  if PR495_byte(a0)^.v <> a2 then
  begin
    {@3E6F-3E73}
    pO0A1_3E58 := 246;
    {@3E73-3E76}
    Exit;
  end;
  {@3E76-3E7A}
  v2b := 0;
  {@3E7A-3E8C}
  v8b := a6524_3981[a1].f;
  case a1 of
    1: begin
      {@3E93-3EC3}
      if (pO0EC_27C1(pointer(a0), 1, @v6b) = 0) and (pO0EC_2A6F(pointer(a0), 1, 0) = 0) then
        v2b := 1;
    end;
    42: begin
      {@3ECA-3EE7}
      if pO0EC_27C1(p9CEE, 49, @v6b) = 0 then
        v2b := 1;
    end;
    3, 58, 71, 36: begin
      {@3EFA-3F17}
      if Ord(PR178_byte(a0)^.v > PR508_byte(a0)^.v) <> 0 then
        v2b := 1;
    end;
    96: begin
      {@3F3D-3F45}
      if Ord((PR173_shortint(a0)^.v < 6) or ((PR420_byte(a0)^.v and 2) <> 0)) <> 0 then
        v2b := 1;
    end;
    10: begin
      {@3F4C-3F70}
      if ((PR421_byte(a0)^.v and 2) <> 0) and (Ord(PR305_byte(a0)^.v = 1) <> 0) then
        v2b := 1;
    end;
    65, 15: begin
      {@3F7B-3F96}
      if pO0EC_27C1(pointer(a0), 17, @v6b) = 0 then
        v2b := 1;
    end;
    21: begin
      {@3F9D-3FCA}
      if (Ord(PR312_byte(a0)^.v < 5) <> 0) and (pO0EC_27C1(pointer(a0), 53, @v6b) = 0) then
        v2b := 1;
    end;
    23, 49: begin
      {@3FD5-4010}
if (Ord(PR173_shortint(a0)^.v < 6) <> 0) and ((PR421_byte(a0)^.v and 2) <> 0)
          and (pO0EC_27C1(pointer(a0), 52, @v6b) = 0) then
        v2b := 1;
    end;
    37: begin
      {@4017-4032}
      if pO0EC_27C1(pointer(a0), 33, @v6b) <> 0 then
        v2b := 1;
    end;
    43: begin
      {@4039-4054}
      if pO0EC_27C1(pointer(a0), 36, @v6b) <> 0 then
        v2b := 1;
    end;
    47, 64, 74, 115: begin
      {@4067-4082}
      if pO0EC_27C1(pointer(a0), 93, @v6b) = 0 then
        v2b := 1;
    end;
    51: begin
      {@4089-40A4}
      if pO0EC_27C1(pointer(a0), 6, @v6b) = 0 then
        v2b := 1;
    end;
    76, 110: begin
      {@40AF-40C1}
      if (PR421_byte(a0)^.v and 8) = 0 then
        v2b := 1;
    end;
    61: v2b := 1;
    68: begin
      {@40D3-40E5}
      if (PR421_byte(a0)^.v and 16) = 0 then
        v2b := 1;
    end;
    94, 120, 81: begin
      {@40F4-4106}
      if (PR421_byte(a0)^.v and 2) <> 0 then
        v2b := 1;
    end;
    82: v2b := 1;
    84: begin
      {@4116-4131}
      if pO0EC_27C1(pointer(a0), 92, @v6b) = 0 then
        v2b := 1;
    end;
    91: begin
      {@4137-4146}
      if PR312_byte(a0)^.v < 6 then
        v2b := 1;
    end;
  else
    {@4148-4177}
    if v8b = 0 then
      v2b := 1
    else
    begin
      {@4154-4177}
      if Ord(pO0EC_27C1(pointer(a0), v8b, @v6b) = 0) <> 0 then
        v2b := 1;
    end;
  end;
  {@4177-4189}
  v7b := a651B_3981[a1].f;
  if v2sb > 0 then
  begin
    {@418F-41B0}
    if (v7b < 5) and (pO0EC_27C1(pointer(a0), 57, @v6b) <> 0) then
      v2b := 0;
    {@41B0-41D1}
    if (v7b < 4) and (pO0EC_27C1(pointer(a0), 63, @v6b) <> 0) then
      v2b := 0;
    {@41D1-41E0}
    if PR491_byte(a0)^.v > 50 then
      v2b := 0;
  end;
  {@41E0-41E6}
  pO0A1_3E58 := v2b;
end;

{ 41EF }
function pO0A1_41EF(a0: pointer; a1: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..5] of byte;
begin
  {@41F5-41F9}
  pO0A1_41EF := 0;
  if a6528_3981[a1].f = 0 then
    v3b := PR495_byte(a0)^.v
  else
    v3b := pO0EC_29F3(pointer(a0));
  asm
  db 138,70,6,48,228,139,248,177,4,211,231,128,189,32,101,0,117,24,255,118,10,255,118,8,138,70,6,80
  db 138,70,253,80
  push cs
  call near ptr pO0A1_3E58
  db 136,70,254,233,149,0,138,70,6,80
  call pO0BB_0D5B
  db 136,70,250,255,118,10,255,118,8
  call pO135_0CA2
  db 80,255,118,10,255,118,8
  call pO135_0CCA
  db 80,138,70,250,48,228,80,176,255,80,255,118,10,255,118,8
  call pO135_0CF2
  db 80
  call pO130_08D7
  db 160,228,166,136,70,251,198,70,252,1,198,70,254,0,128,126,251,0,118,67,138,70,252,58,70,251,119,59
  db 128,126,254,0,127,53,138,70,252,48,228,139,248,139,247,209,231,1,247,138,133,226,166,48,228,139,248,209
  db 231,209,231,255,181,133,165,255,181,131,165,138,70,6,80,138,70,253,80
  push cs
  call near ptr pO0A1_3E58
  db 136,70,254,254,70,252,235,189
  end;
  {@42E5-42EB}
  pO0A1_41EF := v2b;
end;

{ 4334 }
function pO0A1_4334(a0: byte; a1: pointer): byte;
var loc: array[1..53] of byte;
begin
  if false then begin
    if LSV = [34, 101] then;
    if LSV = [34, 91] then;
  end;
  asm
    db 138,70,10,48,228,139,248,177,4,211,231,128,189,40,101,0,117,14,196,62,238,156,38,138,133,239,1,136
    db 70,204,235,16,255,54,240,156,255,54,238,156
    call pO0EC_29F3
    db 136,70,204,198,70,255,0,138,70,10,48,228,139,248,177,4,211,231,138,133,32,101,48,228,45,8,0,136
    db 70,250,128,126,10,47,116,6,128,126,10,115,117,14,196,62,248,135,38,128,125,33,0,117,3,254,78,250
    db 49,192,137,70,240,137,70,242,138,70,10,80
    call pO0BB_0D5B
    db 48,228,139,208,138,70,250,48,228,3,194,136,70,249,128,126,249,18,118,27,198,70,249,18,196,62,238,156
    db 38,196,189,231,1,38,139,69,9,38,139,85,11,137,70,240,137,86,242,138,70,250,48,228,139,208,138,70
    db 249,48,228,43,194,136,70,248,139,70,240,11,70,242,117,13,161,238,156,139,22,240,156,137,70,240,137,86
    db 242,255,118,242,255,118,240
    call pO135_0CA2
    db 136,70,239,255,118,242,255,118,240
    call pO135_0CCA
    db 136,70,238,138,70,10,80,191,244,66,14,87,154,36,13,37,8,116,34,138,70,248,48,228,139,208,138,70
    db 239,152,43,194,136,70,220,138,70,248,48,228,139,208,138,70,238,152,43,194,136,70,221,235,32,138,70,249
    db 48,228,139,208,138,70,239,152,43,194,136,70,220,138,70,249,48,228,139,208,138,70,238,152,43,194,136,70
    db 221,138,70,248,48,228,139,208,138,70,239,152,43,194,136,70,216,138,70,248,48,228,139,208,138,70,238,152
    db 43,194,136,70,217,138,70,249,48,228,139,208,138,70,239,152,3,194,136,70,222,138,70,249,48,228,139,208
    db 138,70,238,152,3,194,136,70,223,138,70,248,48,228,139,208,138,70,239,152,3,194,136,70,218,138,70,248
    db 48,228,139,208,138,70,238,152,3,194,136,70,219,184,89,5,80,154,63,2,37,8,137,70,251,137,86,253
    db 196,126,251,6,87,184,89,5,80
    call XR670_046E
    db 161,242,156,139,22,244,156,137,70,240,137,86,242,139,70,240,11,70,242,117,3,233,231,1,255,118,242,255
    db 118,240
    call pO135_0CA2
    db 136,70,237,255,118,242,255,118,240
    call pO135_0CCA
    db 136,70,236,196,126,240,38,128,189,238,1,0,117,3,233,167,1,138,70,237,58,70,220,125,3,233,156,1
    db 138,70,237,58,70,222,126,3,233,145,1,138,70,236,58,70,221,125,3,233,134,1,138,70,236,58,70,223
    db 126,3,233,123,1,255,118,242,255,118,240,138,70,10,80,138,70,204,80
    push cs
    call near ptr pO0A1_3E58
    db 136,70,225,138,70,10,80,191,20,67,14,87,154,36,13,37,8,116,6,198,70,227,0,235,10,138,70,250
    db 48,228,247,216,136,70,227,138,70,250,136,70,226,138,70,217,152,139,200,138,70,236,152,139,208,138,70,227
    db 152,3,194,59,193,125,15,138,70,236,152,139,208,138,70,217,152,43,194,136,70,227,138,70,219,152,139,200
    db 138,70,236,152,139,208,138,70,226,152,3,194,59,193,126,15,138,70,236,152,139,208,138,70,219,152,43,194
    db 136,70,226,138,70,226,136,70,203,138,70,227,58,70,203,126,3,233,229,0,136,70,230,235,3,254,70,230
    db 138,70,10,80,191,20,67,14,87,154,36,13,37,8,116,8,138,70,237,136,70,229,235,37,138,70,250,48
    db 228,139,208,138,70,230,152,139,248,139,247,209,231,1,247,3,250,138,133,158,10,152,139,208,138,70,237,152
    db 43,194,136,70,229,138,70,250,48,228,139,208,138,70,230,152,139,248,139,247,209,231,1,247,3,250,138,133
    db 158,10,152,139,208,138,70,237,152,3,194,136,70,228,138,70,229,58,70,216,125,6,138,70,216,136,70,229
    db 138,70,228,58,70,218,126,6,138,70,218,136,70,228,138,70,228,136,70,202,138,70,229,58,70,202,127,70
    db 136,70,231,235,3,254,70,231,138,94,225,138,70,238,152,139,200,138,70,236,152,139,208,138,70,230,152,3
    db 194,43,193,139,200,138,70,239,152,139,208,138,70,231,152,43,194,186,37,0,247,226,196,126,251,3,248,3
    db 249,38,0,157,172,2,138,70,231,58,70,202,117,191,138,70,230,58,70,203,116,3,233,32,255,196,126,240
    db 38,139,133,227,1,38,139,149,229,1,137,70,240,137,86,242,233,14,254,255,54,240,156,255,54,238,156
    call pO135_0CA2
    db 136,70,233,255,54,240,156,255,54,238,156
    call pO135_0CCA
    db 136,70,232,198,70,224,0,138,70,248,136,70,203,138,70,248,48,228,247,216,58,70,203,126,3,233,36,1
    db 136,70,231,235,3,254,70,231,138,70,248,136,70,202,138,70,248,48,228,247,216,58,70,202,126,3,233,252
    db 0,136,70,230,235,3,254,70,230,138,70,230,152,139,200,138,70,231,152,186,37,0,247,226,196,126,251,3
    db 248,3,249,38,138,133,172,2,136,70,225,138,70,225,58,70,224,127,35,138,70,225,58,70,224,116,3,233
    db 184,0,128,126,225,0,127,3,233,175,0,176,25,80
    call pO0EC_0000
    db 8,192,117,3,233,160,0,138,70,233,136,70,237,138,70,232,136,70,236,138,70,10,80
    call pO0BB_0D5B
    db 48,228,137,70,213,138,70,231,152,139,208,138,70,239,152,3,194,9,192,124,118,138,70,231,152,139,208,138
    db 70,239,152,3,194,61,49,0,127,101,138,70,230,152,139,208,138,70,238,152,3,194,9,192,124,85,138,70
    db 230,152,139,208,138,70,238,152,3,194,61,24,0,125,68,138,70,231,152,139,208,138,70,239,152,3,194,80
    db 138,70,230,152,139,208,138,70,238,152,3,194,80,141,126,237,22,87,141,126,236,22,87,141,126,213,22,87
    call pO130_03EC
    db 8,192,116,18,138,70,231,136,70,235,138,70,230,136,70,234,138,70,225,136,70,224,138,70,230,58,70,202
    db 116,3,233,9,255,138,70,231,58,70,203,116,3,233,225,254,196,126,6,49,192,38,137,5,38,137,69,2
    db 128,126,224,0,126,44,198,70,255,1,138,70,239,152,139,208,138,70,235,152,3,194,196,126,6,38,136,69
    db 4,138,70,238,152,139,208,138,70,234,152,3,194,196,126,6,38,136,69,5,235,16,198,70,255,0,196,126
    db 6,49,192,38,137,5,38,137,69,2,255,118,253,255,118,251,184,89,5,80,154,84,2,37,8
  end;
end;

{ 4943 }
procedure pO0A1_4943;
var
  v4p: pointer;
  v8p: pointer;
  _f1: array[1..4] of byte;
  { 48B2 }
  function pO0A1_48B2(b0: pointer): byte;
  var
    w2b: byte;
    w3b: byte;
    _f1: array[1..1] of byte;
  begin
    {@48B8-48E8}
    case pO102_1276(pointer(b0), 3) of
      0: w3b := 0;
      1: w3b := 20;
      2: w3b := 40;
    else
      {@48E4-48E8}
      w3b := 80;
    end;
    {@48E8-490F}
    if PR27_byte(b0)^.v > 13 then
      w2b := (PR27_byte(b0)^.v - 13) * 5
    else
      w2b := 0;
    {@490F-4936}
    if (w3b + w2b) > pO0E2_1374(1, 100) then
    begin
      {@4930-4934}
      pO0A1_48B2 := 1;
      {@4934-4936}
      Exit;
    end;
    {@4936-493A}
    pO0A1_48B2 := 0;
  end;

begin
  {@4949-4956}
  v8p := p9CF2;
  {@4956-499F}
  while v8p <> nil do
  begin
    {@495E-498A}
    if PR495_byte(v8p)^.v = 0 then
      PR496_byte(v8p)^.v := Ord(PR327_byte(v8p)^.v > 127)
    else
      PR496_byte(v8p)^.v := 1;
    {@498A-499D}
    v8p := PR483_pointer(v8p)^.v;
  end;
  {@499F-49AC}
  v4p := p9CF2;
  {@49AC-4A81}
  while v4p <> nil do
  begin
    {@49B7-4A6B}
if (PR495_byte(v4p)^.v = 0) and (PR327_byte(v4p)^.v <= 127) and (pO102_1276(v4p, 3) > 0)
        and (PR493_byte(v4p)^.v = 0) then
    begin
      {@49F3-4A00}
      v8p := p9CF2;
      {@4A00-4A6B}
      while v8p <> nil do
      begin
        {@4A08-4A56}
if (PR495_byte(v8p)^.v = 0) and (PR327_byte(v8p)^.v > 127) and (PR496_byte(v8p)^.v <> 0)
            and (PR493_byte(v8p)^.v = 0) and (PR19_byte(v8p)^.v > 3) and (pO0A1_48B2(v4p) <> 0) then
          PR496_byte(v8p)^.v := 0;
        {@4A56-4A69}
        v8p := PR483_pointer(v8p)^.v;
      end;
    end;
    {@4A6B-4A7E}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 4C33 }
procedure pO0A1_4C33(a0: pointer; a1: word; a2: word; a3: word);
var
  _f1: array[1..4] of byte;
  v5b: byte;
  _f2: array[1..33] of byte;
  { 4A85 }
  procedure pO0A1_4A85(b0: byte);
  begin
    {@4A88-4A91}
    pO0EC_1E6D(b0);
    asm
    db 139,126,6,54,196,125,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,139,126,6,54,196,125,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,139,126,6,54,255,117,248,54,255,117,246
    call pO135_0CA2
    db 152,80,139,126,6,54,255,117,248,54,255,117,246
    call pO135_0CCA
    db 152,80,176,1,80,176,30,80
    call pO0EC_1F07
    end;
  end;

  { 4AEE }
  procedure pO0A1_4AEE(b0: byte);
  var
    w1b: byte;
    _f1: array[1..1] of byte;
  begin
    {@4AF4-4AFC}
    v5b := 1;
    {@4AFC-4B22}
    if pO0A1_3B4F(pointer(PR0_pointer(a0)^.v), 255, 0, b0, 0) = 0 then
      Exit;
    {@4B22-4B41}
    w1b := pO135_0CA2(longint(PR9_longint(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v));
    asm
    db 139,126,6,54,196,125,12,38,196,61,38,196,189,231,1,38,255,117,11,38,255,117,9
    call pO135_0CCA
    db 136,70,254,139,126,6,54,196,125,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 80,139,126,6,54,196,125,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 80,141,126,255,22,87,141,126,254,22,87,139,126,6,129,199,253,255,22,87
    call pO130_03EC
    db 8,192,116,8
    end;
    {@4BA4-4BAC}
    v5b := 0;
  end;

begin
  if false then begin
    if LV = 'fires a disintegrate ray' then;
    if LV = 'is disintegrated' then;
    if LV = 'fires a flesh to stone ray' then;
    if LV = 'is Stoned' then;
    if LV = 'fires a death ray' then;
    if LV = 'is killed' then;
    if LV = 'Causes Serious Wounds' then;
  end;
  asm
    db 198,70,252,0,198,70,255,4,198,70,251,0,196,126,12,38,196,61,38,196,189,231,1,49,192,38,137,69
    db 9,38,137,69,11,176,1,80,85
    push cs
    call near ptr pO0A1_4AEE
    db 198,6,210,167,8,196,126,12,38,196,61,38,196,189,231,1,38,139,69,9,38,139,85,11,137,70,246,137
    db 86,248,196,126,12,38,255,117,2,38,255,53,255,118,248,255,118,246
    call pO0EC_2C22
    db 48,228,137,70,253,254,78,255,139,70,246,11,70,248,117,3,233,120,2,131,126,253,2,119,122,138,70,252
    db 36,1,8,192,117,113,138,70,252,12,1,136,70,252,196,126,12,38,255,117,2,38,255,53,141,126,221,22
    db 87,191,178,75,14,87,154,111,10,37,8,176,10,80,176,1,80
    call pO0EC_1B08
    db 176,17,80,85
    push cs
    call near ptr pO0A1_4A85
    db 255,118,248,255,118,246,176,3,80,176,0,80
    call pO0E2_12C9
    db 8,192,117,29,255,118,248,255,118,246,176,8,80,141,126,229,22,87,191,203,75,14,87,154,111,10,37,8
    call pO0E2_0000
    db 176,0,80,85
    push cs
    call near ptr pO0A1_4AEE
    db 233,248,1,131,126,253,3,119,122,138,70,252,36,2,8,192,117,113,138,70,252,12,2,136,70,252,196,126
    db 12,38,255,117,2,38,255,53,141,126,219,22,87,191,220,75,14,87,154,111,10,37,8,176,10,80,176,1
    db 80
    call pO0EC_1B08
    db 176,17,80,85
    push cs
    call near ptr pO0A1_4A85
    db 255,118,248,255,118,246,176,1,80,176,0,80
    call pO0E2_12C9
    db 8,192,117,29,255,118,248,255,118,246,176,7,80,141,126,236,22,87,191,247,75,14,87,154,111,10,37,8
    call pO0E2_0000
    db 176,0,80,85
    push cs
    call near ptr pO0A1_4AEE
    db 233,120,1,131,126,253,4,118,3,233,127,0,138,70,252,36,4,8,192,117,118,198,6,210,167,72,138,70
    db 252,12,4,136,70,252,196,126,12,38,255,117,2,38,255,53,141,126,228,22,87,191,1,76,14,87,154,111
    db 10,37,8,176,10,80,176,1,80
    call pO0EC_1B08
    db 176,17,80,85
    push cs
    call near ptr pO0A1_4A85
    db 255,118,248,255,118,246,176,0,80,176,0,80
    call pO0E2_12C9
    db 8,192,117,29,255,118,248,255,118,246,176,6,80,141,126,236,22,87,191,19,76,14,87,154,111,10,37,8
    call pO0E2_0000
    db 176,0,80,85
    push cs
    call near ptr pO0A1_4AEE
    db 233,240,0,131,126,253,5,119,107,138,70,252,36,8,8,192,117,98,138,70,252,12,8,136,70,252,196,126
    db 12,38,255,117,2,38,255,53,141,126,224,22,87,191,29,76,14,87,154,111,10,37,8,176,10,80,176,1
    db 80
    call pO0EC_1B08
    db 176,17,80,85
    push cs
    call near ptr pO0A1_4A85
    db 198,6,213,167,66,255,118,248,255,118,246,176,2,80,176,8,80
    call pO0E2_13BF
    db 64,80,176,0,80,176,0,80
    call pO0E2_1D19
    db 176,0,80,85
    push cs
    call near ptr pO0A1_4AEE
    db 233,127,0,138,70,252,36,16,8,192,117,34,198,6,213,167,84,176,84,80,176,1,80,176,1,80,141,126
    db 251,22,87
    call pO0BB_121C
    db 138,70,252,12,16,136,70,252,235,84,138,70,252,36,32,8,192,117,34,198,6,213,167,55,176,55,80,176
    db 1,80,176,1,80,141,126,251,22,87
    call pO0BB_121C
    db 138,70,252,12,32,136,70,252,235,41,138,70,252,36,64,8,192,117,32,198,6,213,167,21,176,21,80,176
    db 1,80,176,1,80,141,126,251,22,87
    call pO0BB_121C
    db 138,70,252,12,64,136,70,252,128,126,255,0,118,24,196,126,12,38,196,61,38,196,189,231,1,38,139,69
    db 9,38,11,69,11,116,3,233,36,253
  end;
end;

{ 4F44 }
begin
end.

