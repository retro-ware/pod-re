{ O0EC: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0EC;

interface

uses GAMEDATA;

function pO0EC_0000(a0: byte): byte;
procedure pO0EC_0484(a0: longint; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte);
procedure pO0EC_07C0(a0: pointer);
procedure pO0EC_0987(a0: pointer; a1: byte);
procedure pO0EC_0BAA(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte);
procedure pO0EC_0B21(a0: pointer; a1: byte; a2: byte);
procedure pO0EC_0C95(a0: pointer);
function pO0EC_0E7A(a0: pointer): byte;
procedure pO0EC_0EBF(a0: pointer);
function pO0EC_14A5(a0: longint): string;
function pO0EC_146B(a0: word): string;
function pO0EC_142F(a0: byte): string;
function pO0EC_1560(a0: pointer): shortint;
function pO0EC_1712(a0: pointer): shortint;
function pO0EC_178D(a0: pointer): integer;
procedure pO0EC_186D(a0: pointer; a1: byte);
procedure pO0EC_18EF(a0: pointer; a1: pointer);
procedure pO0EC_19DE(a0: pointer; a1: pointer);
procedure pO0EC_1AAC(a0: S40);
procedure pO0EC_1B08(a0: pointer; a1: string; a2: byte; a3: byte);
procedure pO0EC_1BEF;
procedure pO0EC_1C22(a0: pointer; a1: byte; a2: byte; a3: byte);
procedure pO0EC_1CBC(a0: byte; a1: byte; a2: byte; a3: byte);
procedure pO0EC_1E6D(a0: byte);
procedure pO0EC_1F07(a0: word; a1: word; a2: word; a3: word; a4: byte; a5: byte);
procedure pO0EC_2601(a0: pointer; a1: byte; a2: string);
function pO0EC_27C1(a0: pointer; a1: byte; a2: pointer): byte;
procedure pO0EC_2851(a0: pointer; a1: word);
procedure pO0EC_296E(a0: pointer);
function pO0EC_29F3(a0: pointer): byte;
procedure pO0EC_2A17;
function pO0EC_2A6F(a0: pointer; a1: byte; a2: byte): byte;
function pO0EC_2C22(a0: longint; a1: longint): byte;
function pO0EC_2CF6(a0: pointer): byte;
function pO0EC_2D45(a0: pointer): byte;
function pO0EC_2D90(a0: byte; a1: byte): byte;
procedure pO0EC_3497(a0: S40; a1: byte; a2: byte; a3: pointer);
procedure pO0EC_2ED1;
procedure pO0EC_301C;
procedure pO0EC_324C;
function pO0EC_3280(a0: pointer): byte;
function pO0EC_32C3(a0: pointer): byte;
function pO0EC_330E(a0: pointer; a1: pointer): byte;
function pO0EC_12E6(a0: pointer): byte;
function pO0EC_33E6(a0: byte): byte;
function pO0EC_36C5(a0: longint; a1: longint): byte;
function pO0EC_38FA(a0: pointer): byte;
procedure pO0EC_3B46(a0: byte; a1: byte; a2: byte);
function pO0EC_3D89(a0: pointer; a1: byte): shortint;
procedure pO0EC_3E0E;
procedure pO0EC_3E76(a0: byte; a1: byte);

implementation

uses LIT, Crt, O102, O108, O10E, O111, O130, O135, R142, R1C3, R47F, R5A0, R670;

type
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E3_byte = record f: byte; _r: array[1..2] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R0_integer = record v: integer end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R0_word = record v: word end;
  R13_byte = record _p: array[1..13] of byte; v: byte end;
  R15_byte = record _p: array[1..15] of byte; v: byte end;
  R172_byte = record _p: array[1..172] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R18_word = record _p: array[1..18] of byte; v: word end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R23_byte = record _p: array[1..23] of byte; v: byte end;
  R23_pointer = record _p: array[1..23] of byte; v: pointer end;
  R24_byte = record _p: array[1..24] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R27_shortint = record _p: array[1..27] of byte; v: shortint end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R311_byte = record _p: array[1..311] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R368_byte = record _p: array[1..368] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R427_longint = record _p: array[1..427] of byte; v: longint end;
  R427_pointer = record _p: array[1..427] of byte; v: pointer end;
  R42_longint = record _p: array[1..42] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R463_pointer = record _p: array[1..463] of byte; v: pointer end;
  R467_pointer = record _p: array[1..467] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R471_pointer = record _p: array[1..471] of byte; v: pointer end;
  R475_pointer = record _p: array[1..475] of byte; v: pointer end;
  R479_byte = record _p: array[1..479] of byte; v: byte end;
  R480_byte = record _p: array[1..480] of byte; v: byte end;
  R480_shortint = record _p: array[1..480] of byte; v: shortint end;
  R481_word = record _p: array[1..481] of byte; v: word end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R492_byte = record _p: array[1..492] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R493_shortint = record _p: array[1..493] of byte; v: shortint end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R495_shortint = record _p: array[1..495] of byte; v: shortint end;
  R497_byte = record _p: array[1..497] of byte; v: byte end;
  R498_byte = record _p: array[1..498] of byte; v: byte end;
  R499_byte = record _p: array[1..499] of byte; v: byte end;
  R49_byte = record _p: array[1..49] of byte; v: byte end;
  R4_byte = record _p: array[1..4] of byte; v: byte end;
  R502_byte = record _p: array[1..502] of byte; v: byte end;
  R504_byte = record _p: array[1..504] of byte; v: byte end;
  R506_byte = record _p: array[1..506] of byte; v: byte end;
  R506_shortint = record _p: array[1..506] of byte; v: shortint end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R509_byte = record _p: array[1..509] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R50_shortint = record _p: array[1..50] of byte; v: shortint end;
  R51_shortint = record _p: array[1..51] of byte; v: shortint end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R53_byte = record _p: array[1..53] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R55_word = record _p: array[1..55] of byte; v: word end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_byte = record _p: array[1..5] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  R5_shortint = record _p: array[1..5] of byte; v: shortint end;
  R6_byte = record _p: array[1..6] of byte; v: byte end;
  R7_byte = record _p: array[1..7] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  RA27_byte = record _p: array[1..27] of byte; a: array[0..32000] of byte end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA331_word = record _p: array[1..331] of byte; a: array[0..16000] of word end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA361_byte = record _p: array[1..361] of byte; a: array[0..32000] of byte end;
  RA363_byte = record _p: array[1..363] of byte; a: array[0..32000] of byte end;
  RA365_byte = record _p: array[1..365] of byte; a: array[0..32000] of byte end;
  RA427_longint = record _p: array[1..427] of byte; a: array[0..8000] of longint end;
  RA427_pointer = record _p: array[1..427] of byte; a: array[0..8000] of pointer end;
  RA46_byte = record _p: array[1..46] of byte; a: array[0..32000] of byte end;
  RA501_byte = record _p: array[1..501] of byte; a: array[0..32000] of byte end;
  RA503_byte = record _p: array[1..503] of byte; a: array[0..32000] of byte end;
  RA505_byte = record _p: array[1..505] of byte; a: array[0..32000] of byte end;
W10_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W12_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W14_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W16_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W18_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W20_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W4_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
W8_13_38FA = record case byte of 0: (_p0: array[1..17] of byte; _w13_17byte: byte);
      1: (_p1: array[1..19] of byte; _w13_19byte: byte); 2: (_p2: array[1..173] of byte;
      _w13_173byte: byte) end;
  PR0_byte = ^R0_byte;
  PR0_integer = ^R0_integer;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR0_word = ^R0_word;
  PR13_byte = ^R13_byte;
  PR15_byte = ^R15_byte;
  PR172_byte = ^R172_byte;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR178_byte = ^R178_byte;
  PR17_byte = ^R17_byte;
  PR18_byte = ^R18_byte;
  PR18_word = ^R18_word;
  PR1_byte = ^R1_byte;
  PR22_byte = ^R22_byte;
  PR23_byte = ^R23_byte;
  PR23_pointer = ^R23_pointer;
  PR24_byte = ^R24_byte;
  PR25_byte = ^R25_byte;
  PR27_byte = ^R27_byte;
  PR27_shortint = ^R27_shortint;
  PR28_byte = ^R28_byte;
  PR2_byte = ^R2_byte;
  PR2_shortint = ^R2_shortint;
  PR311_byte = ^R311_byte;
  PR323_pointer = ^R323_pointer;
  PR35_byte = ^R35_byte;
  PR368_byte = ^R368_byte;
  PR370_longint = ^R370_longint;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR422_byte = ^R422_byte;
  PR423_pointer = ^R423_pointer;
  PR427_longint = ^R427_longint;
  PR427_pointer = ^R427_pointer;
  PR42_longint = ^R42_longint;
  PR42_pointer = ^R42_pointer;
  PR463_pointer = ^R463_pointer;
  PR467_pointer = ^R467_pointer;
  PR46_byte = ^R46_byte;
  PR471_pointer = ^R471_pointer;
  PR475_pointer = ^R475_pointer;
  PR479_byte = ^R479_byte;
  PR480_byte = ^R480_byte;
  PR480_shortint = ^R480_shortint;
  PR481_word = ^R481_word;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR492_byte = ^R492_byte;
  PR493_byte = ^R493_byte;
  PR493_shortint = ^R493_shortint;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR495_shortint = ^R495_shortint;
  PR497_byte = ^R497_byte;
  PR498_byte = ^R498_byte;
  PR499_byte = ^R499_byte;
  PR49_byte = ^R49_byte;
  PR4_byte = ^R4_byte;
  PR502_byte = ^R502_byte;
  PR504_byte = ^R504_byte;
  PR506_byte = ^R506_byte;
  PR506_shortint = ^R506_shortint;
  PR508_byte = ^R508_byte;
  PR509_byte = ^R509_byte;
  PR50_byte = ^R50_byte;
  PR50_shortint = ^R50_shortint;
  PR51_shortint = ^R51_shortint;
  PR52_byte = ^R52_byte;
  PR53_byte = ^R53_byte;
  PR54_byte = ^R54_byte;
  PR55_word = ^R55_word;
  PR57_byte = ^R57_byte;
  PR5_byte = ^R5_byte;
  PR5_pointer = ^R5_pointer;
  PR5_shortint = ^R5_shortint;
  PR6_byte = ^R6_byte;
  PR7_byte = ^R7_byte;
  PRA0_byte = ^RA0_byte;
  PRA27_byte = ^RA27_byte;
  PRA30_byte = ^RA30_byte;
  PRA331_word = ^RA331_word;
  PRA337_byte = ^RA337_byte;
  PRA361_byte = ^RA361_byte;
  PRA363_byte = ^RA363_byte;
  PRA365_byte = ^RA365_byte;
  PRA427_longint = ^RA427_longint;
  PRA427_pointer = ^RA427_pointer;
  PRA46_byte = ^RA46_byte;
  PRA501_byte = ^RA501_byte;
  PRA503_byte = ^RA503_byte;
  PRA505_byte = ^RA505_byte;
  PW10_13_38FA = ^W10_13_38FA;
  PW12_13_38FA = ^W12_13_38FA;
  PW14_13_38FA = ^W14_13_38FA;
  PW16_13_38FA = ^W16_13_38FA;
  PW18_13_38FA = ^W18_13_38FA;
  PW20_13_38FA = ^W20_13_38FA;
  PW4_13_38FA = ^W4_13_38FA;
  PW8_13_38FA = ^W8_13_38FA;
var
  a1144_6be1: array[0..2519] of string[12] absolute d1144;
  a333F_165c: array[0..1559] of string[20] absolute d333F;
  a3D96_d854: array[0..10919] of string[2] absolute d3D96;
  a400D_ec3f: array[0..32759] of byte absolute d400D;
  a651A_3981: array[0..2046] of E16_byte absolute d651A;
  a7CDE_0777: array[0..4679, 0..6] of byte absolute d7CDE;
  a94D6_3981: array[0..2046] of E16_byte absolute d94D6;
  a94D7_3981: array[0..2046] of E16_byte absolute d94D7;
  a94DC_3981: array[0..2046] of E16_byte absolute d94DC;
  a94DF_3981: array[0..2046] of E16_byte absolute d94DF;
  a94E0_3981: array[0..2046] of E16_byte absolute d94E0;
  a94E1_3981: array[0..2046] of E16_byte absolute d94E1;
  a94E2_3981: array[0..2046] of E16_byte absolute d94E2;
  a94E4_3981: array[0..2046] of E16_byte absolute d94E4;
  a9DC4_9f5c: array[0..4094, 0..1] of longint absolute d9DC4;
  a9DC4_b6a1: array[0..4094, 0..1] of pointer absolute d9DC4;
  aA014_ff2a: array[0..32759] of shortint absolute dA014;
  aA05C_ff2a: array[0..32759] of shortint absolute dA05C;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aA583_b676: array[0..8189] of longint absolute dA583;
  aA6E2_eec0: array[0..10919] of array[0..2] of byte absolute dA6E2;
  aA6E2_fd21: array[0..10919] of E3_byte absolute dA6E2;
  aA6E3_fd21: array[0..10919] of E3_byte absolute dA6E3;
  aA7CE_ec3f: array[0..32759] of byte absolute dA7CE;
  aAE8E_ec3f: array[0..32759] of byte absolute dAE8E;
  b880C: byte absolute d880C;
  b880F: byte absolute d880F;
  b9D93: byte absolute d9D93;
  bA6E4: byte absolute dA6E4;
  bA6E5: byte absolute dA6E5;
  bA7BE: byte absolute dA7BE;
  bA7CA: byte absolute dA7CA;
  bA7CE: byte absolute dA7CE;
  bA7CF: byte absolute dA7CF;
  bA7D4: byte absolute dA7D4;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bAADE: byte absolute dAADE;
  bAAE6: byte absolute dAAE6;
  bAB08: byte absolute dAB08;
  bAB09: byte absolute dAB09;
  bAB0A: byte absolute dAB0A;
  bAB0B: byte absolute dAB0B;
  bAE5B: byte absolute dAE5B;
  bAE5C: byte absolute dAE5C;
  bAE61: byte absolute dAE61;
  bAE7D: byte absolute dAE7D;
  bAE8F: byte absolute dAE8F;
  bAEEF: byte absolute dAEEF;
  bB029: byte absolute dB029;
  bC58A: byte absolute dC58A;
  bC591: byte absolute dC591;
  bC592: byte absolute dC592;
  bC595: byte absolute dC595;
  bC5C3: byte absolute dC5C3;
  bC5C5: byte absolute dC5C5;
  l8836: longint absolute d8836;
  lAEEA: longint absolute dAEEA;
  p87F8: pointer absolute d87F8;
  p883A: pointer absolute d883A;
  p9CEA: pointer absolute d9CEA;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CF6: pointer absolute d9CF6;
  pA6E0: pointer absolute dA6E0;
  pA7CA: pointer absolute dA7CA;
  pAADF: pointer absolute dAADF;
  pAEE0: pointer absolute dAEE0;
  s2BB6: string absolute d2BB6;
  w3DF6: word absolute d3DF6;
  w3DFC: word absolute d3DFC;
  w8514: word absolute d8514;

procedure pO0EC_0029(a0: pointer); far; forward;
procedure pO0EC_0226(a0: pointer; a1: pointer); far; forward;
procedure pO0EC_02AE(a0: pointer; a1: pointer; a2: pointer; a3: pointer); far; forward;
procedure pO0EC_03E2(a0: pointer); far; forward;
function pO0EC_14DE(a0: pointer): byte; far; forward;
function pO0EC_15E2(a0: pointer): byte; far; forward;
function pO0EC_167A(a0: pointer): shortint; far; forward;

{ 0000 }
function pO0EC_0000(a0: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0006-0020}
  pO0EC_0000 := Ord(a0 > Random(100));
end;

{ 0029 }
procedure pO0EC_0029(a0: pointer);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v6sb: shortint absolute v6b;
begin
  {@002F-0042}
  v4p := PR427_pointer(a0)^.v;
  {@0042-004D}
  if v4p = nil then
    Exit;
  {@004D-0057}
  v5b := PR46_byte(v4p)^.v;
  {@0057-0067}
  PR497_byte(a0)^.v := PR172_byte(a0)^.v;
  if (a94E4_3981[v5b].f and 2) <> 0 then
    PR497_byte(a0)^.v := PR497_byte(a0)^.v + pO0EC_1560(pointer(a0));
  {@009D-00B4}
  PR506_byte(a0)^.v := a94E1_3981[v5b].f;
  if (a94E4_3981[v5b].f and 4) <> 0 then
  begin
    {@00C9-00EA}
    PR497_byte(a0)^.v := PR497_byte(a0)^.v + pO0EC_167A(pointer(a0));
    {@00EA-010A}
    PR506_byte(a0)^.v := PR506_shortint(a0)^.v + pO0EC_1712(pointer(a0));
  end;
  {@010A-0114}
  v6b := PR50_byte(v4p)^.v;
  if (a94E4_3981[v5b].f > 127) and (PR475_pointer(a0)^.v <> nil) then
    v6b := v6sb + PR50_shortint(PR475_pointer(a0)^.v)^.v;
  {@014D-0189}
  if ((a94E4_3981[v5b].f and 1) > 0) and (PR471_pointer(a0)^.v <> nil) then
    v6b := v6sb + PR50_shortint(PR471_pointer(a0)^.v)^.v;
  {@0189-01A2}
  PR506_byte(a0)^.v := PR506_shortint(a0)^.v + v6sb;
if (PR173_byte(a0)^.v = 0) and ((PR46_byte(v4p)^.v > 21) and (PR46_byte(v4p)^.v < 27)
      or (PR46_byte(v4p)^.v = 19) or (PR46_byte(v4p)^.v = 18)) then
    Inc(v6b);
  {@01D8-01F2}
  PR497_byte(a0)^.v := PR497_byte(a0)^.v + v6sb;
  {@01F2-0209}
  PR502_byte(a0)^.v := a94DF_3981[v5b].f;
  {@0209-0220}
  PR504_byte(a0)^.v := a94E0_3981[v5b].f;
end;

{ 0226 }
procedure pO0EC_0226(a0: pointer; a1: pointer);
begin
  {@0229-02AA}
  if a94D6_3981[PR46_byte(a1)^.v].f = 2 then
  begin
    {@023F-0280}
    case PR55_word(a1)^.v of
      0..150: PR509_byte(a0)^.v := PR311_byte(a0)^.v;
      151..399: PR509_byte(a0)^.v := 9;
    else
      {@0277-0280}
      PR509_byte(a0)^.v := 6;
    end;
    {@0280-02AA}
    if (PR50_byte(a1)^.v <> 0) and (PR509_byte(a0)^.v <= 9) then
      PR509_byte(a0)^.v := PR509_byte(a0)^.v + 3;
  end;
end;

{ 02AE }
procedure pO0EC_02AE(a0: pointer; a1: pointer; a2: pointer; a3: pointer);
var
  v1b: byte;
  v2b: byte;
begin
  {@02B4-02CA}
  v1b := a94DC_3981[PR46_byte(a1)^.v].f;
  {@02CA-02D3}
  if v1b <= 127 then
    Exit;
  {@02D3-02DB}
  v1b := v1b and 127;
  {@02DB-02F1}
  v2b := a94D6_3981[PR46_byte(a1)^.v].f;
  if v2b = 1 then
  begin
    {@02F7-030F}
    PR1_byte(a2)^.v := v1b + PR50_shortint(a1)^.v;
    {@030F-0312}
    Exit;
  end;
  {@0312-038E}
  if v1b = 0 then
  begin
    {@0318-036F}
    if v2b = 9 then
    begin
      {@031E-033C}
      if PR50_shortint(a1)^.v > PR3_shortint(a2)^.v then
        PR3_byte(a2)^.v := PR50_byte(a1)^.v;
    end
    else
    begin
      {@033E-036F}
      if v2b = 7 then
        PR4_byte(a2)^.v := PR50_byte(a1)^.v
      else
        PR2_byte(a2)^.v := PR2_shortint(a2)^.v + PR50_shortint(a1)^.v;
    end;
    {@036F-038C}
    PR480_byte(a0)^.v := PR480_shortint(a0)^.v + PR51_shortint(a1)^.v;
    {@038C-038E}
    Exit;
  end;
  {@038E-03DC}
  if (v1b + PR50_shortint(a1)^.v) > PR5_shortint(a2)^.v then
  begin
    {@03AD-03C5}
    PR5_byte(a2)^.v := v1b + PR50_shortint(a1)^.v;
    if (PR50_shortint(a1)^.v > 0) and (v2b = 2) then
      PR0_byte(a3)^.v := 1;
  end;
end;

{ 03E2 }
procedure pO0EC_03E2(a0: pointer);
var
  v2w: word;
  v3b: byte;
  _f1: array[1..1] of byte;
  v2i: integer absolute v2w;
begin
  {@03E8-0408}
  v2w := LongInt(PR481_word(a0)^.v) - LongInt(pO0EC_178D(pointer(a0)));
  if v2i < 0 then
    v2w := 0;
  {@0413-0451}
  case v2i of
    0..512: v3b := PR509_byte(a0)^.v;
    513..768: v3b := 9;
    769..1024: v3b := 6;
  else
    {@044D-0451}
    v3b := 3;
  end;
  {@0451-0469}
  if v3b < PR509_byte(a0)^.v then
    PR509_byte(a0)^.v := v3b;
end;

{ 0484 }
procedure pO0EC_0484(a0: longint; a1: pointer; a2: byte; a3: byte; a4: byte; a5: byte);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..3] of byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v12p: pointer;
begin
  if false then begin
    if LV = ' Yes  ' then;
    if LV = ' No   ' then;
    if LV = '*' then;
    if LV = ' ' then;
    if LV = 's ' then;
  end;
  {@048B-0492}
  PR0_byte(a1)^.v := 0;
  if a4 <> 0 then
  begin
    {@0498-04CA}
    if PR52_byte(a1)^.v <> 0 then
      PR0_string_40_(a1)^.v := ' Yes  '
    else
      PR0_string_40_(a1)^.v := ' No   ';
  end;
  {@04CA-04CE}
  v7b := 0;
  {@04CE-04DB}
  v12p := p9CF2;
  {@04DB-0518}
  while (v12p <> nil) and (v7b = 0) do
  begin
    {@04E9-0503}
    if pO0EC_27C1(v12p, 5, @v6b) <> 0 then
      v7b := 1;
    {@0503-0516}
    v12p := PR483_pointer(v12p)^.v;
  end;
  {@0518-056E}
  if (v7b <> 0) and ((PR50_shortint(a1)^.v > 0) or (PR51_shortint(a1)^.v > 0) or (PR54_byte(a1)^.v <> 0)) then
    PR0_string_40_(a1)^.v := PR0_string(a1)^.v + '*' + ' ';
  {@056E-05B7}
  if PR57_byte(a1)^.v > 0 then
    PR0_string_40_(a1)^.v := PR0_string(a1)^.v + pO0EC_142F(PR57_byte(a1)^.v) + ' ';
  {@05B7-05BB}
  v2b := 0;
  for v1b := 1 to 3 do
  begin
    {@05C4-0609}
    if (PRA46_byte(a1)^.a[v1b] <> 0) and ((PR53_byte(a1)^.v shr (3 - v1b) and 1) = 0) then
      Inc(v2b, 1 shl (v1b - 1));
  end;
  {@060F-0613}
  v8b := 0;
  for v1b := 3 downto 1 do
  begin
    {@061C-0787}
    if (v2b shr (v1b - 1) and 1) > 0 then
    begin
      {@0637-0677}
      PR0_string_40_(a1)^.v := PR0_string(a1)^.v + a333F_165c[PRA46_byte(a1)^.a[v1b]];
      if (PR57_byte(a1)^.v < 2) or (v8b <> 0) then
        PR0_string_40_(a1)^.v := PR0_string(a1)^.v + ' '
      else
      begin
        {@06B2-0787}
