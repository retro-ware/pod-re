{ O0BB: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0BB;

interface

uses GAMEDATA;

function pO0BB_0123(a0: byte; a1: pointer): byte;
function pO0BB_09DE(a0: byte): byte;
function pO0BB_0D5B(a0: byte): byte;
procedure pO0BB_10E6(a0: byte; a1: word; a2: pointer);
procedure pO0BB_121C(a0: byte; a1: byte; a2: byte; a3: pointer);
function pO0BB_6C36(a0: pointer): byte;
procedure pO0BB_6C6B(a0: pointer; a1: pointer; a2: byte);
procedure pO0BB_6CF9(a0: pointer; a1: S40; a2: byte);
procedure pO0BB_3336;
procedure pO0BB_6DFB;
procedure pO0BB_1D6C;
procedure pO0BB_1D9F;
procedure pO0BB_1DD6;
procedure pO0BB_1E12;
procedure pO0BB_1E55;
procedure pO0BB_1E8F;
procedure pO0BB_1ECE;
procedure pO0BB_1EFC;
procedure pO0BB_1F4F;
procedure pO0BB_203F;
procedure pO0BB_219D;
procedure pO0BB_223D;
procedure pO0BB_2284;
procedure pO0BB_22E9;
procedure pO0BB_2317;
procedure pO0BB_236D;
procedure pO0BB_24AC;
procedure pO0BB_250F;
procedure pO0BB_2548;
procedure pO0BB_2581;
procedure pO0BB_2625;
procedure pO0BB_270E;
procedure pO0BB_275E;
procedure pO0BB_2797;
procedure pO0BB_27D2;
procedure pO0BB_2833;
procedure pO0BB_2860;
procedure pO0BB_2B20;
procedure pO0BB_2D20;
procedure pO0BB_2E8F;
procedure pO0BB_2ED5;
procedure pO0BB_2F08;
procedure pO0BB_2F48;
procedure pO0BB_3012;
procedure pO0BB_32C8;
procedure pO0BB_3446;
procedure pO0BB_347F;
procedure pO0BB_34AD;
procedure pO0BB_36EC;
procedure pO0BB_3A62;
procedure pO0BB_3AA1;
procedure pO0BB_3AD0;
procedure pO0BB_3B7B;
procedure pO0BB_3BBC;
procedure pO0BB_3C06;
procedure pO0BB_3C8B;
procedure pO0BB_3CB6;
procedure pO0BB_3CED;
procedure pO0BB_3D5E;
procedure pO0BB_3DEF;
procedure pO0BB_3E29;
procedure pO0BB_3E7D;
procedure pO0BB_3F73;
procedure pO0BB_3FFA;
procedure pO0BB_40A2;
procedure pO0BB_40E3;
procedure pO0BB_412A;
procedure pO0BB_418B;
procedure pO0BB_41D1;
procedure pO0BB_429B;
procedure pO0BB_4365;
procedure pO0BB_442A;
procedure pO0BB_4457;
procedure pO0BB_448F;
procedure pO0BB_451E;
procedure pO0BB_45EC;
procedure pO0BB_4693;
procedure pO0BB_47DF;
procedure pO0BB_495E;
procedure pO0BB_4A71;
procedure pO0BB_4ABA;
procedure pO0BB_4AF4;
procedure pO0BB_4B22;
procedure pO0BB_4BCE;
procedure pO0BB_4CAC;
procedure pO0BB_4CDE;
procedure pO0BB_4DCB;
procedure pO0BB_4DF8;
procedure pO0BB_4E3D;
procedure pO0BB_4E8B;
procedure pO0BB_4EB8;
procedure pO0BB_50F8;
procedure pO0BB_5142;
procedure pO0BB_51D1;
procedure pO0BB_5272;
procedure pO0BB_52B8;
procedure pO0BB_5382;
procedure pO0BB_54D9;
procedure pO0BB_55C0;
procedure pO0BB_560D;
procedure pO0BB_57B2;
procedure pO0BB_582B;
procedure pO0BB_58E3;
procedure pO0BB_59AD;
procedure pO0BB_59E7;
procedure pO0BB_5A2D;
procedure pO0BB_5BC7;
procedure pO0BB_5C8B;
procedure pO0BB_5EB8;
procedure pO0BB_617E;
procedure pO0BB_62B4;
procedure pO0BB_652D(a0: pointer; a1: pointer; a2: word);
procedure pO0BB_6728(a0: pointer; a1: pointer; a2: word);
procedure pO0BB_6874(a0: pointer; a1: pointer; a2: word);
procedure pO0BB_6B64(a0: pointer; a1: word; a2: word; a3: word);

implementation

uses LIT, O0E2, O0EC, O102, O108, O130, O135, R142, R1C3, R47F, R5A0, R670;

type
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E3_byte = record f: byte; _r: array[1..2] of byte end;
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R0_integer = record v: integer end;
  R0_pointer = record v: pointer end;
  R0_shortint = record v: shortint end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R0_word = record v: word end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R174_byte = record _p: array[1..174] of byte; v: byte end;
  R176_word = record _p: array[1..176] of byte; v: word end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R24_byte = record _p: array[1..24] of byte; v: byte end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R337_byte = record _p: array[1..337] of byte; v: byte end;
  R339_byte = record _p: array[1..339] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R340_byte = record _p: array[1..340] of byte; v: byte end;
  R341_byte = record _p: array[1..341] of byte; v: byte end;
  R342_byte = record _p: array[1..342] of byte; v: byte end;
  R343_byte = record _p: array[1..343] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R374_longint = record _p: array[1..374] of byte; v: longint end;
  R378_byte = record _p: array[1..378] of byte; v: byte end;
  R380_byte = record _p: array[1..380] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R420_byte = record _p: array[1..420] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R435_longint = record _p: array[1..435] of byte; v: longint end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R47_byte = record _p: array[1..47] of byte; v: byte end;
  R483_longint = record _p: array[1..483] of byte; v: longint end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R492_byte = record _p: array[1..492] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R495_shortint = record _p: array[1..495] of byte; v: shortint end;
  R498_byte = record _p: array[1..498] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R53_byte = record _p: array[1..53] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  R9_longint = record _p: array[1..9] of byte; v: longint end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA351_byte = record _p: array[1..351] of byte; a: array[0..32000] of byte end;
  RA59_byte = record _p: array[1..59] of byte; a: array[0..32000] of byte end;
  TPV_ = procedure;
  TPV_byte_byte_var = procedure(p0: byte; p1: byte; var p2);
W9_20_09DE = record case byte of 0: (_p0: array[1..30] of byte; _w20_30abyte: array[0..32000] of byte);
      1: (_p1: array[1..178] of byte; _w20_178abyte: array[0..32000] of byte);
      2: (_p2: array[1..398] of byte; _w20_398abyte: array[0..32000] of byte) end;
  X7 = array[0..6] of byte;
  PR0_byte = ^R0_byte;
  PR0_integer = ^R0_integer;
  PR0_pointer = ^R0_pointer;
  PR0_shortint = ^R0_shortint;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR0_word = ^R0_word;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR174_byte = ^R174_byte;
  PR176_word = ^R176_word;
  PR178_byte = ^R178_byte;
  PR17_byte = ^R17_byte;
  PR19_byte = ^R19_byte;
  PR21_byte = ^R21_byte;
  PR24_byte = ^R24_byte;
  PR28_byte = ^R28_byte;
  PR312_byte = ^R312_byte;
  PR327_byte = ^R327_byte;
  PR337_byte = ^R337_byte;
  PR339_byte = ^R339_byte;
  PR33_byte = ^R33_byte;
  PR340_byte = ^R340_byte;
  PR341_byte = ^R341_byte;
  PR342_byte = ^R342_byte;
  PR343_byte = ^R343_byte;
  PR370_longint = ^R370_longint;
  PR374_longint = ^R374_longint;
  PR378_byte = ^R378_byte;
  PR380_byte = ^R380_byte;
  PR3_byte = ^R3_byte;
  PR41_byte = ^R41_byte;
  PR420_byte = ^R420_byte;
  PR421_byte = ^R421_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR435_longint = ^R435_longint;
  PR46_byte = ^R46_byte;
  PR47_byte = ^R47_byte;
  PR483_longint = ^R483_longint;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR492_byte = ^R492_byte;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR495_shortint = ^R495_shortint;
  PR498_byte = ^R498_byte;
  PR508_byte = ^R508_byte;
  PR53_byte = ^R53_byte;
  PR8_byte = ^R8_byte;
  PR9_longint = ^R9_longint;
  PRA30_byte = ^RA30_byte;
  PRA337_byte = ^RA337_byte;
  PRA351_byte = ^RA351_byte;
  PRA59_byte = ^RA59_byte;
  PW9_20_09DE = ^W9_20_09DE;
var
  a0AAC_c68f: array[0..798] of string[40] absolute d0AAC;
  a0C46_ff2a: array[0..32759] of shortint absolute d0C46;
  a0C4E_ff2a: array[0..32759] of shortint absolute d0C4E;
  a0C56_ff2a: array[0..32759] of shortint absolute d0C56;
  a0C5E_ff2a: array[0..32759] of shortint absolute d0C5E;
  a0C65_ff2a: array[0..32759] of shortint absolute d0C65;
  a0C69_ff2a: array[0..32759] of shortint absolute d0C69;
  a3EAC_ec3f: array[0..32759] of byte absolute d3EAC;
  a3EB5_ec3f: array[0..32759] of byte absolute d3EB5;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  a53CD_9a87: array[0..935] of string[34] absolute d53CD;
  a651A_3981: array[0..2046] of E16_byte absolute d651A;
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  a651C_3981: array[0..2046] of E16_byte absolute d651C;
  a651D_3981: array[0..2046] of E16_byte absolute d651D;
  a651E_3981: array[0..2046] of E16_byte absolute d651E;
  a651F_3981: array[0..2046] of E16_byte absolute d651F;
  a6520_3981: array[0..2046] of E16_byte absolute d6520;
  a6521_3981: array[0..2046] of E16_byte absolute d6521;
  a6522_3981: array[0..2046] of E16_byte absolute d6522;
  a6523_3981: array[0..2046] of E16_byte absolute d6523;
  a6524_3981: array[0..2046] of E16_byte absolute d6524;
  a8332_ec3f: array[0..32759] of byte absolute d8332;
  a83BF_ec3f: array[0..32759] of byte absolute d83BF;
  a844C_9f8b: array[0..8189] of pointer absolute d844C;
  a844C_b676: array[0..8189] of longint absolute d844C;
  a94D6_3981: array[0..2046] of E16_byte absolute d94D6;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aA583_b676: array[0..8189] of longint absolute dA583;
  aA6A0_be96: array[0..4679] of X7 absolute dA6A0;
  aA6E2_fd21: array[0..10919] of E3_byte absolute dA6E2;
  aAB3E_7e62: array[0..8189] of TPV_ absolute dAB3E;
  aAD37_0389: array[0..8189] of array[0..3] of byte absolute dAD37;
  aAD37_9f8b: array[0..8189] of pointer absolute dAD37;
  aAD37_b676: array[0..8189] of longint absolute dAD37;
  b3E00: byte absolute d3E00;
  b5362: byte absolute d5362;
  b6C72: byte absolute d6C72;
  b6C74: byte absolute d6C74;
  b832E: byte absolute d832E;
  b8332: byte absolute d8332;
  b83BF: byte absolute d83BF;
  b8510: byte absolute d8510;
  b8511: byte absolute d8511;
  b8512: byte absolute d8512;
  b880C: byte absolute d880C;
  bA6DF: byte absolute dA6DF;
  bA6E4: byte absolute dA6E4;
  bA7D1: byte absolute dA7D1;
  bA7D2: byte absolute dA7D2;
  bA7D5: byte absolute dA7D5;
  bA7DB: byte absolute dA7DB;
  bA7DC: byte absolute dA7DC;
  bA7DD: byte absolute dA7DD;
  bAAE5: byte absolute dAAE5;
  bAD3A: byte absolute dAD3A;
  bAD3B: byte absolute dAD3B;
  bAE5B: byte absolute dAE5B;
  bAE5C: byte absolute dAE5C;
  bAE61: byte absolute dAE61;
  bAE88: byte absolute dAE88;
  bAE8D: byte absolute dAE8D;
  bAEF0: byte absolute dAEF0;
  bB16C: byte absolute dB16C;
  gAB3E_dd92: TPV_byte_byte_var absolute dAB3E;
  l9CE6: longint absolute d9CE6;
  l9CEE: longint absolute d9CEE;
  lAB3A: longint absolute dAB3A;
  lAD3B: longint absolute dAD3B;
  p832E: pointer absolute d832E;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pA932: pointer absolute dA932;
  pA936: pointer absolute dA936;
  pA93A: pointer absolute dA93A;
  pA94E: pointer absolute dA94E;
  pA952: pointer absolute dA952;
  pA966: pointer absolute dA966;
  pA9D6: pointer absolute dA9D6;
  pAB3A: pointer absolute dAB3A;
  pAB3E: pointer absolute dAB3E;
  pAB42: pointer absolute dAB42;
  pAB46: pointer absolute dAB46;
  pAB4A: pointer absolute dAB4A;
  pAB4E: pointer absolute dAB4E;
  pAB52: pointer absolute dAB52;
  pAB56: pointer absolute dAB56;
  pAB5A: pointer absolute dAB5A;
  pAB5E: pointer absolute dAB5E;
  pAB62: pointer absolute dAB62;
  pAB66: pointer absolute dAB66;
  pAB6A: pointer absolute dAB6A;
  pAB6E: pointer absolute dAB6E;
  pAB72: pointer absolute dAB72;
  pAB76: pointer absolute dAB76;
  pAB7A: pointer absolute dAB7A;
  pAB7E: pointer absolute dAB7E;
  pAB82: pointer absolute dAB82;
  pAB86: pointer absolute dAB86;
  pAB8A: pointer absolute dAB8A;
  pAB8E: pointer absolute dAB8E;
  pAB92: pointer absolute dAB92;
  pAB96: pointer absolute dAB96;
  pAB9A: pointer absolute dAB9A;
  pAB9E: pointer absolute dAB9E;
  pABA2: pointer absolute dABA2;
  pABA6: pointer absolute dABA6;
  pABAA: pointer absolute dABAA;
  pABAE: pointer absolute dABAE;
  pABB2: pointer absolute dABB2;
  pABB6: pointer absolute dABB6;
  pABBA: pointer absolute dABBA;
  pABBE: pointer absolute dABBE;
  pABC2: pointer absolute dABC2;
  pABC6: pointer absolute dABC6;
  pABCA: pointer absolute dABCA;
  pABCE: pointer absolute dABCE;
  pABD2: pointer absolute dABD2;
  pABD6: pointer absolute dABD6;
  pABDA: pointer absolute dABDA;
  pABDE: pointer absolute dABDE;
  pABE2: pointer absolute dABE2;
  pABE6: pointer absolute dABE6;
  pABEA: pointer absolute dABEA;
  pABEE: pointer absolute dABEE;
  pABF2: pointer absolute dABF2;
  pABF6: pointer absolute dABF6;
  pABFA: pointer absolute dABFA;
  pABFE: pointer absolute dABFE;
  pAC02: pointer absolute dAC02;
  pAC06: pointer absolute dAC06;
  pAC0A: pointer absolute dAC0A;
  pAC0E: pointer absolute dAC0E;
  pAC12: pointer absolute dAC12;
  pAC16: pointer absolute dAC16;
  pAC1A: pointer absolute dAC1A;
  pAC1E: pointer absolute dAC1E;
  pAC22: pointer absolute dAC22;
  pAC26: pointer absolute dAC26;
  pAC2A: pointer absolute dAC2A;
  pAC2E: pointer absolute dAC2E;
  pAC32: pointer absolute dAC32;
  pAC36: pointer absolute dAC36;
  pAC3A: pointer absolute dAC3A;
  pAC3E: pointer absolute dAC3E;
  pAC42: pointer absolute dAC42;
  pAC46: pointer absolute dAC46;
  pAC4A: pointer absolute dAC4A;
  pAC4E: pointer absolute dAC4E;
  pAC52: pointer absolute dAC52;
  pAC56: pointer absolute dAC56;
  pAC5A: pointer absolute dAC5A;
  pAC5E: pointer absolute dAC5E;
  pAC62: pointer absolute dAC62;
  pAC66: pointer absolute dAC66;
  pAC6A: pointer absolute dAC6A;
  pAC6E: pointer absolute dAC6E;
  pAC72: pointer absolute dAC72;
  pAC76: pointer absolute dAC76;
  pAC7A: pointer absolute dAC7A;
  pAC7E: pointer absolute dAC7E;
  pAC82: pointer absolute dAC82;
  pAC86: pointer absolute dAC86;
  pAC8A: pointer absolute dAC8A;
  pAC8E: pointer absolute dAC8E;
  pAC92: pointer absolute dAC92;
  pAC96: pointer absolute dAC96;
  pAC9A: pointer absolute dAC9A;
  pAC9E: pointer absolute dAC9E;
  pACA2: pointer absolute dACA2;
  pACA6: pointer absolute dACA6;
  pACAA: pointer absolute dACAA;
  pACAE: pointer absolute dACAE;
  pACB2: pointer absolute dACB2;
  pACB6: pointer absolute dACB6;
  pACBA: pointer absolute dACBA;
  pACBE: pointer absolute dACBE;
  pACC2: pointer absolute dACC2;
  pACC6: pointer absolute dACC6;
  pACCA: pointer absolute dACCA;
  pACCE: pointer absolute dACCE;
  pACD2: pointer absolute dACD2;
  pACD6: pointer absolute dACD6;
  pACDA: pointer absolute dACDA;
  pACDE: pointer absolute dACDE;
  pACE2: pointer absolute dACE2;
  pACE6: pointer absolute dACE6;
  pACEA: pointer absolute dACEA;
  pACEE: pointer absolute dACEE;
  pACF2: pointer absolute dACF2;
  pACF6: pointer absolute dACF6;
  pACFA: pointer absolute dACFA;
  pACFE: pointer absolute dACFE;
  pAD02: pointer absolute dAD02;
  pAD06: pointer absolute dAD06;
  pAD0A: pointer absolute dAD0A;
  pAD0E: pointer absolute dAD0E;
  pAD12: pointer absolute dAD12;
  pAD16: pointer absolute dAD16;
  pAD1A: pointer absolute dAD1A;
  pAD1E: pointer absolute dAD1E;
  pAD22: pointer absolute dAD22;
  pAD26: pointer absolute dAD26;
  pAD2A: pointer absolute dAD2A;
  pAD2E: pointer absolute dAD2E;
  pAD32: pointer absolute dAD32;
  pAD36: pointer absolute dAD36;
  pAD3B: pointer absolute dAD3B;
  s13DB: string absolute d13DB;
  s1404: string absolute d1404;
  s142D: string absolute d142D;
  s1456: string absolute d1456;
  s147F: string absolute d147F;
  s14A8: string absolute d14A8;
  s14D1: string absolute d14D1;
  s14FA: string absolute d14FA;
  s278C: string absolute d278C;
  s27DE: string absolute d27DE;
  s2978: string absolute d2978;
  s2B12: string absolute d2B12;
  s2BDF: string absolute d2BDF;
  s2C08: string absolute d2C08;
  s2C31: string absolute d2C31;
  s2C5A: string absolute d2C5A;
  s2C83: string absolute d2C83;
  s4025: string absolute d4025;
  s405C: string absolute d405C;
  s4087: string absolute d4087;
  s40AD: string absolute d40AD;
  s4203: string absolute d4203;
  s456D: string absolute d456D;
  s501D: string absolute d501D;
  sbAE5B: shortint absolute dAE5B;
  sbAE5C: shortint absolute dAE5C;
  sbB16D: shortint absolute dB16D;
  w3DEE: word absolute d3DEE;
  w3DFA: word absolute d3DFA;
  w3E00: word absolute d3E00;
  wA7D8: word absolute dA7D8;

function pO0BB_0000(a0: pointer; a1: byte; a2: byte): byte; far; forward;
procedure pO0BB_0335(a0: byte); far; forward;
procedure pO0BB_0502(a0: byte); far; forward;
procedure pO0BB_0858(a0: byte; a1: byte); far; forward;
procedure pO0BB_095A(a0: byte; a1: byte); far; forward;
function pO0BB_0E1D(a0: byte): word; far; forward;
procedure pO0BB_0ED6(a0: byte; a1: byte; a2: byte; a3: word; a4: byte; a5: S40); far; forward;
procedure pO0BB_1736(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte); far; forward;
procedure pO0BB_1AE5(a0: byte; a1: S40); far; forward;
procedure pO0BB_1CB4(a0: byte; a1: S40); far; forward;
function pO0BB_2C67: byte; far; forward;
procedure pO0BB_35BD(a0: byte; a1: byte; a2: S40); far; forward;
procedure pO0BB_3716(a0: byte; a1: byte; a2: word); far; forward;
procedure pO0BB_3783(a0: word; a1: word; a2: byte); far; forward;

{ 0000 }
function pO0BB_0000(a0: pointer; a1: byte; a2: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0006-000E}
  a1 := a1 and 127;
  {@000E-0012}
  pO0BB_0000 := 0;
  case a651A_3981[a1].f of
0: pO0BB_0000 := Ord((Ord(PR21_byte(a0)^.v > 8) <> 0) and ((pO102_1276(pointer(a0), 0) > 0)
        or (pO102_1276(pointer(a0), 3) > 8)));
    1: pO0BB_0000 := Ord((Ord(PR21_byte(a0)^.v > 8) <> 0) and (pO102_1276(pointer(a0), 4) > 6));
    2: begin
      {@009D-0110}
      if PR19_byte(a0)^.v > 8 then
      begin
        {@00A7-00DE}
if (pO102_1276(pointer(a0), 5) > 0) and ((PR173_byte(a0)^.v <> 5) or (PR435_longint(a0)^.v = 0)
            or (b880C <> 5)) then
          pO0BB_0000 := 1;
        {@00DE-00F4}
        if pO102_1276(pointer(a0), 4) > 8 then
          pO0BB_0000 := 1;
        {@00F4-0110}
        if (a2 <> 0) and (pO102_1276(pointer(a0), 6) > 10) then
          pO0BB_0000 := 1;
      end;
    end;
    3: pO0BB_0000 := 0;
  end;
end;

{ 0123 }
function pO0BB_0123(a0: byte; a1: pointer): byte;
var
c91: record case byte of 0: (v91a2: string[89]); 1: (v91a: string[40]); 2: (_p2: array[1..41] of byte;
      v50a2: string[48]); 3: (_p3: array[1..41] of byte; v50a: string[40]); 4: (_p4: array[1..82] of byte;
      v9p: pointer); 5: (_p5: array[1..86] of byte; v5p: pointer); 6: (_p6: array[1..86] of byte;
      v5b: byte) end;
  _f1: array[1..1] of byte;
  v93b: byte;
  v94b: byte;
  v95b: byte;
  v96b: byte;
  v97b: byte;
  v98b: byte;
begin
  {@0129-013C}
  c91.v50a := s27DE;
  {@013C-0140}
  v94b := 22;
  {@0140-0144}
  v98b := 0;
  {@0144-014C}
  pO108_00CB(0);
  {@014C-0150}
  v97b := 0;
  {@0150-0155}
  bAAE5 := 1;
  case a0 of
    1: c91.v91a := s2BDF;
    2: begin
      {@0176-0189}
      c91.v91a := s2C08;
      {@0189-018D}
      v94b := 15;
      {@018D-0193}
      v97b := bAE88;
    end;
    3: c91.v91a := s2C5A;
    4: c91.v91a := s2C83;
    5: begin
      {@01CC-01DF}
      c91.v50a := s2978;
      {@01DF-01F2}
      c91.v91a := s2C31;
    end;
  else
    {@01F4-01F8}
    v98b := 255;
    {@01F8-020B}
    c91.v91a := s2B12;
    {@020B-021E}
    c91.v50a := s278C;
  end;
  {@021E-022A}
  v96b := Ord(a0 <> 4);
  if PR0_integer(a1)^.v < 0 then
  begin
    {@0233-0237}
    v97b := 1;
    {@0237-023F}
    PR0_word(a1)^.v := 0;
  end;
  {@023F-024F}
  if (a0 = 4) or (a0 = 1) then
    v97b := 1;
  {@024F-0257}
  c91.v5p := nil;
  {@0257-02A1}
  repeat
    {@0257-0295}
v95b := pO108_1D45(c91.v50a2, c91.v91a2, 1, 5, 38, v94b, p832E, v96b, v98b, @v97b, @PR0_byte(a1)^.v,
        @c91.v5b);
  until (v95b = 0) or (v95b = 27);
  {@02A1-02AE}
  c91.v9p := p832E;
  {@02AE-02B2}
  v93b := 0;
  {@02B2-02E2}
  while c91.v9p <> c91.v5p do
  begin
    {@02C2-02CF}
    if PR41_byte(c91.v9p)^.v = 0 then
      Inc(v93b);
    {@02CF-02E0}
    c91.v9p := PR42_pointer(c91.v9p)^.v;
  end;
  {@02E2-02FC}
  if v95b <> 0 then
    pO0BB_0123 := 0
  else
    pO0BB_0123 := a83BF_ec3f[v93b];
  {@02FC-031C}
  if a0 = 3 then
    lAB3A := a844C_b676[v93b];
  {@031C-0326}
  pO108_2363(@b832E);
end;

{ 0335 }
procedure pO0BB_0335(a0: byte);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v5sb: shortint absolute v5b;
begin
  if false then begin
    if LV = ' *' then;
    if LV = '  ' then;
  end;
  {@033C-0349}
  v4p := p832E;
  if p832E = nil then
  begin
    {@0352-0361}
    GetMem(v4p, 46);
    {@0361-036E}
    p832E := v4p;
    {@036E-0372}
    v6b := 0;
    {@0372-0376}
    v5b := 0;
  end
  else
  begin
    {@0378-037C}
    v5b := 1;
    {@037C-03A9}
    while PR42_pointer(v4p)^.v <> nil do
    begin
      {@0389-0396}
      if PR41_byte(v4p)^.v = 0 then
        Inc(v5b);
      {@0396-03A7}
      v4p := PR42_pointer(v4p)^.v;
    end;
    {@03A9-03C3}
    v6b := a651B_3981[a83BF_ec3f[v5sb - 1]].f;
    {@03C3-03D7}
    GetMem(PR42_pointer(v4p)^.v, 46);
    {@03D7-03E8}
    v4p := PR42_pointer(v4p)^.v;
  end;
  {@03E8-03F5}
  PR42_pointer(v4p)^.v := nil;
  if a651B_3981[a0 and 127].f <> v6b then
  begin
    {@040B-0439}
    PR0_string_40_(v4p)^.v := a0AAC_c68f[a651B_3981[a0 and 127].f];
    {@0439-0441}
    PR41_byte(v4p)^.v := 1;
    {@0441-0455}
    GetMem(PR42_pointer(v4p)^.v, 46);
    {@0455-0466}
    v4p := PR42_pointer(v4p)^.v;
    {@0466-0473}
    PR42_pointer(v4p)^.v := nil;
  end;
  {@0473-04A1}
  if a0 > 127 then
    PR0_string_40_(v4p)^.v := ' *'
  else
    PR0_string_40_(v4p)^.v := '  ';
  {@04A1-04D8}
  PR0_string_40_(v4p)^.v := PR0_string(v4p)^.v + a53CD_9a87[a0 and 127];
  {@04D8-04E0}
  PR41_byte(v4p)^.v := 0;
  {@04E0-04F1}
  a83BF_ec3f[v5sb] := a0 and 127;
end;

{ 0502 }
procedure pO0BB_0502(a0: byte);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v10p: pointer;
  v14p: pointer;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v15sb: shortint absolute v15b;
begin
  if false then begin
    if LV = ' *' then;
    if LV = '  ' then;
    if LV = ' (' then;
    if LV = ')' then;
  end;
  {@0509-0516}
  v6p := p832E;
  {@0516-051A}
  v17b := 0;
  {@051A-052E}
  v18b := a651B_3981[a0 and 127].f;
  if p832E = nil then
  begin
    {@0537-0545}
    XR670_046E(@b8332, 141);
    {@0545-0554}
    GetMem(v6p, 46);
    {@0554-0561}
    PR42_pointer(v6p)^.v := nil;
    {@0561-056E}
    p832E := v6p;
    {@056E-0572}
    v15b := 0;
    {@0572-057D}
    a8332_ec3f[v15sb] := 1;
  end
  else
  begin
    {@0580-0584}
    v15b := 0;
    {@0584-05FE}
    while (v6p <> nil) and (v17b = 0) do
    begin
      {@0592-05FC}
      if PR41_byte(v6p)^.v = 0 then
      begin
        {@059C-05E6}
        if (a651B_3981[a83BF_ec3f[v15sb]].f <= v18b) and (a83BF_ec3f[v15sb] <> (a0 and 127)) then
        begin
          {@05CC-05CF}
          Inc(v15b);
          {@05CF-05E0}
          v6p := PR42_pointer(v6p)^.v;
        end
        else
          v17b := 1;
      end
      else
      begin
        {@05E8-05F9}
        v6p := PR42_pointer(v6p)^.v;
        {@05F9-05FC}
        Inc(v15b);
      end;
    end;
    {@05FE-071F}
    if a83BF_ec3f[v15sb] <> (a0 and 127) then
    begin
      {@0616-0623}
      v10p := p832E;
      if v10p <> v6p then
      begin
        {@0633-065B}
        while PR42_pointer(v10p)^.v <> v6p do
          v10p := PR42_pointer(v10p)^.v;
        {@065B-066A}
        GetMem(v14p, 46);
        {@066A-0680}
        PR42_pointer(v14p)^.v := PR42_pointer(v10p)^.v;
        {@0680-0691}
        PR42_pointer(v10p)^.v := v14p;
        {@0691-069D}
        v6p := v14p;
      end
      else
      begin
        {@069F-06AE}
        GetMem(v14p, 46);
        {@06AE-06BF}
        PR42_pointer(v14p)^.v := v6p;
        {@06BF-06CC}
        p832E := v14p;
        {@06CC-06D8}
        v6p := v14p;
      end;
      {@06D8-06DC}
      v1b := 1;
      for v16b := v15b to 140 do
      begin
        {@06EB-06F9}
        v2b := a8332_ec3f[v16b];
        {@06F9-0707}
        a8332_ec3f[v16b] := v1b;
        {@0707-070D}
        v1b := v2b;
      end;
    end
    else
      Inc(a8332_ec3f[v15sb]);
  end;
  {@071F-074D}
  if a0 > 127 then
    PR0_string_40_(v6p)^.v := ' *'
  else
    PR0_string_40_(v6p)^.v := '  ';
  {@074D-0784}
  PR0_string_40_(v6p)^.v := PR0_string(v6p)^.v + a53CD_9a87[a0 and 127];
  {@0784-078C}
  PR41_byte(v6p)^.v := 0;
  if a8332_ec3f[v15sb] > 1 then
    PR0_string_40_(v6p)^.v := Concat(PR0_string(v6p)^.v + ' (', pO0EC_142F(a8332_ec3f[v15sb])) + ')';
  {@07E6-0852}
  if a83BF_ec3f[v15sb] <> (a0 and 127) then
  begin
    {@07FB-0808}
    v1b := a83BF_ec3f[v15sb];
    {@0808-0819}
    a83BF_ec3f[v15sb] := a0 and 127;
    for v16b := v15sb + 1 to 140 do
    begin
      {@082A-0838}
      v2b := a83BF_ec3f[v16b];
      {@0838-0846}
      a83BF_ec3f[v16b] := v1b;
      {@0846-084C}
      v1b := v2b;
    end;
  end;
end;

{ 0858 }
procedure pO0BB_0858(a0: byte; a1: byte);
var
  v1b: byte;
  _f1: array[1..3] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@085E-087E}
  if (a1 <> 0) and (a94D6_3981[PR46_byte(pAB3A)^.v].f = 12) then
    Exit;
  {@087E-08D4}
