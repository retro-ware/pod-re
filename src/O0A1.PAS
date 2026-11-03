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
procedure pO0A1_1F46(a0: byte; a1: byte; a2: pointer);
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
  E3_byte = record f: byte; _r: array[1..2] of byte end;
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  E7_byte = record f: byte; _r: array[1..6] of byte end;
  E7_pointer = record f: pointer; _r: array[1..3] of byte end;
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
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R305_byte = record _p: array[1..305] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R314_byte = record _p: array[1..314] of byte; v: byte end;
  R314_shortint = record _p: array[1..314] of byte; v: shortint end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
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
  RA499_byte = record _p: array[1..499] of byte; a: array[0..32000] of byte end;
  RA501_byte = record _p: array[1..501] of byte; a: array[0..32000] of byte end;
  RA503_byte = record _p: array[1..503] of byte; a: array[0..32000] of byte end;
  RA505_shortint = record _p: array[1..505] of byte; a: array[0..32000] of shortint end;
  RB684_37_byte = record _p: array[1..684] of byte; a: array[0..1602, 0..36] of byte end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
W13_7_0000 = record case byte of 0: (_w7_0byte: byte); 1: (_p1: array[1..1] of byte; _w7_1byte: byte);
      2: (_p2: array[1..2] of byte; _w7_2byte: byte); 3: (_p3: array[1..3] of byte; _w7_3byte: byte);
      4: (_p4: array[1..3] of byte; _w7_3shortint: shortint); 5: (_p5: array[1..4] of byte; _w7_4byte: byte);
      6: (_p6: array[1..7] of byte; _w7_7byte: byte) end;
  X16 = array[0..15] of byte;
  X3 = array[0..2] of byte;
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
  PR27_byte = ^R27_byte;
  PR2_shortint = ^R2_shortint;
  PR305_byte = ^R305_byte;
  PR312_byte = ^R312_byte;
  PR314_byte = ^R314_byte;
  PR314_shortint = ^R314_shortint;
  PR327_byte = ^R327_byte;
  PR33_byte = ^R33_byte;
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
  PRA499_byte = ^RA499_byte;
  PRA501_byte = ^RA501_byte;
  PRA503_byte = ^RA503_byte;
  PRA505_shortint = ^RA505_shortint;
  PRB684_37_byte = ^RB684_37_byte;
  PRB7_50_byte = ^RB7_50_byte;
  PW13_7_0000 = ^W13_7_0000;
var
  a09FB_dd99: array[0..2977, 0..10] of byte absolute d09FB;
  a0A9E_c143: array[0..10919, 0..2] of shortint absolute d0A9E;
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
  a94D6_622c: array[0..2046] of X16 absolute d94D6;
  a94DB_3981: array[0..2046] of E16_byte absolute d94DB;
  a94E2_3981: array[0..2046] of E16_byte absolute d94E2;
  a9EF1_2a50: array[0..8189] of E4_byte absolute d9EF1;
  a9EF2_2a50: array[0..8189] of E4_byte absolute d9EF2;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aA6A0_b509: array[0..4679] of E7_pointer absolute dA6A0;
  aA6A4_30da: array[0..4679] of E7_byte absolute dA6A4;
  aA6A5_30da: array[0..4679] of E7_byte absolute dA6A5;
  aA6E2_89af: array[0..10919] of X3 absolute dA6E2;
  aA6E2_fd21: array[0..10919] of E3_byte absolute dA6E2;
  aAD37_9f8b: array[0..8189] of pointer absolute dAD37;
  aAE8E_ec3f: array[0..32759] of byte absolute dAE8E;
  aAEED_9f8b: array[0..8189] of pointer absolute dAEED;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  bA6DF: byte absolute dA6DF;
  bA6E4: byte absolute dA6E4;
  bA7D2: byte absolute dA7D2;
  bA7D3: byte absolute dA7D3;
  bA7D5: byte absolute dA7D5;
  bA7DA: byte absolute dA7DA;
  bA7DC: byte absolute dA7DC;
  bA7E8: byte absolute dA7E8;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0D: byte absolute dAB0D;
  bAB0E: byte absolute dAB0E;
  bAD3A: byte absolute dAD3A;
  bAD3B: byte absolute dAD3B;
  bAE5B: byte absolute dAE5B;
  bAE5C: byte absolute dAE5C;
  bAE8C: byte absolute dAE8C;
  bAE8D: byte absolute dAE8D;
  bAE8E: byte absolute dAE8E;
  bAED7: byte absolute dAED7;
  bAED9: byte absolute dAED9;
  bAEDB: byte absolute dAEDB;
  bAEE5: byte absolute dAEE5;
  bAEE6: byte absolute dAEE6;
  bAEE7: byte absolute dAEE7;
  bAEEF: byte absolute dAEEF;
  bAEF0: byte absolute dAEF0;
  bB011: byte absolute dB011;
  bB16C: byte absolute dB16C;
  iA7D8: integer absolute dA7D8;
  l9CEE: longint absolute d9CEE;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CFA: pointer absolute d9CFA;
  pA6E0: pointer absolute dA6E0;
  pA7CA: pointer absolute dA7CA;
  pAD3B: pointer absolute dAD3B;
  s21A1: string absolute d21A1;
  s21CA: string absolute d21CA;
  s2A1C: string absolute d2A1C;
  s2A45: string absolute d2A45;
  s3006: string absolute d3006;
  s302F: string absolute d302F;
  sbAEE5: shortint absolute dAEE5;
  sbAEE6: shortint absolute dAEE6;
  w3DFC: word absolute d3DFC;
  w3DFE: word absolute d3DFE;
  w3E02: word absolute d3E02;
  wA7D8: word absolute dA7D8;

procedure pO0A1_019C(a0: pointer; a1: longint; a2: byte); far; forward;
procedure pO0A1_0321(a0: longint; a1: pointer; a2: byte; a3: word; a4: byte; a5: byte); far; forward;
procedure pO0A1_067F(a0: pointer); far; forward;
function pO0A1_0F85(a0: byte): byte; far; forward;
procedure pO0A1_1403(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: longint); far; forward;
procedure pO0A1_1C3E(a0: pointer; a1: longint; a2: pointer); far; forward;
function pO0A1_1E3E(a0: byte; a1: byte; a2: byte; a3: pointer): byte; far; forward;
function pO0A1_2720(a0: pointer; a1: pointer): byte; far; forward;
procedure pO0A1_27FA(a0: longint; a1: longint; a2: pointer); far; forward;
function pO0A1_2ABB
  (a0: pointer; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte; a7: byte; a8: byte): byte; far; forward;