if ((1 shl (v1b - 1)) = v2b) or (v1b = 1) and (v2b > 4) and (PR46_byte(a1)^.v <> 55) or (v1b = 2)
            and not Odd(v2b) or (v1b = 3) and (PR46_byte(a1)^.v = 55) or ((PR46_byte(a1)^.v = 30)
            or (PR46_byte(a1)^.v = 5) or (PR46_byte(a1)^.v = 7) or (PR46_byte(a1)^.v = 12))
            and (PR49_byte(a1)^.v <> 93) then
        begin
          {@0731-0759}
          PR0_string_40_(a1)^.v := PR0_string(a1)^.v + 's ';
          {@0759-075D}
          v8b := 1;
        end
        else
          PR0_string_40_(a1)^.v := PR0_string(a1)^.v + ' ';
      end;
    end;
  end;
  {@0790-07AE}
  if a5 <> 0 then
    pR47F_0354(a2, a3, 10, 0, PR0_string(a1)^.v);
end;

{ 07C0 }
procedure pO0EC_07C0(a0: pointer);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v7b: byte;
begin
  if false then begin
    if LV = 'Name' then;
    if LV = 'AC  HP' then;
  end;
  {@07C6-07E2}
  if (b880C = 3) and (PR35_byte(p87F8)^.v = 1) or (b880F <> 0) then
    Exit;
  {@07E2-07F3}
  if b880C = 0 then
    v5b := 1
  else
    v5b := 17;
  {@07F3-07F9}
  bAB08 := v5b;
  {@07F9-07FE}
  bAB0A := 4;
  {@07FE-0803}
  bAB09 := 38;
  {@0803-0808}
  bAB0B := 3;
  {@0808-080C}
  v6b := 2;
  {@080C-082E}
  pR47F_0354(v5b, v6b, 15, 0, 'Name');
  {@082E-084F}
  pR47F_0354(33, v6b, 15, 0, 'AC  HP');
  {@084F-0853}
  Inc(v6b, 2);
  {@0853-0860}
  v4p := p9CF2;
  {@0860-096D}
  while v4p <> nil do
  begin
    {@086B-086F}
    Inc(bAB0B);
    {@086F-0883}
    pR142_0217(v5b, v6b, 38, v6b);
    if v4p = a0 then
      pR47F_0354(v5b, v6b, 15, 0, PR0_string(v4p)^.v)
    else
      pO0EC_1C22(v4p, v5b, v6b, 0);
    {@08C2-08F8}
    case PR498_byte(v4p)^.v of
      0..50: v7b := 1;
      51..60: v7b := 2;
      61..69: v7b := 1;
    else
      {@08F4-08F8}
      v7b := 0;
    end;
    {@08F8-090F}
    pO0EC_0B21(v4p, v7b + 32, v6b);
    case PR508_byte(v4p)^.v of
      0..9: v7b := 2;
      10..99: v7b := 1;
    else
      {@0933-0937}
      v7b := 0;
    end;
    {@0937-0954}
    pO0EC_0BAA(v4p, v7b + 36, v6b, 0, 0);
    {@0954-0957}
    Inc(v6b);
    {@0957-096A}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@096D-0981}
  pR142_0217(v5b, v6b, 38, v6b);