if (pO0EC_27C1(p9CEE, 16, @v5b) <> 0) or (pO102_1276(p9CEE, 0) > 0)
      and (a94D6_3981[PR46_byte(pAB3A)^.v].f = 12) then
    PR53_byte(pAB3A)^.v := PR53_byte(pAB3A)^.v and 248;
  {@08D4-0954}
  if (PR53_byte(pAB3A)^.v and 7) = 0 then
    for v1b := 1 to 3 do
    begin
      {@08EB-094E}
      if (a0 <> 0) and (PRA59_byte(pAB3A)^.a[v1b] > 128) or (a0 = 0) and (PRA59_byte(pAB3A)^.a[v1b] > 0) then
      begin
        {@091B-092F}
        pO0BB_0335(PRA59_byte(pAB3A)^.a[v1b]);
        {@092F-094A}
        a844C_9f8b[b8510] := pAB3A;
        {@094A-094E}
        Inc(b8510);
      end;
    end;
end;

{ 095A }
procedure pO0BB_095A(a0: byte; a1: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0960-0984}
  for v1b := 0 to 48 do
    a844C_b676[v1b] := 0;
  {@0984-0989}
  b8510 := 0;
  {@0989-099E}
  pAB3A := PR423_pointer(p9CEE)^.v;
  {@099E-09D8}
  while pAB3A <> nil do
  begin
    {@09A7-09C3}
    if pO0BB_6C36(pAB3A) <> 0 then
      pO0BB_0858(a0, a1);
    {@09C3-09D6}
    pAB3A := PR42_pointer(pAB3A)^.v;
  end;
end;

{ 09DE }
function pO0BB_09DE(a0: byte): byte;
var
  v2b: byte;
  v4w: word;
  v8p: pointer;
  v12p: pointer;
  v13b: byte;
  v14b: byte;
  v15b: byte;
  _f1: array[1..1] of byte;
begin
  {@09E4-09E8}
  v15b := 1;
  {@09E8-09EC}
  pO0BB_09DE := 0;
  {@09EC-09F4}
  p832E := nil;
  {@09F4-0A02}
  XR670_046E(@b83BF, 141);
  with PW9_20_09DE(p9CEE)^ do
  begin
    case a0 of
      0: for v4w := 0 to 140 do
        begin
          {@0A1D-0A6E}
if (_w20_30abyte[v4w] > 0) and (pO0BB_0000(p9CEE, _w20_30abyte[v4w] and 127, 0) <> 0)
              and (_w20_30abyte[v4w] < 128) then
            pO0BB_0502(_w20_30abyte[v4w]);
        end;
      5: for v4w := 0 to 140 do
        begin
          {@0A86-0AC9}
          if (PRA30_byte(p9CEE)^.a[v4w] > 127) and (pO0BB_0000(p9CEE, _w20_30abyte[v4w] and 127, 0) <> 0) then
            pO0BB_0502(_w20_30abyte[v4w]);
        end;
      1: for v4w := 1 to 126 do
          asm
  db 139,70,252,196,126,236,3,248,38,128,189,178,0,0,116,78,139,126,252,177,4,211,231,138,133,27,101,48
  db 228,139,216,139,126,252,177,4,211,231,138,133,26,101,152,186,9,0,247,226,196,126,236,3,248,3,251,38
  db 128,189,124,1,0,118,31,255,54,240,156,255,54,238,156,138,70,252,80,176,0,80
  push cs
  call near ptr pO0BB_0000
  db 8,192,116,8,138,70,252,80
  push cs
  call near ptr pO0BB_0502
          end;
      2: begin
        {@0B4C-0B51}
        b8510 := 0;
        {@0B51-0B5B}
        pO0BB_0858(0, 0);
        {@0B5B-0B5F}
        v15b := 0;
      end;
      3: begin
        {@0B66-0B70}
        pO0BB_095A(0, 1);
        {@0B70-0B74}
        v15b := 0;
      end;
      6: begin
        {@0B7A-0B84}
        pO0BB_095A(1, 1);
        {@0B84-0B88}
        v15b := 0;
      end;
      4: for v2b := 1 to 126 do
        begin
          {@0B97-0BA9}
          v14b := a651B_3981[v2b].f;
          if (_w20_398abyte[v14b] > 0) and (a651A_3981[v2b].f = 2) and (_w20_178abyte[v2b] = 0) then
            pO0BB_0502(v2b);
        end;
    end;
  end;
  {@0BED-0BF9}
  if p832E = nil then
    Exit;
  {@0BF9-0D4E}
  if v15b <> 0 then
  begin
    {@0C02-0C07}
    v4w := 0;
    {@0C07-0C1D}
    v14b := a651B_3981[a83BF_ec3f[v4w]].f;
    {@0C1D-0C2C}
    GetMem(v12p, 46);
    {@0C2C-0C3E}
    PR42_pointer(v12p)^.v := p832E;
    {@0C3E-0C4B}
    p832E := v12p;
    {@0C4B-0C7C}
    PR0_string_40_(p832E)^.v := a0AAC_c68f[a651B_3981[a83BF_ec3f[v4w]].f];
    {@0C7C-0C85}
    PR41_byte(p832E)^.v := 1;
    {@0C85-0C92}
    v8p := p832E;
    {@0C92-0D4E}
    repeat
      {@0C92-0C98}
      v13b := v14b;
      if a83BF_ec3f[v4w] <> 0 then
        v14b := a651B_3981[a83BF_ec3f[v4w]].f;
      {@0CB8-0D2F}
      if v13b < v14b then
      begin
        {@0CC0-0CCF}
        GetMem(v12p, 46);
        {@0CCF-0CE5}
        PR42_pointer(v12p)^.v := PR42_pointer(v8p)^.v;
        {@0CE5-0CF6}
        PR42_pointer(v8p)^.v := v12p;
        {@0CF6-0D07}
        v8p := PR42_pointer(v8p)^.v;
        {@0D07-0D27}
        PR0_string_40_(v8p)^.v := a0AAC_c68f[v14b];
        {@0D27-0D2F}
        PR41_byte(v8p)^.v := 1;
      end;
      {@0D2F-0D32}
      Inc(v4w);
      {@0D32-0D43}
      v8p := PR42_pointer(v8p)^.v;
    until v8p = nil;
  end;
  {@0D4E-0D52}
  pO0BB_09DE := 1;
end;

{ 0D5B }
function pO0BB_0D5B(a0: byte): byte;
var
  v2b: byte;
begin
  {@0D61-0DD6}
  if bAE61 = 0 then
    v2b := a651C_3981[a0].f + a651D_3981[a0].f * pO0EC_2D90(a0, 0)
  else
    v2b := a651D_3981[a0].f * 6 + a651C_3981[a0].f;
  {@0DD6-0DE8}
  if a0 = 125 then
    v2b := v2b shr 1 shr 1;
  {@0DE8-0E04}
  if (v2b = 0) and (a6520_3981[a0].f <> 0) then
    v2b := 1;
  {@0E04-0E0E}
  if v2b = 255 then
    v2b := 1;
  {@0E0E-0E14}
  pO0BB_0D5B := v2b;
end;

{ 0E1D }
function pO0BB_0E1D(a0: byte): word;
var
  v4w: word;
begin
  {@0E23-0EC7}
  case a0 of
    26: v4w := 3780;
    57, 61: v4w := pO0E2_1374(5, 4);
    59: v4w := pO0E2_1374(1, 4) * 10 + 40;
    122: v4w := 1440;
    121: v4w := pO0E2_1374(1, 4) + 1;
  else
    {@0E8C-0EC7}
    v4w := a651E_3981[a0].f + a651F_3981[a0].f * pO0EC_2D90(a0, 0);
  end;
  {@0EC7-0ECD}
  pO0BB_0E1D := v4w;
end;

{ 0ED6 }
procedure pO0BB_0ED6(a0: byte; a1: byte; a2: byte; a3: word; a4: byte; a5: S40);
var
  v42b: byte;
  v43b: byte;
  _f1: array[1..4] of byte;
  v48b: byte;
begin
  {@0EEF-0F02}
  if a3 = 0 then
    bA7D2 := 0
  else
    bA7D2 := a4;
  {@0F02-0F0C}
  if bAD3A = 0 then
    Exit;
  {@0F0C-0F29}
  if a1 = 0 then
    v42b := pO0EC_2D90(a0, 1)
  else
    v42b := a1;
  {@0F29-10C8}
  for v43b := 1 to bAD3A do
  begin
    {@0F41-10BD}
    if aAD37_9f8b[v43b] <> nil then
    begin
      {@0F59-0F9F}
      if a6522_3981[a0].f = 0 then
        v48b := 0
      else
        v48b := pO0E2_12C9(pointer(aAD37_9f8b[v43b]), a6523_3981[a0].f, 0);
      asm
  db 160,213,167,48,228,139,248,177,4,211,231,128,189,28,101,255,117,115,138,70,213,48,228,139,248,209,231,209
  db 231,255,181,57,173,255,181,55,173
  call pO0EC_0EBF
  db 176,11,80,138,70,213,48,228,139,248,209,231,209,231,129,199,55,173,30,87
  call pO0E2_04DD
  db 255,54,240,156,255,54,238,156,138,70,213,48,228,139,248,209,231,209,231,255,181,57,173,255,181,55,173,138
  db 70,213,48,228,139,248,209,231,209,231,196,189,55,173,38,138,133,242,1,80
  call pO0E2_11C2
  db 8,192,117,9,49,192,137,70,12,198,70,208,1
      end;
      {@1024-1059}
      if a3 > 0 then
        pO0E2_1D19(pointer(aAD37_9f8b[v43b]), a3, a6522_3981[a0].f, v48b);
      asm
  db 138,70,18,48,228,139,248,177,4,211,231,128,189,36,101,0,118,82,138,70,213,48,228,139,248,209,231,209
  db 231,255,181,57,173,255,181,55,173,138,70,18,48,228,139,248,177,4,211,231,138,133,36,101,80,138,70,18
  db 80
  push cs
  call near ptr pO0BB_0E1D
  db 80,138,70,214,80,138,70,14,80,138,70,18,48,228,139,248,177,4,211,231,138,133,34,101,80,138,70,208
  db 80,141,126,215,22,87
  call pO0E2_2039
      end;
    end;
  end;
  {@10C8-10CD}
  bA7D2 := 0;
end;