procedure pO0A1_2CA5(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: pointer); far; forward;
procedure pO0A1_2DE8
  (a0: pointer; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: pointer;
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
procedure pO0A1_0321(a0: longint; a1: pointer; a2: byte; a3: word; a4: byte; a5: byte);
var
c82: record case byte of 0: (v82a2: string[81]); 1: (v82a: string[80]); 2: (_p2: array[1..81] of byte;
      v1b: byte) end;
  _f1: array[1..1] of byte;
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
  case a2 of
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
  asm
  db 198,70,255,12
  end;
  asm
  db 255,118,16,255,118,14,176,23,80,138,70,255,80,176,0,80
  call pO0EC_1C22
  end;
  asm
  db 254,70,255
  end;
  if a2 = 1 then
    c82.v82a := '(from behind) '
  else
    asm
  db 198,70,174,0
    end;
  {@03C1-04DA}
  if a5 <> 0 then
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
    asm
  db 255,118,16,255,118,14,255,118,10
  call pO0EC_2851
    end;
  end
  else
    c82.v82a := c82.v82a2 + 'and Misses';
  asm
  db 196,126,14,38,128,189,237,1,8,116,38,176,23,80,138,70,255,80,176,38,80,138,70,255,48,228,5,3
  db 0,80,176,10,80,176,0,80,176,1,80,141,126,174,22,87
  call pR47F_0498
  end;
  asm
  db 160,147,157,48,228,64,136,70,255
  end;
  if a3 > 0 then
  begin
    asm
  db 196,126,14,38,196,189,231,1,38,198,69,1,0
    end;
    if PR0_byte(PR487_pointer(a1)^.v)^.v > 0 then
    begin
      asm
  call pR47F_0D1A
      end;
      {@053A-055A}
      pO0EC_1B08(pointer(a1), 'lost a spell', 12, 1);
      asm
  db 255,118,16,255,118,14,196,126,14,38,196,189,231,1,38,138,5,80
  call pO0EC_186D
      end;
      asm
  db 255,118,16,255,118,14
  call pO0EC_2CF6
  db 136,70,173
      end;
    end
    else
      asm
  call pR47F_0D1A
      end;
  end
  else
    asm
  call pR47F_0D1A
    end;
  {@058D-0674}
  if PR494_byte(a1)^.v = 0 then
  begin
    {@059B-05BC}
    pO0EC_1B08(pointer(a1), 'goes down', c82.v1b, 0);
    if (PR421_byte(a1)^.v and 8) = 0 then
    begin
      asm
  db 128,70,255,2
      end;
      if PR493_byte(a1)^.v = 5 then
        pR47F_0354(23, c82.v1b, 10, 0, 'and is Dying');
      {@05FA-0630}
      if PR493_byte(a1)^.v in [6..8] then
        pO0EC_1B08(pointer(a1), 'is killed', c82.v1b, 0);
      asm
  db 128,70,255,2
      end;
    end;
    asm
  db 255,118,16,255,118,14
  call pO0E2_15A0
    end;
    asm
  db 176,13,80,141,126,14,22,87
  call pO0E2_04DD
    end;
    if (PR494_byte(a1)^.v = 0) and (PR493_byte(a1)^.v <> 10) then
      asm
  db 255,118,16,255,118,14
  call pO135_0F14
      end
    else
      asm
  call pR47F_0D1A
      end;
  end;
  asm
  call pO0EC_1BEF
  end;
end;

{ 067F }
procedure pO0A1_067F(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  v6l: longint absolute v6p;
begin
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
      begin
        {@06FE-0721}
        pO135_0A4D(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), 2, 8);
        {@0721-072E}
        PR6_byte(PR487_pointer(v6p)^.v)^.v := 0;
        {@072E-073E}
        pO0A1_182A(v6l, pointer(a0));
        {@073E-075C}
        pO0A1_18B9(v6p, pointer(a0), 0, nil, @v7b);
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
  _f1: array[1..11] of byte;
  v12b: byte;
  v13a: array[0..0] of byte;
  _f2: array[1..2] of byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  _f3: array[1..1] of byte;
  v21b: byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  v25b: byte;
  v26b: byte;
  v27b: byte;
  v31p: pointer;
  v35l: longint;
  v31l: longint absolute v31p;
begin
  {@097F-098D}
  v19b := pO135_0D1A(longint(a0));
  {@098D-09A1}
  v21b := pO0EC_2A6F(pointer(a0), 1, 0);
  {@09A1-09AA}
  if v21b = 0 then
    Exit;
  {@09AA-09B8}
  XR670_046E(@v12b, 12);
  {@09B8-09BC}
  v24b := 1;
  for v23b := 1 to v21b do
  begin
    {@09D4-0A5F}
if (pO0EC_0E7A(pointer(aA583_9f8b[aAE8E_ec3f[v23b]])) = 0)
        and (PR15_byte(PR487_pointer(aA583_9f8b[aAE8E_ec3f[v23b]])^.v)^.v = 0)
        and (pO0EC_27C1(pointer(aA583_9f8b[aAE8E_ec3f[v23b]]), 27, @v16b) = 0) then
    begin
      {@0A47-0A5C}
      v13a[v24b] := aAE8E_ec3f[v23b];
      {@0A5C-0A5F}
      Inc(v24b);
    end;
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
if (v18b = 0) and ((PR3_shortint(PR487_pointer(v31p)^.v)^.v > 0)
              or (PR14_byte(PR487_pointer(v31p)^.v)^.v = 0) or (pO130_0549(pO135_0CA2(v31l),
              pO135_0CCA(v31l), pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), v27b mod 8) <> 0)) then
          begin
            {@0C9F-0CA3}
            v26b := 1;
            if PR360_byte(v31p)^.v = 0 then
              v26b := 2;
            {@0CB2-0CD9}
            for v25b := 1 to 2 do
            begin
              {@0CBB-0CD3}
              if PRA499_byte(v31p)^.a[v25b] > 0 then
                v26b := v25b;
            end;
            {@0CD9-0CFB}
            if PRA499_byte(v31p)^.a[v26b] = 0 then
              PRA499_byte(v31p)^.a[v26b] := 1;
            {@0CFB-0D0A}
            PR4_byte(PR487_pointer(v31p)^.v)^.v := v26b;
            {@0D0A-0D20}
            v35l := PR9_longint(PR487_pointer(v31p)^.v)^.v;
            {@0D20-0D3E}
            pO0A1_18B9(v31p, pointer(a0), 1, nil, @bAEDB);
            {@0D3E-0D42}
            v18b := 1;
            {@0D42-0D58}
            PR9_longint(PR487_pointer(v31p)^.v)^.v := v35l;
            if PR494_byte(a0)^.v <> 0 then
            begin
              {@0D63-0D68}
              bAEEF := 1;
              {@0D68-0D73}
              pO0EC_0C95(pointer(a0));
            end;
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
  _f1: array[1..15] of byte;
  _v16: byte;
  _f2: array[1..2] of byte;
  v19b: byte;
  _f3: array[1..1] of byte;
  v21b: byte;
  v22b: byte;
  _f4: array[1..2] of byte;
  v16a: X16 absolute _v16;
begin
  asm
  db 138,70,14,136,70,237
  end;
  asm
  db 196,126,10,38,198,5,0
  end;
  asm
  db 198,6,223,167,0
  end;
  asm
  db 198,6,224,167,0
  end;
  asm
  db 198,6,215,174,0
  end;
  asm
  db 198,6,216,174,0
  end;
  asm
  db 198,70,239,0
  end;
  asm
  db 198,70,238,0
  end;
  asm
  db 49,192,163,216,167
  end;
  asm
  db 196,126,20,38,196,189,231,1,38,198,69,7,1
  end;
  if pO0EC_0E7A(pointer(a1)) <> 0 then
  begin
    asm
  db 255,54,248,61
  call pR5A0_0000
    end;
    asm
  db 196,126,20,38,196,189,231,1,38,138,69,4,48,228,196,126,20,3,248,38,128,189,243,1,0,117,14,196
  db 126,20,38,196,189,231,1,38,254,77,4,235,215
    end;
    asm
  db 196,126,20,38,196,189,231,1,38,138,69,4,48,228,139,248,254,133,214,174
    end;
    asm
  db 255,118,22,255,118,20,255,118,18,255,118,16,176,3,80,196,126,16,38,138,133,252,1,48,228,5,5,0
  db 80,184,1,0,80,176,1,80
  push cs
  call near ptr pO0A1_0321
    end;
    asm
  db 255,118,22,255,118,20
  call pO0E2_1568
    end;
    asm
  db 196,126,20,38,198,133,244,1,0
    end;
    asm
  db 196,126,20,38,198,133,245,1,0
    end;
    asm
  db 198,70,239,1
    end;
    asm
  db 196,126,10,38,198,5,1
    end;
  end
  else
  begin
    {@14EF-1576}
    if (PR427_pointer(a0)^.v <> nil) and ((PR305_byte(a1)^.v > 128) or ((PR305_byte(a1)^.v and 7) > 1)) then
    begin
      {@1517-153F}
      v16a := a94D6_622c[PR46_byte(PR427_pointer(a0)^.v)^.v];
      asm
  db 138,70,242,196,126,20,38,136,133,246,1
      end;
      asm
  db 138,70,243,196,126,20,38,136,133,248,1
      end;
      asm
  db 138,70,244,152,139,200,138,70,251,152,139,208,196,126,20,38,138,133,250,1,152,43,194,3,193,196,126,20
  db 38,136,133,250,1
      end;
    end;
    asm
  db 255,118,18,255,118,16
  call pO0EC_0EBF
    end;
    asm
  db 176,11,80,141,126,16,22,87
  call pO0E2_04DD
    end;
    asm
  db 198,70,232,0
    end;
    if pO0A1_2720(pointer(a0), pointer(a1)) <> 0 then
      asm
  db 196,126,16,38,138,133,243,1,48,228,45,4,0,136,70,236
      end
    else
    begin
      asm
  db 196,126,16,38,196,189,231,1,38,128,125,14,1,118,50,255,118,22,255,118,20,255,118,18,255,118,16
  call pO0EC_36C5
  db 196,126,16,38,196,189,231,1,38,58,69,8,117,19,196,126,16,38,196,189,231,1,38,128,125,17,4,118
  db 4,198,70,237,1
      end;
      asm
  db 128,126,237,0,116,4,198,70,232,1
      end;
      asm
  db 138,70,232,152,196,126,16,3,248,38,138,133,242,1,136,70,236
      end;
    end;
    asm
  db 255,118,22,255,118,20,255,118,18,255,118,16,141,126,236,22,87
  push cs
  call near ptr pO0A1_1C3E
    end;
    asm
  db 198,70,233,0
    end;
    if v19b <> 0 then
      asm
  db 198,70,233,1
      end;
    asm
  db 255,118,22,255,118,20,255,118,18,255,118,16
  push cs
  call near ptr pO0A1_2720
  db 8,192,116,4,198,70,233,2
    end;
    asm
  db 196,126,20,38,196,189,231,1,38,138,69,4,136,70,234
    end;
    for v21b := v22b downto 1 do
      asm
  db 138,70,235,48,228,196,126,20,3,248,38,128,189,243,1,0,119,3,233,7,1,128,126,238,0,116,3,233
  db 254,0,138,70,235,48,228,196,126,20,3,248,38,254,141,243,1,138,70,235,196,126,20,38,196,189,231,1
  db 38,136,69,4,138,70,235,48,228,139,248,254,133,214,174,255,118,22,255,118,20,255,118,18,255,118,16,138
  db 70,236,80
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
  db 234,0,138,70,235,48,228,196,126,20,3,248,38,198,133,243,1,0,233,228,254
      end;
    asm
  db 128,126,239,0,117,46,139,70,6,11,70,8,117,9,255,54,252,61
  call pR5A0_0000
  db 255,118,22,255,118,20,255,118,18,255,118,16,138,70,233,80,49,192,80,49,192,80,176,0,80
  push cs
  call near ptr pO0A1_0321
    end;
    asm
  db 196,126,10,38,198,5,1
    end;
    for v21b := 1 to 2 do
      asm
  db 138,70,235,48,228,196,126,20,3,248,38,128,189,243,1,0,118,7,196,126,10,38,198,5,0
      end;
  end;
  asm
  db 196,126,20,38,128,189,238,1,0,117,7,196,126,10,38,198,5,1
  end;
  asm
  db 196,126,10,38,128,61,0,116,17,255,118,22,255,118,20
  call pO0EC_2CF6
  db 196,126,10,38,136,5
  end;
