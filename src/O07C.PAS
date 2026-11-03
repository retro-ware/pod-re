{ O07C: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O07C;

interface

uses GAMEDATA;

procedure pO07C_32F6;
procedure pO07C_00F5(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_0128(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_013E(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_017A(a0: pointer; a1: pointer; a2: word);
procedure pO07C_020F(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0230(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0244(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_027E(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_02B9(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_02F4(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_031B(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_03FF(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_0406(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0424(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_042B(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_04B3(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_04BA(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_04F1(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_051B(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0542(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_060D(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_068B(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0886(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_08B6(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0903(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_09E5(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_0A11(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_0AEA(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0BB2(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0BE1(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0C4A(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_0E16(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0E2D(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_0E5B(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_0ED5(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_0FEE(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1030(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_105C(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_10F1(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_119E(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_11C1(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_11E4(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_1237(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_126E(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_12A5(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_12AC(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_12F6(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_134E(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_152F(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_15AA(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_15B8(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_161F(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_1672(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_1760(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_178E(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_17F2(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_1841(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_18AD(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_19AA(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1A05(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1B4E(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1B7A(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_1B81(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_1BA0(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_1BBA(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1C1F(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_1C42(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1DA3(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_1DB6(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_1EC3(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_1F06(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_1F52(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_1FA3(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_1FBE(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2003(a0: word; a1: word; a2: pointer; a3: byte);
procedure pO07C_2054(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_206A(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_2078(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2100(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_212C(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_21AD(a0: word; a1: word; a2: word; a3: word; a4: byte);
procedure pO07C_21CC(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_2209(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_2827(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_284F(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_2877(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_2885(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_28EA(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_295C(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_297A(a0: pointer; a1: pointer; a2: byte);
procedure pO07C_2A92(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_2AF7(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2B2A(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2B79(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2C10(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2C72(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_2E7E(a0: pointer; a1: word; a2: word; a3: byte);
procedure pO07C_2EE2(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_30DF(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_30FE(a0: pointer; a1: pointer; a2: word);
procedure pO07C_319D(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_31BC(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_3221(a0: pointer; a1: word; a2: word; a3: word);
procedure pO07C_3240(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_326A(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_3278(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_328D(a0: word; a1: word; a2: word; a3: word; a4: word);
procedure pO07C_3294(a0: pointer; a1: pointer; a2: byte);

implementation

uses LIT, O0A1, O0AA, O0E2, O0EC, O102, O130, O135, R47F, R670;

type
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  R0_byte = record v: byte end;
  R0_pointer = record v: pointer end;
  R15_byte = record _p: array[1..15] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R175_byte = record _p: array[1..175] of byte; v: byte end;
  R176_word = record _p: array[1..176] of byte; v: word end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R359_byte = record _p: array[1..359] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R420_byte = record _p: array[1..420] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R427_longint = record _p: array[1..427] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R495_shortint = record _p: array[1..495] of byte; v: shortint end;
  R496_byte = record _p: array[1..496] of byte; v: byte end;
  R498_byte = record _p: array[1..498] of byte; v: byte end;
  R499_byte = record _p: array[1..499] of byte; v: byte end;
  R49_byte = record _p: array[1..49] of byte; v: byte end;
  R500_byte = record _p: array[1..500] of byte; v: byte end;
  R501_byte = record _p: array[1..501] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R50_shortint = record _p: array[1..50] of byte; v: shortint end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R9_longint = record _p: array[1..9] of byte; v: longint end;
  R9_pointer = record _p: array[1..9] of byte; v: pointer end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA351_byte = record _p: array[1..351] of byte; a: array[0..32000] of byte end;
  TPV_byte_byte_var = procedure(p0: byte; p1: byte; var p2);
  PR0_byte = ^R0_byte;
  PR0_pointer = ^R0_pointer;
  PR15_byte = ^R15_byte;
  PR173_byte = ^R173_byte;
  PR175_byte = ^R175_byte;
  PR176_word = ^R176_word;
  PR178_byte = ^R178_byte;
  PR19_byte = ^R19_byte;
  PR1_byte = ^R1_byte;
  PR21_byte = ^R21_byte;
  PR25_byte = ^R25_byte;
  PR2_byte = ^R2_byte;
  PR312_byte = ^R312_byte;
  PR327_byte = ^R327_byte;
  PR359_byte = ^R359_byte;
  PR370_longint = ^R370_longint;
  PR3_byte = ^R3_byte;
  PR420_byte = ^R420_byte;
  PR421_byte = ^R421_byte;
  PR422_byte = ^R422_byte;
  PR423_pointer = ^R423_pointer;
  PR427_longint = ^R427_longint;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR487_pointer = ^R487_pointer;
  PR495_byte = ^R495_byte;
  PR495_shortint = ^R495_shortint;
  PR496_byte = ^R496_byte;
  PR498_byte = ^R498_byte;
  PR499_byte = ^R499_byte;
  PR49_byte = ^R49_byte;
  PR500_byte = ^R500_byte;
  PR501_byte = ^R501_byte;
  PR508_byte = ^R508_byte;
  PR50_shortint = ^R50_shortint;
  PR52_byte = ^R52_byte;
  PR61_byte = ^R61_byte;
  PR9_longint = ^R9_longint;
  PR9_pointer = ^R9_pointer;
  PRA30_byte = ^RA30_byte;
  PRA337_byte = ^RA337_byte;
  PRA351_byte = ^RA351_byte;
var
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  a6528_3981: array[0..2046] of E16_byte absolute d6528;
  b880C: byte absolute d880C;
  b94D5: byte absolute d94D5;
  b9CFE: byte absolute d9CFE;
  bA7D0: byte absolute dA7D0;
  bA7D1: byte absolute dA7D1;
  bA7D2: byte absolute dA7D2;
  bA7D3: byte absolute dA7D3;
  bA7D4: byte absolute dA7D4;
  bA7D5: byte absolute dA7D5;
  bA7D6: byte absolute dA7D6;
  bA7DA: byte absolute dA7DA;
  bA7DB: byte absolute dA7DB;
  bA7DC: byte absolute dA7DC;
  bA7DE: byte absolute dA7DE;
  bA7E1: byte absolute dA7E1;
  bA7E6: byte absolute dA7E6;
  bA7E7: byte absolute dA7E7;
  bA7E9: byte absolute dA7E9;
  bAE80: byte absolute dAE80;
  bAE8D: byte absolute dAE8D;
  bAED7: byte absolute dAED7;
  gAB3E_dd92: TPV_byte_byte_var absolute dAB3E;
  iA7D8: integer absolute dA7D8;
  lA7E2: longint absolute dA7E2;
  p9CEE: pointer absolute d9CEE;
  pA7E2: pointer absolute dA7E2;
  pA7EA: pointer absolute dA7EA;
  pA7EE: pointer absolute dA7EE;
  pA7F2: pointer absolute dA7F2;
  pA7F6: pointer absolute dA7F6;
  pA7FA: pointer absolute dA7FA;
  pA7FE: pointer absolute dA7FE;
  pA802: pointer absolute dA802;
  pA806: pointer absolute dA806;
  pA80A: pointer absolute dA80A;
  pA80E: pointer absolute dA80E;
  pA812: pointer absolute dA812;
  pA816: pointer absolute dA816;
  pA81A: pointer absolute dA81A;
  pA81E: pointer absolute dA81E;
  pA822: pointer absolute dA822;
  pA826: pointer absolute dA826;
  pA82A: pointer absolute dA82A;
  pA82E: pointer absolute dA82E;
  pA832: pointer absolute dA832;
  pA836: pointer absolute dA836;
  pA83A: pointer absolute dA83A;
  pA83E: pointer absolute dA83E;
  pA842: pointer absolute dA842;
  pA846: pointer absolute dA846;
  pA84A: pointer absolute dA84A;
  pA84E: pointer absolute dA84E;
  pA852: pointer absolute dA852;
  pA856: pointer absolute dA856;
  pA85A: pointer absolute dA85A;
  pA85E: pointer absolute dA85E;
  pA862: pointer absolute dA862;
  pA866: pointer absolute dA866;
  pA86A: pointer absolute dA86A;
  pA86E: pointer absolute dA86E;
  pA872: pointer absolute dA872;
  pA876: pointer absolute dA876;
  pA87A: pointer absolute dA87A;
  pA87E: pointer absolute dA87E;
  pA882: pointer absolute dA882;
  pA886: pointer absolute dA886;
  pA88A: pointer absolute dA88A;
  pA88E: pointer absolute dA88E;
  pA892: pointer absolute dA892;
  pA896: pointer absolute dA896;
  pA89A: pointer absolute dA89A;
  pA89E: pointer absolute dA89E;
  pA8A2: pointer absolute dA8A2;
  pA8A6: pointer absolute dA8A6;
  pA8AA: pointer absolute dA8AA;
  pA8AE: pointer absolute dA8AE;
  pA8B2: pointer absolute dA8B2;
  pA8B6: pointer absolute dA8B6;
  pA8BA: pointer absolute dA8BA;
  pA8BE: pointer absolute dA8BE;
  pA8C2: pointer absolute dA8C2;
  pA8C6: pointer absolute dA8C6;
  pA8CA: pointer absolute dA8CA;
  pA8CE: pointer absolute dA8CE;
  pA8D2: pointer absolute dA8D2;
  pA8D6: pointer absolute dA8D6;
  pA8DA: pointer absolute dA8DA;
  pA8DE: pointer absolute dA8DE;
  pA8E2: pointer absolute dA8E2;
  pA8E6: pointer absolute dA8E6;
  pA8EA: pointer absolute dA8EA;
  pA8EE: pointer absolute dA8EE;
  pA8F2: pointer absolute dA8F2;
  pA8F6: pointer absolute dA8F6;
  pA8FA: pointer absolute dA8FA;
  pA8FE: pointer absolute dA8FE;
  pA902: pointer absolute dA902;
  pA906: pointer absolute dA906;
  pA90A: pointer absolute dA90A;
  pA90E: pointer absolute dA90E;
  pA912: pointer absolute dA912;
  pA916: pointer absolute dA916;
  pA91A: pointer absolute dA91A;
  pA91E: pointer absolute dA91E;
  pA922: pointer absolute dA922;
  pA926: pointer absolute dA926;
  pA92A: pointer absolute dA92A;
  pA92E: pointer absolute dA92E;
  pA93E: pointer absolute dA93E;
  pA942: pointer absolute dA942;
  pA946: pointer absolute dA946;
  pA94A: pointer absolute dA94A;
  pA956: pointer absolute dA956;
  pA95A: pointer absolute dA95A;
  pA95E: pointer absolute dA95E;
  pA962: pointer absolute dA962;
  pA96A: pointer absolute dA96A;
  pA96E: pointer absolute dA96E;
  pA972: pointer absolute dA972;
  pA976: pointer absolute dA976;
  pA97A: pointer absolute dA97A;
  pA97E: pointer absolute dA97E;
  pA982: pointer absolute dA982;
  pA986: pointer absolute dA986;
  pA98A: pointer absolute dA98A;
  pA98E: pointer absolute dA98E;
  pA992: pointer absolute dA992;
  pA996: pointer absolute dA996;
  pA99A: pointer absolute dA99A;
  pA99E: pointer absolute dA99E;
  pA9A2: pointer absolute dA9A2;
  pA9A6: pointer absolute dA9A6;
  pA9AA: pointer absolute dA9AA;
  pA9AE: pointer absolute dA9AE;
  pA9B2: pointer absolute dA9B2;
  pA9B6: pointer absolute dA9B6;
  pA9BA: pointer absolute dA9BA;
  pA9BE: pointer absolute dA9BE;
  pA9C2: pointer absolute dA9C2;
  pA9C6: pointer absolute dA9C6;
  pA9CA: pointer absolute dA9CA;
  pA9CE: pointer absolute dA9CE;
  pA9D2: pointer absolute dA9D2;
  pA9DA: pointer absolute dA9DA;
  pA9DE: pointer absolute dA9DE;
  pA9E2: pointer absolute dA9E2;
  pAD3B: pointer absolute dAD3B;
  s3393: string absolute d3393;
  s3450: string absolute d3450;
  s3465: string absolute d3465;
  s348F: string absolute d348F;
  s34B9: string absolute d34B9;
  s34E3: string absolute d34E3;
  s3C99: string absolute d3C99;
  s4025: string absolute d4025;
  s403B: string absolute d403B;
  s407C: string absolute d407C;
  s437F: string absolute d437F;
  s469D: string absolute d469D;
  s488B: string absolute d488B;
  s5127: string absolute d5127;
  wA7D8: word absolute dA7D8;

procedure pO07C_0014(a0: pointer; a1: word; a2: byte); far; forward;
procedure pO07C_0081(a0: byte); far; forward;
function pO07C_00A0(a0: pointer; a1: byte; a2: byte; a3: word): byte; far; forward;
procedure pO07C_00DD(a0: byte); far; forward;
procedure pO07C_0113(a0: word; a1: word; a2: longint; a3: byte); far; forward;
procedure pO07C_0F0C(a0: pointer; a1: byte); far; forward;
function pO07C_0F85(a0: pointer): pointer; far; forward;
procedure pO07C_1536(a0: byte); far; forward;
procedure pO07C_16AB(a0: pointer; a1: byte); far; forward;
procedure pO07C_24F9(a0: pointer; a1: byte); far; forward;

{ 0014 }
procedure pO07C_0014(a0: pointer; a1: word; a2: byte);
var
  v1b: byte;
begin
  if false then begin
    if LV = 'paralyzed by poison' then;
  end;
  {@001A-0034}
  pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
  {@0034-004B}
  v1b := pO0E2_12C9(pA7E2, 0, a2);
  {@004B-007B}
  pO0E2_2039(lA7E2, 52, 10, 12, 0, 1, v1b, 'paralyzed by poison');
end;

{ 0081 }
procedure pO07C_0081(a0: byte);
begin
  {@0084-009C}
  if (a0 = 0) or (bA7D1 = a0) then
  begin
    {@0092-0097}
    wA7D8 := 0;
    {@0097-009C}
    bA7D1 := 0;
  end;
end;

{ 00A0 }
function pO07C_00A0(a0: pointer; a1: byte; a2: byte; a3: word): byte;
var
  _f1: array[1..1] of byte;
begin
  {@00A6-00B3}
  if bA7DB <> 0 then
  begin
    {@00AD-00B1}
    pO07C_00A0 := 0;
    {@00B1-00B3}
    Exit;
  end;
  {@00B3-00B7}
  pO07C_00A0 := 1;
  {@00B7-00D4}
  pO0E2_13E5(pointer(PR0_pointer(a0)^.v), a1, a3, a2, 1);
end;

{ 00DD }
procedure pO07C_00DD(a0: byte);
begin
  {@00E0-00F1}
  if (bA7D2 and a0) <> 0 then
    pO07C_0081(0);
end;

{ 00F5 }
procedure pO07C_00F5(a0: pointer; a1: word; a2: word; a3: word);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@00FB-010D}
  v1b := pO0EC_2CF6(pointer(PR0_pointer(a0)^.v));
end;

{ 0113 }
procedure pO07C_0113(a0: word; a1: word; a2: longint; a3: byte);
begin
  {@0116-0124}
  if a3 = 0 then
  begin
    {@011C-0120}
    Inc(bA7D0);
    {@0120-0124}
    Inc(bA7DE);
  end;
end;

{ 0128 }
procedure pO07C_0128(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@012B-013A}
  if a4 = 0 then
  begin
    {@0131-0136}
    Inc(bA7E1, 5);
    {@0136-013A}
    Inc(bA7DE);
  end;
end;

{ 013E }
procedure pO07C_013E(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0141-015E}
  if a4 = 0 then
  begin
    {@0147-015A}
    if bA7E1 < 5 then
      bA7E1 := 0
    else
      Dec(bA7E1, 5);
    {@015A-015E}
    Dec(bA7DE);
  end;
end;

{ 017A }
procedure pO07C_017A(a0: pointer; a1: pointer; a2: word);
var
  v1b: byte;
  v2b: byte;
begin
  if false then begin
    if LV = 'is fighting with snakes' then;
  end;
  {@0180-01A1}
  v1b := PR500_byte(PR0_pointer(a0)^.v)^.v + PR501_byte(PR0_pointer(a0)^.v)^.v;
  if PR3_byte(a1)^.v > v1b then
    Dec(PR3_byte(a1)^.v, v1b)
  else
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), 3, nil);
  {@01D1-01F2}
  pO0EC_2601(pointer(PR0_pointer(a0)^.v), 1, 'is fighting with snakes');
  {@01F2-01F7}
  pO0EC_1BEF;
  {@01F7-0209}
  v2b := pO0EC_2CF6(pointer(PR0_pointer(a0)^.v));
end;

{ 020F }
procedure pO07C_020F(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0212-022C}
  if (a4 = 0) and ((PR420_byte(p9CEE)^.v and 1) <> 0) then
    Dec(bA7DE, 7);
end;

{ 0230 }
procedure pO07C_0230(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0233-0240}
  if a4 = 0 then
    pO07C_00DD(4);
end;

{ 0244 }
procedure pO07C_0244(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0247-027A}
  if a3 = 0 then
  begin
    {@024D-0267}
    pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if (PR421_byte(pA7E2)^.v and 4) <> 0 then
      Inc(bA7DE);
  end;
end;

{ 027E }
procedure pO07C_027E(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0281-02B5}
if (a4 = 0) and ((PR359_byte(p9CEE)^.v = 2) or (PR359_byte(p9CEE)^.v = 5)
      or (PR359_byte(p9CEE)^.v = 8)) then
  begin
    {@02AB-02B0}
    Inc(bA7D0, 2);
    {@02B0-02B5}
    Dec(bA7DE, 2);
  end;
end;

{ 02B9 }
procedure pO07C_02B9(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@02BC-02F0}
if (a4 = 0) and ((PR359_byte(p9CEE)^.v = 0) or (PR359_byte(p9CEE)^.v = 3)
      or (PR359_byte(p9CEE)^.v = 6)) then
  begin
    {@02E6-02EB}
    Inc(bA7D0, 2);
    {@02EB-02F0}
    Dec(bA7DE, 2);
  end;
end;

{ 02F4 }
procedure pO07C_02F4(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@02F7-0317}
  if (a4 = 0) and ((bA7D2 and 2) <> 0) then
  begin
    asm
  db 161,216,167,153,185,2,0,247,249,163,216,167
    end;
    {@0312-0317}
    Inc(bA7D0, 3);
  end;
end;

{ 031B }
procedure pO07C_031B(a0: pointer; a1: pointer; a2: byte);
begin
  {@031E-0367}
  if a2 <> 0 then
  begin
    {@0324-033E}
    PR495_byte(PR0_pointer(a0)^.v)^.v := PR3_byte(a1)^.v and 64 div 64;
    if PR327_byte(PR0_pointer(a0)^.v)^.v = 179 then
    begin
      {@034C-0358}
      PR327_byte(PR0_pointer(a0)^.v)^.v := 0;
      {@0358-0364}
      PR496_byte(PR0_pointer(a0)^.v)^.v := 0;
    end;
    {@0364-0367}
    Exit;
  end;
  {@0367-03F6}
  if (PR3_byte(a1)^.v and 32) = 0 then
  begin
    {@0377-039E}
    PR3_byte(a1)^.v := PR3_byte(a1)^.v + 32 + PR495_shortint(PR0_pointer(a0)^.v)^.v * 64;
    {@039E-03B6}
    PR495_byte(PR0_pointer(a0)^.v)^.v := PR3_byte(a1)^.v div 128;
    {@03B6-03C2}
    PR496_byte(PR0_pointer(a0)^.v)^.v := 1;
    if PR327_byte(PR0_pointer(a0)^.v)^.v <= 127 then
      PR327_byte(PR0_pointer(a0)^.v)^.v := 179;
    {@03DC-03F1}
    PR9_longint(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
    {@03F1-03F6}
    pO0EC_2A17;
  end;
  {@03F6-03FB}
  bA7E1 := 100;
end;

{ 03FF }
procedure pO07C_03FF(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 0406 }
procedure pO07C_0406(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0409-0420}
  if a4 = 0 then
  begin
    {@040F-041C}
    if (bA7D2 and 8) = 0 then
      Inc(bA7D0);
    {@041C-0420}
    Dec(bA7DE);
  end;
end;

{ 0424 }
procedure pO07C_0424(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 042B }
procedure pO07C_042B(a0: pointer; a1: pointer; a2: byte);
begin
  {@042E-04AF}
if (a2 = 0) and (pO07C_00A0(@PR0_byte(a0)^.v, 26, PR3_byte(a1)^.v, 10) <> 0)
      and (PR508_byte(PR0_pointer(a0)^.v)^.v > 1) then
  begin
    {@045E-0463}
    bA7D2 := 0;
    {@0463-047C}
    pO0E2_1D19(pointer(PR0_pointer(a0)^.v), 1, 0, 0);
    if b880C <> 5 then
      pO0EC_0987(pointer(PR0_pointer(a0)^.v), Ord(PR0_pointer(a0)^.v = p9CEE));
  end;
end;

{ 04B3 }
procedure pO07C_04B3(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 04BA }
procedure pO07C_04BA(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@04BD-04ED}
  if a3 = 0 then
  begin
    {@04C3-04DD}
    if PR498_byte(PR0_pointer(a0)^.v)^.v < 57 then
      PR498_byte(PR0_pointer(a0)^.v)^.v := 57;
    {@04DD-04E1}
    Inc(bA7D0);
    if bA7D5 = 15 then
      wA7D8 := 0;
  end;
end;

{ 04F1 }
procedure pO07C_04F1(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@04F4-0517}
  if (a4 = 0) and (pO0E2_1374(1, 100) <= 30) then
  begin
    {@0509-0510}
    pO07C_0081(11);
    {@0510-0517}
    pO07C_0081(53);
  end;
end;

{ 051B }
procedure pO07C_051B(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@051E-053E}
  if (a4 = 0) and ((bA7D2 and 1) <> 0) then
  begin
    asm
  db 161,216,167,153,185,2,0,247,249,163,216,167
    end;
    {@0539-053E}
    Inc(bA7D0, 3);
  end;
end;

{ 0542 }
procedure pO07C_0542(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0549-0552}
  if a3 <> 0 then
    Exit;
  {@0552-0593}
  if PR2_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v <> 0 then
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), s4025 + s437F, 10, 1);
  {@0593-05C2}
  if PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v > 0 then
    pO0EC_186D(pointer(PR0_pointer(a0)^.v), PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v);
  {@05C2-05D1}
  PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@05D1-05E1}
  PR2_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@05E1-05F1}
  PR1_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
end;

{ 060D }
procedure pO07C_060D(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..3] of byte;
  v4b: byte;
begin
  if false then begin
    if LV = 'collapses from poison' then;
  end;
  {@0613-0677}
  if a3 = 0 then
  begin
    {@0619-0655}
    if pO0EC_27C1(pointer(PR0_pointer(a0)^.v), 55, @v4b) <> 0 then
      pO0E2_0000(pointer(PR0_pointer(a0)^.v), 4, 'collapses from poison');
    {@0655-065A}
    bA7DB := 1;
    {@065A-0672}
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), 15, nil);
    {@0672-0677}
    bA7DB := 0;
  end;
end;

{ 068B }
procedure pO07C_068B(a0: pointer; a1: word; a2: word; a3: byte);
var
  v4p: pointer;
  v5b: byte;
  v9p: pointer;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'Gains an item' then;
    for a3 := a3 to a3 do LM1_0('Gains an item');
  end;
  {@0691-06A7}
  v4p := PR423_pointer(PR0_pointer(a0)^.v)^.v;
  {@06A7-06AB}
  v5b := 0;
  {@06AB-06E6}
  while (v4p <> nil) and (v5b = 0) do
  begin
    {@06B9-06E4}
    if (PR46_byte(v4p)^.v = 6) and (PR49_byte(v4p)^.v = 121) then
      v5b := 1
    else
      v4p := PR42_pointer(v4p)^.v;
  end;
  {@06E6-0709}
  if (a3 <> 0) and (v4p <> nil) then
    pO0EC_18EF(pointer(PR0_pointer(a0)^.v), v4p);
  {@0709-0871}
  if (a3 = 0) and (v5b = 0) and (PR422_byte(PR0_pointer(a0)^.v)^.v < 16) then
  begin
    {@072C-073B}
    GetMem(v4p, 63);
    asm
  db 196,126,252,6,87,184,63,0,80
  call XR670_046E
  db 196,126,252,38,198,69,46,6,196,126,252,38,198,69,48,6,196,126,252,38,198,69,49,121,196,126,252,38
  db 198,69,50,1,196,126,252,38,198,69,61,23,196,126,252,38,198,69,62,128,196,126,12,38,255,117,2,38
  db 255,53,255,118,254,255,118,252
  call pO0EC_19DE
  db 255,118,254,255,118,252,184,63,0,80,154,84,2,37,8,196,126,12,38,196,61,38,139,133,167,1,38,139
  db 149,169,1,137,70,252,137,86,254,198,70,251,0
    end;
    {@07B7-07F5}
    while (v4p <> nil) and (v5b = 0) do
    begin
      {@07C5-07E2}
      v5b := Ord((PR49_byte(v4p)^.v = 121) and (PR46_byte(v4p)^.v = 6));
      {@07E2-07F3}
      v4p := PR42_pointer(v4p)^.v;
    end;
    {@07F5-0802}
    v9p := p9CEE;
    {@0802-0813}
    p9CEE := PR0_pointer(a0)^.v;
    if (v4p <> nil) and (PR427_longint(PR0_pointer(a0)^.v)^.v = 0) then
    begin
      {@082D-0838}
      pO0AA_1845(v4p);
      {@0838-0840}
      PR52_byte(v4p)^.v := 1;
    end;
    asm
  db 139,70,247,139,86,249,163,238,156,137,22,240,156
    end;
    {@084D-0871}
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'Gains an item', 10, 1);
  end;
  {@0871-0880}
  pO0EC_0EBF(pointer(PR0_pointer(a0)^.v));
end;

{ 0886 }
procedure pO07C_0886(a0: word; a1: word; a2: word; a3: word; a4: byte);
var
  _f1: array[1..3] of byte;
  v4b: byte;
begin
  {@088C-08B0}
  if (a4 = 0) and (pO0EC_27C1(p9CEE, 24, @v4b) = 0) then
    Dec(bA7DE, 4);
end;

{ 08B6 }
procedure pO07C_08B6(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..2] of byte;
begin
  {@08BC-08EF}
  if a3 = 0 then
  begin
    {@08C2-08DC}
    pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if (PR420_byte(pA7E2)^.v and 128) <> 0 then
      Inc(bA7DE);
  end;
end;

{ 0903 }
procedure pO07C_0903(a0: pointer; a1: pointer; a2: byte);
var
  v1b: byte;
begin
  if false then begin
    if LV = 'lost an image' then;
  end;
  {@0909-09DF}
if (a2 = 0) and (b880C = 5) and (pO0E2_1374(1, PR3_byte(a1)^.v div 32 + 1) > 1) and ((bA7DC = 0)
      or (bA7D5 > 0) and (a6528_3981[bA7D5].f = 0)) then
  begin
    {@0960-0967}
    pO07C_0081(0);
    {@0967-098B}
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'lost an image', 10, 1);
    {@098B-099C}
    v1b := PR3_byte(a1)^.v shr 5;
    {@099C-099F}
    Dec(v1b);
    if v1b = 0 then
    begin
      {@09A5-09BD}
      pO0E2_0104(pointer(PR0_pointer(a0)^.v), 28, nil);
      {@09BD-09BF}
      Exit;
    end;
    {@09BF-09CC}
    v1b := v1b shl 5;
    {@09CC-09DF}
    PR3_byte(a1)^.v := PR3_byte(a1)^.v and 31 or v1b;
  end;
end;

{ 09E5 }
procedure pO07C_09E5(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  asm
  db 128,126,6,0,117,19,161,216,167,153,185,4,0,247,249,139,208,161,216,167,43,194,163,216,167
  end;
end;

{ 0A11 }
procedure pO07C_0A11(a0: pointer; a1: word; a2: word; a3: word);
var
  _f1: array[1..12] of byte;
begin
  if false then begin
    if LV = 'is coughing' then;
  end;
  {@0A17-0A21}
  if b880C <> 5 then
    Exit;
  asm
  db 196,126,12,38,196,61,38,196,189,231,1,38,128,125,2,0,116,36,196,126,12,38,255,117,2,38,255,53
  db 141,126,244,22,87,191,5,10,14,87,154,111,10,37,8,176,10,80,176,1,80
  call pO0EC_1B08
  end;
  {@0A57-0A67}
  PR2_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@0A67-0A77}
  PR1_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@0A77-0A86}
  pO0EC_0EBF(pointer(PR0_pointer(a0)^.v));
  {@0A86-0A92}
  Dec(PR498_byte(PR0_pointer(a0)^.v)^.v, 2);
  {@0A92-0A9E}
  Dec(PR499_byte(PR0_pointer(a0)^.v)^.v, 2);
  if PR0_pointer(a0)^.v = p9CEE then
    pO0EC_0C95(pointer(PR0_pointer(a0)^.v));
end;

{ 0AEA }
procedure pO07C_0AEA(a0: pointer; a1: word; a2: word; a3: byte);
begin
  if false then begin
    if LV = 'is dispelled' then;
    if LV = 'resists dispel evil' then;
  end;
  {@0AF0-0AF9}
  if a3 <> 0 then
    Exit;
  {@0AF9-0B13}
  pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
  if ((PR420_byte(pA7E2)^.v and 1) <> 0) and (pO0E2_12C9(pA7E2, 4, 0) = 0) then
  begin
    {@0B39-0B58}
    pO0E2_0000(pA7E2, 8, 'is dispelled');
    {@0B58-0B70}
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), 4, nil);
    {@0B70-0B88}
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), 32, nil);
    asm
  db 235,34
    end;
  end;
  {@0B8A-0BAC}
  pO0EC_1B08(pA7E2, 'resists dispel evil', 10, 1);
end;

{ 0BB2 }
procedure pO07C_0BB2(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0BB5-0BDD}
  if a3 = 0 then
  begin
    {@0BBB-0BC0}
    Dec(bA7DE, 4);
    {@0BC0-0BCC}
    Dec(PR498_byte(PR0_pointer(a0)^.v)^.v, 4);
    {@0BCC-0BD8}
    Dec(PR499_byte(PR0_pointer(a0)^.v)^.v, 4);
    {@0BD8-0BDD}
    Dec(bA7D0, 4);
  end;
end;

{ 0BE1 }
procedure pO07C_0BE1(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0BE4-0C18}
  if a3 = 0 then
  begin
    asm
  db 176,43,80,196,126,12,6,87,255,118,10,255,118,8,138,70,6,80
  call pO0E2_00BD
    end;
    asm
  db 176,44,80,196,126,12,6,87,255,118,10,255,118,8,138,70,6,80
  call pO0E2_00BD
    end;
  end;
end;

{ 0C4A }
procedure pO07C_0C4A(a0: pointer; a1: word; a2: word; a3: word);
var
  _f1: array[1..1] of byte;
  v2b: byte;
  _f2: array[1..14] of byte;
begin
  if false then begin
    if LV = 'runs away' then;
    if LV = 'is confused' then;
    if LV = 'goes berserk' then;
    if LV = 'is enraged' then;
  end;
  asm
  db 128,126,6,0,116,3,233,183,1
  end;
  asm
  db 176,1,80,176,100,80
  call pO0E2_1374
  db 136,70,255,138,70,255,60,1,115,3,233,158,0,60,10,118,3,233,151,0,196,126,12,38,255,117,2,38
  db 255,53,176,35,80,49,192,49,210,82,80
  call pO0E2_0104
  db 196,126,12,38,196,61,38,196,189,231,1,38,198,69,15,1,196,126,12,38,196,61,38,198,133,240,1,1
  db 196,126,12,38,196,61,38,128,189,71,1,127,119,12,196,126,12,38,196,61,38,198,133,71,1,179,196,126
  db 12,38,196,61,38,196,189,231,1,49,192,38,137,69,9,38,137,69,11,196,126,12,38,255,117,2,38,255
  db 53,176,111,80,184,10,0,80,176,0,80,176,1,80,176,1,80,176,0,80,141,126,244,22,87,191,28,12
  db 14,87,154,111,10,37,8
  call pO0E2_2039
  db 233,203,0,60,11,114,63,60,60,119,59,196,126,12,38,255,117,2,38,255,53,176,1,80,141,126,242,22
  db 87,191,38,12,14,87,154,111,10,37,8
  call pO0EC_2601
  call pO0EC_1BEF
  db 196,126,12,6,87,255,118,10,255,118,8,176,0,80
  push cs
  call near ptr pO07C_00F5
  db 233,136,0,60,61,114,86,60,80,119,82,196,126,12,38,255,117,2,38,255,53,176,77,80,184,1,0,80
  db 196,126,12,38,196,61,38,138,133,239,1,80,176,1,80,176,1,80,176,0,80,141,126,241,22,87,191,50
  db 12,14,87,154,111,10,37,8
  call pO0E2_2039
  db 176,77,80,196,126,12,6,87,49,192,49,210,82,80,176,0,80
  call pO0E2_00BD
  db 235,46,60,81,114,42,60,100,119,38,196,126,12,38,255,117,2,38,255,53,176,1,80,141,126,243,22,87
  db 191,63,12,14,87,154,111,10,37,8
  call pO0EC_2601
  call pO0EC_1BEF
  end;
  {@0DDA-0DF2}
  v2b := pO0E2_12C9(pointer(PR0_pointer(a0)^.v), 4, -2);
  if v2b <> 0 then
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), 35, nil);
end;

{ 0E16 }
procedure pO07C_0E16(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0E19-0E29}
  if a4 = 0 then
  begin
    {@0E1F-0E24}
    Dec(bA7DE, 4);
    {@0E24-0E29}
    Dec(bA7D0, 4);
  end;
end;

{ 0E2D }
procedure pO07C_0E2D(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0E30-0E52}
  if (a3 = 0) and (PR3_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v = 0) then
  begin
    {@0E48-0E4D}
    bA7DA := 1;
    {@0E4D-0E52}
    bA7DE := 255;
  end;
end;

{ 0E5B }
procedure pO07C_0E5B(a0: pointer; a1: pointer; a2: byte);
begin
  if false then begin
    if LV = 'ages' then;
  end;
  {@0E61-0ECF}
  if a2 = 0 then
  begin
    {@0E67-0EBB}
    if (PR3_byte(a1)^.v and 32) = 0 then
    begin
      asm
  db 196,126,8,38,138,69,3,48,228,5,32,0,196,126,8,38,136,69,3
      end;
      {@0E87-0EAB}
      pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'ages', 10, 1);
      {@0EAB-0EB6}
      Inc(PR176_word(PR0_pointer(a0)^.v)^.v);
      {@0EB6-0EBB}
      b9CFE := 1;
    end;
    {@0EBB-0EC5}
    bA7D4 := bA7D4 * 2;
    {@0EC5-0ECF}
    bA7D3 := bA7D3 * 2;
  end;
end;

{ 0ED5 }
procedure pO07C_0ED5(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@0ED8-0EFE}
  if (a4 = 0) and (bA7D5 <> 0) and (a651B_3981[bA7D5].f < 8) then
    pO07C_0081(0);
end;

{ 0F0C }
procedure pO07C_0F0C(a0: pointer; a1: byte);
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'Avoids it' then;
  end;
  {@0F12-0F7F}
  if PR427_longint(p9CEE)^.v <> 0 then
  begin
    asm
  db 255,54,240,156,255,54,238,156,196,126,8,38,255,117,2,38,255,53
  call pO0EC_2C22
  db 60,1,118,66
    end;
    asm
  db 176,1,80,176,100,80
  call pO0E2_1374
  db 58,70,6,119,50,196,126,8,38,255,117,2,38,255,53,141,126,246,22,87,191,2,15,14,87,154,111,10
  db 37,8,176,10,80,176,1,80
  call pO0EC_1B08
  db 49,192,163,216,167,198,6,222,167,255,254,14,223,167
    end;
  end;
end;

{ 0F85 }
function pO07C_0F85(a0: pointer): pointer;
var
  v8l: longint;
  v9b: byte;
  _f1: array[1..1] of byte;
  v8b: byte absolute v8l;
begin
  {@0F8B-0F93}
  v8l := 0;
  if PR427_longint(a0)^.v <> 0 then
  begin
    {@0FA2-0FB5}
    v9b := pO0EC_330E(pointer(a0), @v8b);
    if (v9b = 0) or (v8l = 0) then
      v8l := PR427_longint(a0)^.v;
  end;
  asm
  db 139,70,248,139,86,250,137,70,252,137,86,254
  end;
end;

{ 0FEE }
procedure pO07C_0FEE(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@0FF1-0FF9}
  if a3 <> 0 then
    Exit;
  {@0FF9-102C}
  if pO07C_0F85(p9CEE) <> nil then
  begin
    asm
  db 255,54,240,156,255,54,238,156
  push cs
  call near ptr pO07C_0F85
  db 137,199,142,194,38,128,125,50,0,117,12
    end;
    {@1020-102C}
    pO07C_0F0C(@PR0_byte(a0)^.v, 100);
  end;
end;

{ 1030 }
procedure pO07C_1030(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1033-103B}
  if a4 <> 0 then
    Exit;
  {@103B-1045}
  bA7D4 := bA7D4 shr 1;
  {@1045-104F}
  bA7D3 := bA7D3 shr 1;
end;

{ 105C }
procedure pO07C_105C(a0: pointer; a1: pointer; a2: byte);
var
  _f1: array[1..260] of byte;
begin
  if false then begin
    if LV = 'weakened' then;
  end;
  {@1063-10EB}
  if (a2 = 0) and (pO07C_00A0(@PR0_byte(a0)^.v, 43, PR3_byte(a1)^.v, 60) <> 0) then
  begin
    asm
  db 196,126,12,38,196,61,38,128,125,17,3,118,59,196,126,12,38,255,117,2,38,255,53,141,190,252,254,22
  db 87,191,37,64,30,87,154,111,10,37,8,191,83,16,14,87,154,252,10,37,8,176,10,80,176,1,80
  call pO0EC_1B08
  db 196,126,12,38,196,61,38,254,77,17,235,27
    end;
    {@10D0-10EB}
    pO0E2_13E5(pointer(PR0_pointer(a0)^.v), 31, 0, 255, 0);
  end;
end;

{ 10F1 }
procedure pO07C_10F1(a0: pointer; a1: pointer; a2: byte);
var
  _f1: array[1..4] of byte;
begin
  {@10F7-1198}
  if (a2 = 0) and (pO07C_00A0(@PR0_byte(a0)^.v, 44, PR3_byte(a1)^.v, 10) <> 0) then
  begin
    {@111C-117D}
    if PR508_byte(PR0_pointer(a0)^.v)^.v > 1 then
    begin
      {@112A-112F}
      bA7D2 := 0;
      {@112F-1148}
      pO0E2_1D19(pointer(PR0_pointer(a0)^.v), 1, 0, 0);
      if b880C <> 5 then
        pO0EC_0987(pointer(PR0_pointer(a0)^.v), Ord(PR0_pointer(a0)^.v = p9CEE));
      {@117B-117D}
      Exit;
    end;
    {@117D-1198}
    pO0E2_13E5(pointer(PR0_pointer(a0)^.v), 31, 0, 255, 0);
  end;
end;

{ 119E }
procedure pO07C_119E(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@11A1-11A9}
  if a4 <> 0 then
    Exit;
  {@11A9-11BD}
  if (PR420_byte(p9CEE)^.v and 4) <> 0 then
    Dec(bA7DE, 4);
end;

{ 11C1 }
procedure pO07C_11C1(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@11C4-11CC}
  if a4 <> 0 then
    Exit;
  {@11CC-11E0}
  if (PR420_byte(p9CEE)^.v and 32) <> 0 then
    Dec(bA7DE, 4);
end;

{ 11E4 }
procedure pO07C_11E4(a0: pointer; a1: pointer; a2: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@11EA-11F2}
  if a2 <> 0 then
    Exit;
  {@11F2-1204}
  v1b := PR3_byte(a1)^.v and 128 div 128;
  if PR495_byte(PR0_pointer(a0)^.v)^.v = v1b then
    asm
  db 196,126,12,6,87,255,118,10,255,118,8,138,70,6,80
  push cs
  call near ptr pO07C_0113
  db 235,8
    end;
  {@1229-122D}
  Dec(bA7DE);
  {@122D-1231}
  Dec(bA7D0);
end;

{ 1237 }
procedure pO07C_1237(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@123A-1242}
  if a4 <> 0 then
    Exit;
  {@1242-1252}
  if (bA7D2 and 2) <> 0 then
  begin
    {@124B-1250}
    Inc(bA7D0, 2);
    {@1250-1252}
    Exit;
  end;
  {@1252-126A}
  if ((bA7D2 and 1) <> 0) and (bA7E7 = 0) then
    wA7D8 := wA7D8 * 2;
end;

{ 126E }
procedure pO07C_126E(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1271-1279}
  if a4 <> 0 then
    Exit;
  {@1279-1289}
  if (bA7D2 and 1) <> 0 then
  begin
    {@1282-1287}
    Inc(bA7D0, 2);
    {@1287-1289}
    Exit;
  end;
  {@1289-12A1}
  if ((bA7D2 and 2) <> 0) and (b94D5 = 0) then
    wA7D8 := wA7D8 * 2;
end;

{ 12A5 }
procedure pO07C_12A5(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 12AC }
procedure pO07C_12AC(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@12AF-12D6}
  if a3 <> 0 then
  begin
    {@12B5-12D4}
    if b880C = 5 then
      pO0E2_0104(pointer(PR0_pointer(a0)^.v), 25, nil);
    {@12D4-12D6}
    Exit;
  end;
  {@12D6-12F2}
  pO0E2_13E5(pointer(PR0_pointer(a0)^.v), 25, 1, 12, 0);
end;

{ 12F6 }
procedure pO07C_12F6(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@12F9-1301}
  if a4 <> 0 then
    Exit;
  {@1301-1321}
  if (bA7D5 > 0) and (a651B_3981[bA7D5].f <= 4) then
    pO07C_0081(0);
end;

{ 134E }
procedure pO07C_134E(a0: pointer; a1: word; a2: word; a3: word);
var loc: array[1..28] of byte;
begin
  if false then begin
    if LV = 'gazes...' then;
    if LV = 'reflects it!' then;
    if LV = 'is turned to stone' then;
  end;
  asm
    db 128,126,6,0,116,3,233,204,1,176,61,80,176,1,80,191,108,177,30,87,255,30,62,171,196,126,12,38
    db 255,117,2,38,255,53
    call pO0EC_29F3
    db 196,62,59,173,38,58,133,239,1,116,5,198,6,108,177,0,128,62,108,177,0,117,3,233,148,1,161,59
    db 173,139,22,61,173,163,226,167,137,22,228,167,196,126,12,38,255,117,2,38,255,53,141,126,238,22,87,191
    db 37,19,14,87,154,111,10,37,8,176,10,80,176,0,80
    call pO0EC_1B08
    db 176,18,80
    call pO0EC_1E6D
    db 196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CA2
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CCA
    db 152,80,176,4,80,176,45,80
    call pO0EC_1F07
    db 196,126,12,38,255,117,2,38,255,53,176,59,80,141,126,247,22,87
    call pO0EC_27C1
    db 8,192,117,3,233,162,0,198,70,251,0,255,54,228,167,255,54,226,167,176,72,80,141,126,247,22,87
    call pO0EC_27C1
    db 8,192,117,3,233,130,0,255,54,228,167,255,54,226,167,141,126,234,22,87,191,46,19,14,87,154,111,10
    db 37,8,176,12,80,176,0,80
    call pO0EC_1B08
    db 255,54,228,167,255,54,226,167
    call pO135_0CA2
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CCA
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,176,4,80,176,45,80
    call pO0EC_1F07
    db 198,70,251,1,196,126,12,38,139,5,38,139,85,2,163,226,167,137,22,228,167,255,54,228,167,255,54,226
    db 167,176,1,80,176,0,80
    call pO0E2_12C9
    db 8,192,117,56,255,54,228,167,255,54,226,167,176,126,80,141,126,247,22,87
    call pO0EC_27C1
    db 8,192,117,31,255,54,228,167,255,54,226,167,176,7,80,141,126,228,22,87,191,59,19,14,87,154,111,10
    db 37,8
    call pO0E2_0000
  end;
end;

{ 152F }
procedure pO07C_152F(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 1536 }
procedure pO07C_1536(a0: byte);
var
  v1b: byte;
  v5p: pointer;
  _f1: array[1..1] of byte;
begin
  {@153C-154E}
  v5p := pO07C_0F85(p9CEE);
  if v5p <> nil then
  begin
    {@1556-156E}
    if PR50_shortint(v5p)^.v < a0 then
      wA7D8 := 0;
    {@156E-1570}
    Exit;
  end;
  {@1570-159F}
  if PR173_byte(p9CEE)^.v = 6 then
  begin
    {@157C-158A}
    v1b := (a0 - 1) * 2 + 5;
    if v1b > PR312_byte(p9CEE)^.v then
      wA7D8 := 0;
    {@159D-159F}
    Exit;
  end;
  {@159F-15A4}
  wA7D8 := 0;
end;

{ 15AA }
procedure pO07C_15AA(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@15AD-15B4}
  pO07C_1536(3);
end;

{ 15B8 }
procedure pO07C_15B8(a0: word; a1: word; a2: word; a3: word; a4: byte);
var
  v1b: byte;
begin
  {@15BE-15C6}
  if a4 <> 0 then
    Exit;
  {@15C6-1619}
  if (bA7D2 and 1) <> 0 then
  begin
    {@15CF-1604}
    for v1b := 1 to bA7D6 do
    begin
      {@15E4-15E9}
      Dec(wA7D8, 2);
      if bA7D6 > iA7D8 then
        wA7D8 := bA7D6;
    end;
    {@1604-1609}
    Inc(bA7D0, 4);
    if (bA7D2 and 8) = 0 then
      pO07C_0081(0);
  end;
end;

{ 161F }
procedure pO07C_161F(a0: pointer; a1: pointer; a2: byte);
begin
  {@1622-162A}
  if a2 <> 0 then
    Exit;
  {@162A-166E}
if (pO07C_00A0(@PR0_byte(a0)^.v, 62, PR3_byte(a1)^.v, 60) <> 0)
      and (pO0E2_212C(pointer(PR0_pointer(a0)^.v), 1, 1) <> 0) then
    pO0EC_296E(pointer(PR0_pointer(a0)^.v));
end;

{ 1672 }
procedure pO07C_1672(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1675-167D}
  if a4 <> 0 then
    Exit;
  {@167D-169D}
  if (bA7D5 > 0) and (a651B_3981[bA7D5].f <= 3) then
    pO07C_0081(0);
end;

{ 16AB }
procedure pO07C_16AB(a0: pointer; a1: byte);
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v5b: byte;
begin
  if false then begin
    if LV = 'is killed' then;
  end;
  {@16B2-16CC}
  pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
  {@16CC-16E3}
  v5b := pO0E2_12C9(pA7E2, 0, a1);
  {@16E3-171D}
  pO0E2_2039(lA7E2, 55, 0, 255, 0, 1, v5b, s4025 + s488B);
  {@171D-1722}
  pR47F_0D1A;
  if pO0EC_27C1(pA7E2, 55, @v4b) <> 0 then
    pO0E2_0000(pA7E2, 6, 'is killed');
end;

{ 1760 }
procedure pO07C_1760(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@1763-176B}
  if a3 <> 0 then
    Exit;
  {@176B-1777}
  pO07C_16AB(@PR0_byte(a0)^.v, 0);
end;

{ 178E }
procedure pO07C_178E(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LV = 'is turned to stone' then;
  end;
  {@1794-179C}
  if a3 <> 0 then
    Exit;
  {@179C-17B6}
  pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
  if pO0E2_12C9(pA7E2, 1, 0) = 0 then
    pO0E2_0000(pA7E2, 7, 'is turned to stone');
end;

{ 17F2 }
procedure pO07C_17F2(a0: word; a1: word; a2: word; a3: word; a4: word);
var loc: array[1..4] of byte;
begin
  asm
    db 255,54,240,156,255,54,238,156
    push cs
    call near ptr pO07C_0F85
    db 137,70,252,137,86,254,139,70,252,11,70,254,116,41,196,126,252,38,138,69,46,48,228,139,248,177,4,211
    db 231,128,189,221,148,1,176,0,119,1,64,8,192,116,12,161,216,167,153,185,2,0,247,249,163,216,167
  end;
end;

{ 1841 }
procedure pO07C_1841(a0: word; a1: word; a2: word; a3: word; a4: word);
var loc: array[1..4] of byte;
begin
  asm
    db 255,54,240,156,255,54,238,156
    push cs
    call near ptr pO07C_0F85
    db 137,70,252,137,86,254,139,70,252,11,70,254,116,41,196,126,252,38,138,69,46,48,228,139,248,177,4,211
    db 231,128,189,221,148,127,176,0,118,1,64,8,192,116,12,161,216,167,153,185,2,0,247,249,163,216,167
  end;
end;

{ 18AD }
procedure pO07C_18AD(a0: pointer; a1: word; a2: word; a3: byte);
var
  v1b: byte;
begin
  if false then begin
    if LV = 'loses intellect' then;
    if LV = 'lost a spell' then;
  end;
  {@18B3-18BC}
  if a3 <> 0 then
    Exit;
  {@18BC-18C7}
  PR19_byte(PR0_pointer(a0)^.v)^.v := 3;
  {@18C7-18D2}
  PR21_byte(PR0_pointer(a0)^.v)^.v := 3;
  {@18D2-18F6}
  pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'loses intellect', 10, 1);
  if b880C = 5 then
  begin
    {@18FD-190D}
    PR1_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
    if PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v > 0 then
    begin
      {@191E-1942}
      pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'lost a spell', 12, 1);
      {@1942-1960}
      pO0EC_186D(pointer(PR0_pointer(a0)^.v), PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v);
      {@1960-196F}
      PR0_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
    end;
  end;
  {@196F-19A4}
  for v1b := 1 to 140 do
  begin
    {@1978-199E}
    if PRA30_byte(PR0_pointer(a0)^.v)^.a[v1b] > 127 then
      PRA30_byte(PR0_pointer(a0)^.v)^.a[v1b] := 0;
  end;
end;

{ 19AA }
procedure pO07C_19AA(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..3] of byte;
  v4b: byte;
begin
  {@19B0-19E7}
if (a3 = 0) and ((PR420_byte(PR0_pointer(a0)^.v)^.v and 69) <> 0)
      and (pO0EC_27C1(pointer(PR0_pointer(a0)^.v), 24, @v4b) = 0) then
    Dec(bA7DE, 4);
end;

{ 1A05 }
procedure pO07C_1A05(a0: pointer; a1: word; a2: word; a3: byte);
var
  v1b: byte;
  _f1: array[1..3] of byte;
  v5b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'gazes...' then;
    if LV = 'stares blankly' then;
    LM1_0('stares blankly');
  end;
  {@1A0B-1A14}
  if a3 <> 0 then
    Exit;
  {@1A14-1A23}
  gAB3E_dd92(68, 1, v1b);
  {@1A23-1A31}
  pA7E2 := pAD3B;
  asm
  db 128,126,255,0,117,3,233,14,1
  end;
  asm
  db 196,126,12,38,255,117,2,38,255,53,255,54,228,167,255,54,226,167
  call pO0EC_2C22
  db 60,2,114,3,233,240,0
  end;
  asm
  db 198,6,210,167,16
  end;
  {@1A5D-1A81}
  pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'gazes...', 10, 0);
  {@1A81-1A89}
  pO0EC_1E6D(18);
  asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 152,80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 152,80,255,54,228,167,255,54,226,167
  call pO135_0CA2
  db 152,80,255,54,228,167,255,54,226,167
  call pO135_0CCA
  db 152,80,176,4,80,176,45,80
  call pO0EC_1F07
  db 255,54,228,167,255,54,226,167,176,4,80,176,0,80
  call pO0E2_12C9
  db 8,192,117,93
  end;
  {@1AEB-1B48}
  if pO0EC_27C1(pA7E2, 126, @v5b) = 0 then
pO0E2_2039(lA7E2, 35, pO0E2_1374(1, 10) + 2, PR495_byte(PR0_pointer(a0)^.v)^.v, 1, 1, 0,
        'stares blankly');
end;

{ 1B4E }
procedure pO07C_1B4E(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..2] of byte;
begin
  {@1B54-1B5C}
  if a3 <> 0 then
    Exit;
  {@1B5C-1B68}
  Dec(PR498_byte(PR0_pointer(a0)^.v)^.v, 2);
  {@1B68-1B74}
  Dec(PR499_byte(PR0_pointer(a0)^.v)^.v, 2);
end;

{ 1B7A }
procedure pO07C_1B7A(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 1B81 }
procedure pO07C_1B81(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1B84-1B8C}
  if a4 <> 0 then
    Exit;
  {@1B8C-1B9C}
  if (bA7D2 and 32) > 0 then
    pO07C_0081(0);
end;

{ 1BA0 }
procedure pO07C_1BA0(a0: word; a1: word; a2: word; a3: word; a4: byte);
var
  v2w: word;
  _f1: array[1..4] of byte;
begin
  {@1BA6-1BB4}
  if a4 = 0 then
    v2w := v2w * 2;
end;

{ 1BBA }
procedure pO07C_1BBA(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@1BBD-1BC5}
  if a3 <> 0 then
    Exit;
  {@1BC5-1BDF}
  pA7E2 := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
  if (PR421_byte(pA7E2)^.v and 1) <> 0 then
  begin
    {@1BEE-1C17}
    wA7D8 := LongInt(pO0E2_13BF(6, 6)) + LongInt(pO0EC_1712(pointer(PR0_pointer(a0)^.v)));
    {@1C17-1C1B}
    Inc(bA7DE);
  end;
end;

{ 1C1F }
procedure pO07C_1C1F(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1C22-1C2A}
  if a4 <> 0 then
    Exit;
  {@1C2A-1C31}
  pO07C_0081(34);
end;

{ 1C42 }
procedure pO07C_1C42(a0: pointer; a1: word; a2: word; a3: byte);
var
  _f1: array[1..14] of byte;
begin
  if false then begin
    if LV = 'goes berserk' then;
  end;
  {@1C48-1D6B}
  if a3 = 0 then
  begin
    asm
  db 196,126,12,38,196,61,38,198,133,240,1,1
    end;
    if (PR327_byte(PR0_pointer(a0)^.v)^.v <= 127) or (PR327_byte(PR0_pointer(a0)^.v)^.v = 179) then
      PR327_byte(PR0_pointer(a0)^.v)^.v := 179
    else
      PR327_byte(PR0_pointer(a0)^.v)^.v := 178;
    asm
  db 128,62,12,136,5,116,3,233,204,0,196,126,12,38,196,61,38,196,189,231,1,49,192,38,137,69,9,38
  db 137,69,11,196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 80,184,255,0,80,176,255,80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CF2
  db 80
  call pO130_08D7
db 160,232,166,48,228,139,248,209,231,209,231,139,133,131,165,139,149,133,165,196,126,12,38,196,61,38,196,189
  db 231,1,38,137,69,9,38,137,85,11,196,126,12,38,196,61,38,196,189,231,1,38,198,69,1,0,196,126
  db 12,38,196,61,38,196,189,231,1,38,196,125,9,38,138,133,239,1,52,1,196,126,12,38,196,61,38,136
  db 133,239,1,196,126,12,38,255,117,2,38,255,53,141,126,243,22,87,191,53,28,14,87,154,111,10,37,8
  db 176,10,80,176,1,80
  call pO0EC_1B08
    end;
    {@1D69-1D6B}
    Exit;
  end;
  {@1D6B-1D91}
  if PR327_byte(PR0_pointer(a0)^.v)^.v = 179 then
  begin
    {@1D79-1D85}
    PR327_byte(PR0_pointer(a0)^.v)^.v := 0;
    {@1D85-1D91}
    PR496_byte(PR0_pointer(a0)^.v)^.v := 0;
  end;
  {@1D91-1D9D}
  PR495_byte(PR0_pointer(a0)^.v)^.v := 0;
end;

{ 1DA3 }
procedure pO07C_1DA3(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@1DA6-1DAE}
  if a4 <> 0 then
    Exit;
  {@1DAE-1DB2}
  Inc(bA7D0);
end;

{ 1DB6 }
procedure pO07C_1DB6(a0: pointer; a1: word; a2: word; a3: word);
var
  _f1: array[1..4] of byte;
  v6w: word;
  v6b: byte absolute v6w;
begin
  {@1DBD-1E59}
  if ((bA7D2 and 1) <> 0) and ((bA7D2 and 8) <> 0) then
  begin
    {@1DD5-1E04}
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), s4025 + s403B, 10, 1);
    {@1E04-1E18}
    v6w := PR508_byte(PR0_pointer(a0)^.v)^.v + wA7D8;
    if PR178_byte(PR0_pointer(a0)^.v)^.v < v6w then
      PR508_byte(PR0_pointer(a0)^.v)^.v := PR178_byte(PR0_pointer(a0)^.v)^.v
    else
      PR508_byte(PR0_pointer(a0)^.v)^.v := v6b;
    {@1E50-1E57}
    pO07C_0081(0);
    {@1E57-1E59}
    Exit;
  end;
  {@1E59-1EB6}
  if (bA7D2 and 4) <> 0 then
  begin
    {@1E62-1E7E}
    pO0E2_13E5(pointer(PR0_pointer(a0)^.v), 42, 3, 255, 0);
    {@1E7E-1EAD}
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), s4025 + s469D, 10, 1);
    {@1EAD-1EB4}
    pO07C_0081(0);
    {@1EB4-1EB6}
    Exit;
  end;
  {@1EB6-1EBD}
  pO07C_0081(0);
end;

{ 1EC3 }
procedure pO07C_1EC3(a0: word; a1: word; a2: word; a3: word; a4: word);
var loc: array[1..4] of byte;
begin
  asm
    db 255,54,240,156,255,54,238,156
    push cs
    call near ptr pO07C_0F85
    db 137,70,252,137,86,254,139,70,252,11,70,254,116,29,196,126,252,38,128,125,50,3,176,0,125,1,64,8
    db 192,116,12,161,216,167,153,185,2,0,247,249,163,216,167
  end;
end;

{ 1F06 }
procedure pO07C_1F06(a0: word; a1: word; a2: word; a3: word; a4: word);
var loc: array[1..4] of byte;
begin
  asm
    db 255,54,240,156,255,54,238,156
    push cs
    call near ptr pO07C_0F85
    db 137,70,252,137,86,254,139,70,252,11,70,254,116,29,196,126,252,38,128,125,50,4,176,0,125,1,64,8
    db 192,116,12,161,216,167,153,185,2,0,247,249,163,216,167
  end;
end;

{ 1F52 }
procedure pO07C_1F52(a0: pointer; a1: word; a2: word; a3: word);
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is slain' then;
  end;
  {@1F58-1F6A}
  v4p := pO07C_0F85(p9CEE);
  if (v4p <> nil) and (PR46_byte(v4p)^.v = 74) then
    pO0E2_0000(pointer(PR0_pointer(a0)^.v), 6, 'is slain');
end;

{ 1FA3 }
procedure pO07C_1FA3(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@1FA6-1FAE}
  if a3 <> 0 then
    Exit;
  {@1FAE-1FBA}
  pO07C_16AB(@PR0_byte(a0)^.v, 254);
end;

{ 1FBE }
procedure pO07C_1FBE(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@1FC1-1FC9}
  if a3 <> 0 then
    Exit;
  asm
  db 196,126,12,38,255,117,2,38,255,53,196,126,12,38,196,61,38,196,189,231,1,38,255,117,11,38,255,117
  db 9
  call pO0EC_2C22
  db 60,2,115,16
  end;
  {@1FEF-1FFF}
  pO07C_0014(@PR0_byte(a0)^.v, 100, 0);
end;

{ 2003 }
procedure pO07C_2003(a0: word; a1: word; a2: pointer; a3: byte);
begin
  {@2006-200E}
  if a3 <> 0 then
    Exit;
  {@200E-202E}
  if (bAE8D = 0) and (bA7DE = 0) then
  begin
    {@201C-202C}
    PR3_byte(a2)^.v := PR3_byte(a2)^.v and 15;
    {@202C-202E}
    Exit;
  end;
  {@202E-2050}
  if (PR3_byte(a2)^.v and 16) = 0 then
  begin
    {@203B-2040}
    bA7DE := 255;
    {@2040-2050}
    PR3_byte(a2)^.v := PR3_byte(a2)^.v or 16;
  end;
end;

{ 2054 }
procedure pO07C_2054(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@2057-205F}
  if a4 <> 0 then
    Exit;
  {@205F-2066}
  pO07C_0081(111);
end;

{ 206A }
procedure pO07C_206A(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@206D-2074}
  pO07C_00DD(1);
end;

{ 2078 }
procedure pO07C_2078(a0: pointer; a1: word; a2: word; a3: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@207E-2086}
  if a3 <> 0 then
    Exit;
  {@2086-20FA}
  if (bA7E6 = 4) or (bA7E6 = 2) or (bA7E6 = 0) then
  begin
    {@209B-20E9}
    case PR25_byte(PR0_pointer(a0)^.v)^.v of
      4..6: v1b := 1;
      7..10: v1b := 2;
      11..13: v1b := 3;
      14..17: v1b := 4;
      18..20: v1b := 5;
    end;
    {@20E9-20FA}
    bA7D0 := bA7D0 + v1b;
  end;
end;

{ 2100 }
procedure pO07C_2100(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@2103-210B}
  if a4 <> 0 then
    Exit;
  {@210B-2128}
  if pO0E2_1374(1, 100) <= 90 then
  begin
    {@211A-2121}
    pO07C_0081(11);
    {@2121-2128}
    pO07C_0081(53);
  end;
end;

{ 212C }
procedure pO07C_212C(a0: pointer; a1: word; a2: word; a3: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@2132-213A}
  if a3 <> 0 then
    Exit;
  {@213A-21A7}
  if (bA7E6 = 4) or (bA7E6 = 2) then
  begin
    {@2148-2196}
    case PR25_byte(PR0_pointer(a0)^.v)^.v of
      4..6: v1b := 1;
      7..10: v1b := 2;
      11..13: v1b := 3;
      14..17: v1b := 4;
      18..20: v1b := 5;
    end;
    {@2196-21A7}
    bA7D0 := bA7D0 + v1b;
  end;
end;

{ 21AD }
procedure pO07C_21AD(a0: word; a1: word; a2: word; a3: word; a4: byte);
begin
  {@21B0-21B8}
  if a4 <> 0 then
    Exit;
  {@21B8-21C8}
  if (bA7D2 and 2) <> 0 then
    pO07C_0081(0);
end;

{ 21CC }
procedure pO07C_21CC(a0: pointer; a1: word; a2: word; a3: word);
begin
  {@21CF-21EC}
  if pO0E2_1374(1, 4) = 1 then
  begin
    {@21DE-21EA}
    PR501_byte(PR0_pointer(a0)^.v)^.v := 8;
    {@21EA-21EC}
    Exit;
  end;
  {@21EC-21F8}
  PR501_byte(PR0_pointer(a0)^.v)^.v := 4;
end;

{ 2209 }
procedure pO07C_2209(a0: pointer; a1: word; a2: word; a3: word);
var
  v4l: longint;
  _f1: array[1..18] of byte;
begin
  if false then begin
    if LV = 'is terrified' then;
  end;
  {@220F-2214}
  bA7DC := 1;
  {@2214-221C}
  v4l := 0;
  asm
  db 161,242,156,139,22,244,156,137,70,248,137,86,250
  end;
  asm
  db 139,70,248,11,70,250,117,3,233,142,0,196,126,248,38,138,133,239,1,196,126,12,38,196,61,38,58,133
  db 239,1,116,99,196,126,248,38,128,189,237,1,0,117,88,255,118,250,255,118,248,176,1,80,176,252,80
  call pO0E2_12C9
  db 8,192,117,67,255,118,250,255,118,248,176,120,80,141,126,252,22,87
  call pO0EC_27C1
  db 8,192,117,44,255,118,250,255,118,248,176,120,80,49,192,80,176,0,80,176,1,80,176,1,80,176,0,80
  db 141,126,235,22,87,191,252,33,14,87,154,111,10,37,8
  call pO0E2_2039
  db 196,126,248,38,139,133,227,1,38,139,149,229,1,137,70,248,137,86,250,233,103,255
  end;
  {@22C2-22C7}
  bA7DC := 0;
end;

{ 24F9 }
procedure pO07C_24F9(a0: pointer; a1: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4sb: shortint;
  v8l: longint;
  v12l: longint;
  _f2: array[1..1] of byte;
  v14b: byte;
  _f3: array[1..1] of byte;
  v16b: byte;
  v3sb: shortint absolute v3b;
  { 22CD }
  procedure pO07C_22CD;
  var
    _f1: array[1..28] of byte;
    w29b: byte;
    _f2: array[1..7] of byte;
  begin
    asm
    db 141,126,229,22,87,184,27,0,80
    call XR670_046E
    db 198,70,227,0,235,3,254,70,227,139,126,6,54,196,125,8,137,126,221,140,70,223,138,70,227,48,228,196
    db 126,221,3,248,38,128,125,30,0,119,3,233,220,0,138,70,227,48,228,196,126,221,3,248,38,128,125,30
    db 128,114,3,233,200,0,138,70,227,48,228,196,126,221,3,248,38,138,69,30,36,127,136,70,228,138,70,228
    db 48,228,139,248,177,4,211,231,138,133,26,101,136,70,226,138,70,228,48,228,139,248,177,4,211,231,138,133
    db 27,101,136,70,225,138,70,225,48,228,139,200,138,70,226,152,186,9,0,247,226,196,126,221,3,248,3,249
    db 38,138,157,124,1,138,70,225,48,228,139,200,138,70,226,152,186,9,0,247,226,139,248,3,249,138,67,228
    db 58,195,114,67,138,70,225,48,228,139,200,138,70,226,152,186,9,0,247,226,196,126,221,3,248,3,249,38
    db 128,189,124,1,0,116,13,128,62,138,174,0,116,6,128,126,226,2,116,17,138,70,227,48,228,196,126,221
    db 3,248,38,198,69,30,0,235,4,254,14,138,174,235,23,138,70,225,48,228,139,200,138,70,226,152,186,9
    db 0,247,226,139,248,3,249,254,67,228,128,126,227,140,116,3,233,247,254
    end;
    {@23F0-24B9}
    for w29b := 0 to 140 do
      asm
    db 139,126,6,54,196,125,8,137,126,221,140,70,223,138,70,227,48,228,196,126,221,3,248,38,128,125,30,127
    db 119,3,233,150,0,138,70,227,48,228,196,126,221,3,248,38,138,69,30,36,127,136,70,228,138,70,228,48
    db 228,139,248,177,4,211,231,138,133,26,101,136,70,226,138,70,228,48,228,139,248,177,4,211,231,138,133,27
    db 101,136,70,225,138,70,225,48,228,139,200,138,70,226,152,186,9,0,247,226,196,126,221,3,248,3,249,38
    db 138,157,124,1,138,70,225,48,228,139,200,138,70,226,152,186,9,0,247,226,139,248,3,249,138,67,228,58
    db 195,114,17,138,70,227,48,228,196,126,221,3,248,38,198,69,30,0,235,23,138,70,225,48,228,139,200,138
    db 70,226,152,186,9,0,247,226,139,248,3,249,254,67,228
      end;
  end;

begin
  if false then begin
    if LV = 'gets drained' then;
    if LV = 'dies from drainning' then;
    if LV = 'collapses from drainning' then;
    LP1('collapses from drainning');
  end;
  asm
  db 139,70,8,11,70,10,117,3,233,23,3
  end;
  {@250A-252A}
  pO0EC_1B08(pointer(a0), 'gets drained', 10, 0);
  asm
  call pR47F_0D1A
  end;
  for v14b := 1 to a1 do
  begin
    asm
  db 198,70,241,0
    end;
    asm
  db 198,70,254,0
    end;
    for v3b := 0 to 6 do
    begin
      asm
  db 138,70,253,152,196,126,8,3,248,38,138,133,81,1,136,70,255
      end;
      if (v1b > 0) or (PRA351_byte(a0)^.a[v3sb] > 0) then
        asm
  db 254,70,241
        end;
      asm
  db 138,70,255,58,70,254,118,14,138,70,255,136,70,254,138,70,253,136,70,252,235,78,138,70,255,58,70,254
  db 117,70,128,126,254,0,116,64,255,118,10,255,118,8,138,70,254,80,138,70,253,80
  call pO102_12D1
  db 82,80,255,118,10,255,118,8,138,70,255,80,138,70,252,80
  call pO102_12D1
  db 89,91,59,211,127,6,124,16,59,193,118,12,138,70,255,136,70,254,138,70,253,136,70,252
      end;
    end;
    asm
  db 138,70,252,152,196,126,8,3,248,38,138,149,81,1,138,70,252,152,196,126,8,3,248,38,138,133,95,1
  db 58,194,119,28,138,70,252,152,196,126,8,3,248,38,138,149,81,1,138,70,252,152,196,126,8,3,248,38
  db 136,149,95,1
    end;
    asm
  db 196,126,8,38,139,133,118,1,38,139,149,120,1,196,126,8,38,59,149,116,1,124,9,127,33,38,59,133
  db 114,1,119,26,196,126,8,38,139,133,114,1,38,139,149,116,1,196,126,8,38,137,133,118,1,38,137,149
  db 120,1
    end;
    asm
  db 196,126,8,38,138,133,122,1,196,126,8,38,58,133,178,0,119,16,196,126,8,38,138,133,178,0,196,126
  db 8,38,136,133,122,1
    end;
    asm
  db 138,70,254,60,1,117,18,49,192,137,70,244,137,70,246,49,192,137,70,248,137,70,250,235,104,60,2,117
  db 48,49,192,137,70,244,137,70,246,138,70,254,48,228,209,224,209,224,139,200,138,70,252,152,186,45,1,247
  db 226,139,248,3,249,139,133,174,113,139,149,176,113,137,70,248,137,86,250,235,52,255,118,10,255,118,8,138
  db 70,254,254,200,80,138,70,252,80
  call pO102_12D1
  db 137,70,244,137,86,246,255,118,10,255,118,8,138,70,254,80,138,70,252,80
  call pO102_12D1
  db 137,70,248,137,86,250
    end;
    {@2709-2732}
    PR370_longint(a0)^.v := (v8l - v12l) div LongInt(2) + v12l;
    if PRA337_byte(a0)^.a[v4sb] > 0 then
      asm
  db 138,70,252,152,196,126,8,3,248,38,254,141,81,1
      end;
    asm
  db 138,70,252,152,196,126,8,3,248,38,138,133,81,1,196,126,8,38,58,133,57,1,114,29,255,118,10,255
  db 118,8,138,70,252,152,139,248,138,133,185,109,80,138,70,241,80,176,0,80
  call pO0AA_36BA
    end;
    asm
  db 255,118,10,255,118,8
  call pO102_02F5
    end;
    asm
  db 85
  push cs
  call near ptr pO07C_22CD
    end;
  end;
  asm
  db 198,70,240,0
  end;
  for v3b := 0 to 6 do
    asm
  db 138,70,253,152,196,126,8,3,248,38,128,189,81,1,0,118,4,198,70,240,1
    end;
  {@27C9-27F9}
  if (v16b = 0) or (PR178_byte(a0)^.v <= 0) then
  begin
    {@27DA-27F7}
    pO0E2_0000(pointer(a0), 8, 'dies from drainning');
    asm
  db 235,40
    end;
  end;
  {@27F9-2821}
  if PR508_byte(a0)^.v <= 0 then
    pO0E2_0000(pointer(a0), 4, 'collapses from drainning');
end;

{ 2827 }
procedure pO07C_2827(a0: pointer; a1: word; a2: word; a3: word);
begin
  {@282A-284B}
  if b880C = 5 then
    pO07C_24F9(pointer(PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v), 1);
end;

{ 284F }
procedure pO07C_284F(a0: pointer; a1: word; a2: word; a3: word);
begin
  {@2852-2873}
  if b880C = 5 then
    pO07C_24F9(pointer(PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v), 2);
end;

{ 2877 }
procedure pO07C_2877(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@287A-2881}
  pO07C_1536(1);
end;

{ 2885 }
procedure pO07C_2885(a0: pointer; a1: word; a2: word; a3: word);
var
  v4p: pointer;
begin
  {@288B-28E4}
  if b880C = 5 then
  begin
    {@2892-28AB}
    v4p := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if v4p <> nil then
    begin
      {@28B3-28B8}
      bA7D2 := 9;
      {@28B8-28E4}
      pO0E2_1D19(v4p, pO0E2_13BF(4, 6), 2, pO0E2_12C9(v4p, 4, 0));
    end;
  end;
end;

{ 28EA }
procedure pO07C_28EA(a0: pointer; a1: word; a2: word; a3: word);
var loc: array[1..4] of byte;
begin
  asm
    db 128,126,6,0,116,2,235,94,196,126,12,38,196,61,38,196,189,231,1,38,139,69,9,38,139,85,11,163
    db 226,167,137,22,228,167,196,126,12,38,255,117,2,38,255,53,255,54,228,167,255,54,226,167
    call pO0EC_2C22
    db 60,1,118,2,235,39,196,62,226,167,38,138,133,164,1,36,8,8,192,116,24,196,126,12,38,255,117,2
    db 38,255,53,176,4,80
    call pO102_1276
    db 48,228,1,6,216,167
  end;
end;

{ 295C }
procedure pO07C_295C(a0: pointer; a1: word; a2: word; a3: word);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@2962-2974}
  v1b := pO0EC_2CF6(pointer(PR0_pointer(a0)^.v));
end;

{ 297A }
procedure pO07C_297A(a0: pointer; a1: pointer; a2: byte);
begin
  {@297D-2A62}
  if a2 = 0 then
  begin
    {@2986-2992}
    PR496_byte(PR0_pointer(a0)^.v)^.v := 1;
    if (PR327_byte(PR0_pointer(a0)^.v)^.v <= 127) or (PR327_byte(PR0_pointer(a0)^.v)^.v = 179) then
      PR327_byte(PR0_pointer(a0)^.v)^.v := 179
    else
      PR327_byte(PR0_pointer(a0)^.v)^.v := 178;
    {@29C8-29DD}
    PR9_longint(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
    asm
  db 196,126,12,38,255,117,2,38,255,53
  call pO135_0CA2
  db 80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CCA
  db 80,184,255,0,80,176,255,80,196,126,12,38,255,117,2,38,255,53
  call pO135_0CF2
  db 80
  call pO130_08D7
db 160,232,166,48,228,139,248,209,231,209,231,139,133,131,165,139,149,133,165,196,126,12,38,196,61,38,196,189
  db 231,1,38,137,69,9,38,137,85,11,196,126,12,38,196,61,38,196,189,231,1,38,196,125,9,38,138,133
  db 239,1,52,1,196,126,12,38,196,61,38,136,133,239,1,235,44
    end;
  end;
  {@2A62-2A7C}
  if PR327_byte(PR0_pointer(a0)^.v)^.v = 179 then
    PR327_byte(PR0_pointer(a0)^.v)^.v := 0;
  {@2A7C-2A8E}
  PR495_byte(PR0_pointer(a0)^.v)^.v := PR3_byte(a1)^.v;
end;

{ 2A92 }
procedure pO07C_2A92(a0: pointer; a1: word; a2: word; a3: word);
var
  v4p: pointer;
begin
  {@2A98-2AF1}
  if b880C = 5 then
  begin
    {@2A9F-2AB8}
    v4p := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if v4p <> nil then
    begin
      {@2AC0-2AC5}
      bA7D2 := 9;
      {@2AC5-2AF1}
      pO0E2_1D19(v4p, pO0E2_13BF(2, 6), 2, pO0E2_12C9(v4p, 4, 0));
    end;
  end;
end;

{ 2AF7 }
procedure pO07C_2AF7(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@2AFA-2B26}
  if a3 <> 0 then
    PR175_byte(PR0_pointer(a0)^.v)^.v := pO102_1276(pointer(PR0_pointer(a0)^.v), 3) div 5 + 1;
end;

{ 2B2A }
procedure pO07C_2B2A(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@2B2D-2B69}
  if a3 <> 0 then
  begin
    {@2B33-2B59}
    if PR327_byte(PR0_pointer(a0)^.v)^.v = 179 then
    begin
      {@2B41-2B4D}
      PR327_byte(PR0_pointer(a0)^.v)^.v := 0;
      {@2B4D-2B59}
      PR496_byte(PR0_pointer(a0)^.v)^.v := 0;
    end;
    {@2B59-2B69}
    PR15_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  end;
end;

{ 2B79 }
procedure pO07C_2B79(a0: pointer; a1: word; a2: word; a3: byte);
var
  v2w: word;
  _f1: array[1..1] of byte;
  v4b: byte;
begin
  if false then begin
    if LV = 'gets zapped' then;
    LP1('gets zapped');
  end;
  {@2B7F-2B88}
  if a3 <> 0 then
    Exit;
  asm
  db 255,54,240,156,255,54,238,156,196,126,12,38,255,117,2,38,255,53
  call pO0EC_2C22
  db 60,2,115,103
  end;
  {@2BA3-2BA9}
  v2w := wA7D8;
  {@2BA9-2BB1}
  wA7D8 := wA7D8 * 2;
  if iA7D8 > 0 then
  begin
    asm
  db 160,210,167,48,228,137,70,252
    end;
    asm
  db 198,6,210,167,8
    end;
    {@2BC5-2BE7}
    pO0EC_1B08(p9CEE, 'gets zapped', 10, 1);
    {@2BE7-2BFE}
    pO0E2_1D19(p9CEE, wA7D8, 0, 0);
    {@2BFE-2C04}
    wA7D8 := v2w;
    {@2C04-2C0A}
    bA7D2 := v4b;
  end;
end;

{ 2C10 }
procedure pO07C_2C10(a0: pointer; a1: word; a2: word; a3: byte);
begin
  {@2C17-2C4C}
  if a3 = 0 then
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), s407C + s5127, 10, 1);
end;

{ 2C72 }
procedure pO07C_2C72(a0: pointer; a1: word; a2: word; a3: word);
var loc: array[1..24] of byte;
begin
  if false then begin
    if LV = 'gazes...' then;
    if LV = 'reflects it!' then;
    if LV = 'paralyzed' then;
  end;
  asm
    db 128,126,6,0,116,3,233,235,1,176,10,80,176,1,80,191,108,177,30,87,255,30,62,171,196,126,12,38
    db 255,117,2,38,255,53
    call pO0EC_29F3
    db 196,62,59,173,38,58,133,239,1,116,5,198,6,108,177,0,128,62,108,177,0,117,3,233,179,1,198,6
    db 210,167,16,161,59,173,139,22,61,173,163,226,167,137,22,228,167,196,126,12,38,255,117,2,38,255,53,141
    db 126,237,22,87,191,82,44,14,87,154,111,10,37,8,176,10,80,176,0,80
    call pO0EC_1B08
    db 176,18,80
    call pO0EC_1E6D
    db 196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CA2
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CCA
    db 152,80,176,4,80,176,45,80
    call pO0EC_1F07
    db 196,126,12,38,255,117,2,38,255,53,176,59,80,141,126,246,22,87
    call pO0EC_27C1
    db 8,192,117,3,233,162,0,198,70,250,0,255,54,228,167,255,54,226,167,176,72,80,141,126,246,22,87
    call pO0EC_27C1
    db 8,192,117,3,233,130,0,255,54,228,167,255,54,226,167,141,126,233,22,87,191,91,44,14,87,154,111,10
    db 37,8,176,12,80,176,0,80
    call pO0EC_1B08
    db 255,54,228,167,255,54,226,167
    call pO135_0CA2
    db 152,80,255,54,228,167,255,54,226,167
    call pO135_0CCA
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CA2
    db 152,80,196,126,12,38,255,117,2,38,255,53
    call pO135_0CCA
    db 152,80,176,4,80,176,45,80
    call pO0EC_1F07
    db 198,70,250,1,196,126,12,38,139,5,38,139,85,2,163,226,167,137,22,228,167,255,54,228,167,255,54,226
    db 167,176,1,80,176,3,80
    call pO0E2_12C9
    db 8,192,117,29,255,54,228,167,255,54,226,167,176,126,80,141,126,246,22,87
    call pO0EC_27C1
    db 8,192,117,4,176,0,235,2,176,1,136,70,251,255,54,228,167,255,54,226,167,176,52,80,184,10,0,80
    db 176,12,80,176,0,80,176,1,80,138,70,251,80,141,126,236,22,87,191,104,44,14,87,154,111,10,37,8
    call pO0E2_2039
  end;
end;

{ 2E7E }
procedure pO07C_2E7E(a0: pointer; a1: word; a2: word; a3: byte);
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'is beheaded' then;
  end;
  {@2E84-2EDC}
  if (b880C = 5) and (a3 = 0) and (bA7E9 <> 0) then
  begin
    {@2E98-2EB1}
    v4p := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if (PR421_byte(v4p)^.v and 32) = 0 then
      pO0E2_0000(v4p, 6, 'is beheaded');
  end;
end;

{ 2EE2 }
procedure pO07C_2EE2(a0: pointer; a1: word; a2: word; a3: word);
var
  v41a: string[40];
  v42b: byte;
  v42sb: shortint absolute v42b;
  v41a2: string[40] absolute v41a;
  v41b: byte absolute v41a;
begin
  {@2EE9-2EED}
  v41b := 0;
  {@2EED-2EFF}
  v42b := pO0EC_1712(pointer(PR0_pointer(a0)^.v));
  case bAED7 of
    1: begin
      {@2F06-2F21}
      wA7D8 := v42sb + Integer(pO0E2_1374(1, 10) + 4);
      {@2F21-2F49}
      v41a := s34E3 + s3C99;
    end;
    2: begin
      {@2F50-2F6B}
      wA7D8 := v42sb + Integer(pO0E2_1374(2, 4) + 4);
      {@2F6B-2F93}
      v41a := s348F + s3C99;
    end;
    3: begin
      {@2F9A-2FB5}
      wA7D8 := v42sb + Integer(pO0E2_1374(1, 8) + 4);
      {@2FB5-2FDD}
      v41a := s34B9 + s3C99;
    end;
    4: begin
      {@2FE4-2FFF}
      wA7D8 := v42sb + Integer(pO0E2_1374(1, 8) + 4);
      {@2FFF-3027}
      v41a := s3450 + s3C99;
    end;
    5: begin
      {@302E-3049}
      wA7D8 := v42sb + Integer(pO0E2_1374(1, 4) + 4);
      {@3049-3071}
      v41a := s3393 + s3C99;
    end;
    6: begin
      {@3077-3092}
      wA7D8 := v42sb + Integer(pO0E2_1374(1, 6) + 4);
      {@3092-30BA}
      v41a := s3465 + s3C99;
    end;
  end;
  {@30BA-30D9}
  pR47F_0498(23, 7, 38, 9, 10, 0, 1, v41a2);
end;

{ 30DF }
procedure pO07C_30DF(a0: pointer; a1: word; a2: word; a3: word);
begin
  {@30E2-30EE}
  Dec(PR498_byte(PR0_pointer(a0)^.v)^.v, 4);
  {@30EE-30FA}
  Dec(PR499_byte(PR0_pointer(a0)^.v)^.v, 4);
end;

{ 30FE }
procedure pO07C_30FE(a0: pointer; a1: pointer; a2: word);
var
  v2w: word;
begin
  {@3104-3110}
  if (bA7D2 and 1) = 0 then
    Exit;
  {@3110-3121}
  v2w := PR3_byte(a1)^.v * 12;
  if v2w > iA7D8 then
  begin
    {@3138-313E}
    Dec(v2w, wA7D8);
    {@313E-3143}
    wA7D8 := 0;
    {@3143-3154}
    PR3_byte(a1)^.v := v2w div 12;
    if PR3_byte(a1)^.v = 0 then
      pO0E2_0104(pointer(PR0_pointer(a0)^.v), 119, nil);
    {@3176-3178}
    Exit;
  end;
  {@3178-317F}
  Dec(wA7D8, v2w);
  {@317F-3197}
  pO0E2_0104(pointer(PR0_pointer(a0)^.v), 119, nil);
end;

{ 319D }
procedure pO07C_319D(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@31A0-31B3}
  if iA7D8 > 2 then
    Dec(wA7D8, 2)
  else
    wA7D8 := 0;
  {@31B3-31B8}
  Dec(bA7DE, 2);
end;

{ 31BC }
procedure pO07C_31BC(a0: pointer; a1: word; a2: word; a3: word);
var
  v4p: pointer;
begin
  {@31C2-321B}
  if b880C = 5 then
  begin
    {@31C9-31E2}
    v4p := PR9_pointer(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v;
    if v4p <> nil then
    begin
      {@31EA-31EF}
      bA7D2 := 9;
      {@31EF-321B}
      pO0E2_1D19(v4p, pO0E2_13BF(2, 6), 2, pO0E2_12C9(v4p, 4, 0));
    end;
  end;
end;

{ 3221 }
procedure pO07C_3221(a0: pointer; a1: word; a2: word; a3: word);
begin
  {@3224-3230}
  Inc(PR498_byte(PR0_pointer(a0)^.v)^.v, 4);
  {@3230-323C}
  Inc(PR499_byte(PR0_pointer(a0)^.v)^.v, 4);
end;

{ 3240 }
procedure pO07C_3240(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@3243-324A}
  pO07C_0081(11);
  {@324A-3251}
  pO07C_0081(35);
  {@3251-3258}
  pO07C_0081(52);
  {@3258-325F}
  pO07C_0081(68);
  {@325F-3266}
  pO07C_0081(111);
end;

{ 326A }
procedure pO07C_326A(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@326D-3274}
  pO07C_1536(2);
end;

{ 3278 }
procedure pO07C_3278(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
  {@327B-3289}
  if (bA7D2 and 16) <> 0 then
    bA7D0 := 20;
end;

{ 328D }
procedure pO07C_328D(a0: word; a1: word; a2: word; a3: word; a4: word);
begin
end;

{ 3294 }
procedure pO07C_3294(a0: pointer; a1: pointer; a2: byte);
var
  v4p: pointer;
begin
  {@329A-329F}
  bAE80 := 0;
  {@329F-32AB}
  v4p := a1;
  if a2 <> 0 then
  begin
    {@32B1-32CE}
    pO0E2_0104(pointer(PR0_pointer(a0)^.v), PR61_byte(v4p)^.v, nil);
    {@32CE-32D0}
    Exit;
  end;
  {@32D0-32F0}
  pO0E2_13E5(pointer(PR0_pointer(a0)^.v), PR61_byte(v4p)^.v, 0, 255, 1);
end;

{ 32F6 }
procedure pO07C_32F6;
begin
  {@32F9-3306}
  pA7EA := Pointer(@pO07C_0128);
  {@3306-3313}
  pA7EE := Pointer(@pO07C_013E);
  {@3313-3320}
  pA7F2 := Pointer(@pO07C_017A);
  {@3320-332D}
  pA7F6 := Pointer(@pO07C_020F);
  {@332D-333A}
  pA7FA := Pointer(@pO07C_328D);
  {@333A-3347}
  pA7FE := Pointer(@pO07C_0230);
  {@3347-3354}
  pA802 := Pointer(@pO07C_0244);
  {@3354-3361}
  pA806 := Pointer(@pO07C_027E);
  {@3361-336E}
  pA80A := Pointer(@pO07C_02B9);
  {@336E-337B}
  pA80E := Pointer(@pO07C_02F4);
  {@337B-3388}
  pA812 := Pointer(@pO07C_031B);
  {@3388-3395}
  pA816 := Pointer(@pO07C_03FF);
  {@3395-33A2}
  pA81A := Pointer(@pO07C_0406);
  {@33A2-33AF}
  pA81E := Pointer(@pO07C_0424);
  {@33AF-33BC}
  pA822 := Pointer(@pO07C_042B);
  {@33BC-33C9}
  pA826 := Pointer(@pO07C_04B3);
  {@33C9-33D6}
  pA82A := Pointer(@pO07C_04BA);
  {@33D6-33E3}
  pA82E := Pointer(@pO07C_04F1);
  {@33E3-33F0}
  pA832 := Pointer(@pO07C_328D);
  {@33F0-33FD}
  pA836 := Pointer(@pO07C_051B);
  {@33FD-340A}
  pA83A := Pointer(@pO07C_0542);
  {@340A-3417}
  pA83E := Pointer(@pO07C_060D);
  {@3417-3424}
  pA842 := Pointer(@pO07C_068B);
  {@3424-3431}
  pA846 := Pointer(@pO07C_328D);
  {@3431-343E}
  pA84A := Pointer(@pO07C_0886);
  {@343E-344B}
  pA84E := Pointer(@pO07C_08B6);
  {@344B-3458}
  pA852 := Pointer(@pO07C_00F5);
  {@3458-3465}
  pA856 := Pointer(@pO07C_0903);
  {@3465-3472}
  pA85A := Pointer(@pO07C_09E5);
  {@3472-347F}
  pA85E := Pointer(@pO07C_0A11);
  {@347F-348C}
  pA862 := Pointer(@pO07C_00F5);
  {@348C-3499}
  pA866 := Pointer(@pO07C_0AEA);
  {@3499-34A6}
  pA86A := Pointer(@pO07C_0BB2);
  {@34A6-34B3}
  pA86E := Pointer(@pO07C_0BE1);
  {@34B3-34C0}
  pA872 := Pointer(@pO07C_0C4A);
  {@34C0-34CD}
  pA876 := Pointer(@pO07C_0E16);
  {@34CD-34DA}
  pA87A := Pointer(@pO07C_0E2D);
  {@34DA-34E7}
  pA87E := Pointer(@pO07C_03FF);
  {@34E7-34F4}
  pA882 := Pointer(@pO07C_0E5B);
  {@34F4-3501}
  pA886 := Pointer(@pO07C_0ED5);
  {@3501-350E}
  pA88A := Pointer(@pO07C_0FEE);
  {@350E-351B}
  pA88E := Pointer(@pO07C_1030);
  {@351B-3528}
  pA892 := Pointer(@pO07C_105C);
  {@3528-3535}
  pA896 := Pointer(@pO07C_10F1);
  {@3535-3542}
  pA89A := Pointer(@pO07C_027E);
  {@3542-354F}
  pA89E := Pointer(@pO07C_02B9);
  {@354F-355C}
  pA8A2 := Pointer(@pO07C_119E);
  {@355C-3569}
  pA8A6 := Pointer(@pO07C_11C1);
  {@3569-3576}
  pA8AA := Pointer(@pO07C_11E4);
  {@3576-3583}
  pA8AE := Pointer(@pO07C_1237);
  {@3583-3590}
  pA8B2 := Pointer(@pO07C_00F5);
  {@3590-359D}
  pA8B6 := Pointer(@pO07C_00F5);
  {@359D-35AA}
  pA8BA := Pointer(@pO07C_00F5);
  {@35AA-35B7}
  pA8BE := Pointer(@pO07C_126E);
  {@35B7-35C4}
  pA8C2 := Pointer(@pO07C_12A5);
  {@35C4-35D1}
  pA8C6 := Pointer(@pO07C_12AC);
  {@35D1-35DE}
  pA8CA := Pointer(@pO07C_12F6);
  {@35DE-35EB}
  pA8CE := Pointer(@pO07C_134E);
  {@35EB-35F8}
  pA8D2 := Pointer(@pO07C_152F);
  {@35F8-3605}
  pA8D6 := Pointer(@pO07C_15AA);
  {@3605-3612}
  pA8DA := Pointer(@pO07C_15B8);
  {@3612-361F}
  pA8DE := Pointer(@pO07C_161F);
  {@361F-362C}
  pA8E2 := Pointer(@pO07C_1672);
  {@362C-3639}
  pA8E6 := Pointer(@pO07C_1760);
  {@3639-3646}
  pA8EA := Pointer(@pO07C_178E);
  {@3646-3653}
  pA8EE := Pointer(@pO07C_17F2);
  {@3653-3660}
  pA8F2 := Pointer(@pO07C_1841);
  {@3660-366D}
  pA8F6 := Pointer(@pO07C_18AD);
  {@366D-367A}
  pA8FA := Pointer(@pO07C_19AA);
  {@367A-3687}
  pA8FE := Pointer(@pO07C_1A05);
  {@3687-3694}
  pA902 := Pointer(@pO07C_1B4E);
  {@3694-36A1}
  pA906 := Pointer(@pO07C_1B7A);
  {@36A1-36AE}
  pA90A := Pointer(@pO07C_1B81);
  {@36AE-36BB}
  pA90E := Pointer(@pO07C_1BA0);
  {@36BB-36C8}
  pA912 := Pointer(@pO07C_1BBA);
  {@36C8-36D5}
  pA916 := Pointer(@pO07C_1C1F);
  {@36D5-36E2}
  pA91A := Pointer(@pO07C_1C42);
  {@36E2-36EF}
  pA91E := Pointer(@pO07C_1DA3);
  {@36EF-36FC}
  pA922 := Pointer(@pO07C_1DB6);
  {@36FC-3709}
  pA926 := Pointer(@pO07C_1EC3);
  {@3709-3716}
  pA92A := Pointer(@pO07C_1F06);
  {@3716-3723}
  pA92E := Pointer(@pO07C_1F52);
  {@3723-3730}
  pA93E := Pointer(@pO07C_1FA3);
  {@3730-373D}
  pA942 := Pointer(@pO07C_328D);
  {@373D-374A}
  pA946 := Pointer(@pO07C_1FBE);
  {@374A-3757}
  pA94A := Pointer(@pO07C_2003);
  {@3757-3764}
  pA956 := Pointer(@pO07C_2054);
  {@3764-3771}
  pA95A := Pointer(@pO07C_206A);
  {@3771-377E}
  pA95E := Pointer(@pO07C_2078);
  {@377E-378B}
  pA962 := Pointer(@pO07C_2100);
  {@378B-3798}
  pA96A := Pointer(@pO07C_212C);
  {@3798-37A5}
  pA96E := Pointer(@pO07C_21AD);
  {@37A5-37B2}
  pA972 := Pointer(@pO07C_21CC);
  {@37B2-37BF}
  pA976 := Pointer(@pO07C_2209);
  {@37BF-37CC}
  pA97A := Pointer(@pO07C_2827);
  {@37CC-37D9}
  pA97E := Pointer(@pO07C_284F);
  {@37D9-37E6}
  pA982 := Pointer(@pO07C_2877);
  {@37E6-37F3}
  pA986 := Pointer(@pO07C_2885);
  {@37F3-3800}
  pA98A := Pointer(@pO07C_28EA);
  {@3800-380D}
  pA98E := Pointer(@pO07C_295C);
  {@380D-381A}
  pA992 := Pointer(@pO07C_297A);
  {@381A-3827}
  pA996 := Pointer(@pO07C_2A92);
  {@3827-3834}
  pA99A := Pointer(@pO07C_328D);
  {@3834-3841}
  pA99E := Pointer(@pO07C_2AF7);
  {@3841-384E}
  pA9A2 := Pointer(@pO07C_2B2A);
  {@384E-385B}
  pA9A6 := Pointer(@pO07C_2B79);
  {@385B-3868}
  pA9AA := Pointer(@pO07C_2C10);
  {@3868-3875}
  pA9AE := Pointer(@pO07C_2C72);
  {@3875-3882}
  pA9B2 := Pointer(@pO07C_2E7E);
  {@3882-388F}
  pA9B6 := Pointer(@pO07C_2EE2);
  {@388F-389C}
  pA9BA := Pointer(@pO0A1_4C33);
  {@389C-38A9}
  pA9BE := Pointer(@pO07C_30DF);
  {@38A9-38B6}
  pA9C2 := Pointer(@pO07C_30FE);
  {@38B6-38C3}
  pA9C6 := Pointer(@pO07C_319D);
  {@38C3-38D0}
  pA9CA := Pointer(@pO07C_31BC);
  {@38D0-38DD}
  pA9CE := Pointer(@pO07C_3221);
  {@38DD-38EA}
  pA9D2 := Pointer(@pO07C_3240);
  {@38EA-38F7}
  pA9DA := Pointer(@pO07C_326A);
  {@38F7-3904}
  pA9DE := Pointer(@pO07C_3278);
  {@3904-3911}
  pA9E2 := Pointer(@pO07C_3294);
end;

{ 3913 }
begin
end.