{ 10E6 }
procedure pO0BB_10E6(a0: byte; a1: word; a2: pointer);
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'Cast Spell on whom' then;
  end;
  {@10EC-10FA}
  lAD3B := l9CEE;
  {@10FA-10FF}
  bAD3A := 1;
  {@10FF-1106}
  PR0_byte(a2)^.v := 1;
  case a6521_3981[a0].f of
    1: ;
    2: begin
      {@1120-1125}
      pO0EC_2ED1;
      if l9CE6 <> 0 then
        lAD3B := l9CE6;
      {@113C-115B}
      pO0EC_3497('Cast Spell on whom', 1, 1, @bAD3B);
      {@115B-1169}
      l9CE6 := lAD3B;
      if lAD3B = 0 then
      begin
        {@1172-1177}
        bAD3A := 0;
        {@1177-117E}
        PR0_byte(a2)^.v := 0;
      end;
    end;
    3: begin
      {@1184-119F}
      aAD37_9f8b[bAD3A] := p9CF2;
      {@119F-11ED}
      while PR483_longint(aAD37_9f8b[bAD3A])^.v <> 0 do
      begin
        {@11BA-11E7}
        aAD37_b676[bAD3A + 1] := PR483_longint(aAD37_9f8b[bAD3A])^.v;
        {@11E7-11EB}
        Inc(bAD3A);
      end;
    end;
  else
    {@11EF-11F6}
    PR0_byte(a2)^.v := 0;
  end;
end;

{ 121C }
procedure pO0BB_121C(a0: byte; a1: byte; a2: byte; a3: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f2: array[1..1] of byte;
  v10p: pointer;
  _f3: array[1..4] of byte;
  v15b: byte;
  _f4: array[1..1] of byte;
  v10l: longint absolute v10p;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
begin
  if false then begin
    if LSV = [47, 64, 74, 115] then;
  end;
  {@1222-122F}
  v10p := p9CEE;
  {@122F-1233}
  v1b := 1;
  if (b880C <> 5) and (a6521_3981[a0].f = 0) then
  begin
    {@1252-12FE}
    if bAE61 = 0 then
    begin
      {@1259-127C}
      pR47F_0354(1, 19, 10, 0, a53CD_9a87[a0]);
      {@127C-1292}
      pR47F_0354(1, 20, 10, 0, s1404);
      if Byte(pO108_2254(s13DB, b5362)) = b5362 then
        pO0EC_186D(v10p, a0);
    end
    else
    begin
      {@12B7-12CD}
      pR47F_0354(1, 19, 10, 0, s142D);
      {@12CD-12E3}
      pR47F_0354(1, 20, 10, 0, s1456);
      if Byte(pO108_2254(s147F, b5362)) = b5362 then
        PR0_byte(a3)^.v := 1;
    end;
    {@12FE-1302}
    a2 := 0;
    {@1302-1306}
    v1b := 0;
  end;
  {@1306-1326}
  if (a2 <> 0) and (bAE61 = 0) then
    pO0BB_6CF9(v10p, s14A8, a0);
  {@1326-15BA}
  while v1b <> 0 do
  begin
    {@132F-1340}
    gAB3E_dd92(a0, a1, PR0_byte(a3)^.v);
    if PR0_byte(a3)^.v <> 0 then
    begin
      {@134C-1350}
      v1b := 0;
      if (b880C = 5) and (a0 <> 124) then
      begin
        {@1363-1385}
        if a0 in [47, 64, 74, 115] then
          pR1C3_2120(30)
        else
          pR1C3_2120(17);
        {@1385-1393}
        v3b := pO135_0CA2(v10l);
        {@1393-13A1}
        v4b := pO135_0CCA(v10l);
        {@13A1-13A5}
        v5b := 0;
        {@13A5-13C7}
        while pO130_0549(v3b, v4b, bAE5B, bAE5C, v5b) = 0 do
          Inc(v5b);
        {@13C7-13ED}
        if a0 in [47, 64, 74, 115] then
        begin
          {@13D7-13DB}
          v15b := 1;
          {@13DB-13E7}
          pO0EC_3E76(v5b, 30);
        end
        else
          v15b := 4;
        {@13ED-13F2}
        bAEF0 := 1;
        {@13F2-1407}
        pO135_0BAF(v10p, v5b, 1, 0);
        case a0 of
          47: pR5A0_0000(w3E00);
          51: pR5A0_0000(w3DFA);
        else
          {@1428-1431}
          pR5A0_0000(w3DEE);
        end;
        {@1431-1451}
        pO0EC_1F07(v3sb, v4sb, sbAE5B, sbAE5C, v15b, 30);
        case a0 of
          34: pO0EC_3B46(1, 25, b3E00);
          91: pO0EC_3B46(1, 26, b3E00);
          64, 47, 115: begin
            {@148A-14BB}
            if (PR33_byte(p87F8)^.v = 0) or (a0 = 64) then
              pO0EC_3B46(2, 23, b3E00)
            else
              pO0EC_3B46(3, 23, b3E00);
          end;
          87: pO0EC_3B46(2, 24, b3E00);
        end;
        {@14D0-151E}
        if pO135_0805(v10l, 0) <> 0 then
        begin
          {@14E2-1500}
          pO135_0BAF(v10p, PR8_byte(PR487_pointer(v10p)^.v)^.v, 1, 1);
          {@1500-151E}
          pO135_0BAF(v10p, PR8_byte(PR487_pointer(v10p)^.v)^.v, 0, 0);
        end;
      end;
      {@151E-1529}
      pO0E2_1568(v10p);
      if (bAE61 = 0) and (a0 > 0) then
        pO0EC_186D(v10p, a0);
      {@1545-154B}
      bA7D5 := a0;
      {@154B-155A}
      aAB3E_7e62[bA7D5];
      {@155A-155F}
      bA7D5 := 0;
      {@155F-1564}
      bA7DC := 0;
    end
    else
    begin
      {@1566-15B7}
      if b880C <> 5 then
        v1b := 0
      else
      begin
        {@1573-15B7}
        if (a1 <> 0) or (Byte(pO108_2254(s14D1, b5362)) = b5362) then
        begin
          {@158D-1597}
          pO0EC_1AAC(s14FA);
          if (bAE61 = 0) and (a0 > 0) then
            pO0EC_186D(v10p, a0);
          {@15B3-15B7}
          v1b := 0;
        end;
      end;
    end;
  end;
  {@15BA-15BF}
  pO0EC_1BEF;
  if b880C = 5 then
    pR142_0217(0, 23, 39, 23);
end;

{ 1736 }
procedure pO0BB_1736(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  _f1: array[1..5] of byte;
  v12b: byte;
  _f2: array[1..1] of byte;
  v14b: byte;
  _f3: array[1..6] of byte;
  v22w: word;
  v24w: word;
  v26w: word;
  v28w: word;
  v29b: byte;
  _f4: array[1..1] of byte;
  v31b: byte;
  v32b: byte;
  v33b: byte;
  v83a: array[0..49] of byte;
  _f5: array[1..29] of byte;
  v113b: byte;
  v114b: byte;
  v115b: byte;
  v116b: byte;
  v117b: byte;
  v118b: byte;
  v120w: word;
  v121b: byte;
  v114a: array[0..0] of byte absolute v114b;
  v28b: byte absolute v28w;
  { 15DD }
  procedure pO0BB_15DD(b0: shortint; b1: shortint; b2: shortint; b3: shortint);
  begin
    {@15E0-15EB}
    v28w := b0;
    {@15EB-15F6}
    v26w := b1;
    {@15F6-1601}
    v24w := b2;
    {@1601-160C}
    v22w := b3;
    {@160C-161A}
    pO130_01A0(@v28b);
  end;

  { 161E }
  procedure pO0BB_161E(b0: pointer; b1: pointer);
  begin
    {@1621-1643}
    if PR0_shortint(b0)^.v > 49 then
      PR0_byte(b0)^.v := 49
    else
    begin
      {@1633-1643}
      if PR0_shortint(b0)^.v < 0 then
        PR0_byte(b0)^.v := 0;
    end;
    {@1643-1655}
    if PR0_shortint(b1)^.v > 24 then
    begin
      {@164C-1653}
      PR0_byte(b1)^.v := 24;
      {@1653-1655}
      Exit;
    end;
    {@1655-1665}
    if PR0_shortint(b1)^.v < 0 then
      PR0_byte(b1)^.v := 0;
  end;

  { 1669 }
  procedure pO0BB_1669;
  var
    w1b: byte;
    w2b: byte;
  begin
    {@166F-1730}
    repeat
      {@166F-168B}
      v29b := Ord(pO130_0247(@v28b) = 0);
      if v29b = 0 then
      begin
        {@1698-16BF}
        pO135_060F(v14b, v12b, @v114b, @v115b);
        {@16BF-16C3}
        w1b := 1;
        {@16C3-16C7}
        w2b := 0;
        if v114b > 0 then
          repeat
            {@16D1-171D}
            if v114a[w1b] = v114b then
              w2b := 1
            else
            begin
              {@16EE-171D}
              if v114a[w1b] = 0 then
              begin
                {@16FF-1714}
                v114a[w1b] := v114b;
                {@1714-1718}
                w2b := 1;
              end
              else
                Inc(w1b);
            end;
          until w2b <> 0;
      end;
    until v29b <> 0;
  end;

begin
  {@173C-1740}
  v32b := 0;
  {@1740-1755}
  pO0BB_15DD(a0, a1, a2, a3);
  {@1755-1785}
  repeat
    {@1755-1769}
    v29b := Ord(pO130_0247(@v28b) = 0);
    if v29b = 0 then
    begin
      {@176F-177C}
      v83a[v32b] := v5b;
      {@177C-177F}
      Inc(v32b);
    end;
  until v29b <> 0;
  {@1785-178E}
  v33b := v32b - 1;
  {@178E-1792}
  v32b := 0;
  {@1792-179C}
  a5 := a5 * 2;
  {@179C-17A2}
  v31b := v6b;
  {@17A2-17A6}
  v29b := 0;
  {@17A6-1850}
  while (v31b < a5) and (v29b = 0) do
  begin
    {@17BA-184D}
    if (shortint(a2) < 49) and (shortint(a2) > 0) and (shortint(a3) < 24) and (shortint(a3) > 0) then
    begin
      {@17D8-180C}
      case v83a[v32b] of
        0, 2, 4, 6: Inc(v31b, 2);
        1, 3, 5, 7: Inc(v31b, 3);
      end;
      {@180C-1821}
      Inc(a2, a3EAC_ec3f[v83a[v32b]]);
      {@1821-1836}
      Inc(a3, a3EB5_ec3f[v83a[v32b]]);
      if v32b = v33b then
        v32b := 0
      else
        Inc(v32b);
    end
    else
      v29b := 1;
  end;
  asm
  db 141,126,12,22,87,141,126,10,22,87,85
  push cs
  call near ptr pO0BB_161E
  end;
  {@185F-1867}
  v120w := a5;
  asm
  db 138,70,16,80,138,70,14,80,141,126,12,22,87,141,126,10,22,87,141,126,136,22,87
  call pO130_03EC
  db 136,70,226
  end;
  {@1886-189B}
  pO0BB_15DD(a0, a1, a2, a3);
  {@189B-18A9}
  XR670_046E(@v113b, 30);
  {@18A9-18AD}
  v116b := 1;
  {@18AD-1948}
  repeat
    {@18AD-18C1}
    v29b := Ord(pO130_0247(@v28b) = 0);
    if v29b = 0 then
    begin
      {@18C7-18DE}
      pO135_060F(v14b, v12b, @v114b, @v115b);
      if v114b > 0 then
      begin
        {@18E4-1923}
        if v116b > 1 then
          for sbB16D := 1 to v116b - 1 do
          begin
            {@1903-1915}
            if v114a[sbB16D] = v114b then
              v121b := 1;
          end
        else
          v121b := 0;
        {@1923-1939}
        if v121b = 0 then
        begin
          {@1929-1936}
          v114a[v116b] := v114b;
          {@1936-1939}
          Inc(v116b);
        end;
        {@1939-193F}
        v118b := v5b;
      end;
    end;
  until v29b <> 0;
  {@1948-1A0E}
  if (a4 > 1) and (a4 <> 255) then
  begin
    {@195A-1971}
    v1b := shortint(a2) + a0C46_ff2a[v118b];
    {@1971-1988}
    v2b := shortint(a3) + a0C4E_ff2a[v118b];
    {@1988-1997}
    pO0BB_161E(@v1b, @v2b);
    {@1997-19AE}
    v3b := shortint(a2) + a0C56_ff2a[v118b];
    {@19AE-19C5}
    v4b := shortint(a3) + a0C5E_ff2a[v118b];
    {@19C5-19D4}
    pO0BB_161E(@v3b, @v4b);
    {@19D4-19E9}
    pO0BB_15DD(a0, a1, v3b, v4b);
    {@19E9-19EE}
    pO0BB_1669;
    if a4 > 2 then
    begin
      {@19F4-1A09}
      pO0BB_15DD(a0, a1, v1b, v2b);
      {@1A09-1A0E}
      pO0BB_1669;
    end;
  end;
  {@1A0E-1A62}
  if a4 = 255 then
  begin
    {@1A14-1A2B}
    pO130_08D7(a2, a3, 3, 255, 1);
    for sbB16D := 1 to bA6E4 do
      v114a[sbB16D] := aA6E2_fd21[sbB16D].f;
  end;
  {@1A62-1A66}
  v116b := 1;
  {@1A66-1A6A}
  v117b := 1;
  {@1A6A-1A6F}
  bAD3A := 0;
  if v113b <> 0 then
    repeat
      {@1A75-1ACF}
      if aA583_b676[v114a[v116b]] <> l9CEE then
      begin
        {@1A9B-1A9F}
        Inc(bAD3A);
        {@1A9F-1ACC}
        aAD37_b676[v117b] := aA583_b676[v114a[v116b]];
        {@1ACC-1ACF}
        Inc(v117b);
      end;
      {@1ACF-1AD2}
      Inc(v116b);
    until v114a[v116b] = 0;
end;

{ 1AE5 }
procedure pO0BB_1AE5(a0: byte; a1: S40);
var
  v45p: pointer;
  v46b: byte;
  v47b: byte;
  v48b: byte;
  v49b: byte;
  v50b: byte;
  v45l: longint absolute v45p;
begin
  {@1AFE-1B02}
  v50b := 0;
  for v47b := bAD3A downto 1 do
  begin
    {@1B14-1CA5}
    if aAD37_9f8b[v47b] <> nil then
    begin
      {@1B2C-1B45}
      v45p := aAD37_9f8b[v47b];
      if v47b < bAD3A then
      begin
        {@1B4E-1B57}
        pR5A0_0000(w3DEE);
        {@1B57-1B5F}
        pR1C3_2120(17);
        {@1B5F-1BA2}
        pO0EC_1F07(pO135_0CA2(l9CEE), pO135_0CCA(l9CEE), pO135_0CA2(v45l), pO135_0CCA(v45l), 4, 30);
      end;
      {@1BA2-1BF7}
      if ((bA7D5 = 79) or (bA7D5 = 81)) and (v47b = bAD3A) then
      begin
        {@1BB9-1BBD}
        v46b := 1;
        {@1BBD-1BC1}
        v48b := 1;
      end
      else
      begin
        {@1BC3-1BE5}
        v46b := pO0E2_12C9(v45p, a6523_3981[bA7D5].f, a0);
        {@1BE5-1BF7}
        v48b := a6522_3981[bA7D5].f;
      end;
      {@1BF7-1C14}
      if (PR173_byte(v45p)^.v = 6) and ((bA7D5 = 23) or (bA7D5 = 49)) then
        v46b := 1;
      {@1C14-1C2D}
      if ((PR420_byte(v45p)^.v and 64) = 0) and (bA7D5 = 108) then
        v46b := 1;
      {@1C2D-1C6C}
      if bA7D5 = 81 then
      begin
        {@1C34-1C57}
        v49b := PR495_shortint(p9CEE)^.v * 128 + pO0EC_2D90(bA7D5, 1);
        {@1C57-1C5B}
        v50b := 1;
      end
      else
        v49b := pO0EC_2D90(bA7D5, 1);
      {@1C6C-1CA5}
      pO0E2_2039(v45l, a6524_3981[bA7D5].f, pO0BB_0E1D(bA7D5), v49b, v50b, v48b, v46b, a1);
    end;
  end;
end;

{ 1CB4 }
procedure pO0BB_1CB4(a0: byte; a1: S40);
var
  v42b: byte;
begin
  {@1CCD-1CD2}
  bA7DC := 1;
  for v42b := 1 to bAD3A do
  begin
    {@1CE7-1D45}
if (PR495_byte(aAD37_9f8b[v42b])^.v <> a0) or (bA7D5 = 1) and (b880C = 5)
        and (pO0EC_2A6F(pointer(aAD37_9f8b[v42b]), 1, 0) > 0) then
      aAD37_9f8b[v42b] := nil;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,215,22,87
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1D6C }
procedure pO0BB_1D6C;
begin
  {@1D73-1D9B}
  pO0BB_1CB4(PR495_byte(p9CEE)^.v, s4025 + s4087);
end;

{ 1D9F }
procedure pO0BB_1D9F;
begin
  {@1DA6-1DD2}
  pO0BB_1CB4(pO0EC_29F3(p9CEE), s4025 + s40AD);
end;

{ 1DD6 }
procedure pO0BB_1DD6;
begin
  {@1DD9-1DE2}
  if bAD3A = 0 then
    Exit;
  {@1DE2-1E0F}
  if pO0E2_212C(pAD3B, pO0E2_1374(1, 8), 0) <> 0 then
    pO0EC_296E(pAD3B);
end;

{ 1E12 }
procedure pO0BB_1E12;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,1,80,176,8,80
  call pO0E2_13BF
  db 80,184,8,0,80,141,126,255,22,87,191,17,30,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1E55 }
procedure pO0BB_1E55;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is affected' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,73,30,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1E8F }
procedure pO0BB_1E8F;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is protected' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,130,30,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1ECE }
procedure pO0BB_1ECE;
var
  _f1: array[1..18] of byte;
begin
  if false then begin
    if LV = 'is cold-resistant' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,238,22,87,191,188,30,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1EFC }
procedure pO0BB_1EFC;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,160,213,167,80,176,0,80
  call pO0EC_2D90
  db 48,228,80,184,9,0,80,141,126,255,22,87,191,251,30,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 1F4F }
procedure pO0BB_1F4F;
var
  v4l: longint;
  v8p: pointer;
  _f1: array[1..14] of byte;
  v8b: byte absolute v8p;
  v4b: byte absolute v4l;
begin
  if false then begin
    if LV = 'is unaffected' then;
    if LV = 'is charmed' then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,248,137,86,250
  end;
  asm
  db 139,70,248,11,70,250,117,3,233,180,0
  end;
  asm
  db 196,126,248,38,128,189,173,0,6,117,14,196,126,248,38,138,133,164,1,36,2,8,192,116,11,196,126,248
  db 38,128,189,49,1,1,118,34,255,118,250,255,118,248,141,126,234,22,87,191,54,31,14,87,154,111,10,37
  db 8,176,10,80,176,1,80
  call pO0EC_1B08
  db 235,110
  end;
  asm
  db 160,213,167,80,160,213,167,80,176,1,80
  call pO0EC_2D90
  db 48,228,139,208,196,62,238,156,38,138,133,239,1,152,177,7,211,224,3,194,80,176,1,80,49,192,80,49
  db 192,80,141,126,237,22,87,191,68,31,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
  if pO0EC_27C1(v8p, 11, @v4b) <> 0 then
    pO0E2_00BD(11, @v8b, v4l, 0);
end;

{ 203F }
procedure pO0BB_203F;
var
  _f1: array[1..1] of byte;
  v5p: pointer;
  _f2: array[1..4] of byte;
begin
  if false then begin
    if LV = 'is stronger' then;
    if LV = 'is unaffected' then;
  end;
  {@2045-2052}
  v5p := pAD3B;
  {@2052-2057}
  b8511 := 18;
  asm
  db 198,6,18,133,0
  end;
  case pO0EC_2D90(bA7D5, 0) of
    1: b8512 := 0;
    2: b8512 := 1;
    3: b8512 := 51;
    4: b8512 := 76;
    5: b8512 := 91;
    6: b8512 := 100;
    7: b8511 := 19;
    8: b8511 := 20;
    9: b8511 := 21;
  else
    asm
  db 198,6,17,133,22
    end;
  end;
  asm
  db 255,118,253,255,118,251,160,17,133,80,160,18,133,80,141,126,255,22,87
  call pO0E2_16E6
  db 8,192,116,124,255,118,253,255,118,251,176,57,80,141,126,247,22,87
  call pO0EC_27C1
  db 8,192,117,101,255,118,253,255,118,251,176,63,80,141,126,247,22,87
  call pO0EC_27C1
  db 8,192,117,78,255,118,253,255,118,251,141,126,235,22,87,191,37,32,14,87,154,111,10,37,8,176,10,80
  db 176,1,80
  call pO0EC_1B08
  db 255,118,253,255,118,251,176,12,80,160,213,167,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,138,70,255,80,176,1,80
  call pO0E2_13E5
  db 255,118,253,255,118,251,176,0,80
  call pO0E2_186E
  db 235,32
  end;
  {@2168-2188}
  pO0EC_1B08(v5p, 'is unaffected', 10, 1);
end;

{ 219D }
procedure pO0BB_219D;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v8p: pointer;
begin
  if false then begin
    if LV = 'has been reduced' then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,248,137,86,250
  end;
  if (v8p <> nil) and (bAD3A > 0) and (pO0E2_12C9(v8p, 4, 0) = 0) and (pO0EC_27C1(v8p, 12, @v4b) <> 0) then
  begin
    asm
  db 255,118,250,255,118,248,176,12,80,49,192,49,210,82,80
  call pO0E2_0104
    end;
    asm
  db 255,118,250,255,118,248,176,0,80
  call pO0E2_186E
    end;
    {@220D-222D}
    pO0EC_1B08(v8p, 'has been reduced', 10, 1);
  end;
end;