end;

{ 0987 }
procedure pO0EC_0987(a0: pointer; a1: byte);
var
  v4p: pointer;
  _f1: array[1..4] of byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  _f2: array[1..1] of byte;
begin
  {@098D-09A9}
  if (b880C = 3) and (PR35_byte(p87F8)^.v = 1) or (b880F <> 0) then
    Exit;
  {@09A9-09BF}
  if p9CEA = nil then
    p9CEA := a0;
  {@09BF-09D0}
  if b880C = 0 then
    v9b := 1
  else
    v9b := 17;
  {@09D0-09D6}
  bAB08 := v9b;
  {@09D6-09DB}
  bAB0A := 4;
  {@09DB-09E0}
  bAB09 := 38;
  {@09E0-09E5}
  bAB0B := 3;
  {@09E5-09E9}
  v10b := 4;
  {@09E9-09F6}
  v4p := p9CF2;
  {@09F6-0AFD}
  while v4p <> nil do
  begin
    {@0A01-0A05}
    Inc(bAB0B);
    if v4p = p9CEA then
    begin
      {@0A1D-0A52}
      if a1 <> 0 then
        pR47F_0354(v9b, v10b, 15, 0, PR0_string(v4p)^.v)
      else
        pO0EC_1C22(v4p, v9b, v10b, 0);
      {@0A52-0A88}
      case PR498_byte(v4p)^.v of
        0..50: v11b := 1;
        51..60: v11b := 2;
        61..69: v11b := 1;
      else
        {@0A84-0A88}
        v11b := 0;
      end;
      {@0A88-0A9F}
      pO0EC_0B21(v4p, v11b + 32, v10b);
      case PR508_byte(v4p)^.v of
        0..9: v11b := 2;
        10..99: v11b := 1;
      else
        {@0AC3-0AC7}
        v11b := 0;
      end;
      {@0AC7-0AE4}
      pO0EC_0BAA(v4p, v11b + 36, v10b, 0, 0);
    end;
    {@0AE4-0AE7}
    Inc(v10b);
    {@0AE7-0AFA}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@0AFD-0B11}
  pR142_0217(v9b, v10b, 38, v10b);
  {@0B11-0B19}
  p9CEA := nil;
end;

{ 0B21 }
procedure pO0EC_0B21(a0: pointer; a1: byte; a2: byte);
var
  v256a: string;
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LV = '-' then;
  end;
  {@0B28-0B54}
  v256a := pO0EC_142F(Abs(PR498_byte(a0)^.v - 60));
  if PR498_byte(a0)^.v > 60 then
    v256a := '-' + v256a;
  {@0B89-0BA2}
  pR47F_0354(a1, a2, 10, 0, v256a);
end;

{ 0BAA }
procedure pO0EC_0BAA(a0: pointer; a1: byte; a2: byte; a3: byte; a4: byte);
var
  v256a: string;
  v257b: byte;
  v258b: byte;
  v258sb: shortint absolute v258b;
  v256b: byte absolute v256a;
begin
  if false then begin
    if LV = '/' then;
  end;
  {@0BB1-0BCF}
  if PR508_byte(a0)^.v < PR178_byte(a0)^.v then
    v257b := 14
  else
    v257b := 10;
  {@0BCF-0BDA}
  if a3 <> 0 then
    v257b := 13;
  {@0BDA-0BFC}
  v256a := pO0EC_142F(PR508_byte(a0)^.v);
  {@0BFC-0C17}
  pR47F_0354(a1, a2, v257b, 0, v256a);
  if a4 <> 0 then
  begin
    {@0C1D-0C25}
    v258b := v256b;
    {@0C25-0C6B}
    pR47F_0354(a1 + v258sb, a2, 10, 0, '/' + pO0EC_142F(PR178_byte(a0)^.v));
  end;
end;

{ 0C95 }
procedure pO0EC_0C95(a0: pointer);
var
  v1b: byte;
  v2b: byte;
begin
  if false then begin
    if LV = ' ' then;
    if LV = 'Hitpoints' then;
    if LV = 'AC' then;
    if LV = '(Helpless)' then;
    if LV = '(Casting)' then;
  end;
  {@0C9B-0CA5}
  if bAEEF = 0 then
    Exit;
  {@0CA5-0CAA}
  bAEEF := 0;
  {@0CAA-0CBB}
  pR142_0217(23, 1, 38, 21);
  {@0CBB-0CBF}
  v2b := 1;
  {@0CBF-0CDF}
  pO0EC_1B08(pointer(a0), ' ', v2b, 0);
  {@0CDF-0CE2}
  Inc(v2b);
  {@0CE2-0D06}
  pR47F_0354(23, v2b + 1, 10, 0, 'Hitpoints');
  {@0D06-0D20}
  pO0EC_0BAA(pointer(a0), 33, v2b + 1, 0, 0);
  {@0D20-0D24}
  Inc(v2b, 2);
  {@0D24-0D48}
  pR47F_0354(23, v2b + 1, 10, 0, 'AC');
  {@0D48-0D5C}
  pO0EC_0B21(pointer(a0), 26, v2b + 1);
  {@0D5C-0D65}
  b9D93 := v2b + 1;
  if PR427_pointer(a0)^.v <> nil then
  begin
    {@0D74-0D78}
    Inc(v2b, 2);
    {@0D78-0D7C}
    v1b := 23;
    {@0D7C-0D9F}
    pO0EC_0484(longint(a0), pointer(PR427_pointer(a0)^.v), 0, 0, 0, 0);
    {@0D9F-0DCD}
    pR47F_0498(23, v2b + 1, 38, v2b + 2 + 1, 10, 0, 1, PR0_string(PR427_pointer(a0)^.v)^.v);
  end;
  {@0DCD-0DD6}
  v2b := b9D93 + 1;
  if PR494_byte(a0)^.v = 0 then
  begin
    {@0DE1-0E0C}
    pR47F_0354(23, v2b + 1, 15, 0, a1144_6be1[PR493_shortint(a0)^.v]);
    {@0E0C-0E0E}
    Exit;
  end;
  {@0E0E-0E42}
  if pO0EC_0E7A(pointer(a0)) <> 0 then
  begin
    {@0E1C-0E40}
    pR47F_0354(23, v2b + 1, 15, 0, '(Helpless)');
    {@0E40-0E42}
    Exit;
  end;
  {@0E42-0E74}
  if PR0_byte(PR487_pointer(a0)^.v)^.v > 0 then
    pR47F_0354(23, v2b + 1, 15, 0, '(Casting)');
end;

{ 0E7A }
function pO0EC_0E7A(a0: pointer): byte;
var
  v2b: byte;
  _f1: array[1..3] of byte;
  v6b: byte;
begin
  {@0E80-0E84}
  pO0EC_0E7A := 0;
  for v2b := 1 to 4 do
  begin
    {@0E8D-0EB0}
    if pO0EC_27C1(pointer(a0), a400D_ec3f[v2b], @v6b) <> 0 then
      pO0EC_0E7A := 1;
  end;
end;