end;

{ 182A }
procedure pO0A1_182A(a0: longint; a1: pointer);
var
  v1b: byte;
  v2b: byte;
begin
  {@1830-183C}
  Inc(PR14_byte(PR487_pointer(a1)^.v)^.v);
  {@183C-1850}
  v2b := pO0EC_36C5(longint(a1), longint(a0));
  {@1850-1874}
  v1b := Byte((v2b - PR8_byte(PR487_pointer(a1)^.v)^.v + 8) mod 8);
  if v1b > 4 then
    v1b := 8 - v1b;
  {@1889-18B3}
  PR17_byte(PR487_pointer(a1)^.v)^.v := Byte((PR17_byte(PR487_pointer(a1)^.v)^.v + v1b) mod 8);
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
  {@18BF-18C4}
  bAEF0 := 1;
  {@18C4-18C9}
  bAEEF := 1;
  {@18C9-18D4}
  bAE8E := bAE8D + 15;
  if (PR14_byte(PR487_pointer(a1)^.v)^.v < 2) and (a2 = 0) then
  begin
    {@18E9-18FD}
    v13b := pO0EC_36C5(longint(a1), longint(a0));
    {@18FD-1918}
    PR8_byte(PR487_pointer(a1)^.v)^.v := Byte((v13b + 4) mod 8);
  end
  else
  begin
    {@191A-195C}
    if pO135_0805(longint(a1), 0) <> 0 then
    begin
      {@192C-193B}
      v13b := PR8_byte(PR487_pointer(a1)^.v)^.v;
      if a2 = 0 then
        PR8_byte(PR487_pointer(a1)^.v)^.v := Byte((v13b + 4) mod 8);
    end;
  end;
  {@195C-1983}
  if pO135_0805(longint(a1), 0) <> 0 then
    pO135_0BAF(pointer(a1), v13b, 0, 0);
  {@1983-1997}
  v13b := pO0EC_36C5(longint(a0), longint(a1));
  {@1997-19A2}
  pO0EC_0C95(pointer(a0));
  {@19A2-19B7}
  pO135_0BAF(pointer(a0), v13b, 1, 0);
  {@19B7-19CD}
  PR9_pointer(PR487_pointer(a0)^.v)^.v := a1;
  {@19CD-19D6}
  Delay(100);
  if a3 <> nil then
    pO0A1_27FA(longint(a0), longint(a1), pointer(a3));
  {@19F4-1A2F}
  if (PR46_byte(PR427_pointer(a0)^.v)^.v = 28) or (PR46_byte(PR427_pointer(a0)^.v)^.v = 29) then
    pO0A1_27FA(longint(a0), longint(a1), pointer(PR427_pointer(a0)^.v));
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
procedure pO0A1_1C3E(a0: pointer; a1: longint; a2: pointer);
var
  v1b: byte;
  v2b: byte;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
begin
  {@1C44-1C58}
  v2b := pO0EC_2C22(longint(a0), longint(a1));
  if pO0EC_3280(pointer(a0)) <> 0 then
    v1b := Byte((a94E2_3981[PR46_byte(PR427_pointer(a0)^.v)^.v].f - 1) div 3)
  else
    v1b := v2b;
  {@1C93-1CC2}
  if (v2sb - v1sb) > 0 then
  begin
    {@1CA3-1CB2}
    v2b := v2sb - v1sb;
    {@1CB2-1CC2}
    PR0_byte(a2)^.v := PR0_byte(a2)^.v + 2;
  end;
  {@1CC2-1CF2}
  if (v2sb - v1sb) > 0 then
  begin
    {@1CD2-1CE1}
    v2b := v2sb - v1sb;
    {@1CE1-1CF2}
    PR0_byte(a2)^.v := PR0_byte(a2)^.v + 3;
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
        {@1E0D-1E2B}
        PR5_byte(a3)^.v := pO135_0CCA(longint(PR0_pointer(a3)^.v));
        {@1E2B-1E2F}
        w2b := 1;
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
  {@1F02-1F10}
  XR670_046E(@PR0_byte(a3)^.v, 7);
end;

{ 1F46 }
procedure pO0A1_1F46(a0: byte; a1: byte; a2: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..3] of byte;
  v12p: pointer;
  v13b: byte;
  v14b: byte;
  v12l: longint absolute v12p;
  v12b: byte absolute v12p;