{ 223D }
procedure pO0BB_223D;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is friendly' then;
  end;
  asm
  db 160,213,167,80,176,2,80,176,4,80
  call pO0E2_1374
  db 80,176,1,80,49,192,80,49,192,80,141,126,243,22,87,191,49,34,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
  asm
  db 255,54,240,156,255,54,238,156,176,5,80
  call pO0E2_186E
  end;
end;

{ 2284 }
procedure pO0BB_2284;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80
  call pO0EC_2D90
  db 48,228,64,136,70,255
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,138,70,255,48,228,209,232,80,176,4,80
  call pO0E2_13BF
  db 139,208,138,70,255,48,228,209,232,3,194,80,184,8,0,80,141,126,254,22,87,191,131,34,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 22E9 }
procedure pO0BB_22E9;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is shielded' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,221,34,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2317 }
procedure pO0BB_2317;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,160,213,167,80,176,0,80
  call pO0EC_2D90
  db 48,228,80,176,1,80,176,8,80
  call pO0E2_13BF
  db 90,3,194,80,184,12,0,80,141,126,255,22,87,191,22,35,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 236D }
procedure pO0BB_236D;
var
  v1b: byte;
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'falls asleep' then;
    LM1_0('falls asleep');
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 176,4,80,176,4,80
  call pO0E2_1374
  db 162,17,133
  end;
  for v1b := 1 to bAD3A do
  begin
    asm
  db 138,70,255,48,228,139,248,209,231,209,231,196,189,55,173,38,138,133,56,1,60,0,114,11,60,1,119,7
  db 198,6,18,133,1,235,79,60,2,117,7,198,6,18,133,2,235,68,60,3,117,7,198,6,18,133,4,235
  db 57,60,4,117,7,198,6,18,133,6,235,46,60,5,117,37,138,70,255,48,228,139,248,209,231,209,231,196
  db 189,55,173,38,128,189,173,0,6,117,7,198,6,18,133,10,235,5,198,6,18,133,20,235,5,198,6,18
  db 133,20
    end;
    asm
  db 138,70,255,48,228,139,248,209,231,209,231,196,189,55,173,38,128,189,237,1,1,116,54,138,70,255,48,228
  db 139,248,209,231,209,231,255,181,57,173,255,181,55,173,176,53,80,141,126,251,22,87
  call pO0EC_27C1
  db 8,192,117,18,160,17,133,58,6,18,133,114,9,160,18,133,40,6,17,133,235,21,138,70,255,48,228,139
  db 248,209,231,209,231,49,192,137,133,55,173,137,133,57,173
    end;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,238,22,87,191,96,35,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 24AC }
procedure pO0BB_24AC;
var
  v1b: byte;
begin
  if false then begin
    if LV = 'is held' then;
  end;
  {@24B2-24E2}
  case bAD3A of
    1: begin
      {@24B9-24CA}
      if bA7D5 = 23 then
        v1b := 254
      else
        v1b := 253;
    end;
    2: v1b := 255;
    3, 4: v1b := 0;
  end;
  {@24E2-24F9}
  pO0BB_1AE5(v1b, 'is held');
end;

{ 250F }
procedure pO0BB_250F;
var
  _f1: array[1..18] of byte;
begin
  if false then begin
    if LV = 'is fire resistant' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,238,22,87,191,253,36,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2548 }
procedure pO0BB_2548;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is silenced' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,60,37,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2581 }
procedure pO0BB_2581;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v8p: pointer;
  _f2: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is affected' then;
  end;
  {@2587-2594}
  v8p := pAD3B;
  if PR493_byte(v8p)^.v = 1 then
  begin
    {@259F-25A7}
    pAD3B := nil;
    {@25A7-25A9}
    Exit;
  end;
  {@25A9-2621}
  if pO0EC_27C1(v8p, 55, @v4b) <> 0 then
  begin
    asm
  db 196,126,248,38,128,189,252,1,0,117,9,196,126,248,38,198,133,252,1,1
    end;
    asm
  db 196,126,248,38,198,133,237,1,0
    end;
    asm
  db 196,126,248,38,198,133,238,1,1
    end;
    asm
  db 160,213,167,80,176,255,80,176,1,80,49,192,80,49,192,80,141,126,236,22,87,191,117,37,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
    end;
    {@2609-2621}
    pO0E2_13E5(v8p, 15, 10, 255, 1);
  end;
end;

{ 2625 }
procedure pO0BB_2625;
var
  v4p: pointer;
  _f1: array[1..3] of byte;
  v8b: byte;
  _f2: array[1..256] of byte;
begin
  {@262C-2638}
  b8511 := PR508_byte(p9CEE)^.v;
  {@2638-263D}
  bAD3A := 0;
  {@263D-264A}
  v4p := p9CF2;
  {@264A-26DB}
  while v4p <> nil do
  begin
    {@2655-26C5}
if ((PR420_byte(v4p)^.v and 16) <> 0) and (PR494_byte(v4p)^.v <> 0) and (pO0EC_27C1(v4p, 51, @v8b) = 0)
        and (b8511 >= PR508_byte(v4p)^.v) then
    begin
      {@2692-26A8}
      b8511 := b8511 - PR508_byte(v4p)^.v;
      {@26A8-26AC}
      Inc(bAD3A);
      {@26AC-26C5}
      aAD37_9f8b[bAD3A] := v4p;
    end;
    {@26C5-26D8}
    v4p := PR483_pointer(v4p)^.v;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,190,248,254,22,87,191,37,64,30,87,154
  db 111,10,37,8,191,3,66,30,87,154,252,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 270E }
procedure pO0BB_270E;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,1,80,49,192,80,49,192,80,141,126,255,22,87,191,13,39,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
  asm
  db 176,23,80,191,59,173,30,87,49,192,49,210,82,80,176,0,80
  call pO0E2_00BD
  end;
end;

{ 275E }
procedure pO0BB_275E;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is invisible' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,81,39,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2797 }
procedure pO0BB_2797;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'Knock-Knock' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,139,39,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 27D2 }
procedure pO0BB_27D2;
var
  _f1: array[1..16] of byte;
begin
  if false then begin
    if LV = 'is duplicated' then;
  end;
  asm
  db 176,1,80,176,4,80
  call pO0E2_1374
  db 48,228,185,5,0,211,224,136,70,255
  end;
  asm
  db 160,213,167,80,176,1,80
  call pO0EC_2D90
  db 10,70,255,136,70,255
  end;
  asm
  db 160,213,167,80,138,70,255,80,176,0,80,49,192,80,49,192,80,141,126,241,22,87,191,196,39,14,87,154
  db 111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2833 }
procedure pO0BB_2833;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is weakened' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,39,40,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2860 }
procedure pO0BB_2860;
var loc: array[1..30] of byte;
begin
  asm
    db 141,126,233,22,87,184,9,0,80
    call XR670_046E
    db 184,31,0,80,154,63,2,37,8,137,70,248,137,86,250,196,126,248,6,87,184,31,0,80
    call XR670_046E
    db 196,126,248,137,126,229,140,70,231,160,91,174,196,126,229,38,136,69,26,160,92,174,196,126,229,38,136,69
    db 27,161,238,156,139,22,240,156,196,126,229,38,137,5,38,137,85,2,160,213,167,80,176,1,80
    call pO0EC_2D90
    db 196,126,229,38,136,69,29,196,126,229,38,138,69,29,196,126,229,38,136,69,28,160,213,167,60,34,117,14
    db 198,70,246,4,196,126,229,38,198,69,30,29,235,55,60,91,117,14,198,70,246,9,196,126,229,38,198,69
    db 30,28,235,37,60,101,117,33,198,70,246,4,196,126,229,38,198,69,30,27,196,126,229,38,138,69,28,152
    db 139,240,209,224,1,240,196,126,229,38,136,69,28,138,70,246,136,70,228,176,1,58,70,228,118,3,233,95
    db 1,136,70,243,235,3,254,70,243,138,70,243,48,228,139,248,138,133,229,83,136,70,247,138,70,247,48,228
    db 139,248,138,133,172,62,152,139,208,196,126,229,38,138,69,26,152,3,194,137,70,254,138,70,247,48,228,139
    db 248,138,133,181,62,152,139,208,196,126,229,38,138,69,27,152,3,194,137,70,252,131,126,254,0,125,3,233
    db 240,0,131,126,254,49,126,3,233,231,0,131,126,252,0,125,3,233,222,0,131,126,252,24,126,3,233,213
    db 0,138,70,254,80,138,70,252,80,141,126,242,22,87,141,126,245,22,87
    call pO135_060F
    db 138,70,243,48,228,72,136,70,227,176,1,58,70,227,119,35,136,70,244,235,3,254,70,244,138,70,244,48
    db 228,139,248,138,67,232,58,70,242,117,4,198,70,242,0,138,70,244,58,70,227,117,226,138,86,242,138,70
    db 243,48,228,139,248,136,83,232,138,70,254,80,138,70,252,80
    call pO135_14A9
    db 136,70,245,128,126,245,0,118,18,138,70,245,48,228,139,248,209,231,209,231,128,189,186,62,255,114,4,176
    db 0,235,2,176,1,138,208,138,70,243,48,228,196,126,229,3,248,38,136,85,16,138,86,245,138,70,243,48
    db 228,196,126,229,3,248,38,136,85,7,138,70,243,48,228,196,126,229,3,248,38,128,125,16,0,116,28,196
    db 126,229,38,138,93,30,139,78,254,184,50,0,247,102,252,196,62,224,166,3,248,3,249,38,136,93,7,235
    db 15,138,70,243,48,228,196,126,229,3,248,38,198,69,16,0,138,70,243,58,70,228,116,3,233,166,254,161
    db 93,174,139,22,95,174,196,126,248,38,137,69,4,38,137,85,6,139,70,248,139,86,250,163,93,174,137,22
    db 95,174,160,91,174,80,160,92,174,80,176,255,80,176,8,80
    call pO135_0A4D
    db 138,70,246,136,70,232,176,1,58,70,232,119,66,136,70,243,235,3,254,70,243,138,70,243,48,228,139,248
    db 128,123,232,0,118,37,138,70,243,48,228,139,248,138,67,232,48,228,139,248,209,231,209,231,255,181,133,165
    db 255,181,131,165,176,1,80,176,0,80
    call pO0E2_0CAF
    db 138,70,243,58,70,232,117,195
  end;
end;

{ 2B20 }
procedure pO0BB_2B20;
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
begin
  {@2B26-2B2A}
  v5b := 0;
  {@2B2A-2B37}
  v4p := pAD3B;
  if PR342_byte(v4p)^.v > 0 then
    v6b := pO0E2_1374(1, 4);
  {@2B50-2B74}
  if (PR337_byte(v4p)^.v > 0) or (PR343_byte(v4p)^.v > 0) then
    v6b := pO0E2_1374(1, 6);
  {@2B74-2BA3}
  if (PR339_byte(v4p)^.v > 0) or (PR341_byte(v4p)^.v > 0) or (PR340_byte(v4p)^.v > 0) then
    v6b := pO0E2_1374(1, 8);
  {@2BA3-2BB8}
  v7b := PR17_byte(v4p)^.v + v6b;
  if v7b > 18 then
  begin
    {@2BBE-2C10}
    if (PR339_byte(v4p)^.v > 0) or (PR341_byte(v4p)^.v > 0) or (PR340_byte(v4p)^.v > 0) then
    begin
      {@2BDF-2BFC}
      v5b := PR28_byte(v4p)^.v + (v7b - 18) * 10;
      if v5b > 100 then
        v5b := 100;
      {@2C06-2C0A}
      v7b := 18;
    end
    else
      v7b := 18;
  end;
  {@2C10-2C63}
  if pO0E2_16E6(v4p, v7b, v5b, @v8b) <> 0 then
  begin
    {@2C2C-2C37}
    v8b := v6b + 100;
    {@2C37-2C55}
    pO0E2_13E5(v4p, 38, pO0BB_0E1D(bA7D5), v8b, 1);
    {@2C55-2C63}
    pO0E2_186E(v4p, 0);
  end;
end;

{ 2C67 }
function pO0BB_2C67: byte;
var
  _f1: array[1..1] of byte;
begin
  {@2C6D-2C71}
  pO0BB_2C67 := 0;
  {@2C71-2C76}
  bA7DB := 1;
  if pO0E2_160B(pAD3B, 34) <> 0 then
    pO0BB_2C67 := 1;
  {@2C8E-2CE2}
  if pO0E2_160B(pAD3B, 43) <> 0 then
  begin
    {@2CA2-2CA6}
    pO0BB_2C67 := 1;
    {@2CA6-2CBC}
    pO0E2_0104(pAD3B, 44, nil);
    {@2CBC-2CD2}
    pO0E2_0104(pAD3B, 31, nil);
    {@2CD2-2CE2}
    pO0E2_186E(pAD3B, 0);
  end;
  {@2CE2-2CE7}
  bA7DB := 0;
end;

{ 2D20 }
procedure pO0BB_2D20;
var
  v4p: pointer;
  v5b: byte;
begin
  if false then begin
    if LV = 'cured' then;
    if LV = 'no longer blind' then;
    if LV = 'regains intellect' then;
    if LV = 'is healed' then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  if pO0BB_2C67 <> 0 then
    pO0EC_1B08(v4p, s4025 + 'cured', 10, 0);
  {@2D67-2DA4}
  if pO0E2_160B(v4p, 33) <> 0 then
    pO0EC_1B08(v4p, s4025 + 'no longer blind', 10, 0);
  {@2DA4-2DF2}
  if pO0E2_160B(v4p, 68) <> 0 then
  begin
    {@2DB6-2DD6}
    pO0EC_1B08(v4p, 'regains intellect', 10, 0);
    asm
  db 255,118,254,255,118,252,176,1,80
  call pO0E2_186E
    end;
    asm
  db 255,118,254,255,118,252,176,2,80
  call pO0E2_186E
    end;
  end;
  asm
  db 176,1,80,176,4,80
  call pO0E2_1374
  db 136,70,251
  end;
  if (PR508_byte(v4p)^.v + v5b) > PR178_byte(v4p)^.v then
    asm
  db 198,70,251,0
    end
  else
    asm
  db 138,70,251,48,228,139,200,196,126,252,38,138,133,252,1,48,228,139,208,196,126,252,38,138,133,178,0,48
  db 228,43,194,43,193,136,70,251
    end;
  {@2E4D-2E83}
  if pO0E2_212C(v4p, v5b, 0) <> 0 then
    pO0EC_1B08(v4p, 'is healed', 10, 0);
end;

{ 2E8F }
procedure pO0BB_2E8F;
begin
  if false then begin
    if LV = 'can see' then;
  end;
  {@2E95-2EC8}
  if pO0E2_160B(pAD3B, 33) <> 0 then
    pO0EC_2601(pAD3B, 1, 'can see');
end;

{ 2ED5 }
procedure pO0BB_2ED5;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'is blind' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,247,22,87,191,204,46,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 2F08 }
procedure pO0BB_2F08;
var
  _f1: array[1..256] of byte;
begin
  if false then begin
    if LV = 'cured' then;
  end;
  asm
  push cs
  call near ptr pO0BB_2C67
  db 8,192,116,45,255,54,61,173,255,54,59,173,141,190,0,255,22,87,191,37,64,30,87,154,111,10,37,8
  db 191,2,47,14,87,154,252,10,37,8,176,10,80,176,0,80
  call pO0EC_1B08
  end;
end;

{ 2F48 }
procedure pO0BB_2F48;
var
  _f1: array[1..256] of byte;
begin
  asm
  db 160,213,167,80,176,0,80,176,1,80,49,192,80,49,192,80,141,190,0,255,22,87,191,37,64,30,87,154
  db 111,10,37,8,191,109,69,30,87,154,252,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 3012 }
procedure pO0BB_3012;
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  _f1: array[1..17] of byte;
  { 2F81 }
  function pO0BB_2F81(b0: byte): byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@2F87-2FE6}
    if v2b > b0 then
      b8511 := (v2b - b0) * 5 + 50
    else
    begin
      {@2FB5-2FE6}
      if v2b < b0 then
        b8511 := 50 - (b8512 - v2b) * 2
      else
        b8511 := 50;
    end;
    {@2FE6-2FFD}
    pO0BB_2F81 := Ord(Byte(pO0E2_1374(1, 100)) <= b8511);
  end;

begin
  if false then begin
    if LV = 'is affected' then;
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 160,213,167,80,176,0,80
  call pO0EC_2D90
  db 136,70,254
  end;
  for v1b := 1 to bAD3A do
  begin
    asm
  db 198,70,249,0
    end;
    asm
  db 138,70,255,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,250,137,86,252
    end;
    asm
  db 196,126,250,38,139,133,67,1,38,139,149,69,1,137,70,244,137,86,246
    end;
    asm
  db 139,70,244,11,70,246,117,3,233,183,0,196,126,244,38,139,69,5,38,139,85,7,137,70,240,137,86,242
  db 196,126,244,38,128,125,3,255,114,3,233,138,0,196,126,244,38,138,69,3,36,31,162,18,133,138,70,254
  db 58,6,18,133,118,30,160,18,133,48,228,139,208,138,70,254,48,228,43,194,139,240,209,224,209,224,1,240
  db 5,50,0,162,17,133,235,42,138,70,254,58,6,18,133,115,28,138,70,254,48,228,139,208,160,18,133,48
  db 228,43,194,209,224,139,208,184,50,0,43,194,162,17,133,235,5,198,6,17,133,50,176,1,80,176,100,80
  call pO0E2_1374
  db 58,6,17,133,119,28,255,118,252,255,118,250,196,126,244,38,138,5,80,255,118,246,255,118,244
  call pO0E2_0104
  db 198,70,249,1,139,70,240,139,86,242,137,70,244,137,86,246,233,62,255
    end;
    {@3136-3159}
    if v7b <> 0 then
      pO0EC_2601(v6p, 1, 'is affected');
  end;
  asm
  db 128,62,12,136,5,116,3,233,75,1
  end;
  asm
  db 198,6,109,177,0,235,4,254,6,109,177,160,109,177,152,139,248,138,133,172,62,152,139,208,160,91,174,152
  db 3,194,136,70,239,160,109,177,152,139,248,138,133,181,62,152,139,208,160,92,174,152,3,194,136,70,238,138
  db 70,239,80,138,70,238,80,141,126,236,22,87,141,126,237,22,87
  call pO135_060F
  db 128,126,237,29,116,9,128,126,237,28,116,3,233,220,0,161,93,174,139,22,95,174,137,70,232,137,86,234
  db 128,126,237,29,117,6,198,70,236,4,235,4,198,70,236,9,139,70,232,11,70,234,117,3,233,161,0,138
  db 70,236,136,70,231,176,1,58,70,231,118,3,233,125,0,136,70,255,235,3,254,70,255,138,70,255,48,228
  db 139,248,138,133,229,83,48,228,139,248,138,133,172,62,152,139,208,196,126,232,38,138,69,26,152,3,194,139
  db 208,138,70,239,152,59,194,117,67,138,70,255,48,228,139,248,138,133,229,83,48,228,139,248,138,133,181,62
  db 152,139,208,196,126,232,38,138,69,27,152,3,194,139,208,138,70,238,152,59,194,117,25,196,126,232,38,138
  db 69,29,80,85
  push cs
  call near ptr pO0BB_2F81
  db 8,192,116,8,196,126,232,38,198,69,28,255,138,70,255,58,70,231,117,136,196,126,232,38,139,69,4,38
  db 139,85,6,137,70,232,137,86,234,233,84,255,160,91,174,80,160,92,174,80,176,3,80,176,8,80
  call pO135_0A4D
  db 128,62,109,177,8,116,3,233,196,254
  end;
  asm
  db 176,1,80
  call pO0E2_237B
  end;
end;

{ 32C8 }
procedure pO0BB_32C8;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is praying' then;
  end;
  asm
  db 160,213,167,80,160,213,167,80,176,1,80
  call pO0EC_2D90
  db 48,228,139,208,196,62,238,156,38,138,133,239,1,152,177,7,211,224,3,194,80,176,0,80,49,192,80,49
  db 192,80,141,126,245,22,87,191,189,50,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 3336 }
procedure pO0BB_3336;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  if false then begin
    if LV = 'is un-cursed' then;
    if LV = 'has an item un-cursed' then;
    LP1('has an item un-cursed');
  end;
  {@333C-3372}
  if pO0E2_160B(pAD3B, 43) <> 0 then
  begin
    {@3350-336F}
    pO0EC_2601(pAD3B, 1, 'is un-cursed');
    asm
  db 233,191,0
    end;
  end;
  asm
  db 198,70,251,0
  end;
  asm
  db 196,62,59,173,38,139,133,167,1,38,139,149,169,1,137,70,252,137,86,254
  end;
  asm
  db 139,70,252,11,70,254,116,122,128,126,251,0,117,116,196,126,252,38,128,125,54,0,116,86,198,70,251,1
  db 196,126,252,38,198,69,52,0,196,126,252,38,128,125,62,127,118,64,198,6,128,174,1,196,126,252,38,138
  db 69,62,80,191,59,173,30,87,255,118,254,255,118,252,176,1,80
  call pO0E2_00BD
  db 198,70,250,0,235,3,254,70,250,255,54,61,173,255,54,59,173,138,70,250,80
  call pO0E2_186E
  db 128,126,250,5,117,230,196,126,252,38,139,69,42,38,139,85,44,137,70,252,137,86,254,233,126,255
  end;
  {@340C-3431}
  if v5b <> 0 then
    pO0EC_2601(pAD3B, 1, 'has an item un-cursed');
end;

{ 3446 }
procedure pO0BB_3446;
var
  _f1: array[1..18] of byte;