{ 0EBF }
procedure pO0EC_0EBF(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  v8b: byte;
  v9sb: shortint;
  v10sb: shortint;
  v11sb: shortint;
  v12sb: shortint;
  v14a: array[0..1] of shortint;
  v15b: byte;
  _f1: array[1..1] of byte;
  v17b: byte;
  v19w: word;
  v20b: byte;
  _f2: array[1..2] of byte;
  v20sb: shortint absolute v20b;
  v17sb: shortint absolute v17b;
  v15sb: shortint absolute v15b;
  v14b: byte absolute v14a;
  v11b: byte absolute v11sb;
  v10b: byte absolute v10sb;
  v9b: byte absolute v9sb;
  v2sb: shortint absolute v2b;
begin
  {@0EC5-0EED}
  for v15b := 0 to 12 do
    PRA427_longint(a0)^.a[v15sb] := 0;
  {@0EED-0EF1}
  v8b := 0;
  {@0EF1-0EFA}
  PR422_byte(a0)^.v := 0;
  {@0EFA-0F0D}
  v6p := PR423_pointer(a0)^.v;
  {@0F0D-0F16}
  PR479_byte(a0)^.v := 0;
  {@0F16-0F20}
  PR481_word(a0)^.v := 0;
  {@0F20-0F25}
  w8514 := 0;
  {@0F25-1087}
  while v6p <> nil do
  begin
    {@0F30-0F38}
    Inc(PR422_byte(a0)^.v);
    {@0F38-0F42}
    v19w := PR55_word(v6p)^.v;
    if PR57_byte(v6p)^.v > 0 then
      v19w := PR57_byte(v6p)^.v * v19w;
    {@0F5B-0F66}
    Inc(PR481_word(a0)^.v, v19w);
    if PR52_byte(v6p)^.v <> 0 then
    begin
      {@0F73-0F7A}
      Inc(w8514, v19w);
      {@0F7A-0F90}
      v20b := a94D6_3981[PR46_byte(v6p)^.v].f;
      case v20b of
        0..8: PRA427_pointer(a0)^.a[v20sb] := v6p;
        9: begin
          {@0FBE-1004}
          if PR463_pointer(a0)^.v <> nil then
          begin
            {@0FCD-0FEF}
            if PR467_pointer(a0)^.v = nil then
              PR467_pointer(a0)^.v := v6p;
          end
          else
            PR463_pointer(a0)^.v := v6p;
        end;
      end;
      {@1004-1021}
      if PR46_byte(v6p)^.v = 30 then
        PR471_pointer(a0)^.v := v6p;
      {@1021-1048}
      if (PR46_byte(v6p)^.v = 12) or (PR46_byte(v6p)^.v = 74) then
        PR475_pointer(a0)^.v := v6p;
      {@1048-1073}
      PR479_byte(a0)^.v := PR479_byte(a0)^.v + a94D7_3981[PR46_byte(v6p)^.v].f;
    end;
    {@1073-1084}
    v6p := PR42_pointer(v6p)^.v;
  end;
  {@1087-10B6}
  for v17b := 0 to 2 do
    PR481_word(a0)^.v := PRA331_word(a0)^.a[v17sb] + PR481_word(a0)^.v;
  {@10B6-111F}
  for v1b := 1 to 2 do
  begin
    {@10BF-10DD}
    PRA501_byte(a0)^.a[v1b] := PRA361_byte(a0)^.a[v1b];
    {@10DD-10FB}
    PRA503_byte(a0)^.a[v1b] := PRA363_byte(a0)^.a[v1b];
    {@10FB-1119}
    PRA505_byte(a0)^.a[v1b] := PRA365_byte(a0)^.a[v1b];
  end;
  {@111F-112D}
  XR670_046E(@v14b, 6);
  {@112D-1131}
  v7b := 0;
  {@1131-113A}
  PR480_byte(a0)^.v := 0;
  {@113A-114A}
  PR498_byte(a0)^.v := PR368_byte(a0)^.v;
  {@114A-115A}
  PR509_byte(a0)^.v := PR311_byte(a0)^.v;
  {@115A-116A}
  PR497_byte(a0)^.v := PR172_byte(a0)^.v;
  {@116A-1177}
  v14b := pO0EC_14DE(pointer(a0));
  if PR427_longint(a0)^.v = 0 then
  begin
    {@1186-11A7}
    PR497_byte(a0)^.v := PR497_byte(a0)^.v + pO0EC_167A(pointer(a0));
    {@11A7-11C7}
    PR506_byte(a0)^.v := PR506_shortint(a0)^.v + pO0EC_1712(pointer(a0));
  end;
  {@11C7-11D1}
  pO0EC_0029(pointer(a0));
  {@11D1-11E4}
  v6p := PR423_pointer(a0)^.v;
  {@11E4-1233}
  while v6p <> nil do
  begin
    {@11EC-1220}
    if PR52_byte(v6p)^.v <> 0 then
    begin
      {@11F6-1206}
      pO0EC_0226(pointer(a0), v6p);
      {@1206-1220}
      pO0EC_02AE(pointer(a0), v6p, @v14b, @v7b);
    end;
    {@1220-1231}
    v6p := PR42_pointer(v6p)^.v;
  end;
  {@1233-124D}
  if v7b <> 0 then
  begin
    {@1239-1243}
    if v11sb > 0 then
      v11b := 0;
    {@1243-124D}
    if v10sb > 0 then
      v10b := 0;
  end;
  {@124D-1263}
  PR509_byte(a0)^.v := pO0EC_12E6(pointer(a0)) shr 1;
  if v9sb < PR498_byte(a0)^.v then
    v9b := PR498_byte(a0)^.v;
  {@1282-128B}
  PR498_byte(a0)^.v := 0;
  for v2b := 5 downto 0 do
    PR498_byte(a0)^.v := PR498_byte(a0)^.v + v14a[v2sb];
  {@12BA-12E0}
  PR499_byte(a0)^.v := Integer(Integer(v9sb + v12sb) + v10sb) + v11sb - 2;
end;

{ 12E6 }
function pO0EC_12E6(a0: pointer): byte;
var
  v5p: pointer;
  _f1: array[1..3] of byte;
  v9b: byte;
  _f2: array[1..1] of byte;
begin
  {@12EC-12FC}
  PR509_byte(a0)^.v := PR311_byte(a0)^.v;
  {@12FC-130F}
  v5p := PR423_pointer(a0)^.v;
  {@130F-1344}
  while v5p <> nil do
  begin
    {@1317-1331}
    if PR52_byte(v5p)^.v <> 0 then
      pO0EC_0226(pointer(a0), v5p);
    {@1331-1342}
    v5p := PR42_pointer(v5p)^.v;
  end;
  {@1344-134E}
  pO0EC_03E2(pointer(a0));
  if pO0EC_27C1(pointer(a0), 39, @v9b) <> 0 then
    PR509_byte(a0)^.v := PR509_byte(a0)^.v * 2;
  {@1378-13A2}
  if pO0EC_27C1(pointer(a0), 42, @v9b) <> 0 then
    PR509_byte(a0)^.v := PR509_byte(a0)^.v shr 1;
  {@13A2-13CC}
  if pO0EC_27C1(pointer(a0), 74, @v9b) <> 0 then
    PR509_byte(a0)^.v := PR509_byte(a0)^.v * 2;
  {@13CC-13D7}
  bA7D4 := PR509_byte(a0)^.v;
  if PR495_byte(a0)^.v = 0 then
  begin
    {@13E2-1416}
    if (bA7D4 + PR27_shortint(p87F8)^.v) < 1 then
      bA7D4 := 1
    else
      bA7D4 := bA7D4 + PR27_byte(p87F8)^.v;
  end;
  {@1416-1420}
  bA7D4 := bA7D4 * 2;
  {@1420-1426}
  pO0EC_12E6 := bA7D4;
end;

{ 142F }
function pO0EC_142F(a0: byte): string;
var
  v256a: string;
begin
  {@1436-1451}
  Str(a0, v256a);
  {@1451-1465}
  pO0EC_142F := v256a;
end;

{ 146B }
function pO0EC_146B(a0: word): string;
var
  v256a: string;
begin
  {@1472-148B}
  Str(a0, v256a);
  {@148B-149F}
  pO0EC_146B := v256a;
end;

{ 14A5 }
function pO0EC_14A5(a0: longint): string;
var
  v256a: string;
begin
  {@14AC-14C4}
  Str(a0, v256a);
  {@14C4-14D8}
  pO0EC_14A5 := v256a;
end;

{ 14DE }
function pO0EC_14DE(a0: pointer): byte;
var
  v2b: byte;
begin
  {@14E4-14EE}
  v2b := PR23_byte(a0)^.v;
  case v2b of
    1..3: pO0EC_14DE := 252;
    4..6: pO0EC_14DE := v2b - 7;
    15..18: pO0EC_14DE := v2b - 14;
    19..20: pO0EC_14DE := 4;
    21..23: pO0EC_14DE := 5;
    24..25: pO0EC_14DE := 6;
  else
    {@1553-1557}
    pO0EC_14DE := 0;
  end;
end;

{ 1560 }
function pO0EC_1560(a0: pointer): shortint;
var
  v2b: byte;
begin
  {@1566-1570}
  v2b := PR23_byte(a0)^.v;
  case v2b of
    0..2: pO0EC_1560 := -4;
    3..5: pO0EC_1560 := v2b - 6;
    16..18: pO0EC_1560 := v2b - 15;
    19..20: pO0EC_1560 := 3;
    21..23: pO0EC_1560 := 4;
    24..25: pO0EC_1560 := 5;
  else
    {@15D5-15D9}
    pO0EC_1560 := 0;
  end;
end;

{ 15E2 }
function pO0EC_15E2(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@15E8-1671}
  case PR17_byte(a0)^.v of
    0..17: pO0EC_15E2 := PR17_byte(a0)^.v;
    18: case PR28_byte(a0)^.v of
        0: pO0EC_15E2 := 18;
        1..50: pO0EC_15E2 := 19;
        51..75: pO0EC_15E2 := 20;
        76..90: pO0EC_15E2 := 21;
        91..99: pO0EC_15E2 := 22;
        100: pO0EC_15E2 := 23;
      end;
    19..25: pO0EC_15E2 := PR17_byte(a0)^.v + 5;
  end;
end;

{ 167A }
function pO0EC_167A(a0: pointer): shortint;
var
  v2b: byte;
begin
  {@1680-1684}
  pO0EC_167A := 0;
  {@1684-1691}
  v2b := pO0EC_15E2(pointer(a0));
  case v2b of
    1..3: pO0EC_167A := -3;
    4..5: pO0EC_167A := -2;
    6..7: pO0EC_167A := -1;
    17..19: pO0EC_167A := 1;
    20..22: pO0EC_167A := 2;
    23..25: pO0EC_167A := 3;
    26..27: pO0EC_167A := 4;
    28..30: pO0EC_167A := v2b - 23;
  end;
end;

{ 1712 }
function pO0EC_1712(a0: pointer): shortint;
var
  v2b: byte;
begin
  {@1718-171C}
  pO0EC_1712 := 0;
  {@171C-1729}
  v2b := pO0EC_15E2(pointer(a0));
  case v2b of
    1..2: pO0EC_1712 := -2;
    3..5: pO0EC_1712 := -1;
    16: pO0EC_1712 := 1;
    17..19: pO0EC_1712 := v2b - 16;
    20..29: pO0EC_1712 := v2b - 17;
    30: pO0EC_1712 := 14;
  end;
end;

{ 178D }
function pO0EC_178D(a0: pointer): integer;
var
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@1793-17A0}
  v3b := pO0EC_15E2(pointer(a0));
  case v3b of
    1..3: pO0EC_178D := -350;
    4..5: pO0EC_178D := -250;
    6..7: pO0EC_178D := -150;
    12..13: pO0EC_178D := 100;
    14..15: pO0EC_178D := 200;
    16: pO0EC_178D := 350;
    17..21: pO0EC_178D := (v3b - 17) * 250 + 500;
    22..26: pO0EC_178D := (v3b - 22) * 1000 + 2000;
    27: pO0EC_178D := 7500;
    28..30: pO0EC_178D := (v3b - 28) * 3000 + 9000;
  else
    {@185F-1864}
    pO0EC_178D := 0;
  end;
end;

{ 186D }
procedure pO0EC_186D(a0: pointer; a1: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@1873-1877}
  v1b := 0;
  {@1877-18AE}
  while v1b <= 140 do
  begin
    {@187D-18A9}
    if PRA30_byte(a0)^.a[v1b] = a1 then
    begin
      {@1890-18A5}
      PRA30_byte(a0)^.a[v1b] := a1 or 128;
      {@18A5-18A9}
      v1b := 141;
    end;
    {@18A9-18AC}
    Inc(v1b);
  end;
end;

{ 18EF }
procedure pO0EC_18EF(a0: pointer; a1: pointer);
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'Nil Item pointer...' then;
    if LV = 'Tried to Lose item & couldn''t find it!' then;
  end;
  {@18F5-191A}
  if a1 = nil then
  begin
    {@18FD-1917}
    pR47F_0B2E(14, 0, 'Nil Item pointer...');
    {@1917-191A}
    Exit;
  end;
  {@191A-192D}
  v4p := PR423_pointer(a0)^.v;
  if v4p = a1 then
    PR423_pointer(a0)^.v := PR42_pointer(a1)^.v
  else
    while (v4p <> nil) and (PR42_pointer(v4p)^.v <> a1) do
      v4p := PR42_pointer(v4p)^.v;
  {@1987-19AB}
  if v4p = nil then
  begin
    {@198F-19A9}
    pR47F_0B2E(14, 0, 'Tried to Lose item & couldn''t find it!');
    {@19A9-19AB}
    Exit;
  end;
  {@19AB-19C1}
  PR42_pointer(v4p)^.v := PR42_pointer(a1)^.v;
  {@19C1-19CE}
  PR42_pointer(a1)^.v := nil;
  {@19CE-19D8}
  pR670_03ED(@PV4_0_byte(a1).v);
end;

{ 19DE }
procedure pO0EC_19DE(a0: pointer; a1: pointer);
var
  v4p: pointer;
  v8p: pointer;
begin
  {@19E4-1A25}
  if (b880C = 5) and (PR487_pointer(a0)^.v <> nil) and (PR18_byte(PR487_pointer(a0)^.v)^.v = 1) then
    GetMem(v8p, 63)
  else
    v8p := pR670_037F;
  {@1A25-1A38}
  Move(PR0_byte(a1)^.v, PR0_byte(v8p)^.v, 63);
  {@1A38-1A45}
  PR42_longint(v8p)^.v := 0;
  {@1A45-1A58}
  v4p := PR423_pointer(a0)^.v;
  if v4p = nil then
  begin
    {@1A60-1A73}
    PR423_pointer(a0)^.v := v8p;
    {@1A73-1A75}
    Exit;
  end;
  {@1A75-1A95}
  while PR42_pointer(v4p)^.v <> nil do
    v4p := PR42_pointer(v4p)^.v;
  {@1A95-1AA6}
  PR42_pointer(v4p)^.v := v8p;
end;

{ 1AAC }
procedure pO0EC_1AAC(a0: S40);
var
  _f1: array[1..1] of byte;