begin
  if false then begin
    if LV = 'Already been targeted' then;
    if LV = 'Cannot target yourself' then;
  end;
  {@1F4C-1F5A}
  XR670_046E(@bAD3B, 288);
  {@1F5A-1F61}
  PR0_byte(a2)^.v := 1;
  {@1F61-1F66}
  bAD3A := 0;
  {@1F66-1F6B}
  bA7DC := 0;
  {@1F6B-1F7B}
  bAE5B := pO135_0CA2(l9CEE);
  {@1F7B-1F8B}
  bAE5C := pO135_0CCA(l9CEE);
  case a6520_3981[a0].f and 15 of
    0: begin
      {@1FA0-1FAE}
      pAD3B := p9CEE;
      {@1FAE-1FB3}
      bAD3A := 1;
    end;
    5: begin
      {@1FBD-1FC1}
      v5b := 0;
      {@1FC1-1FC5}
      v2b := 0;
      if a0 = 79 then
        v4b := pO0EC_2D90(79, 0)
      else
        v4b := pO0E2_1374(2, 4);
      {@1FE9-1FED}
      v14b := 0;
      {@1FED-2168}
      repeat
        {@1FED-2159}
        if pO0A1_1E3E(a0, a1, 0, @v12b) <> 0 then
        begin
          {@2008-200C}
          v13b := 0;
          for v3b := 1 to v2b do
          begin
            {@2021-2042}
            if aAD37_9f8b[v3b] = v12p then
              v13b := 1;
          end;
          {@204A-2136}
          if v13b = 0 then
          begin
            {@2053-2056}
            Inc(v2b);
            {@2056-206F}
            aAD37_9f8b[v2b] := v12p;
            {@206F-207D}
            bAE5B := pO135_0CA2(v12l);
            {@207D-208B}
            bAE5C := pO135_0CCA(v12l);
            {@208B-208F}
            Inc(bAD3A);
            if a0 <> 79 then
              case PR312_byte(aAD37_9f8b[v2b])^.v of
                0, 1: Inc(v5b);
                2: Inc(v5b, 2);
                3: Inc(v5b, 4);
              else
                {@20CA-20CE}
                Inc(v5b, 8);
              end
            else
              case PR305_byte(aAD37_9f8b[v2b])^.v of
                1: Inc(v5b);
                2, 3: Inc(v5b, 2);
                4: Inc(v5b, 4);
              end;
            {@2103-2115}
            if (v2b > 1) and (v5b > v4b) then
              v14b := 1;
          end
          else
          begin
            {@2117-2136}
            if a1 <> 0 then
              Dec(v4b)
            else
              pO0EC_1AAC('Already been targeted');
          end;
          {@2136-2153}
          pO135_0429(pO135_0CA2(v12l), pO135_0CCA(v12l));
        end
        else
          v14b := 1;
      until (v14b <> 0) or (v4b = 0);
    end;
    8..14: begin
      {@2179-2220}
      if pO0A1_1E3E(a0, a1, 1, @v12b) <> 0 then
      begin
        {@2194-21BB}
        pO130_08D7(bAE5B, bAE5C, a6520_3981[a0].f and 7, 255, 1);
        for v2b := 1 to bA6E4 do
          aAD37_9f8b[v2b] := aA583_9f8b[aA6E2_fd21[v2b].f];
        {@220C-2212}
        bAD3A := bA6E4;
        {@2212-2217}
        bA7DC := 1;
      end
      else
        PR0_byte(a2)^.v := 0;
    end;
    15: begin
      {@222A-2307}
      if pO0A1_1E3E(a0, a1, 0, @v12b) <> 0 then
      begin
        {@2245-22FE}
        if PR9_pointer(PR487_pointer(p9CEE)^.v)^.v <> nil then
        begin
          {@2258-2270}
          pAD3B := PR9_pointer(PR487_pointer(p9CEE)^.v)^.v;
          {@2270-2275}
          bAD3A := 1;
        end
        else
        begin
          {@2278-22A2}
          pO130_08D7(bAE5B, bAE5C, a6520_3981[a0].f shr 4, 255, 1);
          for v2b := 1 to bA6E4 do
            aAD37_9f8b[v2b] := aA583_9f8b[aA6E2_fd21[v2b].f];
          {@22F3-22F9}
          bAD3A := bA6E4;
          {@22F9-22FE}
          bA7DC := 1;
        end;
      end
      else
        PR0_byte(a2)^.v := 0;
    end;
  else
    {@230A-2321}
    v1b := a6520_3981[a0].f and 3 + 1;
    {@2321-2325}
    v2b := 0;
    {@2325-245D}
    while v1b > 0 do
    begin
      {@232E-245A}
      if pO0A1_1E3E(a0, a1, 0, @v12b) <> 0 then
      begin
        {@2349-234D}
        v13b := 0;
        for v3b := 1 to v2b do
        begin
          {@2362-2383}
          if aAD37_9f8b[v3b] = v12p then
            v13b := 1;
        end;
        {@238B-23AD}
        if ((a0 = 23) or (a0 = 49)) and (v12p = p9CEE) then
          v13b := 1;
        {@23AD-2437}
        if v13b = 0 then
        begin
          {@23B3-23B6}
          Inc(v2b);
          {@23B6-23CF}
          aAD37_9f8b[v2b] := v12p;
          {@23CF-23D2}
          Dec(v1b);
          {@23D2-23E0}
          bAE5B := pO135_0CA2(v12l);
          {@23E0-23EE}
          bAE5C := pO135_0CCA(v12l);
        end
        else
        begin
          {@23F0-2437}
          if a1 = 0 then
          begin
            {@23F6-2432}
            if v12p = p9CEE then
              pO0EC_1AAC('Cannot target yourself')
            else
              pO0EC_1AAC('Already been targeted');
          end
          else
            Dec(v1b);
        end;
        {@2437-2454}
        pO135_0429(pO135_0CA2(v12l), pO135_0CCA(v12l));
      end
      else
        v1b := 0;
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
if (v11b <> 0) and (PR14_byte(PR487_pointer(a1)^.v)^.v > 1) and (pO0EC_2C22(longint(a0), longint(a1)) < 2)
      and ((PR305_byte(a1)^.v and 127) <= 1) and (Byte(pO0EC_36C5(longint(a0),
      longint(a1))) = PR8_byte(PR487_pointer(a1)^.v)^.v) then
  begin
    {@27E7-27EB}
    pO0A1_2720 := 1;
    {@27EB-27ED}
    Exit;
  end;
  {@27ED-27F1}
  pO0A1_2720 := 0;
end;

{ 27FA }
procedure pO0A1_27FA(a0: longint; a1: longint; a2: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@2800-2814}
  v2b := pO0EC_36C5(longint(a0), longint(a1));
  {@2814-2818}
  v1b := 1;
  {@2818-281C}
  v3b := 10;
  case PR46_byte(a2)^.v of
    5, 7, 12, 30, 66, 74, 4: begin
      {@283F-284B}
      pO0EC_3E76(v2b, 13);
      {@284B-2854}
      pR5A0_0000(w3E02);
    end;
    2, 3, 6: begin
      {@2863-286B}
      pO0EC_1E6D(16);
      {@286B-286F}
      v1b := 4;
      {@286F-2873}
      v3b := 50;
      {@2873-287C}
      pR5A0_0000(w3DFC);
    end;
    28, 29, 67: begin
      {@288A-289B}
      pO0EC_1CBC(20, 0, 0, 0);
      {@289B-28AC}
      pO0EC_1CBC(20, 1, 1, 0);
      {@28AC-28B0}
      v1b := 2;
      {@28B0-28B4}
      v3b := 10;
      {@28B4-28BD}
      pR5A0_0000(w3DFC);
    end;
  else
    {@28BF-28D0}
    pO0EC_1CBC(19, 0, 0, 0);
    {@28D0-28E1}
    pO0EC_1CBC(19, 1, 1, 0);
    {@28E1-28E5}
    v1b := 2;
    {@28E5-28E9}
    v3b := 20;
    {@28E9-28F2}
    pR5A0_0000(w3DFC);
  end;
  {@28F2-2933}
pO0EC_1F07(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), pO135_0CA2(longint(a1)),
      pO135_0CCA(longint(a1)), v1b, v3b);
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
  (a0: pointer; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte; a7: byte; a8: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..3] of byte;
  v7b: byte;
  v9w: word;
  _f2: array[1..1] of byte;
  v11b: byte;
begin
  if false then begin
    if LV = '  ' then;
  end;
  {@2AC2-2AC7}
  v9w := 255;
  {@2AC7-2AD2}
  v11b := PR6_byte(pA6E0)^.v;
  {@2AD2-2ADB}
  PR6_byte(pA6E0)^.v := 1;
  asm
  db 255,118,26,255,118,24
  call pO135_0CA2
  db 80,255,118,26,255,118,24
  call pO135_0CCA
  db 80,141,126,8,22,87,141,126,6,22,87,141,126,247,22,87
  call pO130_03EC
  db 136,70,246
  end;
  {@2B0A-2B15}
  PR6_byte(pA6E0)^.v := v11b;
  {@2B15-2B1D}
  v9w := v9w shr 1;
  if a3 <> 0 then
    pR47F_0354(0, 23, 10, 0, s21CA + pO0EC_146B(v9w) + '  ');
  {@2B61-2B72}
  FillChar(bAB0E, 40, 255);
  {@2B72-2B76}
  v3b := 0;
  for v2b := 0 to 5 do
  begin
    {@2B7F-2C52}
    if v2b = 3 then
    begin
      {@2B88-2C42}
      if (a2 >= v9w) and (a6 <> 0) then
      begin
        {@2B9E-2C42}
        if a3 = 0 then
        begin
          {@2BA4-2BCD}
          if (a5 <> 0) and (a1 <> nil) or (a4 <> 0) and (a1 = nil) then
            pO108_00AB(3, @v3b);
        end
        else
        begin
          {@2BCF-2C42}
          if a0 <> a1 then
          begin
            {@2BDF-2C42}
            if pO0EC_3280(pointer(a0)) = 0 then
              pO108_00AB(3, @v3b)
            else
            begin
              {@2BFD-2C42}