begin
  if false then begin
    if LV = 'has been cursed!' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,239,22,87,191,53,52,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 347F }
procedure pO0BB_347F;
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is blinking' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,115,52,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 34AD }
procedure pO0BB_34AD;
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 198,6,220,167,1
  end;
  if bA7D5 = 64 then
    asm
  db 176,1,80,176,3,80
  call pO0E2_1374
  db 48,228,209,224,64,136,70,255
    end
  else
    asm
  db 160,213,167,80,176,0,80
  call pO0EC_2D90
  db 136,70,255
    end;
  asm
  db 196,62,248,135,38,128,125,33,0,117,110,160,91,174,80,160,92,174,80,184,2,0,80,176,255,80,176,1
  db 80
  call pO130_08D7
  db 160,228,166,136,70,252,176,1,58,70,252,119,68,136,70,253,235,3,254,70,253,138,70,253,48,228,139,248
db 139,247,209,231,1,247,138,133,226,166,48,228,139,248,209,231,209,231,139,141,131,165,139,157,133,165,138,70
  db 253,48,228,139,248,209,231,209,231,137,141,55,173,137,157,57,173,138,70,253,58,70,252,117,193,160,228,166
  db 162,58,173
  end;
  asm
  db 160,91,174,80,160,92,174,80,176,0,80,176,8,80
  call pO135_0A4D
  end;
  if bA7D5 = 115 then
    asm
  db 138,70,255,136,70,254
    end
  else
    asm
  db 198,70,254,0
    end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,138,70,255,80,176,6,80
  call pO0E2_13BF
  db 139,208,138,70,254,48,228,3,194,80,184,9,0,80,141,126,252,22,87,191,172,52,14,87,154,111,10,37
  db 8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 35BD }
procedure pO0BB_35BD(a0: byte; a1: byte; a2: S40);
var
  v42b: byte;
  v43b: byte;
  _f1: array[1..1] of byte;
begin
  {@35D6-35DB}
  bA7DC := 1;
  {@35DB-35EA}
  v42b := pO0EC_2D90(bA7D5, 0);
  for v43b := 1 to bAD3A do
    asm
  db 138,70,213,48,228,139,248,209,231,209,231,196,189,55,173,38,138,133,239,1,58,70,10,117,64,128,126,214
  db 0,118,58,254,78,214,138,70,213,48,228,139,248,209,231,209,231,255,181,57,173,255,181,55,173,138,70,12
  db 80
  call pO0E2_160B
  db 8,192,116,21,138,70,213,48,228,139,248,209,231,209,231,49,192,137,133,55,173,137,133,57,173,235,21,138
  db 70,213,48,228,139,248,209,231,209,231,49,192,137,133,55,173,137,133,57,173
    end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,215,22,87
  push cs
  call near ptr pO0BB_0ED6
  end;
  for v43b := 1 to bAD3A do
  begin
    {@36A6-36D4}
    if aAD37_9f8b[v43b] <> nil then
      pO0E2_04DD(18, @aAD37_0389[v43b]);
  end;
end;

{ 36EC }
procedure pO0BB_36EC;
begin
  if false then begin
    if LV = 'is Hasted' then;
  end;
  {@36F2-3712}
  pO0BB_35BD(42, PR495_byte(p9CEE)^.v, 'is Hasted');
end;

{ 3716 }
procedure pO0BB_3716(a0: byte; a1: byte; a2: word);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
begin
  {@371C-3733}
  pO135_060F(a0, a1, @v1b, @v2b);
  if v1b > 0 then
  begin
    {@3739-3752}
    v6p := aA583_9f8b[v1b];
    {@3752-3775}
    pO0E2_1D19(v6p, a2, 2, pO0E2_12C9(v6p, 4, 0));
    {@3775-377D}
    pR1C3_2120(18);
  end;
end;

{ 3783 }
procedure pO0BB_3783(a0: word; a1: word; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..4] of byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v13w: word;
  v15w: word;
  v17w: word;
  v19w: word;
  v21w: word;
  v23w: word;
  _f2: array[1..1] of byte;
  v25b: byte;
  _f3: array[1..14] of byte;
  v41w: word;
  v43w: word;
  v45w: word;
  v47w: word;
  _f4: array[1..1] of byte;
  v49b: byte;
  _f5: array[1..4] of byte;
  v55w: word;
  v57w: word;
  _f6: array[1..6] of byte;
  v65w: word;
  v67w: word;
  v69w: word;
  v71w: word;
  v72b: byte;
  v71b: byte absolute v71w;
  v57i: integer absolute v57w;
  v57b: byte absolute v57w;
  v55i: integer absolute v55w;
  v55b: byte absolute v55w;
  v47b: byte absolute v47w;
  v23i: integer absolute v23w;
  v23b: byte absolute v23w;
  v21i: integer absolute v21w;
  v19i: integer absolute v19w;
  v19b: byte absolute v19w;
  v17i: integer absolute v17w;
  v11sb: shortint absolute v11b;
  v10sb: shortint absolute v10b;
  v9sb: shortint absolute v9b;
begin
  {@3789-3791}
  pR1C3_2120(18);
  {@3791-37A2}
  v17w := pO135_0CA2(l9CEE);
  {@37A2-37B3}
  v21w := pO135_0CCA(l9CEE);
  {@37B3-37BA}
  v19w := sbAE5B;
  {@37BA-37C1}
  v23w := sbAE5C;
  {@37C1-37D0}
  pO0BB_3716(v19b, v23b, a1);
  {@37D0-37E7}
  pO135_060F(v19b, v23b, @v2b, @v3b);
  {@37E7-37EF}
  a0 := a0 * 2;
  {@37EF-37F4}
  bA7DC := 1;
  {@37F4-37F8}
  v1b := 0;
  {@37F8-37FC}
  v9b := 1;
  {@37FC-3A57}
  while a0 > 0 do
  begin
    {@3805-3813}
    XR670_046E(@v71b, 24);
    {@3813-3819}
    v71w := v19w;
    {@3819-381F}
    v69w := v23w;
    {@381F-384B}
    v67w := LongInt(v19i) + LongInt((v19i - v17i) * v9sb) * LongInt(a0);
    {@384B-3877}
    v65w := LongInt(v23i) + LongInt((v23i - v21i) * v9sb) * LongInt(a0);
    {@3877-3881}
    pO130_01A0(@v71b);
    {@3881-3A54}
    repeat
      {@3881-3887}
      v10b := v57b;
      {@3887-388D}
      v11b := v55b;
      if (v71w <> v67w) or (v69w <> v65w) then
        repeat
          {@389D-38A3}
          v13w := v57w;
          {@38A3-38A9}
          v15w := v55w;
          {@38A9-38B6}
          v72b := pO130_0247(@v71b);
          {@38B6-38CD}
          pO135_060F(v57b, v55b, @v4b, @v3b);
until (v72b = 0) or (v4b > 0) and (v4b <> v2b) or (v3b = 0) or (a3EBA_2a50[v3b].f > 1)
            or (v49b >= a0);
      {@3903-390E}
      if v3b = 0 then
        a0 := 0;
      {@390E-3932}
      if (v57i < 0) or (v57i > 49) or (v55i < 0) or (v55i > 24) then
      begin
        {@3926-392C}
        v57w := v13w;
        {@392C-3932}
        v55w := v15w;
      end;
      {@3932-394D}
      pO0EC_1F07(v10sb, v11sb, v57w, v55w, 4, 50);
      if v2b <> v4b then
        pO0BB_3716(v57b, v55b, a1);
      {@3964-396A}
      v2b := v4b;
      if (a3EBA_2a50[v3b].f > 1) and (PR33_byte(p87F8)^.v = 1) then
      begin
        {@3987-398D}
        v19w := v57w;
        {@398D-3993}
        v23w := v55w;
        {@3993-3997}
        v9b := 255;
        {@3997-39A5}
        XR670_046E(@v47b, 24);
        {@39A5-39AB}
        v47w := v19w;
        {@39AB-39B1}
        v45w := v23w;
        {@39B1-39B7}
        v43w := v17w;
        {@39B7-39BD}
        v41w := v21w;
        {@39BD-39C7}
        pO130_01A0(@v47b);
        {@39C7-39D7}
        while pO130_0247(@v47b) <> 0 do
        begin
        end;
        {@39D7-39ED}
        if (a2 <> 0) and (v25b <= 8) then
          v49b := v49b * 2;
        {@39ED-39F1}
        a2 := 0;
      end;
      {@39F1-3A02}
      v1b := v49b - v1b;
      if v1b < 2 then
        v1b := 2;
      {@3A0C-3A25}
      if v1b < a0 then
        Dec(a0, v1b)
      else
        a0 := 0;
      {@3A25-3A2B}
      v1b := v49b;
    until (a0 = 0) or (a3EBA_2a50[v3b].f > 1) and (PR33_byte(p87F8)^.v = 1);
  end;
  {@3A57-3A5C}
  bA7DC := 0;
end;

{ 3A62 }
procedure pO0BB_3A62;
var
  v2w: word;
  _f1: array[1..2] of byte;
begin
  {@3A68-3A6D}
  bA7D2 := 12;
  {@3A6D-3A85}
  v2w := pO0E2_13BF(pO0EC_2D90(bA7D5, 0), 6);
  {@3A85-3A93}
  pO0BB_3783(7, v2w, 1);
end;

{ 3AA1 }
procedure pO0BB_3AA1;
begin
  if false then begin
    if LV = 'is Slowed' then;
  end;
  {@3AA7-3ACB}
  pO0BB_35BD(39, pO0EC_29F3(p9CEE), 'is Slowed');
end;

{ 3AD0 }
procedure pO0BB_3AD0;
var
  v4l: longint;
  v4p: pointer absolute v4l;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LV = FS then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  asm
  db 198,6,210,167,8
  end;
  {@3AE9-3B15}
  pO0E2_2039(v4l, 34, 0, 0, 0, 0, 0, '');
  {@3B15-3B40}
  pO0EC_1B08(v4p, s4025 + s456D, 10, 1);
  asm
  db 255,118,254,255,118,252,176,1,80,176,4,80
  call pO0E2_1374
  db 48,228,139,208,196,126,252,38,138,133,252,1,48,228,43,194,80,176,0,80,176,0,80
  call pO0E2_1D19
  end;
end;

{ 3B7B }
procedure pO0BB_3B7B;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'is Speedy' then;
  end;
  {@3B81-3BB8}
  if pO0E2_160B(pAD3B, 42) = 0 then
    asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,246,22,87,191,113,59,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
    end;
end;

{ 3BBC }
procedure pO0BB_3BBC;
begin
  {@3BBF-3BC8}
  if bAD3A = 0 then
    Exit;
  {@3BC8-3BF8}
  if pO0E2_212C(pAD3B, pO0E2_1374(2, 8) + 1, 0) <> 0 then
    pO0EC_296E(pAD3B);
end;

{ 3C06 }
procedure pO0BB_3C06;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is stronger' then;
  end;
  asm
  db 255,54,61,173,255,54,59,173,176,21,80,176,0,80,141,126,255,22,87
  call pO0E2_16E6
  db 8,192,116,34,255,54,61,173,255,54,59,173,141,126,242,22,87,191,250,59,14,87,154,111,10,37,8,176
  db 10,80,176,1,80
  call pO0EC_1B08
  end;
  asm
  db 255,54,61,173,255,54,59,173,176,113,80,176,1,80,176,4,80
  call pO0E2_1374
  db 48,228,186,10,0,247,226,5,40,0,80,138,70,255,80,176,1,80
  call pO0E2_13E5
  end;
  asm
  db 255,54,61,173,255,54,59,173,176,0,80
  call pO0E2_186E
  end;
end;

{ 3C8B }
procedure pO0BB_3C8B;
var
  _f1: array[1..2] of byte;
begin
  {@3C91-3C96}
  bA7D2 := 12;
  {@3C96-3CA5}
  pO0BB_3783(3, 20, 0);
end;

{ 3CB6 }
procedure pO0BB_3CB6;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is paralyzed' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,169,60,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 3CED }
procedure pO0BB_3CED;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'is Healed' then;
  end;
  asm
  db 255,54,61,173,255,54,59,173,176,2,80,176,4,80
  call pO0E2_1374
  db 48,228,64,64,80,176,0,80
  call pO0E2_212C
  db 8,192,116,31,255,54,61,173,255,54,59,173,176,1,80,141,126,246,22,87,191,227,60,14,87,154,111,10
  db 37,8
  call pO0EC_2601
  end;
end;

{ 3D5E }
procedure pO0BB_3D5E;
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is now 18 years old' then;
    if LV = 'becomes younger' then;
    LP1('is now 18 years old');
  end;
  asm
  db 161,238,156,139,22,240,156,137,70,252,137,86,254
  end;
  asm
  db 176,1,80,176,4,80
  call pO0E2_1374
  db 48,228,64,139,208,196,126,252,38,139,133,176,0,43,194,196,126,252,38,137,133,176,0
  end;
  if PR176_word(v4p)^.v < 18 then
  begin
    asm
  db 196,126,252,38,199,133,176,0,18,0
    end;
    {@3DA8-3DC8}
    pO0EC_1B08(v4p, 'is now 18 years old', 10, 1);
    asm
  db 235,32
    end;
  end;
  {@3DCA-3DEA}
  pO0EC_1B08(v4p, 'becomes younger', 10, 1);
end;

{ 3DEF }
procedure pO0BB_3DEF;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,2,80,176,4,80
  call pO0E2_13BF
  db 64,64,80,184,8,0,80,141,126,255,22,87,191,238,61,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 3E29 }
procedure pO0BB_3E29;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,2,80,176,8,80
  call pO0E2_13BF
  db 64,80,184,8,0,80,141,126,255,22,87,191,40,62,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 3E7D }
procedure pO0BB_3E7D;
var
  v4p: pointer;
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'is unpoisoned' then;
    if LV = 'is unaffected' then;
    LP1('is unpoisoned');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  if PR493_byte(v4p)^.v = 1 then
  begin
    asm
  db 49,192,163,59,173,163,61,173
    end;
    asm
  db 233,200,0
    end;
  end;
  asm
  db 255,118,254,255,118,252,176,55,80,141,126,248,22,87
  call pO0EC_27C1
  db 8,192,117,3,233,142,0,196,126,252,38,128,189,252,1,0,117,9,196,126,252,38,198,133,252,1,1,198
  db 6,219,167,1,255,118,254,255,118,252,176,55,80,49,192,49,210,82,80
  call pO0E2_0104
  db 255,118,254,255,118,252,176,22,80,49,192,49,210,82,80
  call pO0E2_0104
  db 255,118,254,255,118,252,176,15,80,49,192,49,210,82,80
  call pO0E2_0104
  db 198,6,219,167,0,255,118,254,255,118,252,141,126,234,22,87,191,97,62,14,87,154,111,10,37,8,176,10
  db 80,176,1,80
  call pO0EC_1B08
  db 196,126,252,38,198,133,238,1,1,196,126,252,38,198,133,237,1,0,235,32
  end;
  {@3F4E-3F6E}
  pO0EC_1B08(v4p, 'is unaffected', 10, 1);
end;

{ 3F73 }
procedure pO0BB_3F73;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,184,8,0,80,141,126,247,22,87,191,114,63,14,87,154
  db 111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
  asm
  db 196,62,238,156,38,196,189,231,1,38,139,69,9,38,139,85,11,137,70,248,137,86,250
  end;
  asm
  db 198,6,209,167,64
  end;
  asm
  db 176,9,80,141,126,248,22,87
  call pO0E2_04DD
  end;
  if bA7D1 = 64 then
    asm
  db 176,64,80,191,238,156,30,87,255,118,254,255,118,252,176,0,80
  call pO0E2_00BD
    end;
end;

{ 3FFA }
procedure pO0BB_3FFA;
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LV = 'smashes them flat' then;
  end;
  asm
  db 196,62,59,173,38,128,189,56,1,6,115,95,160,213,167,80,160,213,167,80,176,1,80
  call pO0EC_2D90
  db 80,176,0,80,49,192,80,184,8,0,80,141,126,251,22,87,191,231,63,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  db 255,54,61,173,255,54,59,173,176,3,80,141,126,252,22,87
  call pO0EC_27C1
  db 8,192,116,22,176,3,80,191,59,173,30,87,255,118,254,255,118,252,176,0,80
  call pO0E2_00BD
  db 235,51
  end;
  {@406B-409E}
  if pO0EC_0E7A(pAD3B) = 0 then
    pO0EC_1B08(pAD3B, 'smashes them flat', 10, 1);
end;

{ 40A2 }
procedure pO0BB_40A2;
begin
  {@40A5-40AE}
  if bAD3A = 0 then
    Exit;
  {@40AE-40E0}
  if pO0E2_212C(pAD3B, pO0E2_1374(3, 8) + 3, 0) <> 0 then
    pO0EC_296E(pAD3B);
end;

{ 40E3 }
procedure pO0BB_40E3;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,3,80,176,8,80
  call pO0E2_13BF
  db 5,3,0,80,184,8,0,80,141,126,255,22,87,191,226,64,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 412A }
procedure pO0BB_412A;
var loc: array[1..12] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LV = 'is affected' then;
  end;
  asm
    db 255,54,240,156,255,54,238,156,176,4,80,176,73,80
    push cs
    call near ptr pO0BB_0E1D
    db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,126,255,22,87,191,29,65,14,87,154,111,10,37,8
    call pO0E2_2039
    db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,244,22,87,191,30,65,14,87,154,111
    db 10,37,8
    push cs
    call near ptr pO0BB_0ED6
  end;
end;

{ 418B }
procedure pO0BB_418B;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,6,80,176,8,80
  call pO0E2_13BF
  db 80,184,9,0,80,141,126,255,22,87,191,138,65,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 41D1 }
procedure pO0BB_41D1;
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is raised' then;
    LP1('is raised');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
if ((PR493_byte(v4p)^.v = 6) or (PR493_byte(v4p)^.v = 1)) and (PR24_byte(v4p)^.v > 0)
      and (PR173_byte(v4p)^.v <> 0) then
  begin
    asm
  db 198,6,219,167,1
    end;
    asm
  db 255,118,254,255,118,252,176,55,80,49,192,49,210,82,80
  call pO0E2_0104
    end;
    asm
  db 198,6,219,167,0
    end;
    asm
  db 196,126,252,38,198,133,237,1,0
    end;
    asm
  db 196,126,252,38,198,133,238,1,1
    end;
    asm
  db 196,126,252,38,254,77,24
    end;
    asm
  db 255,118,254,255,118,252,176,4,80
  call pO0E2_186E
    end;
    asm
  db 196,126,252,38,198,133,252,1,1
    end;
    {@4260-4280}
    pO0EC_1B08(v4p, 'is raised', 10, 1);
  end;
end;

{ 429B }
procedure pO0BB_429B;
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is slain' then;
    if LV = 'is unaffected' then;
    LP1('is unaffected');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  asm
  db 198,6,210,167,64
  end;
  asm
  db 199,6,216,167,67,0
  end;
  asm
  db 176,9,80,141,126,252,22,87
  call pO0E2_04DD
  end;
  if wA7D8 <> 0 then
  begin
    asm
  db 255,118,254,255,118,252,176,4,80,176,0,80
  call pO0E2_12C9
  db 8,192,117,45,196,126,252,38,138,133,165,1,36,8,8,192,117,31,255,118,254,255,118,252,176,6,80,141
  db 126,243,22,87,191,132,66,14,87,154,111,10,37,8
  call pO0E2_0000
  db 235,35,198,6,210,167,8,255,118,254,255,118,252,176,2,80,176,8,80
  call pO0E2_13BF
  db 64,80,176,0,80,176,0,80
  call pO0E2_1D19
    end;
    asm
  db 235,32
    end;
  end;
  {@4334-4354}
  pO0EC_1B08(v4p, 'is unaffected', 10, 1);
end;

{ 4365 }
procedure pO0BB_4365;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  if false then begin
    if LV = 'is entangled' then;
    LP1('is entangled');
  end;
  asm
  db 198,6,220,167,1
  end;
  if PR33_byte(p87F8)^.v = 0 then
    for v5b := 1 to bAD3A do
      asm
  db 138,70,251,48,228,139,248,209,231,209,231,139,133,55,173,11,133,57,173,116,95,138,70,251,48,228,139,248
  db 209,231,209,231,139,133,55,173,139,149,57,173,137,70,252,137,86,254,255,118,254,255,118,252,176,4,80,176
  db 0,80
  call pO0E2_12C9
  db 136,70,250,255,118,254,255,118,252,176,27,80,176,78,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,0,80,176,0,80,176,1,80,138,70,250,80,141,126,236,22,87,191,88,67,14,87,154,111,10,37
  db 8
  call pO0E2_2039
      end;
  asm
  db 198,6,220,167,0
  end;
end;

{ 442A }
procedure pO0BB_442A;
begin
  if false then begin
    if LV = 'is highlighted' then;
  end;
  {@4430-4446}
  pO0BB_1AE5(0, 'is highlighted');
end;

{ 4457 }
procedure pO0BB_4457;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is invisible' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,74,68,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 448F }
procedure pO0BB_448F;
var
  v1b: byte;
  _f1: array[1..2] of byte;
  v7l: longint;
  _f2: array[1..3] of byte;
  v7b: byte absolute v7l;