begin
  {@1AC5-1AD6}
  pR142_0217(0, 24, 39, 24);
  {@1AD6-1AEC}
  pR47F_0354(0, 24, 10, 0, a0);
  {@1AEC-1AF1}
  pR47F_0D1A;
  {@1AF1-1B02}
  pR142_0217(0, 24, 39, 24);
end;

{ 1B08 }
procedure pO0EC_1B08(a0: pointer; a1: string; a2: byte; a3: byte);
var
  v257b: byte;
  _f1: array[1..1] of byte;
begin
  {@1B23-1BDA}
  if b880C = 5 then
  begin
    {@1B2A-1B3C}
    pR142_0217(23, a2, 38, 21);
    {@1B3C-1B50}
    pO0EC_1C22(pointer(a0), 23, a2, 0);
    {@1B50-1B74}
    pR47F_0498(23, a2 + 1, 38, 21, 10, 0, 1, a1);
  end
  else
  begin
    {@1B76-1B89}
    if bAE7D <> 0 then
      v257b := 18
    else
      v257b := 17;
    {@1B89-1B9C}
    pR142_0217(1, v257b, 38, 22);
    {@1B9C-1BB4}
    pO0EC_1C22(pointer(a0), 1, v257b + 1, 0);
    {@1BB4-1BDA}
    pR47F_0498(1, v257b + 2, 38, 22, 10, 0, 1, a1);
  end;
  {@1BDA-1BE9}
  if a3 <> 0 then
  begin
    {@1BE0-1BE5}
    pR47F_0D1A;
    {@1BE5-1BE9}
    pO0EC_1BEF;
  end;
end;

{ 1BEF }
procedure pO0EC_1BEF;
begin
  {@1BF2-1C0C}
  if b880C = 5 then
  begin
    {@1BF9-1C0A}
    pR142_0217(23, 10, 38, 21);
    {@1C0A-1C0C}
    Exit;
  end;
  {@1C0C-1C1D}
  pR142_0217(1, 18, 38, 22);
end;

{ 1C22 }
procedure pO0EC_1C22(a0: pointer; a1: byte; a2: byte; a3: byte);
var
  v1b: byte;
begin
  if false then begin
    if LV = '''s' then;
  end;
  {@1C28-1C66}
  if PR494_byte(a0)^.v = 0 then
    v1b := 12
  else
  begin
    {@1C39-1C66}
    if (PR495_byte(a0)^.v = 1) and (b880C = 5) then
      v1b := 14
    else
    begin
      {@1C51-1C66}
      if PR492_byte(a0)^.v <> 0 then
        v1b := 13
      else
        v1b := 11;
    end;
  end;
  {@1C66-1C7F}
  pR47F_0354(a1, a2, v1b, 0, PR0_string(a0)^.v);
  if a3 <> 0 then
    pR47F_0354(a1 + PR0_byte(a0)^.v, a2, v1b, 0, '''s');
end;

{ 1CBC }
procedure pO0EC_1CBC(a0: byte; a1: byte; a2: byte; a3: byte);
var
  v4p: pointer;
  v6w: word;
  v8w: word;
  v4b: byte absolute v4p;
begin
  {@1CC2-1CCD}
  v6w := PR18_word(pAEE0)^.v;
  {@1CCD-1CD8}
  v8w := a2 * v6w;
  if a3 <> 0 then
  begin
    asm
  db 184,24,0,80,184,3,0,80,184,1,0,80,176,1,80,141,126,252,22,87
  call pR1C3_19A4
    end;
    {@1CFA-1D25}
    pR1C3_0A0C(pointer(a9DC4_9f5c[a0, a1]), v4p);
    {@1D25-1D45}
    Move(PR27_byte(v4p)^.v, PRA27_byte(pAEE0)^.a[v8w], v6w);
    {@1D45-1D6D}
    PR22_byte(pAEE0)^.v := PR22_byte(a9DC4_b6a1[a0, a1])^.v;
    if PR23_pointer(v4p)^.v <> nil then
      Move(PR0_byte(PR23_pointer(v4p)^.v)^.v, PRA0_byte(PR23_pointer(pAEE0)^.v)^.a[v8w], v6w);
    {@1D9A-1DA4}
    pR1C3_1A83(@v4b);
    {@1DA4-1DA7}
    Exit;
  end;
  {@1DA7-1DE0}
  Move(PR27_byte(a9DC4_b6a1[a0, a1])^.v, PRA27_byte(pAEE0)^.a[v8w], v6w);
  {@1DE0-1E08}
  PR22_byte(pAEE0)^.v := PR22_byte(a9DC4_b6a1[a0, a1])^.v;
  if PR23_pointer(a9DC4_b6a1[a0, a1])^.v <> nil then
    Move(PR0_byte(PR23_pointer(a9DC4_b6a1[a0, a1])^.v)^.v, PRA0_byte(PR23_pointer(pAEE0)^.v)^.a[v8w], v6w);
end;

{ 1E6D }
procedure pO0EC_1E6D(a0: byte);
begin
  {@1E70-1E81}
  pO0EC_1CBC(a0, 0, 0, 0);
  {@1E81-1E92}
  pO0EC_1CBC(a0, 0, 1, 1);
  {@1E92-1EA3}
  pO0EC_1CBC(a0, 1, 2, 1);
  {@1EA3-1EB4}
  pO0EC_1CBC(a0, 1, 3, 0);
end;

{ 1F07 }
procedure pO0EC_1F07(a0: word; a1: word; a2: word; a3: word; a4: byte; a5: byte);
var
  _f1: array[1..147] of byte;
  v148b: byte;
  _f2: array[1..60] of byte;
  { 1EB8 }
  procedure pO0EC_1EB8(b0: pointer; b1: pointer);
  begin
    {@1EBB-1EDF}
    if PR0_integer(b0)^.v < 0 then
      PR0_word(b0)^.v := 0
    else
    begin
      {@1ECE-1EDF}
      if PR0_integer(b0)^.v > 49 then
        PR0_word(b0)^.v := 49;
    end;
    {@1EDF-1EF2}
    if PR0_integer(b1)^.v < 0 then
    begin
      {@1EE8-1EF0}
      PR0_word(b1)^.v := 0;
      {@1EF0-1EF2}
      Exit;
    end;
    {@1EF2-1F03}
    if PR0_integer(b1)^.v > 24 then
      PR0_word(b1)^.v := 24;
  end;

begin
  asm
  db 141,126,16,22,87,141,126,14,22,87,85
  push cs
  call near ptr pO0EC_1EB8
  end;
  asm
  db 141,126,12,22,87,141,126,10,22,87,85
  push cs
  call near ptr pO0EC_1EB8
  end;
  asm
  db 139,70,16,137,134,70,255
  end;
  asm
  db 139,70,14,137,134,68,255
  end;
  {@1F3A-1F4C}
  FillChar(v148b, 148, 8);
  asm
  db 141,190,84,255,22,87,184,24,0,80
  call XR670_046E
  end;
  asm
  db 198,134,81,255,0
  end;
  asm
  db 198,134,79,255,0
  end;
  asm
  db 139,70,16,139,240,209,224,1,240,137,134,84,255
  end;
  asm
  db 139,70,14,139,240,209,224,1,240,137,134,86,255
  end;
  asm
  db 139,70,12,139,240,209,224,1,240,137,134,88,255
  end;
  asm
  db 139,70,10,139,240,209,224,1,240,137,134,90,255
  end;
  asm
  db 141,190,84,255,22,87
  call pO130_01A0
  end;
  asm
  db 141,190,84,255,22,87
  call pO130_0247
  db 8,192,176,0,117,1,64,136,134,76,255,138,150,107,255,138,134,81,255,48,228,139,248,136,147,108,255,254
  db 134,81,255,128,190,76,255,0,116,207
  end;
  asm
  db 128,190,81,255,4,115,3,233,28,6
  end;
  asm
  db 138,134,81,255,48,228,72,72,136,134,80,255
  end;
  asm
  db 139,70,12,43,70,16,137,134,62,255
  end;
  asm
  db 139,70,10,43,70,14,137,134,60,255
  end;
if (pO135_07D4(Integer(a0) - PR2_shortint(pA6E0)^.v, Integer(a1) - PR3_shortint(pA6E0)^.v) = 0)
      or (pO135_07D4(Integer(a2) - PR2_shortint(pA6E0)^.v, Integer(a3) - PR3_shortint(pA6E0)^.v) = 0) then
    asm
  db 139,134,62,255,153,49,208,41,208,61,6,0,127,55,139,134,60,255,153,49,208,41,208,61,6,0,127,41
  db 198,134,77,255,1,139,134,62,255,153,185,2,0,247,249,3,70,16,137,134,74,255,139,134,60,255,153,185
  db 2,0,247,249,3,70,14,137,134,72,255,235,37,198,134,77,255,0,196,62,224,166,38,138,69,2,152,5
  db 3,0,137,134,74,255,196,62,224,166,38,138,69,3,152,5,3,0,137,134,72,255
    end
  else
  begin
    asm
  db 198,134,77,255,1
    end;
    asm
  db 196,62,224,166,38,138,69,2,152,5,3,0,137,134,74,255
    end;
    asm
  db 196,62,224,166,38,138,69,3,152,5,3,0,137,134,72,255
    end;
  end;
  asm
  db 138,134,74,255,80,138,134,72,255,80,176,255,80,176,8,80
  call pO135_0A4D
  end;
  asm
  db 198,134,81,255,0
  end;
  asm
  db 49,192,137,134,66,255
  end;
  asm
  db 49,192,137,134,64,255
  end;
  asm
  db 196,62,224,166,38,138,69,2,152,139,208,139,70,16,43,194,139,240,209,224,1,240,3,134,66,255,137,134
  db 54,255,196,62,224,166,38,138,69,3,152,139,208,139,70,14,43,194,139,240,209,224,1,240,3,134,64,255
  db 137,134,52,255,139,70,16,137,134,70,255,139,70,14,137,134,68,255,198,134,76,255,0,138,134,81,255,48