if (pO0EC_330E(pointer(a0), @v7b) <> 0) and ((pO0EC_2A6F(pointer(a0), 1, 0) = 0)
                  or (pO0EC_32C3(pointer(a0)) <> 0)) then
                pO108_00AB(3, @v3b);
            end;
          end;
        end;
      end;
    end
    else
      pO108_00AB(v2b, @v3b);
  end;
  {@2C5B-2C84}
  if a1 <> nil then
  begin
    {@2C63-2C74}
    pO135_141F(longint(a1), 3, 1);
    {@2C74-2C79}
    bAEEF := 1;
    {@2C79-2C84}
    pO0EC_0C95(pointer(a1));
  end;
  {@2C84-2C9C}
  pO0A1_2ABB := pO108_1009(s2A1C, s3006, 1, 0);
end;

{ 2CA5 }
procedure pO0A1_2CA5(a0: pointer; a1: pointer; a2: byte; a3: pointer; a4: pointer);
var
  _f1: array[1..1] of byte;
  v5p: pointer;
  _f2: array[1..1] of byte;
  v5b: byte absolute v5p;
begin
  {@2CAB-2CB3}
  v5p := nil;
  {@2CB3-2CBA}
  PR0_byte(a3)^.v := 1;
  if (a2 = 1) and (pO0A1_2A57(pointer(a0), pointer(a1)) = 0) then
    PR0_byte(a3)^.v := 0;
  {@2CDB-2DD1}
  if PR0_byte(a3)^.v <> 0 then
  begin
    {@2CE7-2CF7}
    PR0_pointer(a4)^.v := a1;
    {@2CF7-2D09}
    PR4_byte(a4)^.v := pO135_0CA2(longint(a1));
    {@2D09-2D1B}
    PR5_byte(a4)^.v := pO135_0CCA(longint(a1));
    {@2D1B-2D24}
    PR4_byte(pA6E0)^.v := 0;
    {@2D24-2D49}
    pO135_0A4D(PR2_shortint(pA6E0)^.v + 3, PR3_shortint(pA6E0)^.v + 3, 3, 8);
    if a2 = 1 then
    begin
      {@2D52-2D62}
      pO0A1_182A(longint(a0), pointer(a1));
if (pO0EC_3280(pointer(a0)) <> 0) and (pO0EC_330E(pointer(a0), @v5b) <> 0)
          and (pO0EC_32C3(pointer(a0)) <> 0) and (pO0EC_2C22(longint(a0), longint(a1)) = 1) then
        v5p := nil;
      {@2DB1-2DCF}
      pO0A1_18B9(pointer(a0), pointer(a1), 0, v5p, @PR0_byte(a3)^.v);
    end;
    {@2DCF-2DD1}
    Exit;
  end;
  {@2DD1-2DDF}
  XR670_046E(@PR0_byte(a4)^.v, 7);
end;

{ 2DE8 }
procedure pO0A1_2DE8
  (a0: pointer; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte; a6: pointer; a7: pointer;
   a8: pointer; a9: byte; a10: byte);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..3] of byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v16w: word;
  v16b: byte absolute v16w;
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
  {@2E0C-2E1A}
  XR670_046E(@PR0_byte(a8)^.v, 7);
  {@2E1A-2E23}
  PR4_byte(pA6E0)^.v := 1;
  {@2E23-2E2C}
  PR5_byte(pA6E0)^.v := 1;
  {@2E2C-2E30}
  v2b := 255;
  {@2E30-2E34}
  v7b := 8;
  {@2E34-2E39}
  bB16C := 0;
  {@2E39-3339}
  while v2b > 1 do
  begin
    {@2E42-2E56}
    pO135_0A4D(bAEE5, bAEE6, 2, v7b);
    {@2E56-2E65}
    Inc(bAEE5, a3EAC_ec3f[v7b]);
    {@2E65-2E74}
    Inc(bAEE6, a3EB5_ec3f[v7b]);
    if sbAEE5 < 0 then
      bAEE5 := 0;
    {@2E80-2E8C}
    if sbAEE6 < 0 then
      bAEE6 := 0;
    {@2E8C-2E98}
    if sbAEE5 > 49 then
      bAEE5 := 49;
    {@2E98-2EA4}
    if sbAEE6 > 24 then
      bAEE6 := 24;
    {@2EA4-2EBB}
    pO135_060F(bAEE5, bAEE6, @v11b, @v12b);
    {@2EBB-2EC0}
    pR670_0311;
    {@2EC0-2EC7}
    PR0_byte(a6)^.v := 0;
    {@2EC7-2ECC}
    v16w := 255;
    {@2ECC-2ED2}
    v9b := bAEE5;
    {@2ED2-2ED8}
    v10b := bAEE6;
    if pO130_03EC(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), @v9b, @v10b, @v16b) <> 0 then
    begin
      {@2F08-2F0F}
      PR0_byte(a6)^.v := 1;
      if a3 <> 0 then
        pR47F_0354(0, 23, 10, 0, s21CA + pO0EC_146B(v16w shr 1) + '  ');
    end
    else
    begin
      {@2F58-2F6F}
      if a3 <> 0 then
        pR142_0217(0, 23, 39, 23);
    end;
    {@2F6F-2F77}
    v16w := v16w shr 1;
    {@2F77-2F7F}
    a1 := nil;
    if PR0_byte(a6)^.v <> 0 then
    begin
      {@2F8B-3015}
      if v11b > 0 then
        a1 := aA583_9f8b[v11b]
      else
      begin
        {@2FAC-3015}
        if v12b = 31 then
          for v8b := 1 to bA6DF do
          begin
            {@2FC7-300D}
            if (aA6A4_30da[v8b].f = bAEE5) and (aA6A5_30da[v8b].f = bAEE6) then
              a1 := aA6A0_b509[v8b].f;
          end;
      end;
    end;
    {@3015-3040}
    if a1 <> nil then
    begin
      {@301D-3022}
      bAEEF := 1;
      {@3022-302D}
      pO0EC_0C95(pointer(a1));
    end
    else
      pR142_0217(23, 1, 38, 21);
    {@3040-3063}
    if (a2 < v16w) or (a3EBA_2a50[v12b].f = 255) then
      PR0_byte(a6)^.v := 0;
    {@3063-311A}
    if a1 <> nil then
    begin
      {@306E-3092}
      if (pO0A1_0FAE(pointer(a0), pointer(a1), 1) = 0) or (a5 = 0) then
        PR0_byte(a6)^.v := 0;
      {@3092-310B}
      if a3 = 1 then
      begin
        {@3098-310B}
        if (a0 = a1) or (v11b = 0) and (v12b = 31) then
          PR0_byte(a6)^.v := 0
        else
        begin
          {@30BD-310B}