begin
  if false then begin
    if LV = 'is charmed' then;
  end;
  {@4495-44AB}
  pO0BB_1AE5(0, 'is charmed');
  for v1b := 1 to bAD3A do
  begin
    {@44C0-4506}
    if pO0EC_27C1(pointer(aAD37_9f8b[v1b]), 11, @v7b) <> 0 then
      pO0E2_00BD(11, @aAD37_0389[v1b], v7l, 0);
  end;
end;

{ 451E }
procedure pO0BB_451E;
var
  v1b: byte;
  v2b: byte;
  v6l: longint;
  _f1: array[1..4] of byte;
  v11b: byte;
begin
  if false then begin
    if LV = 'is confused' then;
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 176,2,80,176,8,80
  call pO0E2_1374
  db 136,70,245
  end;
  if bAD3A > v11b then
    asm
  db 138,70,245,162,58,173
    end;
  {@4545-45D9}
  for v1b := 1 to bAD3A do
  begin
    {@455D-45D1}
    if aAD37_9f8b[v1b] <> nil then
    begin
      asm
  db 138,70,255,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,250,137,86,252
      end;
      asm
  db 255,118,252,255,118,250,176,4,80,176,0,80
  call pO0E2_12C9
  db 136,70,254
      end;
      {@459F-45D1}
      pO0E2_2039(v6l, 35, pO0BB_0E1D(82), 0, 0, 1, v2b, 'is confused');
    end;
  end;
  asm
  db 198,6,220,167,0
  end;
end;

{ 45EC }
procedure pO0BB_45EC;
var
  v4p: pointer;
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'teleports' then;
    LP1('teleports');
  end;
  asm
  db 161,238,156,139,22,240,156,137,70,252,137,86,254
  end;
  asm
  db 176,0,80,176,0,80,255,118,254,255,118,252
  call pO135_0D1A
  db 80
  call pO135_067C
  end;
  asm
  db 255,118,254,255,118,252,160,91,174,80,160,92,174,80,176,0,80
  call pO135_122B
  db 136,70,247
  end;
  asm
  db 255,118,254,255,118,252
  call pO135_0CA2
  db 80,255,118,254,255,118,252
  call pO135_0CCA
  db 80,176,0,80,176,8,80
  call pO135_0A4D
  end;
  {@4652-4672}
  pO0EC_1B08(v4p, 'teleports', 10, 1);
end;

{ 4693 }
procedure pO0BB_4693;
var
  _f1: array[1..4] of byte;
  v8l: longint;
  v9b: byte;
  v10b: byte;
  _f2: array[1..3] of byte;
  v14b: byte;
  v8p: pointer absolute v8l;
begin
  if false then begin
    if LV = 'runs in terror' then;
    if LV = 'is unaffected' then;
    LP1('runs in terror');
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 161,238,156,139,22,240,156,137,70,252,137,86,254
  end;
  asm
  db 255,118,254,255,118,252
  call pO135_0CA2
  db 80,255,118,254,255,118,252
  call pO135_0CCA
  db 80,160,91,174,80,160,92,174,80,176,3,80,176,6,80
  push cs
  call near ptr pO0BB_1736
  end;
  for v9b := 1 to bAD3A do
  begin
    asm
  db 138,70,247,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,248,137,86,250
    end;
    asm
  db 255,118,250,255,118,248,176,4,80,176,0,80
  call pO0E2_12C9
  db 136,70,246
    end;
    if v10b = 0 then
    begin
      {@4723-4755}
      pO0E2_2039(v8l, 111, pO0BB_0E1D(84), 0, 1, 1, v10b, 'runs in terror');
      if pO0EC_27C1(v8p, 111, @v14b) <> 0 then
      begin
        asm
  db 196,126,248,38,196,189,231,1,38,198,69,15,1
        end;
        asm
  db 196,126,248,38,198,133,240,1,1
        end;
        if PR327_byte(v8p)^.v <= 127 then
          asm
  db 196,126,248,38,198,133,71,1,179
          end;
        asm
  db 196,126,248,38,196,189,231,1,49,192,38,137,69,9,38,137,69,11
        end;
      end;
    end
    else
      pO0EC_1B08(v8p, 'is unaffected', 10, 1);
  end;
  asm
  db 198,6,220,167,0
  end;
end;

{ 47DF }
procedure pO0BB_47DF;
var
  _f1: array[1..260] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 198,70,253,0
  end;
  asm
  db 196,62,238,156,38,128,189,240,1,0,116,19,176,1,80,176,2,80
  call pO0E2_1374
  db 48,228,72,136,70,255,235,32,176,1,80
  call pO108_00CB
  db 191,7,40,30,87,191,172,44,30,87,176,0,80,176,0,80
  call pO108_1009
  db 136,70,255,138,70,255,60,0,117,120,255,54,240,156,255,54,238,156,176,50,80,176,85,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,190,253,254,22,87,191,37,64,30,87,154,111,10,37
  db 8,191,92,64,30,87,154,252,10,37,8
  call pO0E2_2039
  db 255,54,240,156,255,54,238,156,176,112,80,176,85,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,126,252,22,87,191,222,71,14,87,154,111,10,37,8
  call pO0E2_2039
  db 198,70,253,1,233,149,0,60,1,117,119,255,54,240,156,255,54,238,156,176,54,80,176,85,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,190,253,254,22,87,191,37,64,30,87,154,111,10,37
  db 8,191,92,64,30,87,154,252,10,37,8
  call pO0E2_2039
  db 255,54,240,156,255,54,238,156,176,112,80,176,85,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,126,252,22,87,191,222,71,14,87,154,111,10,37,8
  call pO0E2_2039
  db 198,70,253,1,235,26,191,209,20,30,87,160,98,83,80
  call pO108_2254
  db 58,6,98,83,176,0,117,1,64,136,70,253,128,126,253,0,117,3,233,164,254
  end;
end;

{ 495E }
procedure pO0BB_495E;
var
  v4p: pointer;
  _f1: array[1..3] of byte;
  v8b: byte;
  v4l: longint absolute v4p;
begin
  if false then begin
    if LV = 'is clumsy' then;
    if LV = 'is slowed' then;
    LP1('is clumsy');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  asm
  db 198,6,210,167,64
  end;
  if pO0E2_12C9(v4p, 4, 0) = 0 then
  begin
    {@498B-49BC}
    pO0E2_2039(v4l, 27, pO0BB_0E1D(86), 0, 0, 0, 0, 'is clumsy');
    if pO0EC_27C1(v4p, 27, @v8b) <> 0 then
      asm
  db 176,27,80,141,126,252,22,87,49,192,49,210,82,80,176,0,80
  call pO0E2_00BD
      end;
  end
  else
  begin
    {@49EB-4A1C}
    pO0E2_2039(v4l, 42, pO0BB_0E1D(86), 0, 0, 0, 0, 'is slowed');
    if pO0EC_27C1(v4p, 42, @v8b) <> 0 then
      asm
  db 176,42,80,141,126,252,22,87,49,192,49,210,82,80,176,0,80
  call pO0E2_00BD
      end;
  end;
  asm
  db 160,213,167,80,176,0,80,176,1,80,49,192,80,49,192,80,141,126,238,22,87,191,74,73,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4A71 }
procedure pO0BB_4A71;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,176,3,80,176,10,80
  call pO0E2_13BF
  db 80,184,8,0,80,141,126,255,22,87,191,112,74,14,87,154,111,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4ABA }
procedure pO0BB_4ABA;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is protected' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,173,74,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4AF4 }
procedure pO0BB_4AF4;
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is toughened' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,231,74,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4B22 }
procedure pO0BB_4B22;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  _f2: array[1..3] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 161,238,156,139,22,240,156,137,70,252,137,86,254
  end;
  asm
  db 160,213,167,80,176,0,80
  call pO0EC_2D90
  db 136,70,250
  end;
  asm
  db 160,213,167,80,176,0,80
  call pO0EC_2D90
  db 48,228,64,209,232,136,70,251
  end;
  if v5b < 1 then
    asm
  db 198,70,251,1
    end;
  asm
  db 255,118,254,255,118,252
  call pO135_0CA2
  db 80,255,118,254,255,118,252
  call pO135_0CCA
  db 80,160,91,174,80,160,92,174,80,176,2,80,138,70,251,80
  push cs
  call near ptr pO0BB_1736
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,138,70,250,80,176,4,80
  call pO0E2_13BF
  db 139,208,138,70,250,48,228,3,194,80,184,10,0,80,141,126,249,22,87,191,33,75,14,87,154,111,10,37
  db 8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4BCE }
procedure pO0BB_4BCE;
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v6p: pointer;
  _f2: array[1..3] of byte;
  v10b: byte;
  _f3: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,250,137,86,252
  end;
  asm
  db 196,126,250,38,138,133,54,1,136,70,254
  end;
  case PR174_byte(v6p)^.v of
    0: asm
  db 196,126,250,38,254,141,54,1
      end;
    5: asm
  db 196,126,250,38,128,133,54,1,4
      end;
  else
    asm
  db 196,126,250,38,128,133,54,1,2
    end;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,245,22,87,191,205,75,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
  if pO0EC_27C1(v6p, 68, @v10b) <> 0 then
  begin
    asm
  db 176,68,80,141,126,250,22,87,49,192,49,210,82,80,176,0,80
  call pO0E2_00BD
    end;
    for v1b := 0 to 140 do
      asm
  db 138,70,255,48,228,196,126,250,3,248,38,138,69,30,36,128,8,192,116,15,138,70,255,48,228,196,126,250
  db 3,248,38,198,69,30,0
      end;
  end;
  asm
  db 138,70,254,196,126,250,38,136,133,54,1
  end;
end;

{ 4CAC }
procedure pO0BB_4CAC;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,255,22,87,191,171,76,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4CDE }
procedure pO0BB_4CDE;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v8p: pointer;
begin
  if false then begin
    if LV = 'not ' then;
    if LV = FS then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,248,137,86,250
  end;
  asm
  db 139,70,248,11,70,250,117,3,233,201,0
  end;
  {@4CFD-4D91}
  if (PR173_shortint(v8p)^.v < 6) or ((PR420_byte(v8p)^.v and 2) <> 0) then
  begin
    asm
  db 160,213,167,80,160,213,167,80,176,1,80
  call pO0EC_2D90
  db 48,228,139,208,196,62,238,156,38,138,133,239,1,152,177,7,211,224,3,194,80,176,1,80,49,192,80,49
  db 192,80,141,190,248,254,22,87,191,37,64,30,87,154,111,10,37,8,191,3,66,30,87,154,252,10,37,8
  push cs
  call near ptr pO0BB_0ED6
    end;
    if pO0EC_27C1(v8p, 11, @v4b) <> 0 then
      asm
  db 176,11,80,141,126,248,22,87,255,118,254,255,118,252,176,0,80
  call pO0E2_00BD
      end;
    asm
  db 235,53
    end;
  end;
  {@4D91-4DC6}
  pO0EC_1B08(v8p, s4025 + 'not ' + s4203, 10, 1);
end;

{ 4DCB }
procedure pO0BB_4DCB;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,255,22,87,191,202,77,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4DF8 }
procedure pO0BB_4DF8;
begin
  {@4DFB-4E04}
  if bAD3A = 0 then
    Exit;
  {@4E04-4E31}
  if pO0E2_212C(pAD3B, pO0E2_1374(1, 8), 0) <> 0 then
    pO0EC_296E(pAD3B);
end;

{ 4E3D }
procedure pO0BB_4E3D;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'is Healed' then;
  end;
  asm
  db 255,54,61,173,255,54,59,173,176,2,80,176,4,80
  call pO0E2_1374
  db 48,228,64,64,80,176,0,80
  call pO0E2_212C
  db 8,192,116,31,255,54,61,173,255,54,59,173,176,1,80,141,126,246,22,87,191,51,78,14,87,154,111,10
  db 37,8
  call pO0EC_2601
  end;
end;

{ 4E8B }
procedure pO0BB_4E8B;
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,255,22,87,191,138,78,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 4EB8 }
procedure pO0BB_4EB8;
var
  v1b: byte;
  v2b: byte;
  c6: record case byte of 0: (v6l: longint); 1: (v6w: word); 2: (_p2: array[1..2] of byte; v4w: word) end;
  v10p: pointer;
  _f1: array[1..1] of byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v15b: byte;
  _f2: array[1..1] of byte;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
begin
  {@4EBE-4EC2}
  v13b := 0;
  {@4EC2-4ECF}
  v10p := pAD3B;
  {@4ECF-4ED3}
  v1b := 17;
  {@4ED3-4ED8}
  c6.v6w := 65535;
  {@4ED8-4EDD}
  c6.v4w := 32767;
  {@4EDD-4EE1}
  v15b := 0;
  for v2b := 0 to 6 do
  begin
    {@4EEA-4EFE}
    if PRA351_byte(v10p)^.a[v2sb] > 0 then
      Inc(v15b);
  end;
  {@4F04-4FBE}
  for v2b := 0 to 6 do
    asm
  db 138,70,254,152,196,126,246,3,248,38,138,149,95,1,138,70,254,152,196,126,246,3,248,38,138,133,81,1
  db 58,194,114,3,233,133,0,138,70,254,152,196,126,246,3,248,38,138,133,81,1,48,228,139,208,138,70,254
  db 152,196,126,246,3,248,38,138,133,95,1,48,228,43,194,136,70,245,138,70,245,0,70,243,255,118,248,255
  db 118,246,138,70,254,152,196,126,246,3,248,38,138,133,81,1,254,192,80,138,70,254,80
  call pO102_12D1
  db 59,86,252,124,7,127,49,59,70,250,119,44,255,118,248,255,118,246,138,70,254,152,196,126,246,3,248,38
  db 138,133,81,1,254,192,80,138,70,254,80
  call pO102_12D1
  db 137,70,250,137,86,252,138,70,254,136,70,255
    end;
  {@4FBE-50E1}
  if v1b <> 17 then
  begin
    {@4FC7-5073}
    if PR178_byte(v10p)^.v < PR378_byte(v10p)^.v then
    begin
      asm
  db 138,70,243,48,228,139,200,196,126,246,38,138,133,178,0,48,228,139,208,196,126,246,38,138,133,122,1,48
db 228,43,194,153,247,241,136,70,244,138,70,255,152,139,248,138,133,201,109,48,228,139,208,138,70,255,152,196
  db 126,246,3,248,38,138,133,81,1,48,228,64,59,194,125,31,138,70,241,48,228,80,255,118,248,255,118,246
  db 138,70,255,80
  call pO0EC_3D89
  db 152,89,153,247,249,136,70,242,235,4,198,70,242,0
      end;
      {@5047-5052}
      Inc(PR508_byte(v10p)^.v, v12b);
      {@5052-5068}
      Inc(PR380_byte(v10p)^.v, v12b - v14b);
      {@5068-5073}
      Inc(PR178_byte(v10p)^.v, v12b);
    end;
    {@5073-5081}
    Inc(PRA337_byte(v10p)^.a[v1sb]);
    {@5081-508C}
    pO102_02F5(v10p);
    if (v13b = 1) and (PR370_longint(v10p)^.v < PR374_longint(v10p)^.v) then
      PR370_longint(v10p)^.v := PR374_longint(v10p)^.v
    else
      PR370_longint(v10p)^.v := c6.v6l;
  end;
  {@50E1-50F4}
  PR492_byte(v10p)^.v := pO0EC_38FA(v10p);
end;

{ 50F8 }
procedure pO0BB_50F8;
begin
  {@50FB-5113}
  PR9_longint(PR487_pointer(p9CEE)^.v)^.v := lAD3B;
  asm
  db 191,238,156,30,87,49,192,49,210,82,80,176,0,80,255,30,122,169
  end;
end;

{ 5142 }
procedure pO0BB_5142;
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is destroyed' then;
    if LV = 'is unaffected' then;
    LP1('is destroyed');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  asm
  db 198,6,210,167,72
  end;
  asm
  db 199,6,216,167,255,0
  end;
  asm
  db 176,9,80,141,126,252,22,87
  call pO0E2_04DD
  end;
  if ((PR421_byte(v4p)^.v and 8) = 0) and (wA7D8 <> 0) then
  begin
    asm
  db 255,118,254,255,118,252,176,8,80,141,126,239,22,87,191,39,81,14,87,154,111,10,37,8
  call pO0E2_0000
    end;
    asm
  db 235,32
    end;
  end;
  {@51A1-51C1}
  pO0EC_1B08(v4p, 'is unaffected', 10, 1);
end;

{ 51D1 }
procedure pO0BB_51D1;
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'ressurected' then;
    if LV = FS then;
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  if (PR493_byte(v4p)^.v = 6) and (PR24_byte(v4p)^.v > 0) and (PR173_shortint(v4p)^.v > 0) then
  begin
    asm
  db 255,118,254,255,118,252,176,55,80,49,192,49,210,82,80
  call pO0E2_0104
    end;
    asm
  db 196,126,252,38,198,133,237,1,0
    end;
    asm
  db 196,126,252,38,198,133,238,1,1
    end;
    asm
  db 196,126,252,38,138,133,178,0,196,126,252,38,136,133,252,1
    end;
    {@523B-5266}
    pO0EC_1B08(v4p, s4025 + 'ressurected', 10, 1);
  end;
end;

{ 5272 }
procedure pO0BB_5272;
var
  v1b: byte;
begin
  if false then begin
    if LV = 'is held' then;
  end;
  {@5278-529D}
  case bAD3A of
    1: v1b := 252;
    2: v1b := 254;
    3: v1b := 255;
  else
    {@5299-529D}
    v1b := 0;
  end;
  {@529D-52B4}
  pO0BB_1AE5(v1b, 'is held');
end;

{ 52B8 }
procedure pO0BB_52B8;
var
  v4p: pointer;
  v4l: longint absolute v4p;
begin
  {@52BF-52CC}
  v4p := pAD3B;
  {@52CC-52D7}
  if v4p = nil then
    Exit;
  {@52D7-532B}
  if pO102_1276(v4p, 4) > 0 then
  begin
    {@52E9-5329}
    pO0E2_2039(v4l, 119, 0, pO0EC_2D90(109, 0), 0, 0, 0, s4025 + s405C);
    {@5329-532B}
    Exit;
  end;
  {@532B-5373}
  pO0E2_2039(v4l, 20, pO0BB_0E1D(109), pO102_1276(v4p, 4), 0, 0, 0, s4025 + s405C);
end;

{ 5382 }
procedure pO0BB_5382;
var
  v4p: pointer;
  v5b: byte;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'drops dead' then;
  end;
  {@5388-538D}
  bA7DC := 1;
  {@538D-5392}
  bA7D2 := 64;
  {@5392-53A4}
  b8511 := pO0E2_1374(4, 20) * 2;
  for v5b := 1 to bAD3A do
  begin
    {@53BC-53D5}
    v4p := aAD37_9f8b[v5b];
    case PR312_byte(v4p)^.v of
      0: b8512 := 1;
      1: b8512 := 2;
      2..3: b8512 := 8;
      4..5: b8512 := 16;
      6: begin
        {@5415-542C}
        if PR178_byte(v4p)^.v <= 51 then
          b8512 := 16
        else
          b8512 := 20;
      end;
      7..8: b8512 := 20;
    else
      {@543D-5442}
      b8512 := 162;
    end;
    {@5442-5448}
    wA7D8 := 100;
    {@5448-5455}
    pO0E2_04DD(9, @v4b);
    if ((PR421_byte(v4p)^.v and 8) = 0) and (wA7D8 <> 0) and (b8511 >= b8512) then
    begin
      {@5473-547A}
      Dec(b8511, b8512);
      {@547A-5497}
      pO0E2_0000(v4p, 6, 'drops dead');
    end
    else
      aAD37_9f8b[v5b] := nil;
  end;
end;

{ 54D9 }
procedure pO0BB_54D9;
var
  v1b: byte;
  v5p: pointer;
begin
  if false then begin
    if LV = 'disintegrates' then;
    if LV = 'is unaffected' then;
  end;
  asm
  db 198,6,210,167,72
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,251,137,86,253
  end;
  asm
  db 199,6,216,167,255,0
  end;
  asm
  db 176,9,80,141,126,251,22,87
  call pO0E2_04DD
  end;
  if wA7D8 <> 0 then
  begin
    asm
  db 255,118,253,255,118,251,176,4,80,176,0,80
  call pO0E2_12C9
  db 136,70,255
    end;
    if v1b = 0 then
    begin
      asm
  db 255,118,253,255,118,251,176,6,80,141,126,237,22,87,191,189,84,14,87,154,111,10,37,8
  call pO0E2_0000
      end;
      asm
  db 196,126,251,38,139,133,167,1,38,11,133,169,1,116,26,255,118,253,255,118,251,196,126,251,38,255,181,169
  db 1,38,255,181,167,1
  call pO0EC_18EF
  db 235,215
      end;
    end
    else
      pO0EC_1B08(v5p, 'is unaffected', 10, 1);
    asm
  db 235,32
    end;
  end;
  {@5592-55B2}
  pO0EC_1B08(v5p, 'is unaffected', 10, 1);
end;

{ 55C0 }
procedure pO0BB_55C0;
var
  _f1: array[1..256] of byte;
begin
  if false then begin
    if LV = 'protected' then;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,190,0,255,22,87,191,37,64,30,87,154
  db 111,10,37,8,191,182,85,14,87,154,252,10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 560D }
procedure pO0BB_560D;
var
  v4p: pointer;
  _f1: array[1..1] of byte;
  v6b: byte;
  v7b: byte;
  v4l: longint absolute v4p;