db 228,139,248,138,131,108,255,48,228,139,248,138,133,172,62,152,137,134,58,255,138,134,81,255,48,228,139,248
  db 138,131,108,255,48,228,139,248,138,133,181,62,152,137,134,56,255,139,134,58,255,1,134,54,255,139,134,56
  db 255,1,134,52,255,128,126,6,0,119,30,139,134,54,255,153,185,3,0,247,249,146,9,192,116,15,139,134
  db 52,255,153,185,3,0,247,249,146,9,192,117,106,255,182,54,255,255,182,52,255,138,134,79,255,80,176,5
  db 80,255,54,226,174,255,54,224,174,255,54,56,136,255,54,54,136
  call pR1C3_08C0
  call pR1C3_10FD
  db 138,70,6,48,228,80
  call Delay
  db 255,182,54,255,255,182,52,255,176,0,80,176,0,80,255,54,60,136,255,54,58,136,255,54,56,136,255,54
  db 54,136
  call pR1C3_08C0
  db 254,134,79,255,138,134,79,255,58,70,8,114,5,198,134,79,255,0,254,134,81,255,131,190,54,255,0,124
  db 21,131,190,54,255,18,127,14,131,190,52,255,0,124,7,131,190,52,255,18,126,5,198,134,76,255,1,128
  db 190,76,255,0,117,116,138,134,81,255,58,134,80,255,115,106,139,134,58,255,1,134,66,255,139,134,56,255
  db 1,134,64,255,139,134,66,255,153,49,208,41,208,61,3,0,117,31,255,182,66,255
  call pO130_0000
  db 1,70,16,255,182,66,255
  call pO130_0000
  db 1,134,74,255,49,192,137,134,66,255,139,134,64,255,153,49,208,41,208,61,3,0,117,31,255,182,64,255
  call pO130_0000
  db 1,70,14,255,182,64,255
  call pO130_0000
  db 1,134,72,255,49,192,137,134,64,255,138,134,81,255,58,134,80,255,115,10,128,190,76,255,0,117,3,233
  db 124,254,138,134,81,255,58,134,80,255,114,3,233,43,2,49,192,137,134,50,255,49,192,137,134,48,255,49
  db 192,137,134,64,255,49,192,137,134,66,255,139,70,12,137,70,16,139,70,10,137,70,14,139,70,16,137,134
  db 70,255,139,70,14,137,134,68,255,139,70,12,5,3,0,61,49,0,126,12,139,70,12,45,49,0,137,134
  db 50,255,235,16,131,126,12,3,125,10,184,3,0,43,70,12,137,134,50,255,139,70,10,5,3,0,61,24
  db 0,126,12,139,70,10,45,24,0,137,134,48,255,235,16,131,126,10,3,125,10,184,3,0,43,70,10,137
  db 134,48,255,139,70,12,3,134,50,255,137,134,74,255,139,70,10,3,134,48,255,137,134,72,255,138,134,74
  db 255,80,138,134,72,255,80,176,255,80,176,8,80
  call pO135_0A4D
  db 196,62,224,166,38,138,69,2,152,139,208,139,70,12,43,194,139,240,209,224,1,240,137,134,54,255,196,62
  db 224,166,38,138,69,3,152,139,208,139,70,10,43,194,139,240,209,224,1,240,137,134,52,255,138,134,80,255
  db 136,134,81,255,198,134,76,255,0,138,134,81,255,48,228,139,248,138,131,108,255,48,228,139,248,138,133,172
  db 62,152,247,216,137,134,58,255,138,134,81,255,48,228,139,248,138,131,108,255,48,228,139,248,138,133,181,62
  db 152,247,216,137,134,56,255,139,134,58,255,1,134,54,255,139,134,56,255,1,134,52,255,131,190,54,255,18
  db 126,17,196,62,224,166,38,138,69,2,152,5,6,0,137,70,16,235,19,131,190,54,255,0,125,12,196,62
  db 224,166,38,138,69,2,152,137,70,16,131,190,52,255,18,126,17,196,62,224,166,38,138,69,3,152,5,6
  db 0,137,70,14,235,19,131,190,52,255,0,125,12,196,62,224,166,38,138,69,3,152,137,70,14,131,190,54
  db 255,0,124,21,131,190,54,255,18,127,14,131,190,52,255,0,124,7,131,190,52,255,18,126,5,198,134,76
  db 255,1,128,190,76,255,0,117,110,139,134,58,255,1,134,66,255,139,134,56,255,1,134,64,255,139,134,66
  db 255,153,49,208,41,208,61,3,0,117,31,255,182,66,255
  call pO130_0000
  db 1,70,16,255,182,66,255
  call pO130_0000
  db 1,134,74,255,49,192,137,134,66,255,139,134,64,255,153,49,208,41,208,61,3,0,117,31,255,182,64,255
  call pO130_0000
  db 1,70,14,255,182,64,255
  call pO130_0000
  db 1,134,72,255,49,192,137,134,64,255,254,142,81,255,128,190,76,255,0,117,3,233,196,254,233,213,0,198
  db 134,77,255,1,196,62,224,166,38,138,69,2,152,139,208,139,70,12,43,194,80,196,62,224,166,38,138,69
  db 3,152,139,208,139,70,10,43,194,80
  call pO135_07D4
  db 8,192,117,19,138,70,12,80,138,70,10,80,176,3,80,176,8,80
  call pO135_0A4D
  db 196,62,224,166,38,138,69,2,152,139,208,139,70,12,43,194,139,240,209,224,1,240,137,134,54,255,196,62
  db 224,166,38,138,69,3,152,139,208,139,70,10,43,194,139,240,209,224,1,240,137,134,52,255,255,182,54,255
  db 255,182,52,255,138,134,79,255,80,176,5,80,255,54,226,174,255,54,224,174,255,54,56,136,255,54,54,136
  call pR1C3_08C0
  db 128,126,6,0,118,51
  call pR1C3_10FD
  db 138,70,6,48,228,80
  call Delay
  db 255,182,54,255,255,182,52,255,176,0,80,176,0,80,255,54,60,136,255,54,58,136,255,54,56,136,255,54
  db 54,136
  call pR1C3_08C0
  db 128,190,77,255,0,117,3,233,22,251
  end;
  asm
  call pR1C3_10FD
  end;
end;

{ 2601 }
procedure pO0EC_2601(a0: pointer; a1: byte; a2: string);
var
  v257b: byte;
  v258b: byte;
  v259b: byte;
  v260b: byte;
  v261b: byte;
  v262b: byte;
  v258sb: shortint absolute v258b;
  v257sb: shortint absolute v257b;
begin
  {@261C-27A5}
  if b880C = 5 then
  begin
    {@2626-2638}
    if a1 <> 0 then
      v259b := 21
    else
      v259b := 23;
    {@2638-2641}
    pO0EC_1E6D(v259b);
    if pO135_0805(longint(a0), 1) = 0 then
      pO135_0A4D(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), 3, 8);
    {@2676-2690}
    if a1 <> 0 then
      pR5A0_0000(w3DF6)
    else
      pR5A0_0000(w3DFC);
    {@2690-26A6}
    pO0EC_1B08(pointer(a0), a2, 10, 0);
    if a1 <> 0 then
      v262b := PR17_byte(p87F8)^.v
    else
      v262b := 0;
    {@26BF-26DD}
    v257b := aA014_ff2a[pO135_0D1A(longint(a0))] * 3;
    {@26DD-26FB}
    v258b := aA05C_ff2a[pO135_0D1A(longint(a0))] * 3;
    for v261b := 0 to v262b do
      for v260b := 0 to 3 do
      begin
        {@2723-274C}
        pR1C3_08C0(v257sb, v258sb, v260b, 5, pAEE0, l8836);
        {@274C-2751}
        pR1C3_10FD;
        {@2751-275A}
        Delay(70);
        {@275A-2781}
        pR1C3_08C0(v257sb, v258sb, 0, 0, p883A, l8836);
      end;
    {@2792-2797}
    pR1C3_10FD;
    if v262b = 0 then
      pR47F_0D1A;
    {@27A3-27A5}
    Exit;
  end;
  {@27A5-27BB}
  pO0EC_1B08(pointer(a0), a2, 10, 1);
end;

{ 27C1 }
function pO0EC_27C1(a0: pointer; a1: byte; a2: pointer): byte;
var
  v2b: byte;
begin
  {@27C7-27CB}
  v2b := 0;
  {@27CB-27E2}
  PR0_pointer(a2)^.v := PR323_pointer(a0)^.v;
  {@27E2-2822}
  while (PR0_pointer(a2)^.v <> nil) and (v2b = 0) do
  begin
    {@27F4-2820}
    if PR0_byte(PR0_pointer(a2)^.v)^.v = a1 then
      v2b := 1
    else
      PR0_pointer(a2)^.v := PR5_pointer(PR0_pointer(a2)^.v)^.v;
  end;
  {@2822-2828}
  pO0EC_27C1 := v2b;
end;

{ 2851 }
procedure pO0EC_2851(a0: pointer; a1: word);
var
  v1b: byte;
  v3w: word;
  _f1: array[1..1] of byte;
  v3b: byte absolute v3w;
begin
  if false then begin
    if LSV = [0..1] then;
  end;
  {@2857-285C}
  v3w := 0;
  {@285C-2860}
  v1b := 0;
  if PR508_byte(a0)^.v >= a1 then
    v1b := PR508_byte(a0)^.v - a1
  else
    v3w := a1 - PR508_byte(a0)^.v;
  {@2895-28ED}
  if (v3w > 9) or (v1b = 0) and (PR493_byte(a0)^.v = 1) then
    PR493_byte(a0)^.v := 6
  else
  begin
    {@28B7-28ED}
    if v3w > 0 then
    begin
      {@28BD-28C6}
      PR493_byte(a0)^.v := 5;
      if b880C = 5 then
        PR13_byte(PR487_pointer(a0)^.v)^.v := v3b;
    end
    else
    begin
      {@28DE-28ED}
      if v1b = 0 then
        PR493_byte(a0)^.v := 4;
    end;
  end;
  {@28ED-2939}
  if not (PR493_byte(a0)^.v in [0..1]) then
  begin
    {@2902-290B}
    PR494_byte(a0)^.v := 0;
    {@290B-2914}
    PR508_byte(a0)^.v := 0;
    if b880C = 5 then
    begin
      {@291B-292A}
      Dec(aA7CE_ec3f[PR495_shortint(a0)^.v]);
      {@292A-2937}
      PR3_byte(PR487_pointer(a0)^.v)^.v := 0;
    end;
    {@2937-2939}
    Exit;
  end;
  {@2939-2944}
  PR508_byte(a0)^.v := v1b;
end;

{ 296E }
procedure pO0EC_296E(a0: pointer);
var
  v41a: string[40];
  _f1: array[1..1] of byte;
  v41a2: string[40] absolute v41a;
begin
  if false then begin
    if LV = 'is fully healed' then;
    if LV = 'is partially healed' then;
  end;
  {@2974-29AE}
  if PR508_byte(a0)^.v = PR178_byte(a0)^.v then
    v41a := 'is fully healed'
  else
    v41a := 'is partially healed';
  {@29AE-29C3}
  pO0EC_1B08(pointer(a0), v41a2, 10, 1);
  if b880C <> 5 then
    pO0EC_0987(pointer(a0), Ord(a0 = p9CEE));
end;

{ 29F3 }
function pO0EC_29F3(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@29F9-2A0A}
  if PR495_byte(a0)^.v = 0 then
  begin
    {@2A04-2A08}
    pO0EC_29F3 := 1;
    {@2A08-2A0A}
    Exit;
  end;
  {@2A0A-2A0E}
  pO0EC_29F3 := 0;
end;

{ 2A17 }
procedure pO0EC_2A17;
var
  v4p: pointer;
begin
  {@2A1D-2A22}
  bA7CE := 0;
  {@2A22-2A27}
  bA7CF := 0;
  {@2A27-2A34}
  v4p := p9CF2;
  {@2A34-2A6B}
  while v4p <> nil do
  begin
    {@2A3C-2A56}
    if PR494_byte(v4p)^.v <> 0 then
      Inc(aA7CE_ec3f[PR495_shortint(v4p)^.v]);
    {@2A56-2A69}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 2A6F }
function pO0EC_2A6F(a0: pointer; a1: byte; a2: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..3] of byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
begin
  {@2A75-2AA7}
  pO130_08D7(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), a1, 255, pO135_0CF2(longint(a0)));
  {@2AA7-2AAD}
  v2b := bA6E4;
  {@2AAD-2AB1}
  v3b := 0;
  if a2 <> 0 then
    v10b := PR495_byte(a0)^.v
  else
    v10b := pO0EC_29F3(pointer(a0));
  {@2AD1-2B5C}
  if v2b > 0 then
  begin
    {@2ADA-2B50}
    for v4b := 1 to v2b do
    begin
      {@2AEF-2B48}
      if PR495_byte(aA583_9f8b[aA6E2_fd21[v4b].f])^.v = v10b then
      begin
        {@2B16-2B19}
        Inc(v3b);
        {@2B19-2B48}
        Move(aA6E2_eec0[v4b], aA6E2_eec0[v3b], 3);
      end;
    end;
    {@2B50-2B56}
    v2b := v3b;
    {@2B56-2B5C}
    bA6E4 := v3b;
  end;
  {@2B5C-2B62}
  pO0EC_2A6F := v2b;
  for v4b := 1 to v2b do
    aAE8E_ec3f[v4b] := aA6E2_fd21[v4b].f;
  {@2B9B-2C19}
  if pO0EC_27C1(pointer(a0), 91, @v8b) <> 0 then
  begin
    {@2BB1-2BB5}
    v4b := 1;
    {@2BB5-2BB9}
    v9b := 0;
    {@2BB9-2C19}
    while (v4b <= v2b) and (v9b = 0) do
    begin
      {@2BC7-2C14}
      if aA583_b676[aAE8E_ec3f[v4b]] = lAEEA then
      begin
        {@2BEE-2BF4}
        v3b := bAE8F;
        {@2BF4-2C02}
        bAE8F := aAE8E_ec3f[v4b];
        {@2C02-2C10}
        aAE8E_ec3f[v4b] := v3b;
        {@2C10-2C14}
        v9b := 1;
      end;
      {@2C14-2C17}
      Inc(v4b);
    end;
  end;
end;

{ 2C22 }
function pO0EC_2C22(a0: longint; a1: longint): byte;
var
  _f1: array[1..764] of byte;
  v766b: byte;
  v767b: byte;
  _f2: array[1..1] of byte;