if (pO0EC_3280(pointer(a0)) <> 0) and ((pO0EC_330E(pointer(a0), @v6b) = 0)
              or (pO0EC_2A6F(pointer(a0), 1, 0) > 0) and (pO0EC_32C3(pointer(a0)) = 0)) then
            PR0_byte(a6)^.v := 0;
        end;
      end;
    end
    else
    begin
      {@310D-311A}
      if a4 = 0 then
        PR0_byte(a6)^.v := 0;
    end;
    {@311A-312B}
    FillChar(bAB0E, 40, 255);
    {@312B-312F}
    v1b := 0;
    if PR0_byte(a6)^.v <> 0 then
      pO108_00AB(0, @v1b)
    else
      pO108_00AB(1, @v1b);
    {@3154-316C}
    v2b := pO108_1009(s2A45, s302F, 1, 0);
    if bAAE6 <> 0 then
      case v2b of
        72: v7b := 0;
        73: v7b := 1;
        77: v7b := 2;
        81: v7b := 3;
        80: v7b := 4;
        79: v7b := 5;
        75: v7b := 6;
        71: v7b := 7;
        32: begin
          {@31D5-31E8}
          pO135_0A4D(bAEE5, bAEE6, 0, 8);
          {@31E8-31EC}
          v7b := 8;
        end;
        27: begin
          {@31F2-31F9}
          PR0_byte(a7)^.v := 0;
          {@31F9-3206}
          pO135_0429(bAEE5, bAEE6);
          {@3206-3214}
          XR670_046E(@PR0_byte(a8)^.v, 7);
          {@3214-321E}
          PR4_byte(a8)^.v := v13b;
          {@321E-3228}
          PR5_byte(a8)^.v := v14b;
          {@3228-323B}
          pO135_0A4D(v13b, v14b, 0, 8);
          {@323B-3244}
          PR4_byte(pA6E0)^.v := 0;
          {@3244-3251}
          pO135_0429(v13b, v14b);
          {@3251-3256}
          bB16C := 0;
          {@3256-325A}
          v2b := 1;
        end;
      else
        {@325C-3260}
        v7b := 8;
      end
    else
      case v2b of
        0: begin
          {@326A-3271}
          PR0_byte(a7)^.v := 1;
          {@3271-327B}
          PR4_byte(a8)^.v := bAEE5;
          {@327B-3285}
          PR5_byte(a8)^.v := bAEE6;
          if a1 <> nil then
            PR0_pointer(a8)^.v := a1
          else
            PR0_pointer(a8)^.v := nil;
          {@32AB-32B4}
          PR4_byte(pA6E0)^.v := 0;
          {@32B4-32C1}
          pO135_0429(bAEE5, bAEE6);
          {@32C1-32C6}
          bB16C := 0;
        end;
        1: begin
          {@32CC-32D3}
          PR0_byte(a7)^.v := 0;
          {@32D3-32E0}
          pO135_0429(bAEE5, bAEE6);
          {@32E0-32EE}
          XR670_046E(@PR0_byte(a8)^.v, 7);
          {@32EE-32F8}
          PR4_byte(a8)^.v := v13b;
          {@32F8-3302}
          PR5_byte(a8)^.v := v14b;
          {@3302-3315}
          pO135_0A4D(v13b, v14b, 0, 8);
          {@3315-331E}
          PR4_byte(pA6E0)^.v := 0;
          {@331E-332B}
          pO135_0429(v13b, v14b);
          {@332B-3330}
          bB16C := 0;
        end;
      else
        {@3332-3336}
        v7b := 8;
      end;
  end;
  {@3339-333E}
  bAEE7 := 0;
end;

{ 3713 }
procedure pO0A1_3713(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte; a5: pointer; a6: pointer);
var
  _f1: array[1..216] of byte;
c219: record case byte of 0: (v219a: array[0..0] of X3); 1: (v219b: byte); 2: (_p2: array[1..1] of byte;
      v218b: byte); 3: (_p3: array[1..2] of byte; v217b: byte) end;
  _f2: array[1..5] of byte;
  v228p: pointer;
  v229b: byte;
  v230b: byte;
  v231b: byte;
  v232b: byte;
  v233b: byte;
  v234b: byte;
  v235b: byte;
  v236b: byte;
  _f3: array[1..2] of byte;
  v228l: longint absolute v228p;
  { 3344 }
  function pO0A1_3344(b0: byte): pointer;
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
  var
    w1b: byte;
    w5p: pointer;
  begin
    {@358C-3595}
    c219.v219b := 1;
    {@3595-35D4}
  pO130_08D7(pO135_0CA2(longint(pointer(a0))), pO135_0CCA(longint(pointer(a0))), 255, 255,
        pO135_0CF2(longint(pointer(a0))));
    {@35D4-35DD}
    c219.v218b := 0;
    for w1b := 1 to bA6E4 do
    begin
      {@35F5-361C}
      w5p := aA583_9f8b[aA6E2_fd21[w1b].f];
      if pO0A1_0FAE(pointer(pointer(a0)), w5p, 0) <> 0 then
      begin
        {@3638-3640}
        Inc(c219.v218b);
        {@3640-3677}
        c219.v219a[c219.v218b] := aA6E2_89af[w1b];
        if w5p = PR9_pointer(PR487_pointer(pointer(a0))^.v)^.v then
          c219.v219b := c219.v218b;
      end;
    end;
    asm
    db 176,0,80,255,118,6
    push cs
    call near ptr pO0A1_3344
    db 139,126,6,54,137,133,28,255,54,137,149,30,255
    end;
    if v228p <> pointer(a0) then
    begin
      {@36E3-36E8}
      bAB0D := 255;
      {@36E8-36ED}
      bAAE5 := 4;
    end;
  end;

begin
  if false then begin
    if LSV = [0..1, 3] then;
  end;
  {@371A-371F}
  bAAE5 := 1;
  {@371F-3730}
  pO0EC_1CBC(28, 0, 0, 0);
  {@3730-373E}
  XR670_046E(@PR0_byte(a6)^.v, 7);
  {@373E-3745}
  PR0_byte(a5)^.v := 0;
  {@3745-374C}
  c219.v217b := a1;
  if c219.v217b = 255 then
  begin
    {@3753-3785}
    if PR427_pointer(pointer(a0))^.v <> nil then
      c219.v217b := a94E2_3981[PR46_byte(PR427_pointer(pointer(a0))^.v)^.v].f
    else
      c219.v217b := 1;
  end;
  {@3785-3798}
  if (c219.v217b = 0) or (c219.v217b = 255) then
    c219.v217b := 1;
  {@3798-37A7}
  v235b := pO135_0CA2(longint(pointer(a0)));
  {@37A7-37B6}
  v236b := pO135_0CCA(longint(pointer(a0)));
  {@37B6-37C5}
  pO135_0429(v235b, v236b);
  {@37C5-37CA}
  pO0A1_3586;
  {@37CA-37DB}
  v233b := pO135_0CA2(v228l);
  {@37DB-37EC}
  v234b := pO135_0CCA(v228l);
  {@37EC-37F1}
  v230b := 1;
  {@37F1-37F6}
  v232b := 0;
  {@37F6-3B32}
  while v232b = 0 do
  begin
    {@3800-3836}
    v229b := pO0A1_2ABB(pointer(pointer(a0)), v228p, c219.v217b, a2, a3, a4, v230b, v233b, v234b);
    if bAAE6 = 0 then
      case v229b of
        0: begin
          {@3848-384D}
          v230b := 1;
          {@384D-385D}
          v228p := pO0A1_3344(1);
        end;
        1: begin
          {@3864-3869}
          v230b := 1;
          {@3869-3879}
          v228p := pO0A1_3344(255);
        end;
        2: begin
          {@3883-38C1}