begin
  if false then begin
    if LV = 'no longer a statue' then;
    if Pos('', LV) = 0 then;
    LM1_8('', [LB], [LB], [LB], [LB], [LB], [LB], [LB], [LB]);
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  if PR493_byte(v4p)^.v = 7 then
  begin
    asm
  db 196,126,252,38,198,133,237,1,0
    end;
    asm
  db 196,126,252,38,198,133,238,1,1
    end;
    asm
  db 196,126,252,38,198,133,252,1,1
    end;
    {@564A-5675}
    pO0EC_1B08(v4p, s4025 + 'no longer a statue', 10, 0);
    if b880C = 5 then
    begin
      asm
  db 198,70,250,1
      end;
      asm
  db 138,70,250,48,228,186,7,0,247,226,139,248,139,133,160,166,139,149,162,166,59,86,254,117,5,59,70,252
  db 116,5,254,70,250,235,221
      end;
      asm
  db 138,70,250,48,228,186,7,0,247,226,139,248,138,157,166,166,138,70,250,48,228,186,7,0,247,226,139,248
  db 138,133,164,166,152,139,200,138,70,250,48,228,186,7,0,247,226,139,248,138,133,165,166,152,186,50,0,247
  db 226,196,62,224,166,3,248,3,249,38,136,93,7
      end;
      for v7b := v6b to bA6DF - 1 do
        aA6A0_be96[v7b] := aA6A0_be96[v7b + 1];
      asm
  db 254,14,223,166
      end;
      if pO135_122B(v4p, pO135_0CA2(v4l), pO135_0CCA(v4l), 1) <> 0 then
        asm
  db 160,91,174,80,160,92,174,80,176,0,80,176,8,80
  call pO135_0A4D
        end;
    end;
  end;
  asm
  db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,248,22,87,191,12,86,14,87,154,111
  db 10,37,8
  push cs
  call near ptr pO0BB_0ED6
  end;
end;

{ 57B2 }
procedure pO0BB_57B2;
var
  v1b: byte;
  v5p: pointer;
  v5b: byte absolute v5p;
begin
  if false then begin
    if LV = 'turned to stone' then;
  end;
  {@57B9-57BE}
  bA7D2 := 64;
  {@57BE-57CB}
  v5p := pAD3B;
  {@57CB-57D1}
  wA7D8 := 255;
  {@57D1-57DE}
  pO0E2_04DD(9, @v5b);
  if wA7D8 <> 0 then
  begin
    {@57E5-57F9}
    v1b := pO0E2_12C9(v5p, 4, 0);
    if v1b = 0 then
      pO0E2_0000(v5p, 7, s4025 + 'turned to stone');
  end;
end;

{ 582B }
procedure pO0BB_582B;
var loc: array[1..258] of byte;
begin
  asm
    db 198,6,220,167,1,160,58,173,136,70,254,176,1,58,70,254,119,109,136,70,255,235,3,254,70,255,138,70
    db 255,48,228,139,248,209,231,209,231,196,189,55,173,38,138,133,239,1,196,62,238,156,38,58,133,239,1,117
    db 41,128,62,12,136,5,117,55,138,70,255,48,228,139,248,209,231,209,231,255,181,57,173,255,181,55,173,176
    db 1,80,176,0,80
    call pO0EC_2A6F
    db 8,192,118,21,138,70,255,48,228,139,248,209,231,209,231,49,192,137,133,55,173,137,133,57,173,138,70,255
    db 58,70,254,117,152,160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,190,255,254,22,87,191
    db 37,64,30,87,154,111,10,37,8,191,23,68,30,87,154,252,10,37,8
    push cs
    call near ptr pO0BB_0ED6
  end;
end;

{ 58E3 }
procedure pO0BB_58E3;
var
  v1b: byte;
  v5p: pointer;
  v5l: longint absolute v5p;
begin
  {@58EA-58EF}
  bA7DC := 1;
  {@58EF-58FC}
  v5p := pAD3B;
  case PR508_byte(v5p)^.v of
    1..30: v1b := pO0E2_1374(4, 4);
    31..60: v1b := pO0E2_1374(2, 4);
    61..90: v1b := pO0E2_1374(1, 4);
  else
    {@594C-5950}
    v1b := 0;
  end;
  {@5950-5995}
  pO0E2_2039(v5l, b6C74, v1b, pO0EC_2D90(117, 1), 0, b6C72, 0, s4025 + s501D);
end;

{ 59AD }
procedure pO0BB_59AD;
var loc: array[1..20] of byte;
begin
  if false then begin
    if LV = 'is covered in flame' then;
  end;
  asm
    db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,236,22,87,191,153,89,14,87,154,111
    db 10,37,8
    push cs
    call near ptr pO0BB_0ED6
  end;
end;

{ 59E7 }
procedure pO0BB_59E7;
var loc: array[1..14] of byte;
begin
  if false then begin
    if LV = 'is protected' then;
  end;
  asm
    db 160,213,167,80,176,0,80,176,0,80,49,192,80,49,192,80,141,126,243,22,87,191,218,89,14,87,154,111
    db 10,37,8
    push cs
    call near ptr pO0BB_0ED6
  end;
end;

{ 5A2D }
procedure pO0BB_5A2D;
var loc: array[1..28] of byte;
begin
  if false then begin
    if LV = 'is unaffected' then;
    if LV = 'is charmed' then;
  end;
  asm
    db 198,6,220,167,1,198,70,247,0,198,70,244,0,198,70,246,1,160,213,167,80,176,0,80
    call pO0EC_2D90
    db 48,228,209,224,136,70,243,138,70,246,58,6,58,173,118,3,233,73,1,128,126,247,0,116,3,233,64,1
    db 138,70,246,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,248,137,86,250,139,70,248
    db 11,70,250,117,3,233,22,1,196,126,248,38,138,133,165,1,36,2,8,192,116,30,196,126,248,38,128,189
    db 49,1,1,119,19,196,126,248,38,138,133,239,1,196,62,238,156,38,58,133,239,1,117,35,255,118,250,255
    db 118,248,141,126,229,22,87,191,20,90,14,87,154,111,10,37,8,176,10,80,176,1,80
    call pO0EC_1B08
    db 233,199,0,196,126,248,38,138,133,56,1,136,70,245,138,70,243,48,228,139,200,138,70,244,48,228,139,208
    db 138,70,245,48,228,3,194,59,193,126,3,233,160,0,138,70,245,0,70,244,138,70,244,58,70,243,176,0
    db 117,1,64,136,70,247,255,118,250,255,118,248,176,11,80,160,213,167,80
    push cs
    call near ptr pO0BB_0E1D
    db 80,160,213,167,80,176,1,80
    call pO0EC_2D90
    db 48,228,139,208,196,62,238,156,38,138,133,239,1,152,177,7,211,224,3,194,80,176,1,80,176,1,80,255
    db 118,250,255,118,248,176,4,80,176,254,80
    call pO0E2_12C9
    db 80,141,126,232,22,87,191,34,90,14,87,154,111,10,37,8
    call pO0E2_2039
    db 255,118,250,255,118,248,176,11,80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,116,22,176,11,80,141,126,248,22,87,255,118,254,255,118,252,176,0,80
    call pO0E2_00BD
    db 254,70,246,233,171,254
  end;
end;

{ 5BC7 }
procedure pO0BB_5BC7;
var
  v4l: longint;
  v4p: pointer absolute v4l;
begin
  if false then begin
    if LV = 'begins to dance wildly' then;
    LP1('begins to dance wildly');
  end;
  asm
  db 161,59,173,139,22,61,173,137,70,252,137,86,254
  end;
  asm
  db 255,118,254,255,118,252
  call pO0EC_0EBF
  end;
  asm
  db 176,11,80,141,126,252,22,87
  call pO0E2_04DD
  end;
  if pO0E2_11C2(p9CEE, v4l, PR498_byte(v4p)^.v) <> 0 then
  begin
    asm
  db 255,118,254,255,118,252,176,27,80,176,121,80
  push cs
  call near ptr pO0BB_0E1D
  db 80,176,121,80,176,1,80
  call pO0EC_2D90
  db 80,176,0,80,176,0,80,176,0,80,191,140,39,30,87
  call pO0E2_2039
    end;
    {@5C42-5C7C}
    pO0E2_2039(v4l, 118, pO0BB_0E1D(121), pO0EC_2D90(121, 1), 0, 0, 0, 'begins to dance wildly');
  end;
end;

{ 5C8B }
procedure pO0BB_5C8B;
var loc: array[1..22] of byte;
begin
  if false then begin
    if LV = 'is blinded' then;
  end;
  asm
    db 198,6,220,167,1,198,70,246,1,198,70,245,0,138,70,246,58,6,58,173,119,82,128,126,245,100,119,76
    db 138,70,246,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,248,137,86,250,196,126,248
    db 38,128,189,178,0,100,119,35,138,70,245,48,228,139,208,196,126,248,38,138,133,178,0,48,228,3,194,61
    db 100,0,127,11,196,126,248,38,138,133,178,0,0,70,245,254,70,246,235,165,176,1,80,176,4,80
    call pO0E2_1374
    db 48,228,64,136,70,247,128,126,245,51,115,13,138,70,247,48,228,186,10,0,247,226,136,70,247,198,70,246
    db 1,198,70,245,0,138,70,246,58,6,58,173,118,3,233,136,0,128,126,245,100,118,3,233,127,0,138,70
    db 246,48,228,139,248,209,231,209,231,139,133,55,173,139,149,57,173,137,70,248,137,86,250,196,126,248,38,128
    db 189,178,0,100,119,85,138,70,245,48,228,139,208,196,126,248,38,138,133,178,0,48,228,3,194,61,100,0
    db 127,61,196,126,248,38,138,133,178,0,0,70,245,255,118,250,255,118,248,176,33,80,160,213,167,80
    push cs
    call near ptr pO0BB_0E1D
    db 80,176,0,80,176,0,80,176,0,80,176,0,80,141,126,234,22,87,191,128,92,14,87,154,111,10,37,8
    call pO0E2_2039
    db 254,70,246,233,108,255
  end;
end;

{ 5EB8 }
procedure pO0BB_5EB8;
var
  v4p: pointer;
  v5sb: shortint;
  v6sb: shortint;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v16w: word;
  v17b: byte;
  v16b: byte absolute v16w;
  v10sb: shortint absolute v10b;
  v9sb: shortint absolute v9b;
  v8sb: shortint absolute v8b;
  v7sb: shortint absolute v7b;
  v6b: byte absolute v6sb;
  v5b: byte absolute v5sb;
  v4l: longint absolute v4p;
  { 5DBD }
  function pO0BB_5DBD(b0: byte; b1: byte): byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@5DC3-5DCC}
    v16w := 255;
    case b0 of
      1: begin
        {@5DD3-5DF2}
        v9b := v5sb + a0C65_ff2a[b1];
        {@5DF2-5E11}
        v10b := v6sb + a0C69_ff2a[b1];
      end;
      2: v9b := v5b;
      3: begin
        {@5E2B-5E4A}
        v9b := v5sb + a0C65_ff2a[b1];
        {@5E4A-5E58}
        v10b := v6b;
      end;
      4: v9b := v5b;
    end;
    {@5E6C-5E9F}
    pO0BB_5DBD := pO130_03EC(v7b, v8b, @v9b, @v10b, @v16b);
    {@5E9F-5EAF}
    v16w := v16w shr 1;
  end;

begin
  {@5EBE-5EC3}
  bA7DC := 1;
  {@5EC3-5EC8}
  bA7D2 := 9;
  {@5EC8-5ED5}
  v4p := p9CEE;
  {@5ED5-5EE3}
  v7b := pO135_0CA2(v4l);
  {@5EE3-5EF1}
  v8b := pO135_0CCA(v4l);
  {@5EF1-5EF7}
  v5b := bAE5B;
  {@5EF7-5EFD}
  v6b := bAE5C;
  for v13b := 1 to 4 do
  begin
    {@5F06-5F14}
    XR670_046E(@bAD3B, 288);
    {@5F14-5F18}
    v14b := 1;
    {@5F18-5F37}
    repeat
      {@5F18-5F28}
      v17b := pO0BB_5DBD(v14b, v13b);
      {@5F28-5F2B}
      Inc(v14b);
    until (v14b > 4) or (v17b <> 0);
    {@5F37-5F59}
    while pO130_0549(v7b, v8b, bAE5B, bAE5C, v11b) = 0 do
      Inc(v11b);
    {@5F59-5F5E}
    bAEF0 := 1;
    {@5F5E-5F73}
    pO135_0BAF(v4p, v11b, 1, 0);
    {@5F73-5F7B}
    pR1C3_2120(30);
    {@5F7B-5F87}
    pO0EC_3E76(v11b, 30);
    {@5F87-5FA6}
    pO0EC_1F07(v7sb, v8sb, v9sb, v10sb, 1, 30);
    {@5FA6-5FAC}
    bAE5B := v9b;
    {@5FAC-5FB2}
    bAE5C := v10b;
    {@5FB2-5FC1}
    pO0EC_3B46(1, 23, b3E00);
    {@5FC1-5FDC}
    pO0BB_1736(v7b, v8b, v9b, v10b, 1, v16b);
    {@5FDC-5FE2}
    v12b := bAD3A;
    {@5FE2-5FF9}
    pO130_08D7(v9b, v10b, 1, 255, 1);
    for v14b := 1 to bA6E4 do
    begin
      {@600E-6012}
      Inc(bAD3A);
      {@6012-6046}
      aAD37_b676[bAD3A] := aA583_b676[aA6E2_fd21[v14b].f];
    end;
    {@604E-611A}
    for v14b := 1 to bAD3A do
    begin
      {@6066-610F}
      if (aAD37_9f8b[v14b] <> nil) and (PR494_byte(aAD37_9f8b[v14b])^.v <> 0) then
      begin
        {@6095-610F}
        if v14b <= v12b then
          pO0E2_1D19(pointer(aAD37_9f8b[v14b]), pO0E2_13BF(10, 4), 0, 0)
        else
pO0E2_1D19(pointer(aAD37_9f8b[v14b]), pO0E2_13BF(10, 4), 2, pO0E2_12C9(pointer(aAD37_9f8b[v14b]),
              4, 0));
      end;
    end;
    {@611A-6168}
    if pO135_0805(v4l, 0) <> 0 then
    begin
      {@612C-614A}
      pO135_0BAF(v4p, PR8_byte(PR487_pointer(v4p)^.v)^.v, 1, 1);
      {@614A-6168}
      pO135_0BAF(v4p, PR8_byte(PR487_pointer(v4p)^.v)^.v, 0, 0);
    end;
  end;
end;

{ 617E }
procedure pO0BB_617E;
var
  v1b: byte;
begin
  if false then begin
    if LV = 'is slain' then;
  end;
  {@6184-6189}
  bA7DC := 1;
  {@6189-6193}
  if bAD3A <= 0 then
    Exit;
  {@6193-61F0}
  if (pAD3B <> nil) and (PR178_byte(pAD3B)^.v <= 60) and (PR178_byte(pAD3B)^.v > 10) then
  begin
    {@61B4-61BA}
    wA7D8 := 255;
    {@61BA-61C7}
    pO0E2_04DD(9, @bAD3B);
    if wA7D8 <> 0 then
      pO0E2_0000(pAD3B, 6, 'is slain');
    {@61ED-61F0}
    Exit;
  end;
  {@61F0-628F}
  for v1b := 1 to bAD3A do
  begin
    {@6208-6284}
    if (aAD37_9f8b[v1b] <> nil) and (PR178_byte(aAD37_9f8b[v1b])^.v <= 10) then
    begin
      {@6234-623A}
      wA7D8 := 255;
      {@623A-6253}
      pO0E2_04DD(9, @aAD37_0389[v1b]);
      if wA7D8 <> 0 then
        pO0E2_0000(pointer(aAD37_9f8b[v1b]), 6, 'is slain');
    end;
  end;
end;

{ 62B4 }
procedure pO0BB_62B4;
var loc: array[1..44] of byte;
begin
  if false then begin
    if LV = 'gates in' then;
    if LV = 'summons is not answered' then;
  end;
  asm
    db 161,242,156,139,22,244,156,137,70,243,137,86,245,161,242,156,139,22,244,156,137,70,247,137,86,249,198,70
    db 242,0,198,70,251,0,198,70,240,0,196,62,248,135,38,128,125,33,0,116,6,198,70,237,23,235,4,198
    db 70,237,69,139,70,243,11,70,245,116,32,196,126,243,38,128,189,237,1,9,116,21,196,126,243,38,139,133
    db 227,1,38,139,149,229,1,137,70,243,137,86,245,235,216,128,126,251,7,126,76,139,70,247,11,70,249,116
    db 26,196,126,247,38,139,133,227,1,38,11,133,229,1,116,11,196,126,247,38,128,189,237,1,9,117,19,161
    db 238,156,139,22,240,156,137,70,247,137,86,249,198,70,242,1,235,19,196,126,247,38,139,133,227,1,38,139
    db 149,229,1,137,70,247,137,86,249,198,70,251,0,139,70,243,11,70,245,116,6,128,126,240,2,117,7,198
    db 70,242,1,233,100,1,196,62,238,156,38,138,133,239,1,196,126,243,38,136,133,239,1,255,118,249,255,118
    db 247
    call pO135_0CA2
    db 136,70,255,255,118,249,255,118,247
    call pO135_0CCA
    db 136,70,254,198,70,241,0,138,70,251,152,139,248,138,133,172,62,152,139,208,138,70,255,152,3,194,136,70
    db 253,138,70,251,152,139,248,138,133,181,62,152,139,208,138,70,254,152,3,194,136,70,252,128,126,253,49,126
    db 3,233,239,0,128,126,253,0,125,3,233,230,0,128,126,252,24,126,3,233,221,0,128,126,252,0,125,3
    db 233,212,0,138,70,253,80,138,70,252,80,141,126,238,22,87,141,126,239,22,87
    call pO135_060F
    db 128,126,238,0,116,3,233,177,0,138,70,239,58,70,237,116,3,233,166,0,255,118,245,255,118,243
    call pO135_0D1A
    db 136,70,236,196,126,243,38,138,133,49,1,36,7,138,208,138,70,236,48,228,139,248,209,231,209,231,136,149
    db 244,158,138,86,253,138,70,236,48,228,139,248,209,231,209,231,136,149,241,158,138,86,252,138,70,236,48,228
    db 139,248,209,231,209,231,136,149,242,158,255,118,245,255,118,243,196,126,243,38,138,133,178,0,80,141,126,227
    db 22,87,191,147,98,14,87,154,111,10,37,8
    call pO0E2_21FC
    db 136,70,241,128,126,241,0,116,45,254,70,240,196,126,243,38,139,133,227,1,38,139,149,229,1,137,70,243
    db 137,86,245,139,70,243,11,70,245,116,11,196,126,243,38,128,189,237,1,9,116,4,198,70,242,1,254,70
    db 251,128,126,241,0,117,9,128,126,251,7,127,3,233,205,254,128,126,242,0,117,3,233,44,254,128,126,240
    db 0,117,34,255,54,240,156,255,54,238,156,141,126,212,22,87,191,156,98,14,87,154,111,10,37,8,176,10
    db 80,176,1,80
    call pO0EC_1B08
  end;
end;

{ 652D }
procedure pO0BB_652D(a0: pointer; a1: pointer; a2: word);
var loc: array[1..60] of byte;
begin
  if false then begin
    if LV = 'breathes poison' then;
  end;
  asm
    db 198,6,220,167,1,128,62,141,174,0,117,8,196,126,8,38,198,69,3,3,196,126,8,38,128,125,3,0
    db 119,3,233,182,1,196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 136,70,255,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 136,70,254,176,61,80,176,1,80,141,126,251,22,87,255,30,62,171,128,126,251,0,117,3,233,122,1,138
    db 70,255,80,138,70,254,80,160,91,174,80,160,92,174,80,176,255,80,176,3,80
    push cs
    call near ptr pO0BB_1736
    db 128,62,58,173,0,119,3,233,86,1,198,6,210,167,32,196,126,12,38,255,117,2,38,255,53,141,126,197
    db 22,87,191,29,101,14,87,154,111,10,37,8,176,10,80,176,1,80
    call pO0EC_1B08
    db 196,126,12,38,255,117,2,38,255,53,255,54,61,173,255,54,59,173
    call pO135_17F9
    db 136,70,213,196,126,12,38,255,117,2,38,255,53
    call pO0EC_0C95
    db 196,126,12,38,255,117,2,38,255,53,138,70,213,80,176,1,80,176,0,80
    call pO135_0BAF
    db 176,17,80
    call pR1C3_2120
    db 196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,255,54,61,173,255,54,59,173
    call pO135_0CA2
    db 152,80,255,54,61,173,255,54,59,173
    call pO135_0CCA
    db 152,80,176,1,80,176,30,80
    call pO0EC_1F07
    db 160,58,173,136,70,212,176,1,58,70,212,119,114,136,70,244,235,3,254,70,244,138,70,244,48,228,139,248
    db 209,231,209,231,139,133,55,173,11,133,57,173,116,77,138,70,244,48,228,139,248,209,231,209,231,139,133,55
    db 173,139,149,57,173,137,70,245,137,86,247,255,118,247,255,118,245,176,3,80,176,0,80
    call pO0E2_12C9
    db 136,70,250,255,118,247,255,118,245,196,126,12,38,196,61,38,138,133,178,0,48,228,80,176,2,80,138,70
    db 250,80
    call pO0E2_1D19
    db 138,70,244,58,70,212,117,147,196,126,8,38,254,77,3,196,126,12,38,255,117,2,38,255,53
    call pO0EC_2CF6
    db 136,70,249,198,6,220,167,0
  end;
end;