begin
  {@2C29-2C3D}
  Move(bA6E5, v766b, 216);
  {@2C3D-2C46}
  PR6_byte(pA6E0)^.v := 1;
  {@2C46-2C76}
  pO130_08D7(pO135_0CA2(longint(a0)), pO135_0CCA(longint(a0)), 255, 255, pO135_0CF2(longint(a0)));
  {@2C76-2C7F}
  PR6_byte(pA6E0)^.v := 0;
  {@2C7F-2C84}
  v767b := 1;
  {@2C84-2CC0}
  while (aA583_b676[aA6E2_fd21[v767b].f] <> a1) and (v767b < bA6E4) do
    Inc(v767b);
  {@2CC0-2CD9}
  pO0EC_2C22 := aA6E3_fd21[v767b].f shr 1;
  {@2CD9-2CED}
  Move(v766b, bA6E5, 216);
end;

{ 2CF6 }
function pO0EC_2CF6(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@2CFC-2D09}
  PR3_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@2D09-2D15}
  PR0_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@2D15-2D22}
  PR6_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@2D22-2D2F}
  PR5_byte(PR487_pointer(a0)^.v)^.v := 0;
  {@2D2F-2D33}
  pO0EC_2CF6 := 1;
end;

{ 2D45 }
function pO0EC_2D45(a0: pointer): byte;
begin
  if false then begin
    if LV = 'Guarding' then;
  end;
  {@2D4B-2D58}
  pO0EC_2D45 := pO0EC_2CF6(pointer(a0));
  if PR15_byte(PR487_pointer(a0)^.v)^.v = 0 then
  begin
    {@2D67-2D74}
    PR6_byte(PR487_pointer(a0)^.v)^.v := 1;
    {@2D74-2D87}
    pO0EC_1AAC('Guarding');
  end;
end;

{ 2D90 }
function pO0EC_2D90(a0: byte; a1: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..3] of byte;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
begin
  {@2D96-2E91}
  if (pO102_1276(p9CEE, 0) = 0) and (pO102_1276(p9CEE, 5) = 0) and (pO102_1276(p9CEE, 4) < 8) then
    v2b := 6
  else
    case a651A_3981[a0].f of
      0: begin
        {@2DEC-2DFF}
        v2b := pO102_1276(p9CEE, 0);
        {@2DFF-2E12}
        v3b := pO102_1276(p9CEE, 3);
        if v2sb < v3sb then
          v2b := v3b;
      end;
      1: begin
        {@2E26-2E3E}
        v2b := pO102_1276(p9CEE, 4) - 7;
        if v2sb < 0 then
          v2b := 0;
      end;
      2: begin
        {@2E4E-2E61}
        v2b := pO102_1276(p9CEE, 5);
        {@2E61-2E79}
        v3b := pO102_1276(p9CEE, 4) - 8;
        if v2sb < v3sb then
          v2b := v3b;
      end;
      3: v2b := 12;
    end;
  {@2E91-2EAE}
  if (bAE61 <> 0) and (a651A_3981[a0].f <> 3) then
    v2b := 6;
  {@2EAE-2EBE}
  if (a1 <> 0) and (v2sb > 31) then
    v2b := 31;
  {@2EBE-2EC4}
  pO0EC_2D90 := v2b;
end;

{ 2ED1 }
procedure pO0EC_2ED1;
begin
  if false then begin
    if LV = 'PIC' then;
    LP1('PIC');
  end;
  asm
  db 198,6,126,174,1
  end;
  case b880C of
    0: asm
  db 176,0,80
  call pR142_00D4
      end;
    10, 1: begin
      asm
  db 128,62,120,197,0,116,5
  call pR142_011B
      end;
      asm
  db 184,3,0,80,184,3,0,80,176,1,80,176,0,80
  call pO111_00A8
      end;
      asm
  db 255,54,240,156,255,54,238,156
  push cs
  call near ptr pO0EC_07C0
      end;
      asm
  push cs
  call near ptr pO0EC_301C
      end;
    end;
    2: begin
      asm
  call pR142_011B
      end;
      {@2F31-2F4B}
      pO111_01F1('PIC', 128, 0);
      asm
  db 184,3,0,80,184,3,0,80,176,1,80,176,0,80
  call pO111_00A8
      end;
      asm
  db 255,54,240,156,255,54,238,156
  push cs
  call near ptr pO0EC_07C0
      end;
      asm
  push cs
  call near ptr pO0EC_301C
      end;
      asm
  db 198,6,30,217,1
      end;
    end;
    4: begin
      asm
  call pR142_011B
      end;
      asm
  call pO10E_0000
      end;
      asm
  db 255,54,240,156,255,54,238,156
  push cs
  call near ptr pO0EC_07C0
      end;
      asm
  push cs
  call near ptr pO0EC_301C
      end;
      asm
  db 198,6,143,197,0
      end;
    end;
    3: asm
  db 128,62,213,170,9,116,16,196,62,248,135,38,128,125,35,1,117,5
  call pO10E_0000
      end;
    6: begin
      asm
  call pR142_011B
      end;
      {@2FC1-2FDB}
      pO111_01F1('PIC', 129, 0);
      asm
  db 184,3,0,80,184,3,0,80,176,1,80,176,0,80
  call pO111_00A8
      end;
      asm
  db 255,54,240,156,255,54,238,156
  push cs
  call near ptr pO0EC_07C0
      end;
      asm
  db 198,6,30,217,1
      end;
    end;
  end;
end;

{ 301C }
procedure pO0EC_301C;
var
c49: record case byte of 0: (v49a2: string[48]); 1: (v49a: string[40]); 2: (v49b: byte);
      3: (_p3: array[1..41] of byte; v8a2: string[7]); 4: (_p4: array[1..41] of byte; v8a: string[2]);
      5: (_p5: array[1..41] of byte; v8b: byte); 6: (_p6: array[1..44] of byte; v5a2: string[4]);
      7: (_p7: array[1..44] of byte; v5a: string[2]); 8: (_p8: array[1..44] of byte; v5b: byte);
      9: (_p9: array[1..47] of byte; v2b: byte); 10: (_p10: array[1..48] of byte; v1b: byte) end;
begin
  if false then begin
    if LV = '0' then;
    if LV = ',' then;
    if LV = ' ' then;
    if LV = ':' then;
    if LV = ' camping' then;
    if LV = ' search' then;
  end;
  {@3023-302D}
  if b880C = 3 then
    Exit;
  {@302D-3031}
  c49.v49b := 0;
  {@3031-3037}
  c49.v1b := bA9F3;
  {@3037-303D}
  c49.v2b := bA9F4;
  {@303D-305E}
  c49.v5a := pO0EC_142F(PR7_byte(p87F8)^.v);
  if c49.v5b < 2 then
    c49.v5a := '0' + c49.v5a2;
  {@308C-30C2}
  c49.v8a := pO0EC_142F(PR6_byte(p87F8)^.v * 10 + PR5_byte(p87F8)^.v);
  if c49.v8b < 2 then
    c49.v8a := '0' + c49.v8a2;
  {@30F0-313E}
  if PR25_byte(p87F8)^.v = 0 then
    c49.v49a := Concat(pO0EC_142F(c49.v1b) + ',', pO0EC_142F(c49.v2b)) + ' ';
  {@313E-317E}
  c49.v49a := c49.v49a2 + a3D96_d854[bA9F5] + ' ';
  {@317E-31BA}
  c49.v49a := c49.v49a2 + c49.v5a2 + ':' + c49.v8a2;
  if b880C = 2 then
    c49.v49a := c49.v49a2 + ' camping'
  else
  begin
    {@31EB-3221}
    if (PR24_byte(p87F8)^.v and 1) > 0 then
      c49.v49a := c49.v49a2 + ' search';
  end;
  {@3221-3232}
  pR142_0217(17, 15, 38, 15);
  {@3232-3248}
  pR47F_0354(17, 15, 10, 0, c49.v49a2);
end;

{ 324C }
procedure pO0EC_324C;
begin
  {@324F-3254}
  pO135_00E5;
  {@3254-3259}
  pR142_017B;
  {@3259-327E}
  pO135_0A4D(PR2_shortint(pA6E0)^.v + 3, PR3_shortint(pA6E0)^.v + 3, 255, 8);
end;

{ 3280 }
function pO0EC_3280(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@3286-32B6}
  if (PR427_pointer(a0)^.v <> nil) and (a94E2_3981[PR46_byte(PR427_pointer(a0)^.v)^.v].f > 1) then
  begin
    {@32B0-32B4}
    pO0EC_3280 := 1;
    {@32B4-32B6}
    Exit;
  end;
  {@32B6-32BA}
  pO0EC_3280 := 0;
end;

{ 32C3 }
function pO0EC_32C3(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@32C9-3305}
pO0EC_32C3 := Ord((pO0EC_3280(pointer(a0)) <> 0) and (Ord((a94E4_3981[PR46_byte(PR427_pointer(a0)^.v)^.v].f
      and 20) = 20) <> 0));
end;

{ 330E }
function pO0EC_330E(a0: pointer; a1: pointer): byte;
var
  v5p: pointer;
  v6b: byte;
begin
  {@3314-3318}
  pO0EC_330E := 0;
  {@3318-332B}
  v5p := PR427_pointer(a0)^.v;
  {@332B-3337}
  PR0_pointer(a1)^.v := nil;
  {@3337-333B}
  v6b := 0;
  if v5p <> nil then
  begin
    {@3343-3359}
    v6b := a94E4_3981[PR46_byte(v5p)^.v].f;
    if (v6b and 16) <> 0 then
      PR0_pointer(a1)^.v := v5p;
    {@3372-33BB}
    if (v6b and 8) <> 0 then
    begin
      {@337B-339B}
      if (v6b and 1) <> 0 then
        PR0_pointer(a1)^.v := PR471_pointer(a0)^.v;
      {@339B-33BB}
      if (v6b and 128) <> 0 then
        PR0_pointer(a1)^.v := PR475_pointer(a0)^.v;
    end;
  end;
  {@33BB-33D1}
  if (PR0_pointer(a1)^.v <> nil) or (v6b = 10) then
    pO0EC_330E := 1;
end;

{ 33E6 }
function pO0EC_33E6(a0: byte): byte;
var
  v5p: pointer;
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LV = 'is bandaged' then;
    LP1('is bandaged');
  end;
  asm
  db 198,70,250,0
  end;
  asm
  db 161,242,156,139,22,244,156,137,70,251,137,86,253
  end;
  {@33FD-3486}
  while v5p <> nil do
  begin
    {@3408-3470}
if (PR18_byte(PR487_pointer(v5p)^.v)^.v = 0) and (PR495_byte(v5p)^.v = 0)
        and (PR493_byte(v5p)^.v = 5) then
    begin
      asm
  db 198,70,250,1
      end;
      if a0 <> 0 then
      begin
        asm
  db 196,126,251,38,198,133,237,1,4
        end;
        asm
  db 196,126,251,38,196,189,231,1,38,198,69,13,0
        end;
        {@344D-346C}
        pO0EC_1B08(v5p, 'is bandaged', 10, 1);
        asm
  db 198,70,6,0
        end;
      end;
    end;
    asm
  db 196,126,251,38,139,133,227,1,38,139,149,229,1,137,70,251,137,86,253
    end;
  end;
  asm
  db 138,70,250,136,70,255
  end;
end;