pO0A1_2DE8(pointer(pointer(a0)), v228p, c219.v217b, a2, a3, a4, @v230b, @v231b, @PR0_byte(a6)^.v, v233b,
              v234b);
          {@38C1-38D3}
          v228p := PR0_pointer(a6)^.v;
          {@38D3-38DE}
          v233b := PR4_byte(a6)^.v;
          {@38DE-38E9}
          v234b := PR5_byte(a6)^.v;
          if (v230b <> 0) and (v231b <> 0) then
          begin
            {@38FD-3902}
            v229b := 3;
            {@3902-3907}
            v232b := 1;
            {@3907-390C}
            bAAE5 := 4;
            if v228p <> nil then
              PR0_pointer(a6)^.v := v228p
            else
              PR0_pointer(a6)^.v := nil;
            {@3936-393D}
            PR0_byte(a5)^.v := 1;
            if a2 = 1 then
              pO0A1_2CA5(pointer(pointer(a0)), v228p, a2, @PR0_byte(a5)^.v, @PR0_byte(a6)^.v);
            {@3963-398A}
            if PR0_byte(a5)^.v = 0 then
            begin
              {@396C-3975}
              PR4_byte(pA6E0)^.v := 0;
              {@3975-398A}
              pO135_0A4D(v233b, v234b, 0, 8);
            end;
          end
          else
          begin
            {@398C-39AB}
            if (pointer(a0) <> nil) and (v231b = 0) then
            begin
              {@399B-39A0}
              bAEEF := 1;
              {@39A0-39AB}
              pO0EC_0C95(pointer(pointer(a0)));
            end;
            {@39AB-39B0}
            bAAE5 := 3;
          end;
        end;
        3: begin
          {@39BA-39C5}
          PR4_byte(a6)^.v := v233b;
          {@39C5-39D0}
          PR5_byte(a6)^.v := v234b;
          if v228p <> nil then
            PR0_pointer(a6)^.v := v228p
          else
            PR0_pointer(a6)^.v := nil;
          {@39FA-3A01}
          PR0_byte(a5)^.v := 1;
          if a2 = 1 then
            pO0A1_2CA5(pointer(pointer(a0)), v228p, a2, @PR0_byte(a5)^.v, @PR0_byte(a6)^.v);
          {@3A27-3A4E}
          if PR0_byte(a5)^.v = 0 then
          begin
            {@3A30-3A39}
            PR4_byte(pA6E0)^.v := 0;
            {@3A39-3A4E}
            pO135_0A4D(v233b, v234b, 0, 8);
          end;
          {@3A4E-3A53}
          v232b := 1;
        end;
        4: begin
          {@3A59-3A62}
          PR4_byte(pA6E0)^.v := 1;
          {@3A62-3A6B}
          PR5_byte(pA6E0)^.v := 1;
          {@3A6B-3A80}
          pO135_0A4D(v233b, v234b, 0, 8);
          {@3A80-3A89}
          PR4_byte(pA6E0)^.v := 0;
        end;
        5: begin
          {@3A8F-3A98}
          PR4_byte(pA6E0)^.v := 0;
          {@3A98-3AAD}
          pO135_0A4D(v233b, v234b, 0, 8);
          {@3AAD-3AB2}
          v232b := 1;
        end;
      end
    else
    begin
      {@3AB4-3AF2}
      if v229b = 27 then
      begin
        {@3ABB-3AC4}
        PR4_byte(pA6E0)^.v := 0;
        {@3AC4-3AD3}
        pO135_0429(v233b, v234b);
        {@3AD3-3AE8}
        pO135_0A4D(v235b, v236b, 0, 8);
        {@3AE8-3AED}
        v229b := 5;
        {@3AED-3AF2}
        v232b := 1;
      end;
    end;
    {@3AF2-3B2F}
    if (v229b in [0..1, 3]) and (v228p <> nil) then
    begin
      {@3B0D-3B1E}
      v233b := pO135_0CA2(v228l);
      {@3B1E-3B2F}
      v234b := pO135_0CCA(v228l);
    end;
  end;
  {@3B32-3B49}
  if a2 <> 0 then
    pR142_0217(0, 23, 39, 23);
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
  v4b: byte;
  v5b: byte;
  v6b: byte;
  _f1: array[1..2] of byte;
  v2sb: shortint absolute v2b;
begin
  {@41F5-41F9}
  pO0A1_41EF := 0;
  if a6528_3981[a1].f = 0 then
    v3b := PR495_byte(a0)^.v
  else
    v3b := pO0EC_29F3(pointer(a0));
  {@4226-42E5}
  if a6520_3981[a1].f = 0 then
    v2b := pO0A1_3E58(pointer(a0), a1, v3b)
  else
  begin
    {@4250-425C}
    v6b := pO0BB_0D5B(a1);
    {@425C-428E}
    pO130_08D7(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), v6b, 255, pO135_0CF2(longint(a0)));
    {@428E-4294}
    v5b := bA6E4;
    {@4294-4298}
    v4b := 1;
    {@4298-429C}
    v2b := 0;
    if v5b > 0 then
      while (v4b <= v5b) and (v2sb <= 0) do
      begin
        {@42B0-42E0}
        v2b := pO0A1_3E58(pointer(aA583_9f8b[aA6E2_fd21[v4b].f]), a1, v3b);
        {@42E0-42E3}
        Inc(v4b);
      end;
  end;
  {@42E5-42EB}
  pO0A1_41EF := v2b;
end;

{ 4334 }
function pO0A1_4334(a0: byte; a1: pointer): byte;
var
  v5p: pointer;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  _f1: array[1..4] of byte;
  v16p: pointer;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  v20b: byte;
  v21b: byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  v25sb: shortint;
  v26sb: shortint;
  v27b: byte;
  v28b: byte;
  v29b: byte;
  v30b: byte;
  v31b: byte;
  v32b: byte;
  v33b: byte;
  v34b: byte;
  v35b: byte;
  v36b: byte;
  v37b: byte;
  v38b: byte;
  v39b: byte;
  v40b: byte;
  _f2: array[1..1] of byte;
  v43w: word;
  _f3: array[1..8] of byte;
  v52b: byte;
  v43b: byte absolute v43w;
  v40sb: shortint absolute v40b;
  v39sb: shortint absolute v39b;
  v38sb: shortint absolute v38b;
  v37sb: shortint absolute v37b;
  v36sb: shortint absolute v36b;
  v35sb: shortint absolute v35b;
  v34sb: shortint absolute v34b;
  v33sb: shortint absolute v33b;
  v32sb: shortint absolute v32b;
  v31sb: shortint absolute v31b;
  v30sb: shortint absolute v30b;
  v29sb: shortint absolute v29b;
  v28sb: shortint absolute v28b;
  v27sb: shortint absolute v27b;
  v26b: byte absolute v26sb;
  v25b: byte absolute v25sb;
  v22sb: shortint absolute v22b;
  v21sb: shortint absolute v21b;
  v20sb: shortint absolute v20b;
  v19sb: shortint absolute v19b;
  v18sb: shortint absolute v18b;
  v17sb: shortint absolute v17b;
  v16l: longint absolute v16p;
begin
  if false then begin
    if LSV = [34, 101] then;
    if LSV = [34, 91] then;
  end;
  {@433A-436A}
  if a6528_3981[a0].f = 0 then
    v52b := PR495_byte(p9CEE)^.v
  else
    v52b := pO0EC_29F3(p9CEE);
  {@436A-436E}
  pO0A1_4334 := 0;
  {@436E-4385}
  v6b := a6520_3981[a0].f - 8;
  if ((a0 = 47) or (a0 = 115)) and (PR33_byte(p87F8)^.v = 0) then
    Dec(v6b);
  {@439F-43A7}
  v16p := nil;
  {@43A7-43BE}
  v7b := v6b + pO0BB_0D5B(a0);
  if v7b > 18 then
  begin
    {@43C4-43C8}
    v7b := 18;
    asm
  db 196,62,238,156,38,196,189,231,1,38,139,69,9,38,139,85,11,137,70,240,137,86,242
    end;
  end;
  asm
  db 138,70,250,48,228,139,208,138,70,249,48,228,43,194,136,70,248
  end;
  if v16p = nil then
    v16p := p9CEE;
  {@4405-4413}
  v17b := pO135_0CA2(v16l);
  {@4413-4421}
  v18b := pO135_0CCA(v16l);
  if a0 in [34, 101] then
  begin
    {@4431-4441}
    v36b := v17sb - v8b;
    {@4441-4451}
    v35b := v18sb - v8b;
  end
  else
  begin
    {@4453-4463}
    v36b := v17sb - v7b;
    {@4463-4473}
    v35b := v18sb - v7b;
  end;
  {@4473-4483}
  v40b := v17sb - v8b;
  {@4483-4493}
  v39b := v18sb - v8b;
  {@4493-44A3}
  v34b := v17sb + v7b;
  {@44A3-44B3}
  v33b := v18sb + v7b;
  {@44B3-44C3}
  v38b := v17sb + v8b;
  {@44C3-44D3}
  v37b := v18sb + v8b;
  {@44D3-44E2}
  GetMem(v5p, 1369);
  {@44E2-44F0}
  XR670_046E(@PR0_byte(v5p)^.v, 1369);
  {@44F0-44FD}
  v16p := p9CF2;
  {@44FD-46EF}
  while v16p <> nil do
  begin
    {@4508-4516}
    v19b := pO135_0CA2(v16l);
    {@4516-4524}
    v20b := pO135_0CCA(v16l);