{ 6728 }
procedure pO0BB_6728(a0: pointer; a1: pointer; a2: word);
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'breathes lightning' then;
    LP1('breathes lightning');
  end;
  asm
  db 128,62,141,174,0,116,10,196,126,8,38,128,125,3,3,118,8,196,126,8,38,198,69,3,3
  end;
  asm
  db 196,126,8,38,128,125,3,0,119,3,233,1,1
  end;
  asm
  db 198,6,210,167,36
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 136,70,254
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 136,70,253
  end;
  asm
  db 176,51,80,176,1,80,191,108,177,30,87,255,30,62,171
  end;
  asm
  db 128,62,108,177,0,117,3,233,191,0
  end;
  {@6796-67BA}
  pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'breathes lightning', 10, 1);
  asm
  db 196,126,12,38,255,117,2,38,255,53,255,54,61,173,255,54,59,173
  call pO135_17F9
  db 136,70,252
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO0EC_0C95
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53,138,70,252,80,176,1,80,176,0,80
  call pO135_0BAF
  end;
  asm
  db 176,18,80
  call pR1C3_2120
  end;
  asm
  db 138,70,254,152,80,138,70,253,152,80,160,91,174,152,80,160,92,174,152,80,176,4,80,176,50,80
  call pO0EC_1F07
  end;
  asm
  db 184,9,0,80,196,126,12,38,196,61,38,138,133,178,0,48,228,80,176,0,80
  push cs
  call near ptr pO0BB_3783
  end;
  asm
  db 196,126,8,38,254,77,3
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO0EC_2CF6
  db 136,70,255
  end;
end;

{ 6874 }
procedure pO0BB_6874(a0: pointer; a1: pointer; a2: word);
var
  c32: record case byte of 0: (v32a: string[31]); 1: (_p1: array[1..28] of byte; v4b: byte) end;
  _f1: array[1..3] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'Fire' then;
    if LV = 'cold' then;
    if LV = 'acid' then;
    if LV = 'breathes ' then;
    with LPR^ do with LPR^ do LM3_7('Fire', 'breathes ', 'breathes ', [LB], [LB], [LB], [LB],
    [LB], [LB], [LB]);
  end;
  asm
  db 198,6,220,167,1
  end;
  if (bAE8D = 0) or (PR3_byte(a1)^.v > 3) then
    asm
  db 196,126,8,38,198,69,3,3
    end;
  {@6899-6B53}
  if PR3_byte(a1)^.v > 0 then
  begin
    asm
  db 196,126,12,38,196,61,38,138,133,178,0,48,228,137,70,222
    end;
    case PR0_byte(a1)^.v of
      84, 83: begin
        asm
  db 198,6,210,167,33
        end;
        asm
  db 198,70,246,3
        end;
        asm
  db 198,70,245,9
        end;
        asm
  db 191,91,104,14,87,141,126,224,22,87,184,20,0,80,154,137,10,37,8
        end;
        if PR0_byte(a1)^.v = 83 then
          asm
  db 176,24,80,176,10,80
  call pO0E2_13BF
  db 5,12,0,137,70,222
          end;
      end;
      85: begin
        asm
  db 198,6,210,167,34
        end;
        asm
  db 198,70,246,3
        end;
        asm
  db 198,70,245,7
        end;
        asm
  db 191,96,104,14,87,141,126,224,22,87,184,20,0,80,154,137,10,37,8
        end;
      end;
      96: begin
        asm
  db 198,6,210,167,32
        end;
        asm
  db 198,70,246,1
        end;
        asm
  db 198,70,245,6
        end;
        asm
  db 191,101,104,14,87,141,126,224,22,87,184,20,0,80,154,137,10,37,8
        end;
      end;
    end;
    asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 136,70,254
    end;
    asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 136,70,253
    end;
    asm
  db 176,23,80,176,1,80,191,108,177,30,87,255,30,62,171
    end;
    if bB16C <> 0 then
    begin
      asm
  db 138,70,254,80,138,70,253,80,160,91,174,80,160,92,174,80,138,70,246,80,138,70,245,80
  push cs
  call near ptr pO0BB_1736
      end;
      for c32.v4b := 1 to bAD3A do
        asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO0EC_29F3
  db 138,208,138,70,252,48,228,139,248,209,231,209,231,196,189,55,173,38,138,133,239,1,58,194,116,5,198,6
  db 108,177,0
        end;
      {@69EE-6B53}
      if (bAD3A > 0) and (bB16C <> 0) then
      begin
        {@6A02-6A31}
        pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'breathes ' + c32.v32a, 10, 1);
        asm
  db 196,126,12,38,255,117,2,38,255,53,255,54,61,173,255,54,59,173
  call pO135_17F9
  db 136,70,221
        end;
        asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO0EC_0C95
        end;
        asm
  db 196,126,12,38,255,117,2,38,255,53,138,70,221,80,176,1,80,176,0,80
  call pO135_0BAF
        end;
        asm
  db 176,17,80
  call pR1C3_2120
        end;
        asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 152,80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 152,80,255,54,61,173,255,54,59,173
  call pO135_0CA2
  db 152,80,255,54,61,173,255,54,59,173
  call pO135_0CCA
  db 152,80,176,1,80,176,30,80
  call pO0EC_1F07
        end;
        for c32.v4b := 1 to bAD3A do
          asm
  db 138,70,252,48,228,139,248,209,231,209,231,139,133,55,173,11,133,57,173,116,66,138,70,252,48,228,139,248
  db 209,231,209,231,139,133,55,173,139,149,57,173,137,70,248,137,86,250,255,118,250,255,118,248,176,3,80,176
  db 0,80
  call pO0E2_12C9
  db 136,70,247,255,118,250,255,118,248,255,118,222,176,2,80,138,70,247,80
  call pO0E2_1D19
          end;
        asm
  db 196,126,8,38,254,77,3
        end;
        asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO0EC_2CF6
  db 136,70,255
        end;
      end;
    end;
  end;
  asm
  db 198,6,220,167,0
  end;
end;

{ 6B64 }
procedure pO0BB_6B64(a0: pointer; a1: word; a2: word; a3: word);
var
  _f1: array[1..2] of byte;
begin
  if false then begin
    if LV = 'gazes' then;
    LP1('gazes');
  end;
  asm
  db 176,10,80,176,1,80,141,126,255,22,87,255,30,62,171
  end;
  asm
  db 128,126,255,0,117,3,233,174,0
  end;
  asm
  db 198,6,220,167,1
  end;
  asm
  db 198,6,210,167,16
  end;
  {@6B8C-6BB0}
  pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'gazes', 10, 1);
  asm
  db 196,126,12,38,255,117,2,38,255,53,255,54,61,173,255,54,59,173
  call pO135_17F9
  db 136,70,254
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53,138,70,254,80,176,1,80,176,0,80
  call pO135_0BAF
  end;
  asm
  db 176,17,80
  call pR1C3_2120
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 152,80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 152,80,160,91,174,152,80,160,92,174,152,80,176,4,80,176,50,80
  call pO0EC_1F07
  end;
  asm
  db 198,6,213,167,10
  end;
  asm
  db 255,30,102,171
  end;
  asm
  db 198,6,220,167,0
  end;
end;

{ 6C36 }
function pO0BB_6C36(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@6C3C-6C5E}
  if (a0 <> nil) and ((PR46_byte(a0)^.v = 39) or (PR46_byte(a0)^.v = 40)) then
  begin
    {@6C58-6C5C}
    pO0BB_6C36 := 1;
    {@6C5C-6C5E}
    Exit;
  end;
  {@6C5E-6C62}
  pO0BB_6C36 := 0;
end;

{ 6C6B }
procedure pO0BB_6C6B(a0: pointer; a1: pointer; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@6C71-6C77}
  v1b := a2;
  {@6C77-6C7B}
  v3b := 0;
  for v2b := 1 to 3 do
  begin
    {@6C84-6C9F}
    if (PRA59_byte(a1)^.a[v2b] and 127) = v1b then
      v3b := v2b;
  end;
  {@6CA5-6CAD}
  if v3b = 0 then
    Exit;
  {@6CAD-6CBC}
  PRA59_byte(a1)^.a[v3b] := 0;
  {@6CBC-6CC3}
  Dec(PR47_byte(a1)^.v);
  if PR47_byte(a1)^.v < 100 then
    pO0EC_18EF(pointer(a0), pointer(a1));
end;

{ 6CF9 }
procedure pO0BB_6CF9(a0: pointer; a1: S40; a2: byte);
var loc: array[1..257] of byte;
begin
  if false then begin
    if LV = 'Casts a Spell' then;
    if LV = 'Spell:' then;
  end;
  asm
    db 128,62,12,136,5,117,107,255,118,14,255,118,12,141,126,201,22,87,191,228,108,14,87,154,111,10,37,8
    db 176,10,80,176,1,80
    call pO0EC_1B08
    db 176,0,80,176,23,80,176,39,80,176,23,80
    call pR142_0217
    db 176,0,80,176,23,80,176,10,80,176,0,80,141,190,215,254,22,87,191,242,108,14,87,154,111,10,37,8
    db 138,70,6,48,228,186,35,0,247,226,139,248,129,199,205,83,30,87,154,252,10,37,8
    call pR47F_0354
    db 235,112,176,1,80,176,18,80,176,38,80,176,22,80
    call pR142_0217
    db 255,118,14,255,118,12,176,1,80,176,19,80,176,0,80
    call pO0EC_1C22
    db 196,126,12,38,138,5,48,228,64,64,80,176,19,80,176,10,80,176,0,80,141,126,215,22,87
    call pR47F_0354
    db 176,1,80,176,20,80,176,10,80,176,0,80,138,70,6,48,228,186,35,0,247,226,139,248,129,199,205,83
    db 30,87
    call pR47F_0354
    call pR47F_0D1A
    call pO0EC_1BEF
  end;
end;

{ 6DFB }
procedure pO0BB_6DFB;
begin
  {@6DFE-6E0B}
  pAB3E := Pointer(@pO0BB_10E6);
  {@6E0B-6E10}
  bA7DB := 0;
  {@6E10-6E15}
  bAE61 := 0;
  {@6E15-6E1A}
  bA7DD := 1;
  {@6E1A-6E27}
  pAB42 := Pointer(@pO0BB_1D6C);
  {@6E27-6E34}
  pAB46 := Pointer(@pO0BB_1D9F);
  {@6E34-6E41}
  pAB4A := Pointer(@pO0BB_1DD6);
  {@6E41-6E4E}
  pAB4E := Pointer(@pO0BB_1E12);
  {@6E4E-6E5B}
  pAB52 := Pointer(@pO0BB_1E55);
  {@6E5B-6E68}
  pAB56 := Pointer(@pO0BB_1E8F);
  {@6E68-6E75}
  pAB5A := Pointer(@pO0BB_1E8F);
  {@6E75-6E82}
  pAB5E := Pointer(@pO0BB_1ECE);
  {@6E82-6E8F}
  pAB62 := Pointer(@pO0BB_1EFC);
  {@6E8F-6E9C}
  pAB66 := Pointer(@pO0BB_1F4F);
  {@6E9C-6EA9}
  pAB6A := Pointer(@pO0BB_1E55);
  {@6EA9-6EB6}
  pAB6E := Pointer(@pO0BB_203F);
  {@6EB6-6EC3}
  pAB72 := Pointer(@pO0BB_219D);
  {@6EC3-6ED0}
  pAB76 := Pointer(@pO0BB_223D);
  {@6ED0-6EDD}
  pAB7A := Pointer(@pO0BB_2284);
  {@6EDD-6EEA}
  pAB7E := Pointer(@pO0BB_1E8F);
  {@6EEA-6EF7}
  pAB82 := Pointer(@pO0BB_1E8F);
  {@6EF7-6F04}
  pAB86 := Pointer(@pO0BB_1E55);
  {@6F04-6F11}
  pAB8A := Pointer(@pO0BB_22E9);
  {@6F11-6F1E}
  pAB8E := Pointer(@pO0BB_2317);
  {@6F1E-6F2B}
  pAB92 := Pointer(@pO0BB_236D);
  {@6F2B-6F38}
  pAB96 := Pointer(@pO0BB_1E55);
  {@6F38-6F45}
  pAB9A := Pointer(@pO0BB_24AC);
  {@6F45-6F52}
  pAB9E := Pointer(@pO0BB_250F);
  {@6F52-6F5F}
  pABA2 := Pointer(@pO0BB_2548);
  {@6F5F-6F6C}
  pABA6 := Pointer(@pO0BB_2581);
  {@6F6C-6F79}
  pABAA := Pointer(@pO0BB_2625);
  {@6F79-6F86}
  pABAE := Pointer(@pO0BB_270E);
  {@6F86-6F93}
  pABB2 := Pointer(@pO0BB_1E55);
  {@6F93-6FA0}
  pABB6 := Pointer(@pO0BB_275E);
  {@6FA0-6FAD}
  pABBA := Pointer(@pO0BB_2797);
  {@6FAD-6FBA}
  pABBE := Pointer(@pO0BB_27D2);
  {@6FBA-6FC7}
  pABC2 := Pointer(@pO0BB_2833);
  {@6FC7-6FD4}
  pABC6 := Pointer(@pO0BB_2860);
  {@6FD4-6FE1}
  pABCA := Pointer(@pO0BB_2B20);
  {@6FE1-6FEE}
  pABCE := Pointer(@pO0BB_2D20);
  {@6FEE-6FFB}
  pABD2 := Pointer(@pO0BB_2E8F);
  {@6FFB-7008}
  pABD6 := Pointer(@pO0BB_2ED5);
  {@7008-7015}
  pABDA := Pointer(@pO0BB_2F08);
  {@7015-7022}
  pABDE := Pointer(@pO0BB_2F48);
  {@7022-702F}
  pABE2 := Pointer(@pO0BB_3012);
  {@702F-703C}
  pABE6 := Pointer(@pO0BB_32C8);
  {@703C-7049}
  pABEA := Pointer(@pO0BB_3336);
  {@7049-7056}
  pABEE := Pointer(@pO0BB_3446);
  {@7056-7063}
  pABF2 := Pointer(@pO0BB_347F);
  {@7063-7070}
  pABF6 := Pointer(@pO0BB_3012);
  {@7070-707D}
  pABFA := Pointer(@pO0BB_34AD);
  {@707D-708A}
  pABFE := Pointer(@pO0BB_36EC);
  {@708A-7097}
  pAC02 := Pointer(@pO0BB_24AC);
  {@7097-70A4}
  pAC06 := Pointer(@pO0BB_275E);
  {@70A4-70B1}
  pAC0A := Pointer(@pO0BB_3A62);
  {@70B1-70BE}
  pAC0E := Pointer(@pO0BB_1E8F);
  {@70BE-70CB}
  pAC12 := Pointer(@pO0BB_1E8F);
  {@70CB-70D8}
  pAC16 := Pointer(@pO0BB_1E8F);
  {@70D8-70E5}
  pAC1A := Pointer(@pO0BB_3AA1);
  {@70E5-70F2}
  pAC1E := Pointer(@pO0BB_3AD0);
  {@70F2-70FF}
  pAC22 := Pointer(@pO0BB_3B7B);
  {@70FF-710C}
  pAC26 := Pointer(@pO0BB_3BBC);
  {@710C-7119}
  pAC2A := Pointer(@pO0BB_3C06);
  {@7119-7126}
  pAC2E := Pointer(@pO0BB_3C8B);
  {@7126-7133}
  pAC32 := Pointer(@pO0BB_3CB6);
  {@7133-7140}
  pAC36 := Pointer(@pO0BB_3CED);
  {@7140-714D}
  pAC3A := Pointer(@pO0BB_3D5E);
  {@714D-715A}
  pAC3E := Pointer(@pO0BB_34AD);
  {@715A-7167}
  pAC42 := Pointer(@pO0BB_3DEF);
  {@7167-7174}
  pAC46 := Pointer(@pO0BB_3E29);
  {@7174-7181}
  pAC4A := Pointer(@pO0BB_3E7D);
  {@7181-718E}
  pAC4E := Pointer(@pO0BB_3F73);
  {@718E-719B}
  pAC52 := Pointer(@pO0BB_1E8F);
  {@719B-71A8}
  pAC56 := Pointer(@pO0BB_3FFA);
  {@71A8-71B5}
  pAC5A := Pointer(@pO0BB_40A2);
  {@71B5-71C2}
  pAC5E := Pointer(@pO0BB_40E3);
  {@71C2-71CF}
  pAC62 := Pointer(@pO0BB_412A);
  {@71CF-71DC}
  pAC66 := Pointer(@pO0BB_418B);
  {@71DC-71E9}
  pAC6A := Pointer(@pO0BB_41D1);
  {@71E9-71F6}
  pAC6E := Pointer(@pO0BB_429B);
  {@71F6-7203}
  pAC72 := Pointer(@pO0BB_1E55);
  {@7203-7210}
  pAC76 := Pointer(@pO0BB_4365);
  {@7210-721D}
  pAC7A := Pointer(@pO0BB_442A);
  {@721D-722A}
  pAC7E := Pointer(@pO0BB_4457);
  {@722A-7237}
  pAC82 := Pointer(@pO0BB_448F);
  {@7237-7244}
  pAC86 := Pointer(@pO0BB_451E);
  {@7244-7251}
  pAC8A := Pointer(@pO0BB_45EC);
  {@7251-725E}
  pAC8E := Pointer(@pO0BB_4693);
  {@725E-726B}
  pAC92 := Pointer(@pO0BB_47DF);
  {@726B-7278}
  pAC96 := Pointer(@pO0BB_495E);
  {@7278-7285}
  pAC9A := Pointer(@pO0BB_4A71);
  {@7285-7292}
  pAC9E := Pointer(@pO0BB_4ABA);
  {@7292-729F}
  pACA2 := Pointer(@pO0BB_3336);
  {@729F-72AC}
  pACA6 := Pointer(@pO0BB_4AF4);
  {@72AC-72B9}
  pACAA := Pointer(@pO0BB_2860);
  {@72B9-72C6}
  pACAE := Pointer(@pO0BB_4B22);
  {@72C6-72D3}
  pACB2 := Pointer(@pO0BB_4BCE);
  {@72D3-72E0}
  pACB6 := Pointer(@pO0BB_24AC);
  {@72E0-72ED}
  pACBA := Pointer(@pO0BB_4CAC);
  {@72ED-72FA}
  pACBE := Pointer(@pO0BB_4CDE);
  {@72FA-7307}
  pACC2 := Pointer(@pO0BB_4DCB);
  {@7307-7314}
  pACC6 := Pointer(@pO0BB_4DF8);
  {@7314-7321}
  pACCA := Pointer(@pO0BB_4E3D);
  {@7321-732E}
  pACCE := Pointer(@pO0BB_4E8B);
  {@732E-733B}
  pACD2 := Pointer(@pO0BB_2860);
  {@733B-7348}
  pACD6 := Pointer(@pO0BB_4EB8);
  {@7348-7355}
  pACDA := Pointer(@pO0BB_50F8);
  {@7355-7362}
  pACDE := Pointer(@pO0BB_5142);
  {@7362-736F}
  pACE2 := Pointer(@pO0BB_51D1);
  {@736F-737C}
  pACE6 := Pointer(@pO0BB_2F08);
  {@737C-7389}
  pACEA := Pointer(@pO0BB_3E7D);
  {@7389-7396}
  pACEE := Pointer(@pO0BB_5272);
  {@7396-73A3}
  pACF2 := Pointer(@pO0BB_52B8);
  {@73A3-73B0}
  pACF6 := Pointer(@pO0BB_5382);
  {@73B0-73BD}
  pACFA := Pointer(@pO0BB_54D9);
  {@73BD-73CA}
  pACFE := Pointer(@pO0BB_55C0);
  {@73CA-73D7}
  pAD02 := Pointer(@pO0BB_560D);
  {@73D7-73E4}
  pAD06 := Pointer(@pO0BB_57B2);
  {@73E4-73F1}
  pAD0A := Pointer(@pO0BB_34AD);
  {@73F1-73FE}
  pAD0E := Pointer(@pO0BB_582B);
  {@73FE-740B}
  pAD12 := Pointer(@pO0BB_58E3);
  {@740B-7418}
  pAD16 := Pointer(@pO0BB_59AD);
  {@7418-7425}
  pAD1A := Pointer(@pO0BB_59E7);
  {@7425-7432}
  pAD1E := Pointer(@pO0BB_5A2D);
  {@7432-743F}
  pAD22 := Pointer(@pO0BB_5BC7);
  {@743F-744C}
  pAD26 := Pointer(@pO0BB_1E8F);
  {@744C-7459}
  pAD2A := Pointer(@pO0BB_5C8B);
  {@7459-7466}
  pAD2E := Pointer(@pO0BB_5EB8);
  {@7466-7473}
  pAD32 := Pointer(@pO0BB_617E);
  {@7473-7480}
  pAD36 := Pointer(@pO0BB_62B4);
  {@7480-748D}
  pA952 := Pointer(@pO0BB_6728);
  {@748D-749A}
  pA936 := Pointer(@pO0BB_6874);
  {@749A-74A7}
  pA932 := Pointer(@pO0BB_6874);
  {@74A7-74B4}
  pA93A := Pointer(@pO0BB_6874);
  {@74B4-74C1}
  pA94E := Pointer(@pO0BB_652D);
  {@74C1-74CE}
  pA966 := Pointer(@pO0BB_6874);
  {@74CE-74DB}
  pA9D6 := Pointer(@pO0BB_6B64);
end;

{ 74DD }
begin
end.