{ 3497 }
procedure pO0EC_3497(a0: S40; a1: byte; a2: byte; a3: pointer);
var
  v42b: byte;
  v43b: byte;
  _f1: array[1..1] of byte;
  v45b: byte;
  v49p: pointer;
  v50b: byte;
  v51b: byte;
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@34B1-34B7}
  v50b := bC5C3;
  {@34B7-34BD}
  bAADE := a2;
  {@34BD-34CB}
  pAADF := p9CEE;
  {@34CB-34CF}
  v43b := 255;
  {@34CF-34D5}
  v51b := bC591;
  {@34D5-34DA}
  bC591 := 0;
  {@34DA-36B4}
  while (v43b >= 2) and (v43b <> 27) do
  begin
    {@34EC-34FA}
    pO0EC_07C0(pointer(PR0_pointer(a3)^.v));
    if (b880C = 2) or (b880C = 6) then
      v45b := 1
    else
      v45b := 0;
    {@3512-351E}
    if b880C = 0 then
      bC5C3 := 1;
    {@351E-3536}
    if a1 <> 0 then
      pO108_00CB(1)
    else
      pO108_00CB(0);
    {@3536-3564}
    v43b := pO108_1009(a0 + ' ', s2BB6, 1, v45b);
    {@3564-356A}
    bC5C3 := v50b;
    {@356A-357A}
    v49p := PR0_pointer(a3)^.v;
    if bAAE6 <> 0 then
    begin
      {@3584-358A}
      v42b := v43b;
      case v42b of
        27: begin
          {@3591-359F}
          if a1 <> 0 then
            v49p := nil;
        end;
        80: begin
          {@35A6-35B9}
          v49p := PR483_pointer(v49p)^.v;
          if v49p = nil then
            v49p := p9CF2;
        end;
        72: begin
          {@35D8-368B}
          if bC5C5 <> 0 then
          begin
            {@35DF-3610}
            if bAADE <> 0 then
              v49p := pAADF
            else
            begin
              {@35F5-3602}
              v49p := p9CF6;
              {@3602-3610}
              p9CEE := p9CF6;
            end;
          end
          else
          begin
            {@3612-361F}
            v49p := p9CF2;
            if PR0_pointer(a3)^.v <> p9CF2 then
              while PR483_pointer(v49p)^.v <> PR0_pointer(a3)^.v do
                v49p := PR483_pointer(v49p)^.v
            else
              while PR483_pointer(v49p)^.v <> nil do
                v49p := PR483_pointer(v49p)^.v;
          end;
        end;
      end;
    end
    else
    begin
      {@368D-36A1}
      if (a1 <> 0) and (v43b = 1) then
        v49p := nil;
    end;
    {@36A1-36B1}
    PR0_pointer(a3)^.v := v49p;
  end;
  {@36B4-36BA}
  bC591 := v51b;
  {@36BA-36BF}
  bAADE := 0;
end;

{ 36C5 }
function pO0EC_36C5(a0: longint; a1: longint): byte;
var
  v2b: byte;
  v3b: byte;
  v5w: word;
  v7w: word;
  v9w: word;
  v11w: word;
  v13i: integer;
  v15i: integer;
  _f1: array[1..1] of byte;
  v11i: integer absolute v11w;
  v9i: integer absolute v9w;
  v7i: integer absolute v7w;
  v5i: integer absolute v5w;
begin
  {@36CB-36DA}
  v5w := pO135_0CA2(longint(a0));
  {@36DA-36E9}
  v7w := pO135_0CCA(longint(a0));
  {@36E9-36F8}
  v9w := pO135_0CA2(longint(a1));
  {@36F8-3707}
  v11w := pO135_0CCA(longint(a1));
  asm
  db 139,70,247,43,70,251,153,49,208,41,208,137,70,243
  end;
  asm
  db 139,70,245,43,70,249,153,49,208,41,208,137,70,241
  end;
  {@3723-3727}
  v2b := 0;
  {@3727-372B}
  v3b := 0;
  {@372B-38EB}
  while v3b = 0 do
  begin
    {@3734-38DF}
    case v2b of
      0: v3b := Ord((v11i <= v7i) and ((618 * v13i div 256) <= v15i));
      2: v3b := Ord((v9i >= v5i) and ((106 * v13i div 256) >= v15i));
      4: v3b := Ord((v11i >= v7i) and ((618 * v13i div 256) <= v15i));
      6: v3b := Ord((v9i <= v5i) and ((106 * v13i div 256) >= v15i));
1: v3b := Ord((v11i < v7i) and (v9i > v5i) and ((618 * v13i div 256) >= v15i)
          and ((106 * v13i div 256) <= v15i));
3: v3b := Ord((v11i > v7i) and (v9i > v5i) and ((618 * v13i div 256) >= v15i)
          and ((106 * v13i div 256) <= v15i));
5: v3b := Ord((v11i > v7i) and (v9i < v5i) and ((618 * v13i div 256) >= v15i)
          and ((106 * v13i div 256) <= v15i));
7: v3b := Ord((v11i < v7i) and (v9i < v5i) and ((618 * v13i div 256) >= v15i)
          and ((106 * v13i div 256) <= v15i));
    end;
    {@38DF-38E8}
    if v3b = 0 then
      Inc(v2b);
  end;
  {@38EB-38F1}
  pO0EC_36C5 := v2b;
end;

{ 38FA }
function pO0EC_38FA(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v9l: longint;
  v4sb: shortint absolute v4b;
begin
  {@3900-3904}
  v3b := 0;
  {@3904-3908}
  v4b := 0;
  {@3908-3B37}
  while (v4sb <= 6) and (v3b = 0) do
  begin
    {@391A-3B31}
    if (PRA337_byte(a0)^.a[v4sb] > 0) and (PRA337_byte(a0)^.a[v4sb] < 40) then
    begin
      {@3942-3953}
      v5b := PRA337_byte(a0)^.a[v4sb];
      {@3953-396F}
      v9l := pO102_12D1(longint(a0), v5b + 1, v4b);
      {@396F-3996}
      v2b := Ord(a7CDE_0777[PR173_shortint(a0)^.v, v4sb] <= v5b);
      if v2b = 0 then
      begin
        {@399F-3AFB}
        with PW20_13_38FA(a0)^ do
        begin
          case _w13_173byte of
            2: begin
              {@39B4-39DE}
              if (v4b = 2) and ((v5b = 8) and (_w13_17byte = 17) or (v5b = 7) and (_w13_17byte < 17)) then
                v2b := 1;
            end;
            0: begin
              {@39E5-3A0F}
              if (v4b = 2) and ((v5b = 6) and (_w13_17byte = 17) or (v5b = 5) and (_w13_17byte < 17)) then
                v2b := 1;
              {@3A0F-3A39}
              if (v4b = 5) and ((v5b = 9) and (_w13_19byte < 17) or (v5b = 10) and (_w13_19byte = 17)) then
                v2b := 1;
            end;
            3: begin
              {@3A40-3A5A}
              if (v4b = 2) and (v5b = 5) and (_w13_17byte < 18) then
                v2b := 1;
              {@3A5A-3A6A}
              if (v4b = 0) and (v5b >= 7) then
                v2b := 1;
            end;
            1: begin
              {@3A71-3AA1}
if ((v4b = 2) or (v4b = 4)) and ((v5b = 7) and (_w13_17byte = 17) or (v5b = 6)
                  and (_w13_17byte < 17)) then
                v2b := 1;
              {@3AA1-3ACB}
              if (v4b = 5) and ((v5b = 7) and (_w13_19byte = 17) or (v5b = 6) and (_w13_19byte < 17)) then
                v2b := 1;
            end;
            4: begin
              {@3AD1-3AFB}
              if (v4b = 2) and ((v5b = 5) and (_w13_17byte = 17) or (v5b = 4) and (_w13_17byte < 17)) then
                v2b := 1;
            end;
          end;
        end;
      end;
      {@3AFB-3B31}
      v3b := Ord((PR370_longint(a0)^.v >= v9l) and (v9l > 0) and (v2b = 0));
    end;
    {@3B31-3B34}
    Inc(v4b);
  end;
  {@3B37-3B3D}
  pO0EC_38FA := v3b;
end;

{ 3B46 }
procedure pO0EC_3B46(a0: byte; a1: byte; a2: byte);
var
  _f1: array[1..13] of byte;
  v14b: byte;
  v15b: byte;
  _f2: array[1..1] of byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  _f3: array[1..2] of byte;
  v22b: byte;
  v23b: byte;
  v19sb: shortint absolute v19b;
  v18sb: shortint absolute v18b;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for a0 := a0 to a0 do ;
  end;
  {@3B4C-3B5F}
  pO135_0A4D(bAE5B, bAE5C, 255, 8);
  {@3B5F-3B65}
  v18b := bAE5B;
  {@3B65-3B6B}
  v19b := bAE5C;
  {@3B6B-3B76}
  pR5A0_0000(a2);
  {@3B76-3B87}
  pO0EC_1CBC(a1, 0, 0, 0);
  {@3B87-3B98}
  pO0EC_1CBC(a1, 0, 1, 1);
  {@3B98-3BA9}
  pO0EC_1CBC(a1, 1, 2, 0);
  {@3BA9-3BBA}
  pO0EC_1CBC(a1, 1, 3, 1);
  {@3BBA-3BBE}
  v17b := 1;
  {@3BBE-3BC2}
  v23b := 0;
  {@3BC2-3BC6}
  v22b := 0;
  if v18sb < 3 then
    v23b := (v18sb - 3) * 3
  else
  begin
    {@3BDE-3BF7}
    if v18sb > 46 then
      v23b := (v18sb - 49 + 3) * 3;
  end;
  {@3BF7-3C28}
  if v19sb < 3 then
    v22b := (v19sb - 3) * 3
  else
  begin
    {@3C0F-3C28}
    if v19sb > 21 then
      v22b := (v19sb - 24 + 3) * 3;
  end;
  {@3C28-3C37}
  v14b := a0 * 3 + 1;
  for v15b := 1 to v14b do
  begin
    asm
  db 138,70,241,48,228,49,210,154,254,16,37,8,137,70,249,137,94,251,137,86,253,138,70,241,48,228,209,224
  db 72,72,8,192,115,3,233,236,0,136,70,240,235,3,254,78,240,154,173,21,37,8,185,130,0,49,246,49
  db 255,154,234,16,37,8,185,130,33,190,162,218,191,15,73,154,234,16,37,8,137,70,243,137,94,245,137,86
  db 247,139,70,243,139,94,245,139,86,247,154,16,18,37,8,139,78,249,139,118,251,139,126,253,154,234,16,37
  db 8,154,2,17,37,8,139,200,139,218,138,70,233,152,153,3,193,19,211,136,70,236,139,70,243,139,94,245
  db 139,86,247,154,35,18,37,8,139,78,249,139,118,251,139,126,253,154,234,16,37,8,154,2,17,37,8,139
  db 200,139,218,138,70,234,152,153,3,193,19,211,136,70,235,128,126,236,247,124,75,128,126,236,9,127,69,128
  db 126,235,247,124,63,128,126,235,9,127,57,184,4,0,80,154,151,21,37,8,136,70,255,138,70,236,152,5
  db 9,0,80,138,70,235,152,5,9,0,80,138,70,255,80,138,70,239,80,255,54,226,174,255,54,224,174,255
  db 54,56,136,255,54,54,136
  call pR1C3_08C0
  db 128,126,240,0,116,3,233,25,255
    end;
    {@3D60-3D65}
    pR1C3_10FD;
  end;
  {@3D70-3D83}
  pO135_0A4D(bAE5B, bAE5C, 255, 8);
end;

{ 3D89 }
function pO0EC_3D89(a0: pointer; a1: byte): shortint;
var
  v2b: byte;
  v2sb: shortint absolute v2b;
begin
  {@3D8F-3DFF}
  case PR25_byte(a0)^.v of
    3: v2b := 254;
    4..6: v2b := 255;
    7..14: v2b := 0;
    15: v2b := 1;
    16: v2b := 2;
    17..19: begin
      {@3DD8-3DFF}
      if (a1 = 2) or (a1 = 4) or (a1 = 3) then
        v2b := PR25_byte(a0)^.v - 14
      else
        v2b := 2;
    end;
  end;
  {@3DFF-3E05}
  pO0EC_3D89 := v2sb;
end;

{ 3E0E }
procedure pO0EC_3E0E;
var
  v4p: pointer;
begin
  {@3E14-3E19}
  bC592 := 0;
  {@3E19-3E1E}
  bC595 := 0;
  {@3E1E-3E23}
  bC58A := 0;
  {@3E23-3E28}
  bB029 := 8;
  {@3E28-3E36}
  XR670_046E(@bA7BE, 12);
  {@3E36-3E6A}
  while pA7CA <> nil do
  begin
    {@3E3F-3E51}
    v4p := PR42_pointer(pA7CA)^.v;
    {@3E51-3E5B}
    pR670_03ED(@bA7CA);
    {@3E5B-3E68}
    pA7CA := v4p;
  end;
  {@3E6A-3E72}
  pA7CA := nil;
end;

{ 3E76 }
procedure pO0EC_3E76(a0: byte; a1: byte);
begin
  {@3E79-3EC6}
  if Odd(a0) then
  begin
    {@3E80-3EC4}
    if (a0 = 3) or (a0 = 5) then
      pO0EC_1CBC(a1 + 1, 1, 0, Ord(a0 = 5))
    else
      pO0EC_1CBC(a1 + 1, 0, 0, Ord(a0 = 7));
    {@3EC4-3EC6}
    Exit;
  end;
  {@3EC6-3EF0}
  pO0EC_1CBC(a1 + a0 mod 4, a0 shr 1 shr 1, 0, 0);
end;

{ 3EF4 }
begin
end.