if (PR494_byte(v16p)^.v <> 0) and (v19sb >= v36sb) and (v19sb <= v34sb) and (v20sb >= v35sb)
        and (v20sb <= v33sb) then
    begin
      {@455E-4573}
      v31b := pO0A1_3E58(v16p, a0, v52b);
      if a0 in [34, 91] then
        v29b := 0
      else
        v29b := -v6b;
      {@4593-4599}
      v30b := v6b;
      if (v29sb + v20sb) < v39sb then
        v29b := v39sb - v20sb;
      {@45BE-45E3}
      if (v30sb + v20sb) > v37sb then
        v30b := v37sb - v20sb;
      {@45E3-46D9}
      for v26sb := v29b to v30b do
      begin
        {@45FC-4639}
        if a0 in [34, 91] then
          v27b := v19b
        else
          v27b := v19sb - a0A9E_c143[v26sb, v6b];
        {@4639-465E}
        v28b := v19sb + a0A9E_c143[v26sb, v6b];
        if v27sb < v40sb then
          v27b := v40b;
        {@466C-467A}
        if v28sb > v38sb then
          v28b := v38b;
        {@467A-46CE}
        for v25sb := v27b to v28b do
          Inc(PRB684_37_byte(v5p)^.a[v25sb - v17sb, Integer(v26sb + v20sb) - v18sb], v31b);
      end;
    end;
    {@46D9-46EC}
    v16p := PR483_pointer(v16p)^.v;
  end;
  {@46EF-46FF}
  v23b := pO135_0CA2(l9CEE);
  {@46FF-470F}
  v24b := pO135_0CCA(l9CEE);
  {@470F-4713}
  v32b := 0;
  for v25sb := -v8b to v8b do
    for v26sb := -v8b to v8b do
    begin
      {@474D-476B}
      v31b := PRB684_37_byte(v5p)^.a[v25sb, v26sb];
      if (v31sb > v32sb) or (v31b = v32b) and (v31sb > 0) and (pO0EC_0000(25) <> 0) then
      begin
        {@4796-479C}
        v19b := v23b;
        {@479C-47A2}
        v20b := v24b;
        {@47A2-47B0}
        v43w := pO0BB_0D5B(a0);
if ((v17sb + v25sb) >= 0) and ((v17sb + v25sb) <= 49) and ((v18sb + v26sb) >= 0) and ((v18sb
            + v26sb) < 24) and (pO130_03EC(v17sb + v25sb, v18sb + v26sb, @v19b, @v20b, @v43b) <> 0) then
        begin
          {@4824-482A}
          v21b := v25b;
          {@482A-4830}
          v22b := v26b;
          {@4830-4836}
          v32b := v31b;
        end;
      end;
    end;
  {@484C-4858}
  PR0_longint(a1)^.v := 0;
  if v32sb > 0 then
  begin
    {@485E-4862}
    pO0A1_4334 := 1;
    {@4862-4875}
    PR4_byte(a1)^.v := v21sb + v17sb;
    {@4875-4888}
    PR5_byte(a1)^.v := v22sb + v18sb;
  end
  else
  begin
    {@488A-488E}
    pO0A1_4334 := 0;
    {@488E-489A}
    PR0_longint(a1)^.v := 0;
  end;
  {@489A-48A9}
  FreeMem(v5p, 1369);
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
  v1b: byte;
  v3w: word;
  v4b: byte;
  v5b: byte;
  _f1: array[1..1] of byte;
  v10l: longint;
  v10p: pointer absolute v10l;
  v3b: byte absolute v3w;
  { 4A85 }
  procedure pO0A1_4A85(b0: byte);
  begin
    {@4A88-4A91}
    pO0EC_1E6D(b0);
    {@4A91-4AEA}
  pO0EC_1F07(pO135_0CA2(longint(PR0_longint(a0)^.v)), pO135_0CCA(longint(PR0_longint(a0)^.v)),
        pO135_0CA2(longint(v10l)), pO135_0CCA(longint(v10l)), 1, 30);
  end;

  { 4AEE }
  procedure pO0A1_4AEE(b0: byte);
  var
    w1b: byte;
    w2b: byte;
  begin
    {@4AF4-4AFC}
    v5b := 1;
    {@4AFC-4B22}
    if pO0A1_3B4F(pointer(PR0_pointer(a0)^.v), 255, 0, b0, 0) = 0 then
      Exit;
    {@4B22-4B41}
    w1b := pO135_0CA2(longint(PR9_longint(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v));
    {@4B41-4B60}
    w2b := pO135_0CCA(longint(PR9_longint(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v));
  if pO130_03EC(pO135_0CA2(longint(PR0_pointer(a0)^.v)), pO135_0CCA(longint(PR0_pointer(a0)^.v)), @w1b, @w2b,
        @v3b) <> 0 then
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
  {@4C39-4C3D}
  v4b := 0;
  {@4C3D-4C41}
  v1b := 4;
  {@4C41-4C45}
  v5b := 0;
  {@4C45-4C5A}
  PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := nil;
  {@4C5A-4C62}
  pO0A1_4AEE(1);
  {@4C62-4F3E}
  repeat
    {@4C62-4C67}
    bA7D2 := 8;
    {@4C67-4C80}
    v10p := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    {@4C80-4C9A}
    v3w := pO0EC_2C22(longint(PR0_pointer(a0)^.v), v10l);
    {@4C9A-4C9D}
    Dec(v1b);
    if v10p <> nil then
    begin
      {@4CA8-4F20}
      if (v3w <= 2) and ((v4b and 1) = 0) then
      begin
        {@4CB7-4CBF}
        v4b := v4b or 1;
        {@4CBF-4CE3}
        pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'fires a disintegrate ray', 10, 1);
        {@4CE3-4CEB}
        pO0A1_4A85(17);
        if pO0E2_12C9(v10p, 3, 0) = 0 then
          pO0E2_0000(v10p, 8, 'is disintegrated');
        {@4D1D-4D25}
        pO0A1_4AEE(0);
      end
      else
      begin
        {@4D28-4F20}
        if (v3w <= 3) and ((v4b and 2) = 0) then
        begin
          {@4D37-4D3F}
          v4b := v4b or 2;
          {@4D3F-4D63}
          pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'fires a flesh to stone ray', 10, 1);
          {@4D63-4D6B}
          pO0A1_4A85(17);
          if pO0E2_12C9(v10p, 1, 0) = 0 then
            pO0E2_0000(v10p, 7, 'is Stoned');
          {@4D9D-4DA5}
          pO0A1_4AEE(0);
        end
        else
        begin
          {@4DA8-4F20}
          if (v3w <= 4) and ((v4b and 4) = 0) then
          begin
            {@4DBA-4DBF}
            bA7D2 := 72;
            {@4DBF-4DC7}
            v4b := v4b or 4;
            {@4DC7-4DEB}
            pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'fires a death ray', 10, 1);
            {@4DEB-4DF3}
            pO0A1_4A85(17);
            if pO0E2_12C9(v10p, 0, 0) = 0 then
              pO0E2_0000(v10p, 6, 'is killed');
            {@4E25-4E2D}
            pO0A1_4AEE(0);
          end
          else
          begin
            {@4E30-4F20}
            if (v3w <= 5) and ((v4b and 8) = 0) then
            begin
              {@4E3F-4E47}
              v4b := v4b or 8;
              {@4E47-4E6B}
              pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'Causes Serious Wounds', 10, 1);
              {@4E6B-4E73}
              pO0A1_4A85(17);
              {@4E73-4E78}
              bA7D5 := 66;
              {@4E78-4E96}
              pO0E2_1D19(v10p, pO0E2_13BF(2, 8) + 1, 0, 0);
              {@4E96-4E9E}
              pO0A1_4AEE(0);
            end
            else
            begin
              {@4EA1-4F20}
              if (v4b and 16) = 0 then
              begin
                {@4EAA-4EAF}
                bA7D5 := 84;
                {@4EAF-4EC2}
                pO0BB_121C(84, 1, 1, @v5b);
                {@4EC2-4ECA}
                v4b := v4b or 16;
              end
              else
              begin
                {@4ECC-4F20}
                if (v4b and 32) = 0 then
                begin
                  {@4ED5-4EDA}
                  bA7D5 := 55;
                  {@4EDA-4EED}
                  pO0BB_121C(55, 1, 1, @v5b);
                  {@4EED-4EF5}
                  v4b := v4b or 32;
                end
                else
                begin
                  {@4EF7-4F20}
                  if (v4b and 64) = 0 then
                  begin
                    {@4F00-4F05}
                    bA7D5 := 21;
                    {@4F05-4F18}
                    pO0BB_121C(21, 1, 1, @v5b);
                    {@4F18-4F20}
                    v4b := v4b or 64;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  until (v1b <= 0) or (PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v = nil);
end;

{ 4F44 }
begin
end.

