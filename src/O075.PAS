{ O075: generated skeleton (original bytes in BASM) }
{$A-,B-,D-,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O075;

interface

uses GAMEDATA;

procedure pO075_011F;
procedure pO075_3770(a0: byte; a1: byte);
procedure pO075_3D36;
procedure pO075_23CA;

implementation

uses LIT, Crt, O06E, O079, O0AA, O0E2, O0EC, O102, O108, O13E, R142, R1C3, R47F, R670, R6DD, R716;

type
  AL17_byte = array[17..32017] of byte;
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E2_byte = record f: byte; _r: array[1..1] of byte end;
  E42_byte = record f: byte; _r: array[1..41] of byte end;
  E6_byte = record f: byte; _r: array[1..5] of byte end;
  E8_pointer = record f: pointer; _r: array[1..4] of byte end;
  R0_byte = record v: byte end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_string_15_ = record v: string[15] end;
  R0_string_40_ = record v: string[40] end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R18_word = record _p: array[1..18] of byte; v: word end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R23_pointer = record _p: array[1..23] of byte; v: pointer end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R29_byte = record _p: array[1..29] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R337_byte = record _p: array[1..337] of byte; v: byte end;
  R339_byte = record _p: array[1..339] of byte; v: byte end;
  R340_byte = record _p: array[1..340] of byte; v: byte end;
  R341_byte = record _p: array[1..341] of byte; v: byte end;
  R342_byte = record _p: array[1..342] of byte; v: byte end;
  R343_byte = record _p: array[1..343] of byte; v: byte end;
  R347_byte = record _p: array[1..347] of byte; v: byte end;
  R348_byte = record _p: array[1..348] of byte; v: byte end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R412_byte = record _p: array[1..412] of byte; v: byte end;
  R413_byte = record _p: array[1..413] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_longint = record _p: array[1..42] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R47_byte = record _p: array[1..47] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R53_byte = record _p: array[1..53] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  RA0_byte = record a: array[0..32000] of byte end;
  RA16_byte = record _p: array[1..16] of byte; a: array[0..32000] of byte end;
  RA178_byte = record _p: array[1..178] of byte; a: array[0..32000] of byte end;
  RA17_byte = record _p: array[1..17] of byte; a: array[0..32000] of byte end;
W0_12_441E = record case byte of 0: (_p0: array[1..337] of byte;
      _w12_337abyte: array[0..32000] of byte) end;
W0_4_23CA = record case byte of 0: (_w4_0string: string); 1: (_p1: array[1..494] of byte;
      _w4_494byte: byte) end;
W0_4_38C5 = record case byte of 0: (_p0: array[1..173] of byte; _w4_173byte: byte);
      1: (_p1: array[1..337] of byte; _w4_337byte: byte); 2: (_p2: array[1..339] of byte; _w4_339byte: byte);
      3: (_p3: array[1..340] of byte; _w4_340byte: byte); 4: (_p4: array[1..341] of byte; _w4_341byte: byte);
      5: (_p5: array[1..342] of byte; _w4_342byte: byte); 6: (_p6: array[1..358] of byte; _w4_358byte: byte);
      7: (_p7: array[1..410] of byte; _w4_410byte: byte); 8: (_p8: array[1..411] of byte; _w4_411byte: byte);
      9: (_p9: array[1..413] of byte; _w4_413byte: byte) end;
  W101_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W103_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W105_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W107_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W109_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W111_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W113_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W115_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W117_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W119_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W11_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W121_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W123_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W125_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W127_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W129_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W131_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W133_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W135_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W137_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W139_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W13_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W141_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W143_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W145_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W147_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W149_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W151_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W153_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W155_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W157_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W159_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W15_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W161_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W163_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W165_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W167_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W169_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W171_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W173_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W175_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W177_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W179_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W17_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W181_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W183_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W185_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W187_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W189_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W191_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W193_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W195_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W197_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W199_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W19_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W1_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W201_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W203_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W205_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W207_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W209_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W211_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W213_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W215_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W217_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W219_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W21_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W221_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W223_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W225_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W227_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W229_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W231_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W233_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W235_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W237_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W239_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W23_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W241_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W243_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W245_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W247_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W249_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W251_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W253_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W255_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  X6 = array[0..5] of byte;
W257_281_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w281_410byte: byte);
      1: (_p1: array[1..411] of byte; _w281_411byte: byte); 2: (_p2: array[1..412] of byte;
      _w281_412byte: byte); 3: (_p3: array[1..413] of byte; _w281_413byte: byte);
      4: (_p4: array[1..413] of byte; _w281_413abyte: array[0..32000] of byte);
      5: (_p5: array[1..414] of byte; _w281_414X6: X6) end;
  W259_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W25_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W261_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W263_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W265_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W267_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W269_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W271_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W273_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W275_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W277_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W279_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W27_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  WE2_byte = record f: byte; _r: array[1..1] of byte end;
W27_69_2668 = record case byte of 0: (_p0: array[1..17] of byte; _w69_17r2_0: array[0..16000] of WE2_byte);
      1: (_p1: array[1..28] of byte; _w69_28byte: byte); 2: (_p2: array[1..173] of byte;
      _w69_173shortint: shortint); 3: (_p3: array[1..174] of byte; _w69_174shortint: shortint);
      4: (_p4: array[1..178] of byte; _w69_178byte: byte); 5: (_p5: array[1..339] of byte;
      _w69_339byte: byte); 6: (_p6: array[1..340] of byte; _w69_340byte: byte);
      7: (_p7: array[1..341] of byte; _w69_341byte: byte); 8: (_p8: array[1..358] of byte;
      _w69_358shortint: shortint); 9: (_p9: array[1..381] of byte; _w69_381byte: byte);
      10: (_p10: array[1..508] of byte; _w69_508byte: byte) end;
  W281_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W283_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W285_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W287_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W289_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W291_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W293_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W295_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W297_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W299_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W29_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
W29_69_2668 = record case byte of 0: (_p0: array[1..178] of byte; _w69_178byte: byte);
      1: (_p1: array[1..337] of byte; _w69_337abyte: array[0..32000] of byte);
      2: (_p2: array[1..380] of byte; _w69_380byte: byte) end;
W2_4_23CA = record case byte of 0: (_w4_0string: string); 1: (_p1: array[1..494] of byte;
      _w4_494byte: byte) end;
W2_5_21EE = record case byte of 0: (_p0: array[1..259] of byte; _w5_259byte: byte);
      1: (_p1: array[1..260] of byte; _w5_260byte: byte); 2: (_p2: array[1..261] of byte; _w5_261byte: byte);
      3: (_p3: array[1..262] of byte; _w5_262byte: byte); 4: (_p4: array[1..263] of byte; _w5_263byte: byte);
      5: (_p5: array[1..265] of byte; _w5_265byte: byte); 6: (_p6: array[1..266] of byte; _w5_266byte: byte);
      7: (_p7: array[1..269] of byte; _w5_269byte: byte); 8: (_p8: array[1..270] of byte; _w5_270byte: byte);
      9: (_p9: array[1..289] of byte; _w5_289byte: byte); 10: (_p10: array[1..290] of byte;
      _w5_290byte: byte); 11: (_p11: array[1..291] of byte; _w5_291byte: byte);
      12: (_p12: array[1..292] of byte; _w5_292byte: byte); 13: (_p13: array[1..293] of byte;
      _w5_293byte: byte); 14: (_p14: array[1..295] of byte; _w5_295byte: byte);
      15: (_p15: array[1..296] of byte; _w5_296byte: byte); 16: (_p16: array[1..297] of byte;
      _w5_297byte: byte); 17: (_p17: array[1..402] of byte; _w5_402byte: byte);
      18: (_p18: array[1..403] of byte; _w5_403byte: byte); 19: (_p19: array[1..404] of byte;
      _w5_404byte: byte); 20: (_p20: array[1..405] of byte; _w5_405byte: byte);
      21: (_p21: array[1..407] of byte; _w5_407byte: byte) end;
  W301_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W303_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W305_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W307_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W309_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W311_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W313_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W315_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W317_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W319_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W31_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W321_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W323_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W325_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W327_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W329_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W331_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W333_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W335_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W337_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W339_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W33_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W341_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W343_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W345_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W347_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W349_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W351_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W353_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W355_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W357_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W359_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W35_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W361_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W363_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W365_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W367_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W369_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W371_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W373_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W375_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W377_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W379_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W37_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W381_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W383_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W385_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W387_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W389_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W391_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W393_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W395_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W397_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W399_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W39_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W3_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W401_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W403_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W405_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W407_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W409_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W411_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W413_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W415_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W417_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W419_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W41_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W421_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W423_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W425_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W427_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W429_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W431_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W433_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W435_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W437_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W439_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W43_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W441_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W443_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W445_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W447_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W449_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W451_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W453_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W455_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W457_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W459_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W45_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W461_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W463_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W465_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W467_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W469_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W471_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W473_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W475_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W477_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W479_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W47_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W481_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W483_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W485_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W487_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W489_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W491_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W493_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W495_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W497_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W499_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W49_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W501_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W503_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W505_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W507_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W509_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W511_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W513_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
W515_281_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w281_410byte: byte);
      1: (_p1: array[1..411] of byte; _w281_411byte: byte); 2: (_p2: array[1..412] of byte;
      _w281_412byte: byte); 3: (_p3: array[1..413] of byte; _w281_413byte: byte);
      4: (_p4: array[1..413] of byte; _w281_413abyte: array[0..32000] of byte);
      5: (_p5: array[1..414] of byte; _w281_414X6: X6) end;
  W51_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W53_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W55_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W57_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W59_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W5_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W61_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W63_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W65_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W67_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W69_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
W6_20_0015 = record case byte of 0: (_p0: array[1..323] of byte; _w20_323pointer: pointer);
      1: (_p1: array[1..423] of byte; _w20_423pointer: pointer); 2: (_p2: array[1..487] of byte;
      _w20_487pointer: pointer) end;
W6_44_4638 = record case byte of 0: (_w44_0byte: byte); 1: (_p1: array[1..17] of byte; _w44_17byte: byte);
      2: (_p2: array[1..19] of byte; _w44_19byte: byte); 3: (_p3: array[1..173] of byte; _w44_173byte: byte);
      4: (_p4: array[1..178] of byte; _w44_178abyte: array[0..32000] of byte);
      5: (_p5: array[1..312] of byte; _w44_312byte: byte); 6: (_p6: array[1..313] of byte;
      _w44_313byte: byte); 7: (_p7: array[1..337] of byte; _w44_337abyte: array[0..32000] of byte);
      8: (_p8: array[1..341] of byte; _w44_341byte: byte); 9: (_p9: array[1..342] of byte;
      _w44_342byte: byte); 10: (_p10: array[1..370] of byte; _w44_370longint: longint);
      11: (_p11: array[1..379] of byte; _w44_379byte: byte); 12: (_p12: array[1..492] of byte;
      _w44_492byte: byte) end;
  W71_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W73_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W75_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W77_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W79_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W7_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W81_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W83_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W85_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W87_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W89_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W91_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W93_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W95_285_3D36 = record case byte of 0: (_p0: array[1..411] of byte; _w285_411byte: byte) end;
  W97_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W99_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
  W9_285_3D36 = record case byte of 0: (_p0: array[1..410] of byte; _w285_410byte: byte) end;
W9_40_3B04 = record case byte of 0: (_p0: array[1..413] of byte;
      _w40_413abyte: array[0..32000] of byte) end;
  PAL17_byte = ^AL17_byte;
  PR0_byte = ^R0_byte;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_string_15_ = ^R0_string_15_;
  PR0_string_40_ = ^R0_string_40_;
  PR178_byte = ^R178_byte;
  PR18_word = ^R18_word;
  PR1_byte = ^R1_byte;
  PR23_pointer = ^R23_pointer;
  PR25_byte = ^R25_byte;
  PR27_byte = ^R27_byte;
  PR28_byte = ^R28_byte;
  PR29_byte = ^R29_byte;
  PR31_byte = ^R31_byte;
  PR327_byte = ^R327_byte;
  PR337_byte = ^R337_byte;
  PR339_byte = ^R339_byte;
  PR340_byte = ^R340_byte;
  PR341_byte = ^R341_byte;
  PR342_byte = ^R342_byte;
  PR343_byte = ^R343_byte;
  PR347_byte = ^R347_byte;
  PR348_byte = ^R348_byte;
  PR35_byte = ^R35_byte;
  PR370_longint = ^R370_longint;
  PR412_byte = ^R412_byte;
  PR413_byte = ^R413_byte;
  PR41_byte = ^R41_byte;
  PR422_byte = ^R422_byte;
  PR423_pointer = ^R423_pointer;
  PR42_longint = ^R42_longint;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR47_byte = ^R47_byte;
  PR483_pointer = ^R483_pointer;
  PR493_byte = ^R493_byte;
  PR508_byte = ^R508_byte;
  PR52_byte = ^R52_byte;
  PR53_byte = ^R53_byte;
  PR57_byte = ^R57_byte;
  PR5_pointer = ^R5_pointer;
  PRA0_byte = ^RA0_byte;
  PRA16_byte = ^RA16_byte;
  PRA178_byte = ^RA178_byte;
  PRA17_byte = ^RA17_byte;
  PW0_12_441E = ^W0_12_441E;
  PW0_4_23CA = ^W0_4_23CA;
  PW0_4_38C5 = ^W0_4_38C5;
  PW101_285_3D36 = ^W101_285_3D36;
  PW103_285_3D36 = ^W103_285_3D36;
  PW105_285_3D36 = ^W105_285_3D36;
  PW107_285_3D36 = ^W107_285_3D36;
  PW109_285_3D36 = ^W109_285_3D36;
  PW111_285_3D36 = ^W111_285_3D36;
  PW113_285_3D36 = ^W113_285_3D36;
  PW115_285_3D36 = ^W115_285_3D36;
  PW117_285_3D36 = ^W117_285_3D36;
  PW119_285_3D36 = ^W119_285_3D36;
  PW11_285_3D36 = ^W11_285_3D36;
  PW121_285_3D36 = ^W121_285_3D36;
  PW123_285_3D36 = ^W123_285_3D36;
  PW125_285_3D36 = ^W125_285_3D36;
  PW127_285_3D36 = ^W127_285_3D36;
  PW129_285_3D36 = ^W129_285_3D36;
  PW131_285_3D36 = ^W131_285_3D36;
  PW133_285_3D36 = ^W133_285_3D36;
  PW135_285_3D36 = ^W135_285_3D36;
  PW137_285_3D36 = ^W137_285_3D36;
  PW139_285_3D36 = ^W139_285_3D36;
  PW13_285_3D36 = ^W13_285_3D36;
  PW141_285_3D36 = ^W141_285_3D36;
  PW143_285_3D36 = ^W143_285_3D36;
  PW145_285_3D36 = ^W145_285_3D36;
  PW147_285_3D36 = ^W147_285_3D36;
  PW149_285_3D36 = ^W149_285_3D36;
  PW151_285_3D36 = ^W151_285_3D36;
  PW153_285_3D36 = ^W153_285_3D36;
  PW155_285_3D36 = ^W155_285_3D36;
  PW157_285_3D36 = ^W157_285_3D36;
  PW159_285_3D36 = ^W159_285_3D36;
  PW15_285_3D36 = ^W15_285_3D36;
  PW161_285_3D36 = ^W161_285_3D36;
  PW163_285_3D36 = ^W163_285_3D36;
  PW165_285_3D36 = ^W165_285_3D36;
  PW167_285_3D36 = ^W167_285_3D36;
  PW169_285_3D36 = ^W169_285_3D36;
  PW171_285_3D36 = ^W171_285_3D36;
  PW173_285_3D36 = ^W173_285_3D36;
  PW175_285_3D36 = ^W175_285_3D36;
  PW177_285_3D36 = ^W177_285_3D36;
  PW179_285_3D36 = ^W179_285_3D36;
  PW17_285_3D36 = ^W17_285_3D36;
  PW181_285_3D36 = ^W181_285_3D36;
  PW183_285_3D36 = ^W183_285_3D36;
  PW185_285_3D36 = ^W185_285_3D36;
  PW187_285_3D36 = ^W187_285_3D36;
  PW189_285_3D36 = ^W189_285_3D36;
  PW191_285_3D36 = ^W191_285_3D36;
  PW193_285_3D36 = ^W193_285_3D36;
  PW195_285_3D36 = ^W195_285_3D36;
  PW197_285_3D36 = ^W197_285_3D36;
  PW199_285_3D36 = ^W199_285_3D36;
  PW19_285_3D36 = ^W19_285_3D36;
  PW1_285_3D36 = ^W1_285_3D36;
  PW201_285_3D36 = ^W201_285_3D36;
  PW203_285_3D36 = ^W203_285_3D36;
  PW205_285_3D36 = ^W205_285_3D36;
  PW207_285_3D36 = ^W207_285_3D36;
  PW209_285_3D36 = ^W209_285_3D36;
  PW211_285_3D36 = ^W211_285_3D36;
  PW213_285_3D36 = ^W213_285_3D36;
  PW215_285_3D36 = ^W215_285_3D36;
  PW217_285_3D36 = ^W217_285_3D36;
  PW219_285_3D36 = ^W219_285_3D36;
  PW21_285_3D36 = ^W21_285_3D36;
  PW221_285_3D36 = ^W221_285_3D36;
  PW223_285_3D36 = ^W223_285_3D36;
  PW225_285_3D36 = ^W225_285_3D36;
  PW227_285_3D36 = ^W227_285_3D36;
  PW229_285_3D36 = ^W229_285_3D36;
  PW231_285_3D36 = ^W231_285_3D36;
  PW233_285_3D36 = ^W233_285_3D36;
  PW235_285_3D36 = ^W235_285_3D36;
  PW237_285_3D36 = ^W237_285_3D36;
  PW239_285_3D36 = ^W239_285_3D36;
  PW23_285_3D36 = ^W23_285_3D36;
  PW241_285_3D36 = ^W241_285_3D36;
  PW243_285_3D36 = ^W243_285_3D36;
  PW245_285_3D36 = ^W245_285_3D36;
  PW247_285_3D36 = ^W247_285_3D36;
  PW249_285_3D36 = ^W249_285_3D36;
  PW251_285_3D36 = ^W251_285_3D36;
  PW253_285_3D36 = ^W253_285_3D36;
  PW255_285_3D36 = ^W255_285_3D36;
  PW257_281_3D36 = ^W257_281_3D36;
  PW259_285_3D36 = ^W259_285_3D36;
  PW25_285_3D36 = ^W25_285_3D36;
  PW261_285_3D36 = ^W261_285_3D36;
  PW263_285_3D36 = ^W263_285_3D36;
  PW265_285_3D36 = ^W265_285_3D36;
  PW267_285_3D36 = ^W267_285_3D36;
  PW269_285_3D36 = ^W269_285_3D36;
  PW271_285_3D36 = ^W271_285_3D36;
  PW273_285_3D36 = ^W273_285_3D36;
  PW275_285_3D36 = ^W275_285_3D36;
  PW277_285_3D36 = ^W277_285_3D36;
  PW279_285_3D36 = ^W279_285_3D36;
  PW27_285_3D36 = ^W27_285_3D36;
  PW27_69_2668 = ^W27_69_2668;
  PW281_285_3D36 = ^W281_285_3D36;
  PW283_285_3D36 = ^W283_285_3D36;
  PW285_285_3D36 = ^W285_285_3D36;
  PW287_285_3D36 = ^W287_285_3D36;
  PW289_285_3D36 = ^W289_285_3D36;
  PW291_285_3D36 = ^W291_285_3D36;
  PW293_285_3D36 = ^W293_285_3D36;
  PW295_285_3D36 = ^W295_285_3D36;
  PW297_285_3D36 = ^W297_285_3D36;
  PW299_285_3D36 = ^W299_285_3D36;
  PW29_285_3D36 = ^W29_285_3D36;
  PW29_69_2668 = ^W29_69_2668;
  PW2_4_23CA = ^W2_4_23CA;
  PW2_5_21EE = ^W2_5_21EE;
  PW301_285_3D36 = ^W301_285_3D36;
  PW303_285_3D36 = ^W303_285_3D36;
  PW305_285_3D36 = ^W305_285_3D36;
  PW307_285_3D36 = ^W307_285_3D36;
  PW309_285_3D36 = ^W309_285_3D36;
  PW311_285_3D36 = ^W311_285_3D36;
  PW313_285_3D36 = ^W313_285_3D36;
  PW315_285_3D36 = ^W315_285_3D36;
  PW317_285_3D36 = ^W317_285_3D36;
  PW319_285_3D36 = ^W319_285_3D36;
  PW31_285_3D36 = ^W31_285_3D36;
  PW321_285_3D36 = ^W321_285_3D36;
  PW323_285_3D36 = ^W323_285_3D36;
  PW325_285_3D36 = ^W325_285_3D36;
  PW327_285_3D36 = ^W327_285_3D36;
  PW329_285_3D36 = ^W329_285_3D36;
  PW331_285_3D36 = ^W331_285_3D36;
  PW333_285_3D36 = ^W333_285_3D36;
  PW335_285_3D36 = ^W335_285_3D36;
  PW337_285_3D36 = ^W337_285_3D36;
  PW339_285_3D36 = ^W339_285_3D36;
  PW33_285_3D36 = ^W33_285_3D36;
  PW341_285_3D36 = ^W341_285_3D36;
  PW343_285_3D36 = ^W343_285_3D36;
  PW345_285_3D36 = ^W345_285_3D36;
  PW347_285_3D36 = ^W347_285_3D36;
  PW349_285_3D36 = ^W349_285_3D36;
  PW351_285_3D36 = ^W351_285_3D36;
  PW353_285_3D36 = ^W353_285_3D36;
  PW355_285_3D36 = ^W355_285_3D36;
  PW357_285_3D36 = ^W357_285_3D36;
  PW359_285_3D36 = ^W359_285_3D36;
  PW35_285_3D36 = ^W35_285_3D36;
  PW361_285_3D36 = ^W361_285_3D36;
  PW363_285_3D36 = ^W363_285_3D36;
  PW365_285_3D36 = ^W365_285_3D36;
  PW367_285_3D36 = ^W367_285_3D36;
  PW369_285_3D36 = ^W369_285_3D36;
  PW371_285_3D36 = ^W371_285_3D36;
  PW373_285_3D36 = ^W373_285_3D36;
  PW375_285_3D36 = ^W375_285_3D36;
  PW377_285_3D36 = ^W377_285_3D36;
  PW379_285_3D36 = ^W379_285_3D36;
  PW37_285_3D36 = ^W37_285_3D36;
  PW381_285_3D36 = ^W381_285_3D36;
  PW383_285_3D36 = ^W383_285_3D36;
  PW385_285_3D36 = ^W385_285_3D36;
  PW387_285_3D36 = ^W387_285_3D36;
  PW389_285_3D36 = ^W389_285_3D36;
  PW391_285_3D36 = ^W391_285_3D36;
  PW393_285_3D36 = ^W393_285_3D36;
  PW395_285_3D36 = ^W395_285_3D36;
  PW397_285_3D36 = ^W397_285_3D36;
  PW399_285_3D36 = ^W399_285_3D36;
  PW39_285_3D36 = ^W39_285_3D36;
  PW3_285_3D36 = ^W3_285_3D36;
  PW401_285_3D36 = ^W401_285_3D36;
  PW403_285_3D36 = ^W403_285_3D36;
  PW405_285_3D36 = ^W405_285_3D36;
  PW407_285_3D36 = ^W407_285_3D36;
  PW409_285_3D36 = ^W409_285_3D36;
  PW411_285_3D36 = ^W411_285_3D36;
  PW413_285_3D36 = ^W413_285_3D36;
  PW415_285_3D36 = ^W415_285_3D36;
  PW417_285_3D36 = ^W417_285_3D36;
  PW419_285_3D36 = ^W419_285_3D36;
  PW41_285_3D36 = ^W41_285_3D36;
  PW421_285_3D36 = ^W421_285_3D36;
  PW423_285_3D36 = ^W423_285_3D36;
  PW425_285_3D36 = ^W425_285_3D36;
  PW427_285_3D36 = ^W427_285_3D36;
  PW429_285_3D36 = ^W429_285_3D36;
  PW431_285_3D36 = ^W431_285_3D36;
  PW433_285_3D36 = ^W433_285_3D36;
  PW435_285_3D36 = ^W435_285_3D36;
  PW437_285_3D36 = ^W437_285_3D36;
  PW439_285_3D36 = ^W439_285_3D36;
  PW43_285_3D36 = ^W43_285_3D36;
  PW441_285_3D36 = ^W441_285_3D36;
  PW443_285_3D36 = ^W443_285_3D36;
  PW445_285_3D36 = ^W445_285_3D36;
  PW447_285_3D36 = ^W447_285_3D36;
  PW449_285_3D36 = ^W449_285_3D36;
  PW451_285_3D36 = ^W451_285_3D36;
  PW453_285_3D36 = ^W453_285_3D36;
  PW455_285_3D36 = ^W455_285_3D36;
  PW457_285_3D36 = ^W457_285_3D36;
  PW459_285_3D36 = ^W459_285_3D36;
  PW45_285_3D36 = ^W45_285_3D36;
  PW461_285_3D36 = ^W461_285_3D36;
  PW463_285_3D36 = ^W463_285_3D36;
  PW465_285_3D36 = ^W465_285_3D36;
  PW467_285_3D36 = ^W467_285_3D36;
  PW469_285_3D36 = ^W469_285_3D36;
  PW471_285_3D36 = ^W471_285_3D36;
  PW473_285_3D36 = ^W473_285_3D36;
  PW475_285_3D36 = ^W475_285_3D36;
  PW477_285_3D36 = ^W477_285_3D36;
  PW479_285_3D36 = ^W479_285_3D36;
  PW47_285_3D36 = ^W47_285_3D36;
  PW481_285_3D36 = ^W481_285_3D36;
  PW483_285_3D36 = ^W483_285_3D36;
  PW485_285_3D36 = ^W485_285_3D36;
  PW487_285_3D36 = ^W487_285_3D36;
  PW489_285_3D36 = ^W489_285_3D36;
  PW491_285_3D36 = ^W491_285_3D36;
  PW493_285_3D36 = ^W493_285_3D36;
  PW495_285_3D36 = ^W495_285_3D36;
  PW497_285_3D36 = ^W497_285_3D36;
  PW499_285_3D36 = ^W499_285_3D36;
  PW49_285_3D36 = ^W49_285_3D36;
  PW501_285_3D36 = ^W501_285_3D36;
  PW503_285_3D36 = ^W503_285_3D36;
  PW505_285_3D36 = ^W505_285_3D36;
  PW507_285_3D36 = ^W507_285_3D36;
  PW509_285_3D36 = ^W509_285_3D36;
  PW511_285_3D36 = ^W511_285_3D36;
  PW513_285_3D36 = ^W513_285_3D36;
  PW515_281_3D36 = ^W515_281_3D36;
  PW51_285_3D36 = ^W51_285_3D36;
  PW53_285_3D36 = ^W53_285_3D36;
  PW55_285_3D36 = ^W55_285_3D36;
  PW57_285_3D36 = ^W57_285_3D36;
  PW59_285_3D36 = ^W59_285_3D36;
  PW5_285_3D36 = ^W5_285_3D36;
  PW61_285_3D36 = ^W61_285_3D36;
  PW63_285_3D36 = ^W63_285_3D36;
  PW65_285_3D36 = ^W65_285_3D36;
  PW67_285_3D36 = ^W67_285_3D36;
  PW69_285_3D36 = ^W69_285_3D36;
  PW6_20_0015 = ^W6_20_0015;
  PW6_44_4638 = ^W6_44_4638;
  PW71_285_3D36 = ^W71_285_3D36;
  PW73_285_3D36 = ^W73_285_3D36;
  PW75_285_3D36 = ^W75_285_3D36;
  PW77_285_3D36 = ^W77_285_3D36;
  PW79_285_3D36 = ^W79_285_3D36;
  PW7_285_3D36 = ^W7_285_3D36;
  PW81_285_3D36 = ^W81_285_3D36;
  PW83_285_3D36 = ^W83_285_3D36;
  PW85_285_3D36 = ^W85_285_3D36;
  PW87_285_3D36 = ^W87_285_3D36;
  PW89_285_3D36 = ^W89_285_3D36;
  PW91_285_3D36 = ^W91_285_3D36;
  PW93_285_3D36 = ^W93_285_3D36;
  PW95_285_3D36 = ^W95_285_3D36;
  PW97_285_3D36 = ^W97_285_3D36;
  PW99_285_3D36 = ^W99_285_3D36;
  PW9_285_3D36 = ^W9_285_3D36;
  PW9_40_3B04 = ^W9_40_3B04;
var
  a09B7_c768: array[0..5459, 0..5] of byte absolute d09B7;
  a09B7_ec3f: array[0..32759] of byte absolute d09B7;
  a0E57_b7cc: array[0..1212] of string[26] absolute d0E57;
  a11B9_9ec9: array[0..779] of string[41] absolute d11B9;
  a11E2_620f: array[0..779] of E42_byte absolute d11E2;
  a3191_738a: array[0..711] of string[45] absolute d3191;
  a5364_ec3f: array[0..32759] of byte absolute d5364;
  a651A_3981: array[0..2046] of E16_byte absolute d651A;
  a6DB9_ec3f: array[0..32759] of byte absolute d6DB9;
  a6DC9_ec3f: array[0..32759] of byte absolute d6DC9;
  a6DDD_ec3f: array[0..32759] of byte absolute d6DDD;
  a6EF7_9d21: array[0..2046, 0..15] of byte absolute d6EF7;
  a6EF9_9d21: array[0..2046, 0..15] of byte absolute d6EF9;
  a6EFB_9d21: array[0..2046, 0..15] of byte absolute d6EFB;
  a6EFD_3981: array[0..2046] of E16_byte absolute d6EFD;
  a6EFE_3981: array[0..2046] of E16_byte absolute d6EFE;
  a6EFF_3981: array[0..2046] of E16_byte absolute d6EFF;
  a6F00_3981: array[0..2046] of E16_byte absolute d6F00;
  a6F01_3981: array[0..2046] of E16_byte absolute d6F01;
  a6F02_3981: array[0..2046] of E16_byte absolute d6F02;
  a6F03_3981: array[0..2046] of E16_byte absolute d6F03;
  a6F04_3981: array[0..2046] of E16_byte absolute d6F04;
  a6F05_3981: array[0..2046] of E16_byte absolute d6F05;
  a6F06_3981: array[0..2046] of E16_byte absolute d6F06;
  a708F_07d2: array[0..5459] of E6_byte absolute d708F;
  a7090_07d2: array[0..5459] of E6_byte absolute d7090;
  a7091_07d2: array[0..5459] of E6_byte absolute d7091;
  a7092_07d2: array[0..5459] of E6_byte absolute d7092;
  a7093_07d2: array[0..5459] of E6_byte absolute d7093;
  a7094_07d2: array[0..5459] of E6_byte absolute d7094;
  a719C_ec3f: array[0..32759] of byte absolute d719C;
  a9DC4_7c92: array[0..4094] of E8_pointer absolute d9DC4;
  a9DC8_7c92: array[0..4094] of E8_pointer absolute d9DC8;
  aAB0E_71c0: array[0..16379] of E2_byte absolute dAB0E;
  aC5D4_2fc5: array[0..16379] of word absolute dC5D4;
  aC5E2_2fc5: array[0..16379] of word absolute dC5E2;
  b11E2: byte absolute d11E2;
  b120C: byte absolute d120C;
  b1236: byte absolute d1236;
  b1260: byte absolute d1260;
  b128A: byte absolute d128A;
  b12B4: byte absolute d12B4;
  b12DE: byte absolute d12DE;
  b1308: byte absolute d1308;
  b1332: byte absolute d1332;
  b135C: byte absolute d135C;
  b1386: byte absolute d1386;
  b13B0: byte absolute d13B0;
  b13DA: byte absolute d13DA;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  b880E: byte absolute d880E;
  b8811: byte absolute d8811;
  b94D5: byte absolute d94D5;
  b9CEE: byte absolute d9CEE;
  bAAD5: byte absolute dAAD5;
  bAAE6: byte absolute dAAE6;
  bAB0C: byte absolute dAB0C;
  bAB14: byte absolute dAB14;
  bAB1C: byte absolute dAB1C;
  bAE84: byte absolute dAE84;
  bAE86: byte absolute dAE86;
  bAE87: byte absolute dAE87;
  bB16D: byte absolute dB16D;
  bC594: byte absolute dC594;
  bC5C3: byte absolute dC5C3;
  bC5C4: byte absolute dC5C4;
  bC5C5: byte absolute dC5C5;
  bC5C6: byte absolute dC5C6;
  bC60C: byte absolute dC60C;
  g3DC0_87e6: B8 absolute d3DC0;
  gD51E_9554: B768 absolute dD51E;
  l9CF2: longint absolute d9CF2;
  p87F8: pointer absolute d87F8;
  p8836: pointer absolute d8836;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CFF: pointer absolute d9CFF;
  s199F: string absolute d199F;
  s19C8: string absolute d19C8;
  s1C2F: string absolute d1C2F;
  s1C58: string absolute d1C58;
  s1C81: string absolute d1C81;
  s1CD3: string absolute d1CD3;
  s1CFC: string absolute d1CFC;
  s1D25: string absolute d1D25;
  s1D4E: string absolute d1D4E;
  s278C: string absolute d278C;
  s2882: string absolute d2882;
  s28AB: string absolute d28AB;
  s2B8D: string absolute d2B8D;
  s2DF2: string absolute d2DF2;
  s2E1B: string absolute d2E1B;
  s2E44: string absolute d2E44;
  wC5C7: word absolute dC5C7;
  wC5C9: word absolute dC5C9;
  wC5D4: word absolute dC5D4;
  wC5D6: word absolute dC5D6;
  wC5D8: word absolute dC5D8;
  wC5DA: word absolute dC5DA;
  wC5DC: word absolute dC5DC;
  wC5DE: word absolute dC5DE;
  wC5E0: word absolute dC5E0;
  wC5E2: word absolute dC5E2;
  wC5E4: word absolute dC5E4;
  wC5E6: word absolute dC5E6;
  wC5E8: word absolute dC5E8;
  wC5EA: word absolute dC5EA;
  wC5EC: word absolute dC5EC;
  wC5EE: word absolute dC5EE;

procedure pO075_0015(a0: pointer); far; forward;
procedure pO075_06DF; far; forward;
procedure pO075_21EE(a0: pointer); far; forward;
procedure pO075_2668; far; forward;
procedure pO075_34C0; far; forward;
procedure pO075_38C5; far; forward;
function pO075_439F(a0: pointer; a1: byte): shortint; far; forward;
function pO075_441E(a0: pointer): byte; far; forward;
procedure pO075_4638; far; forward;
procedure pO075_4E86; far; forward;
procedure pO075_5478(a0: pointer); far; forward;
procedure pO075_5700; far; forward;

{ 0015 }
procedure pO075_0015(a0: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'disposing a nil char' then;
  end;
  {@001B-003B}
  if PR0_pointer(a0)^.v = nil then
    pO0EC_1AAC('disposing a nil char');
  {@003B-006C}
  with PW6_20_0015(PR0_pointer(a0)^.v)^ do
  begin
    if _w20_487pointer <> nil then
      FreeMem(_w20_487pointer, 22);
    {@006C-007F}
    v8p := _w20_423pointer;
    {@007F-00B0}
    while v8p <> nil do
    begin
      {@0087-0093}
      v4p := v8p;
      {@0093-00A4}
      v8p := PR42_pointer(v8p)^.v;
      {@00A4-00AE}
      pR670_03ED(@v4b);
    end;
    {@00B0-00C3}
    v16p := _w20_323pointer;
  end;
  {@00C3-00F9}
  while v16p <> nil do
  begin
    {@00CB-00D7}
    v12p := v16p;
    {@00D7-00E8}
    v16p := PR5_pointer(v16p)^.v;
    {@00E8-00F7}
    FreeMem(v12p, 9);
  end;
  {@00F9-010C}
  FreeMem(PR0_pointer(a0)^.v, 510);
  {@010C-0118}
  PR0_pointer(a0)^.v := nil;
end;

{ 011F }
procedure pO075_011F;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..2] of byte;
  v6b: byte;
  _f2: array[1..9] of byte;
  v16b: byte;
  v17b: byte;
  _f3: array[1..1] of byte;
  v22p: pointer;
  v26p: pointer;
  v30p: pointer;
  v32w: word;
  v33b: byte;
  v34b: byte;
  v35b: byte;
  _f4: array[1..3] of byte;
  v39b: byte;
  v32b: byte absolute v32w;
  v26b: byte absolute v26p;
  v22b: byte absolute v22p;
  v16sb: shortint absolute v16b;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@0125-012A}
  bC5C3 := 0;
  {@012A-0130}
  b880D := b880C;
  {@0130-0135}
  b880C := 0;
  {@0135-0139}
  v17b := 1;
  {@0139-013E}
  v32w := 0;
  {@013E-0142}
  v34b := 0;
  {@0142-0663}
  while true do
  begin
    {@0142-0273}
    if v17b <> 0 then
    begin
      {@014B-0153}
      pR142_00D4(1);
      if p9CEE <> nil then
      begin
        {@015C-0169}
        pO0EC_07C0(p9CEE);
        {@0169-016E}
        b120C := 1;
        {@016E-0173}
        b1236 := 1;
        {@0173-0184}
        b1260 := Ord(PR47_byte(p87F8)^.v > 0);
        {@0184-018A}
        b128A := b1260;
        {@018A-018F}
        b12B4 := 1;
        {@018F-0194}
        b1308 := 1;
        {@0194-0199}
        b1332 := 0;
        {@0199-019E}
        b135C := 1;
        {@019E-01A3}
        b1386 := 1;
        {@01A3-01A8}
        b13B0 := 0;
      end
      else
      begin
        {@01AA-01AF}
        b120C := 0;
        {@01AF-01B4}
        b1236 := 0;
        {@01B4-01B9}
        b1260 := 0;
        {@01B9-01BE}
        b128A := 0;
        {@01BE-01C3}
        b12B4 := 0;
        {@01C3-01C8}
        b1308 := 0;
        {@01C8-01CD}
        b1332 := 1;
        {@01CD-01D2}
        b135C := 0;
        {@01D2-01D7}
        b1386 := 0;
        {@01D7-01DC}
        b13B0 := 1;
      end;
      {@01DC-01E0}
      v16b := 0;
      for v1b := 0 to 12 do
      begin
        {@01E9-01FF}
        if a11E2_620f[v1b].f <> 0 then
          Inc(v16b);
      end;
      {@0205-0214}
      pO108_22B0(v16sb, @v22b);
      {@0214-0220}
      v30p := v22p;
      for v1b := 0 to 12 do
      begin
        {@0229-026D}
        if a11E2_620f[v1b].f <> 0 then
        begin
          {@023C-025C}
          PR0_string_40_(v30p)^.v := a11B9_9ec9[v1b];
          {@025C-026D}
          v30p := PR42_pointer(v30p)^.v;
        end;
      end;
    end;
    {@0273-0277}
    v6b := 1;
    {@0277-027F}
    pO108_00CB(0);
    {@027F-02B8}
    v3b := pO108_1D45(s278C, s2B8D, 9, 12, 38, 22, v22p, 0, 0, @v6b, @v32b, @v26b);
    {@02B8-02BC}
    v2b := 0;
    {@02BC-02C0}
    v33b := 0;
    {@02C0-02FB}
    while (v2b < 13) and (v33b = 0) do
    begin
      {@02CC-02F0}
      v33b := Ord(a11B9_9ec9[v2b] = PR0_string(v26p)^.v);
      if v33b = 0 then
        Inc(v2b);
    end;
    {@02FB-030B}
    if v17b <> 0 then
      pO108_2363(@v22b);
    {@030B-031C}
    if (v2b <> 9) and (v2b <> 12) then
      b94D5 := 0;
    {@031C-061B}
    case v2b of
      0: begin
        {@0323-032E}
        if b11E2 <> 0 then
          pO075_06DF;
      end;
      1: begin
        {@0335-0340}
        if b120C <> 0 then
          pO075_23CA;
      end;
      2: begin
        {@0347-0352}
        if b1236 <> 0 then
          pO075_2668;
      end;
      3: begin
        {@0359-0364}
        if b1260 <> 0 then
          pO075_4638;
      end;
      4: begin
        {@036E-043A}
        if (b128A <> 0) and (pO0AA_3594 <> 0) then
        begin
          {@0384-0394}
          v35b := pO102_0E0C(p9CEE);
          if v35b <> 17 then
          begin
            {@039D-03CC}
            if pO0EC_27C1(p9CEE, 8, @v39b) <> 0 then
              pO0E2_0104(p9CEE, 8, nil);
            {@03CC-03FB}
            if pO0EC_27C1(p9CEE, 105, @v39b) <> 0 then
              pO0E2_0104(p9CEE, 105, nil);
            {@03FB-043A}
            case v35b of
              3: pO0E2_13E5(p9CEE, 8, 0, 255, 0);
              4: pO0E2_13E5(p9CEE, 105, 0, 255, 0);
            end;
          end;
        end;
      end;
      5: begin
        {@0441-045B}
        if (b12B4 <> 0) and (pO0AA_3594 <> 0) then
          pO0AA_0C9D(@v6b);
      end;
      6: begin
        {@0462-046D}
        if b12DE <> 0 then
          pO075_34C0;
      end;
      7: begin
        {@0474-04C5}
        if (b1308 <> 0) and (p9CEE <> nil) and (pO0AA_3594 <> 0) then
        begin
          {@048D-04C5}
          if PR327_byte(p9CEE)^.v < 128 then
          begin
            {@0499-04B5}
            pO06E_0AD8(p9CEE, '');
            {@04B5-04BF}
            pO075_3770(0, 1);
          end
          else
            pO075_23CA;
        end;
      end;
      8: begin
        {@04CC-04DB}
        if b1332 <> 0 then
          pO06E_203E(0);
      end;
      9: begin
        {@04E2-04FD}
        if (b135C <> 0) and (l9CF2 <> 0) then
          pO06E_2989(0, 0);
      end;
      10: begin
        {@0507-05A8}
        if b1386 <> 0 then
        begin
          {@0511-0516}
          bC5C3 := 1;
          if (l9CF2 <> 0) or (b880E <> 0) then
          begin
            {@0529-052F}
            b880C := b880D;
            if (b8811 = 0) or (bAAD5 = 9) then
            begin
              {@053D-055B}
              if (b880C = 3) and (PR35_byte(p87F8)^.v = 1) then
                pR142_0137
              else
                pR142_011B;
              {@055B-0568}
              pO0EC_07C0(p9CEE);
            end
            else
              case b880C of
                0, 4: begin
                  {@0575-057A}
                  pR142_011B;
                  {@057A-0587}
                  pO0EC_07C0(p9CEE);
                end;
                3: pR142_0137;
              end;
            {@0592-0597}
            pO108_167D;
            {@0597-05A0}
            PR47_byte(p87F8)^.v := 0;
            {@05A0-05A5}
            pO0EC_301C;
            {@05A5-05A8}
            Exit;
          end;
        end;
      end;
      11: begin
        {@05AE-05B9}
        if b13B0 <> 0 then
          pO075_4E86;
      end;
      12: begin
        {@05BF-061B}
        if (b13DA <> 0) and (Byte(pO108_2254(s199F, b5363)) = b5362) then
        begin
          {@05DA-0613}
          if (l9CF2 <> 0) and (b94D5 = 0) then
          begin
            {@05EA-0613}
            if Byte(pO108_2254(s19C8, b5363)) = b5363 then
              pO06E_2989(0, 0)
            else
              pR670_0000(0);
          end;
          {@0613-061B}
          pR670_0000(0);
        end;
      end;
    end;
    {@061B-0660}
    if ((v2b = 1) or (v2b = 7)) and (p9CEE = nil) and (l9CF2 = 0) then
    begin
      {@0639-063E}
      pO079_08A7;
      {@063E-0643}
      bC5C3 := 0;
      {@0643-0649}
      b880D := b880C;
      {@0649-064E}
      b880C := 0;
      {@064E-0652}
      v17b := 1;
      {@0652-0657}
      v32w := 0;
      {@0657-065B}
      v34b := 1;
      {@065B-0660}
      bC594 := 1;
    end;
  end;
end;

{ 06DF }
procedure pO075_06DF;
var loc: array[1..600] of byte;
begin
  if false then begin
    if LV = '  ' then;
    if Pos('', LV) = 0 then;
    if LV = 'Select' then;
    if LSV = [8..12] then;
    if LV = '/' then;
    if LV = ' ' then;
    if LV = 'Reroll stats? ' then;
    if LV = 'Character name: ' then;
    if LSV = [49..57] then;
    if LV = 'Save ' then;
    if LV = '? ' then;
  end;
  asm
    db 184,254,1,80,154,63,2,37,8,137,70,252,137,86,254,196,126,252,6,87,184,254,1,80
    call XR670_046E
    db 196,126,252,137,126,165,140,70,167,198,70,237,1,235,3,254,70,237,138,70,237,48,228,139,248,138,133,221
    db 109,48,228,5,8,0,177,4,211,224,139,208,138,70,237,48,228,139,248,138,133,221,109,48,228,3,194,138
    db 208,138,70,237,48,228,196,126,165,3,248,38,136,149,157,1,128,126,237,6,117,193,196,126,165,38,198,133
    db 112,1,50,196,126,165,38,198,133,172,0,40,196,126,165,38,198,133,237,1,0,196,126,165,38,198,133,238
    db 1,1,196,126,165,38,198,133,49,1,1,196,126,165,38,198,133,156,1,10,184,7,0,80,141,126,244,22
    db 87
    call pO108_22B0
    db 196,126,244,38,198,69,41,1,191,241,25,30,87,196,126,244,6,87,184,40,0,80,154,137,10,37,8,198
    db 70,233,0,235,3,254,70,233,138,70,233,152,64,80,255,118,246,255,118,244
    call pO108_0000
    db 137,70,240,137,86,242,141,190,169,254,22,87,191,103,6,14,87,154,111,10,37,8,138,70,233,152,186,9
    db 0,247,226,139,248,129,199,61,16,30,87,154,252,10,37,8,196,126,240,6,87,184,40,0,80,154,137,10
    db 37,8,128,126,233,5,117,172,139,70,244,139,86,246,137,70,240,137,86,242,199,70,238,1,0,198,70,222
    db 1,198,70,223,1,176,0,80
    call pO108_00CB
    db 141,126,168,22,87,191,106,6,14,87,154,111,10,37,8,141,126,161,22,87,191,107,6,14,87,154,111,10
    db 37,8,176,1,80,176,2,80,176,38,80,176,22,80,255,118,246,255,118,244,138,70,223,80,176,0,80,141
    db 126,222,22,87,141,126,238,22,87,141,126,240,22,87
    call pO108_1D45
    db 136,70,234,128,62,230,170,0,116,6,128,126,234,27,116,13,128,62,230,170,0,117,28,128,126,234,0,118
    db 22,141,126,244,22,87
    call pO108_2363
    db 141,126,252,22,87
    push cs
    call near ptr pO075_0015
    db 233,65,25,128,126,234,0,116,3,233,121,255,196,126,252,137,126,165,140,70,167,139,70,238,72,196,126,165
    db 38,136,133,173,0,196,126,165,38,198,133,157,1,2,196,126,165,38,138,133,173,0,60,4,117,35,255,118
    db 254,255,118,252,176,97,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 196,126,165,38,198,133,157,1,1,233,225,0,60,2,117,81,255,118,254,255,118,252,176,47,80,49,192,80
    db 176,255,80,176,0,80
    call pO0E2_13E5
    db 255,118,254,255,118,252,176,26,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 255,118,254,255,118,252,176,97,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 196,126,165,38,198,133,157,1,1,233,140,0,60,3,117,80,255,118,254,255,118,252,176,48,80,49,192,80
    db 176,255,80,176,0,80
    call pO0E2_13E5
    db 255,118,254,255,118,252,176,7,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 255,118,254,255,118,252,176,97,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 196,126,165,38,198,133,157,1,1,235,56,60,0,117,25,255,118,254,255,118,252,176,95,80,49,192,80,176
    db 255,80,176,0,80
    call pO0E2_13E5
    db 235,27,60,1,117,23,255,118,254,255,118,252,176,18,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 141,126,244,22,87
    call pO108_2363
    db 184,3,0,80,141,126,244,22,87
    call pO108_22B0
    db 196,126,244,38,198,69,41,1,191,26,26,30,87,196,126,244,6,87,184,40,0,80,154,137,10,37,8,198
    db 70,232,0,235,3,254,70,232,138,70,232,152,64,80,255,118,246,255,118,244
    call pO108_0000
    db 137,70,240,137,86,242,141,190,169,254,22,87,191,103,6,14,87,154,111,10,37,8,138,70,232,152,186,7
    db 0,247,226,139,248,129,199,21,17,30,87,154,252,10,37,8,196,126,240,6,87,184,40,0,80,154,137,10
    db 37,8,128,126,232,1,117,172,139,70,244,139,86,246,137,70,240,137,86,242,199,70,238,1,0,198,70,223
    db 1,198,70,222,1,141,126,168,22,87,191,106,6,14,87,154,111,10,37,8,141,126,161,22,87,191,107,6
    db 14,87,154,111,10,37,8,176,1,80,176,2,80,176,38,80,176,22,80,255,118,246,255,118,244,138,70,223
    db 80,176,0,80,141,126,222,22,87,141,126,238,22,87,141,126,240,22,87
    call pO108_1D45
    db 136,70,234,128,62,230,170,0,116,6,128,126,234,27,116,13,128,62,230,170,0,117,28,128,126,234,0,118
    db 22,141,126,244,22,87
    call pO108_2363
    db 141,126,252,22,87
    push cs
    call near ptr pO075_0015
    db 233,230,22,128,126,234,0,116,3,233,121,255,139,70,238,72,196,126,252,38,136,133,102,1,141,126,244,22
    db 87
    call pO108_2363
    db 196,126,252,38,138,133,173,0,152,186,14,0,247,226,139,248,138,133,87,111,136,70,229,138,70,229,48,228
    db 64,80,141,126,244,22,87
    call pO108_22B0
    db 196,126,244,38,198,69,41,1,191,67,26,30,87,196,126,244,6,87,184,40,0,80,154,137,10,37,8,138
    db 70,229,136,70,168,176,1,58,70,168,119,117,136,70,237,235,3,254,70,237,138,70,237,48,228,80,255,118
    db 246,255,118,244
    call pO108_0000
    db 137,70,240,137,86,242,141,190,168,254,22,87,191,103,6,14,87,154,111,10,37,8,138,70,237,48,228,139
    db 200,196,126,252,38,138,133,173,0,152,186,14,0,247,226,139,248,3,249,138,133,87,111,152,186,27,0,247
    db 226,139,248,129,199,87,14,30,87,154,252,10,37,8,196,126,240,6,87,184,40,0,80,154,137,10,37,8
    db 138,70,237,58,70,168,117,144,139,70,244,139,86,246,137,70,240,137,86,242,199,70,238,1,0,198,70,223
    db 1,198,70,222,1,141,126,168,22,87,191,106,6,14,87,154,111,10,37,8,141,126,161,22,87,191,107,6
    db 14,87,154,111,10,37,8,176,1,80,176,2,80,176,38,80,176,22,80,255,118,246,255,118,244,138,70,223
    db 80,176,0,80,141,126,222,22,87,141,126,238,22,87,141,126,240,22,87
    call pO108_1D45
    db 136,70,234,128,62,230,170,0,116,6,128,126,234,27,116,13,128,62,230,170,0,117,28,128,126,234,0,118
    db 22,141,126,244,22,87
    call pO108_2363
    db 141,126,252,22,87
    push cs
    call near ptr pO075_0015
    db 233,107,21,128,126,234,0,116,3,233,121,255,196,126,252,137,126,165,140,70,167,196,126,165,38,199,133,114
    db 1,97,227,38,199,133,116,1,22,0,139,78,238,196,126,165,38,138,133,173,0,152,186,14,0,247,226,139
    db 248,3,249,138,133,87,111,196,126,165,38,136,133,174,0,196,126,165,38,198,133,56,1,1,196,126,165,38
    db 138,133,174,0,60,0,124,27,60,2,127,23,196,126,165,38,138,133,174,0,152,196,126,165,3,248,38,198
    db 133,81,1,1,233,20,2,60,5,124,27,60,6,127,23,196,126,165,38,138,133,174,0,152,196,126,165,3
    db 248,38,198,133,81,1,1,233,245,1,60,3,117,44,196,126,252,38,198,133,175,0,1,196,126,165,38,198
    db 133,84,1,1,255,118,254,255,118,252,176,8,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 233,197,1,60,4,117,35,196,126,165,38,198,133,85,1,1,255,118,254,255,118,252,176,105,80,49,192,80
    db 176,255,80,176,0,80
    call pO0E2_13E5
    db 233,158,1,60,8,117,38,196,126,165,38,198,133,81,1,1,196,126,165,38,198,133,83,1,1,196,126,165
    db 38,199,133,114,1,176,113,38,199,133,116,1,11,0,233,116,1,60,9,117,47,196,126,165,38,198,133,81
    db 1,1,196,126,165,38,198,133,83,1,1,196,126,165,38,198,133,86,1,1,196,126,165,38,199,133,114,1
    db 32,161,38,199,133,116,1,7,0,233,65,1,60,10,117,61,196,126,165,38,198,133,81,1,1,196,126,165
    db 38,198,133,85,1,1,255,118,254,255,118,252,176,105,80,49,192,80,176,255,80,176,0,80
    call pO0E2_13E5
    db 196,126,165,38,199,133,114,1,176,113,38,199,133,116,1,11,0,233,0,1,60,11,117,38,196,126,165,38
    db 198,133,81,1,1,196,126,165,38,198,133,86,1,1,196,126,165,38,199,133,114,1,176,113,38,199,133,116
    db 1,11,0,233,214,0,60,12,117,38,196,126,165,38,198,133,81,1,1,196,126,165,38,198,133,87,1,1
    db 196,126,165,38,199,133,114,1,176,113,38,199,133,116,1,11,0,233,172,0,60,13,117,38,196,126,165,38
    db 198,133,83,1,1,196,126,165,38,198,133,86,1,1,196,126,165,38,199,133,114,1,176,113,38,199,133,116
    db 1,11,0,233,130,0,60,14,117,37,196,126,165,38,198,133,83,1,1,196,126,165,38,198,133,87,1,1
    db 196,126,165,38,199,133,114,1,176,113,38,199,133,116,1,11,0,235,89,60,15,117,46,196,126,165,38,198
    db 133,83,1,1,196,126,165,38,198,133,86,1,1,196,126,165,38,198,133,87,1,1,196,126,165,38,199,133
    db 114,1,32,161,38,199,133,116,1,7,0,235,39,60,16,117,35,196,126,165,38,198,133,86,1,1,196,126
    db 165,38,198,133,87,1,1,196,126,165,38,199,133,114,1,176,113,38,199,133,116,1,11,0,196,126,165,38
    db 128,189,87,1,0,118,11,255,118,254,255,118,252
    call pO102_0970
    db 196,126,165,38,198,133,123,1,0,196,126,165,38,198,133,172,0,0,198,70,231,0,235,3,254,70,231,138
    db 70,231,152,196,126,165,3,248,38,128,189,81,1,0,118,106,138,70,231,152,196,126,165,3,248,38,138,133
    db 81,1,48,228,139,200,138,70,231,152,186,22,0,247,226,139,248,3,249,138,133,24,109,196,126,165,38,58
    db 133,172,0,118,43,138,70,231,152,196,126,165,3,248,38,138,133,81,1,48,228,139,200,138,70,231,152,186
    db 22,0,247,226,139,248,3,249,138,133,24,109,196,126,165,38,136,133,172,0,138,70,231,152,139,248,138,133
    db 178,109,196,126,165,38,0,133,123,1,128,126,231,6,116,3,233,121,255,255,118,254,255,118,252
    call pO102_0738
    db 196,126,252,38,138,133,174,0,152,186,10,0,247,226,139,248,138,133,245,112,136,70,229,138,70,229,48,228
    db 64,80,141,126,244,22,87
    call pO108_22B0
    db 196,126,244,38,198,69,41,1,191,149,26,30,87,196,126,244,6,87,184,40,0,80,154,137,10,37,8,138
    db 70,229,136,70,168,176,1,58,70,168,119,117,136,70,237,235,3,254,70,237,138,70,237,48,228,80,255,118
    db 246,255,118,244
    call pO108_0000
    db 137,70,240,137,86,242,141,190,168,254,22,87,191,103,6,14,87,154,111,10,37,8,138,70,237,48,228,139
    db 200,196,126,252,38,138,133,174,0,152,186,10,0,247,226,139,248,3,249,138,133,245,112,152,186,17,0,247
    db 226,139,248,129,199,124,16,30,87,154,252,10,37,8,196,126,240,6,87,184,40,0,80,154,137,10,37,8
    db 138,70,237,58,70,168,117,144,139,70,244,139,86,246,137,70,240,137,86,242,199,70,238,1,0,198,70,223
    db 1,198,70,222,1,141,126,168,22,87,191,106,6,14,87,154,111,10,37,8,141,126,161,22,87,191,107,6
    db 14,87,154,111,10,37,8,176,1,80,176,2,80,176,38,80,176,22,80,255,118,246,255,118,244,138,70,223
    db 80,176,0,80,141,126,222,22,87,141,126,238,22,87,141,126,240,22,87
    call pO108_1D45
    db 136,70,234,128,62,230,170,0,116,6,128,126,234,27,116,13,128,62,230,170,0,117,28,128,126,234,0,118
    db 22,141,126,244,22,87
    call pO108_2363
    db 141,126,252,22,87
    push cs
    call near ptr pO075_0015
    db 233,199,16,128,126,234,0,116,3,233,121,255,139,78,238,196,126,252,38,138,133,174,0,152,186,10,0,247
    db 226,139,248,3,249,138,133,245,112,196,126,252,38,136,133,103,1,141,126,244,22,87
    call pO108_2363
    db 196,126,252,38,128,189,174,0,6,127,86,196,126,252,38,138,133,174,0,152,209,224,209,224,139,200,196,126
    db 252,38,138,133,173,0,152,186,28,0,247,226,139,248,3,249,129,199,171,111,137,126,165,140,94,167,196,126
    db 165,38,138,69,2,80,196,126,165,38,138,69,3,80
    call pO0E2_1374
    db 48,228,196,126,165,38,3,5,5,10,0,196,126,252,38,137,133,176,0,233,38,1,196,126,252,137,126,165
    db 140,70,167,196,126,165,38,138,133,174,0,60,8,116,12,60,9,116,8,60,11,116,4,60,10,117,83,196
    db 126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,173,111,48,228,139,200,196,126,165,38,138
    db 133,173,0,152,186,28,0,247,226,139,248,138,133,174,111,48,228,247,225,139,200,196,126,165,38,138,133,173
    db 0,152,186,28,0,247,226,139,248,139,133,171,111,3,193,196,126,165,38,137,133,176,0,233,178,0,60,13
    db 116,8,60,15,116,4,60,16,117,82,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133
    db 193,111,48,228,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,194,111,48,228
    db 247,225,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,139,133,191,111,3,193,196,126
    db 165,38,137,133,176,0,235,84,60,14,117,80,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248
    db 138,133,181,111,48,228,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,182,111
    db 48,228,247,225,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,139,133,179,111,3,193
    db 196,126,165,38,137,133,176,0,161,238,156,139,22,240,156,137,70,248,137,86,250,139,70,252,139,86,254,163
    db 238,156,137,22,240,156
    call pO0AA_0041
    db 198,70,231,0,235,3,254,70,231,138,70,231,152,196,62,238,156,3,248,38,128,189,81,1,0,118,16,138
    db 70,231,152,196,62,238,156,3,248,38,198,133,81,1,1,128,126,231,6,117,213,196,126,252,38,198,69,28
    db 0,198,70,230,0,235,3,254,70,230,138,70,230,152,209,224,196,126,252,3,248,38,198,69,17,0,198,70
    db 236,1,235,3,254,70,236,176,3,80,176,6,80
    call pO0E2_1374
    db 48,228,64,136,70,235,138,70,233,60,2,117,21,138,70,230,60,4,117,5,254,70,235,235,7,60,5,117
    db 3,254,78,235,235,48,60,0,117,21,138,70,230,60,3,117,5,254,70,235,235,7,60,4,117,3,254,78
    db 235,235,23,60,4,117,19,138,70,230,60,0,117,5,254,78,235,235,7,60,3,117,3,254,70,235,138,70
    db 230,152,209,224,196,126,252,3,248,38,138,69,17,58,70,235,115,18,138,86,235,138,70,230,152,209,224,196
    db 126,252,3,248,38,136,85,17,128,126,236,6,116,3,233,113,255,196,126,252,137,126,165,140,70,167,138,70
    db 230,60,0,116,3,233,179,2,138,70,230,152,209,224,196,126,165,3,248,38,128,125,17,0,118,45,196,126
    db 165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,83,112,196,126,165,38,59,133,176,0,115,15
    db 138,70,230,152,209,224,196,126,165,3,248,38,254,69,17,138,70,230,152,209,224,196,126,165,3,248,38,128
    db 125,17,0,118,45,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,85,112,196,126,165
    db 38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254,77,17,138,70,230,152,209,224
    db 196,126,165,3,248,38,128,125,17,0,118,46,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248
    db 139,133,87,112,196,126,165,38,59,133,176,0,115,16,138,70,230,152,209,224,196,126,165,3,248,38,128,109
    db 17,2,138,70,230,152,209,224,196,126,165,3,248,38,128,125,17,0,118,45,196,126,165,38,138,133,173,0
    db 152,186,10,0,247,226,139,248,139,133,89,112,196,126,165,38,59,133,176,0,115,15,138,70,230,152,209,224
    db 196,126,165,3,248,38,254,77,17,196,126,165,38,138,133,102,1,152,139,208,196,126,165,38,138,133,173,0
    db 152,139,248,177,4,211,231,3,250,138,149,247,110,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17
    db 58,194,115,47,196,126,165,38,138,133,102,1,152,139,208,196,126,165,38,138,133,173,0,152,139,248,177,4
    db 211,231,3,250,138,149,247,110,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,196,126,165,38,138
    db 133,102,1,152,139,208,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,3,250,138,149,249,110,138
    db 70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,118,47,196,126,165,38,138,133,102,1,152,139
    db 208,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,3,250,138,149,249,110,138,70,230,152,209,224
    db 196,126,165,3,248,38,136,85,17,138,70,230,152,139,208,196,126,165,38,138,133,174,0,152,139,248,209,231
    db 139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58
    db 194,115,46,138,70,230,152,139,208,196,126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247
    db 3,250,138,149,143,112,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,196,126,165,38,128,125,17
    db 18,116,3,233,130,0,196,126,165,38,128,189,83,1,0,119,22,196,126,165,38,128,189,85,1,0,119,11
    db 196,126,165,38,128,189,84,1,0,118,97,184,100,0,80,154,151,21,37,8,64,196,126,165,38,136,69,28
    db 196,126,165,38,138,133,102,1,152,139,208,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,3,250
    db 138,133,251,110,196,126,165,38,58,69,28,115,39,196,126,165,38,138,133,102,1,152,139,208,196,126,165,38
    db 138,133,173,0,152,139,248,177,4,211,231,3,250,138,133,251,110,196,126,165,38,136,69,28,233,6,7,60
    db 1,116,3,233,77,1,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,85,112,196,126
    db 165,38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254,69,17,196,126,165,38,138
    db 133,173,0,152,186,10,0,247,226,139,248,139,133,89,112,196,126,165,38,59,133,176,0,115,15,138,70,230
    db 152,209,224,196,126,165,3,248,38,254,69,17,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138
    db 149,253,110,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115,34,196,126,165,38,138,133
    db 173,0,152,139,248,177,4,211,231,138,149,253,110,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17
    db 196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,254,110,138,70,230,152,209,224,196,126,165
    db 3,248,38,138,69,17,58,194,118,34,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,254
    db 110,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,138,70,230,152,139,208,196,126,165,38,138,133
    db 174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209,224,196,126,165
    db 3,248,38,138,69,17,58,194,115,46,138,70,230,152,139,208,196,126,165,38,138,133,174,0,152,139,248,209
    db 231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17
    db 233,178,5,60,2,116,3,233,222,1,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133
    db 83,112,196,126,165,38,59,133,176,0,114,15,138,70,230,152,209,224,196,126,165,3,248,38,254,77,17,196
    db 126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,85,112,196,126,165,38,59,133,176,0,115
    db 15,138,70,230,152,209,224,196,126,165,3,248,38,254,69,17,196,126,165,38,138,133,173,0,152,186,10,0
    db 247,226,139,248,139,133,87,112,196,126,165,38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3
    db 248,38,254,69,17,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,89,112,196,126,165
    db 38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254,69,17,196,126,165,38,138,133
    db 173,0,152,139,248,177,4,211,231,138,149,255,110,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17
    db 58,194,115,34,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,255,110,138,70,230,152,209
    db 224,196,126,165,3,248,38,136,85,17,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,0
    db 111,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,118,34,196,126,165,38,138,133,173,0
    db 152,139,248,177,4,211,231,138,149,0,111,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,138,70
    db 230,152,139,208,196,126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143
    db 112,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115,46,138,70,230,152,139,208,196,126
    db 165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209
    db 224,196,126,165,3,248,38,136,85,17,138,70,230,152,209,224,196,126,165,3,248,38,128,125,17,13,115,37
    db 196,126,165,38,138,133,174,0,80,191,114,6,14,87,154,36,13,37,8,116,16,138,70,230,152,209,224,196
    db 126,165,3,248,38,198,69,17,13,233,205,3,60,3,116,3,233,78,1,196,126,165,38,138,133,173,0,152
    db 186,10,0,247,226,139,248,139,133,87,112,196,126,165,38,59,133,176,0,115,16,138,70,230,152,209,224,196
    db 126,165,3,248,38,128,109,17,2,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,89
    db 112,196,126,165,38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254,77,17,196,126
    db 165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,1,111,138,70,230,152,209,224,196,126,165,3,248
    db 38,138,69,17,58,194,115,34,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,1,111,138
    db 70,230,152,209,224,196,126,165,3,248,38,136,85,17,196,126,165,38,138,133,173,0,152,139,248,177,4,211
    db 231,138,149,2,111,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,118,34,196,126,165,38
    db 138,133,173,0,152,139,248,177,4,211,231,138,149,2,111,138,70,230,152,209,224,196,126,165,3,248,38,136
    db 85,17,138,70,230,152,139,208,196,126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3
    db 250,138,149,143,112,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115,46,138,70,230,152
    db 139,208,196,126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138
    db 70,230,152,209,224,196,126,165,3,248,38,136,85,17,233,120,2,60,4,116,3,233,122,1,196,126,165,38
    db 138,133,173,0,152,186,10,0,247,226,139,248,139,133,85,112,196,126,165,38,59,133,176,0,115,15,138,70
    db 230,152,209,224,196,126,165,3,248,38,254,77,17,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139
    db 248,139,133,87,112,196,126,165,38,59,133,176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254
    db 77,17,196,126,165,38,138,133,173,0,152,186,10,0,247,226,139,248,139,133,89,112,196,126,165,38,59,133
    db 176,0,115,15,138,70,230,152,209,224,196,126,165,3,248,38,254,77,17,196,126,165,38,138,133,173,0,152
    db 139,248,177,4,211,231,138,149,3,111,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115
    db 34,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,3,111,138,70,230,152,209,224,196,126
    db 165,3,248,38,136,85,17,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,4,111,138,70
    db 230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,118,34,196,126,165,38,138,133,173,0,152,139,248
    db 177,4,211,231,138,149,4,111,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,138,70,230,152,139
    db 208,196,126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70
    db 230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115,46,138,70,230,152,139,208,196,126,165,38,138
    db 133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209,224,196,126
    db 165,3,248,38,136,85,17,233,247,0,60,5,116,3,233,240,0,196,126,165,38,138,133,173,0,152,139,248
    db 177,4,211,231,138,149,5,111,138,70,230,152,209,224,196,126,165,3,248,38,138,69,17,58,194,115,34,196
    db 126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,5,111,138,70,230,152,209,224,196,126,165,3
    db 248,38,136,85,17,196,126,165,38,138,133,173,0,152,139,248,177,4,211,231,138,149,6,111,138,70,230,152
    db 209,224,196,126,165,3,248,38,138,69,17,58,194,118,34,196,126,165,38,138,133,173,0,152,139,248,177,4
    db 211,231,138,149,6,111,138,70,230,152,209,224,196,126,165,3,248,38,136,85,17,138,70,230,152,139,208,196
    db 126,165,38,138,133,174,0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152
    db 209,224,196,126,165,3,248,38,138,69,17,58,194,115,46,138,70,230,152,139,208,196,126,165,38,138,133,174
    db 0,152,139,248,209,231,139,247,209,231,1,247,3,250,138,149,143,112,138,70,230,152,209,224,196,126,165,3
    db 248,38,136,85,17,138,70,230,152,209,224,196,126,252,3,248,38,138,85,17,138,70,230,152,209,224,196,126
    db 252,3,248,38,136,85,16,128,126,230,0,117,14,196,126,252,38,138,69,28,196,126,252,38,136,69,29,138
    db 70,230,80,176,0,80
    call pO0AA_0AE5
    db 128,126,230,5,116,3,233,69,245,196,126,252,137,126,165,140,70,167,196,126,165,38,138,133,178,0,196,126
    db 165,38,136,133,252,1,196,126,165,38,198,133,104,1,2,196,126,165,38,198,133,106,1,1,196,126,165,38
    db 198,133,108,1,2,196,126,165,38,198,133,55,1,12,198,70,224,0,198,70,225,0,196,126,165,129,199,125
    db 1,6,87,184,27,0,80
    call XR670_046E
    db 198,70,231,0,235,3,254,70,231,138,70,231,152,196,126,165,3,248,38,128,189,81,1,0,118,100,128,126
    db 231,0,117,91,196,126,165,38,198,133,125,1,2,255,118,254,255,118,252
    call pO102_0594
    db 198,70,237,1,235,3,254,70,237,138,70,237,48,228,139,248,177,4,211,231,129,199,26,101,137,126,161,140
    db 94,163,196,126,161,38,128,61,0,117,26,196,126,161,38,128,125,1,1,117,16,138,70,237,48,228,196,126
    db 165,3,248,38,198,133,178,0,1,128,126,237,126,117,191,254,70,225,128,126,231,6,117,130,196,126,165,38
    db 199,133,75,1,200,0,196,126,165,38,198,133,178,0,0,196,126,165,38,198,133,124,1,0,196,126,165,38
    db 198,133,252,1,0,255,118,254,255,118,252,176,255,80,138,70,225,80,176,1,80
    call pO0AA_36BA
    db 196,62,248,135,38,138,69,47,136,70,178,196,62,248,135,38,198,69,47,255,198,6,132,174,0,198,6,135
    db 174,1
    push cs
    call near ptr pO075_4638
    db 128,62,132,174,0,116,245,138,70,178,196,62,248,135,38,136,69,47,198,6,135,174,0,198,70,220,0,198
    db 70,179,0,198,70,231,0,235,3,254,70,231,138,70,231,152,196,62,238,156,3,248,38,128,189,81,1,0
    db 119,58,255,54,240,156,255,54,238,156
    call pO102_0BA1
    db 138,208,138,70,231,152,196,62,238,156,3,248,38,138,133,88,1,58,194,114,3,233,156,0,138,70,231,152
    db 196,62,238,156,3,248,38,128,189,88,1,0,119,3,233,135,0,128,126,220,0,116,40,141,190,169,254,22
    db 87,141,126,179,22,87,154,111,10,37,8,191,146,6,14,87,154,252,10,37,8,141,126,179,22,87,184,40
    db 0,80,154,137,10,37,8,141,190,169,253,22,87,141,126,179,22,87,154,111,10,37,8,141,190,169,254,22
    db 87,138,70,231,152,196,62,238,156,3,248,38,138,133,88,1,48,228,139,208,138,70,231,152,196,62,238,156
    db 3,248,38,138,133,81,1,48,228,3,194,80
    call pR47F_0FB2
    db 154,252,10,37,8,141,126,179,22,87,184,40,0,80,154,137,10,37,8,198,70,220,1,128,126,231,6,116
    db 3,233,33,255,141,190,169,254,22,87,141,126,179,22,87,154,111,10,37,8,191,148,6,14,87,154,252,10
    db 37,8,141,126,179,22,87,184,40,0,80,154,137,10,37,8,176,7,80,176,7,80,176,15,80,176,0,80
    db 141,126,179,22,87
    call pR47F_0354
    call pO0AA_0791
    call pO0AA_063D
    db 141,126,154,22,87,191,150,6,14,87,154,111,10,37,8,160,98,83,80
    call pO108_2254
    db 136,70,234,138,70,234,58,6,99,83,116,3,233,92,242
    call pO0AA_0041
    db 141,190,152,254,22,87,141,126,152,22,87,191,165,6,14,87,154,111,10,37,8,176,13,80,176,0,80,176
    db 15,80
    call pR47F_0711
    db 196,126,252,6,87,184,15,0,80,154,137,10,37,8,196,126,252,38,128,61,0,116,198,196,126,252,38,138
    db 69,1,80,191,182,6,14,87,154,36,13,37,8,117,178
    push cs
    call near ptr pO075_38C5
    push cs
    call near ptr pO075_3D36
    db 198,70,230,0,235,3,254,70,230,138,70,230,152,209,224,196,126,252,3,248,38,138,85,17,138,70,230,152
    db 209,224,196,126,252,3,248,38,136,85,16,128,126,230,5,117,217,196,126,252,38,138,69,28,196,126,252,38
    db 136,69,29,196,126,252,38,198,133,164,1,2,196,126,252,38,198,133,165,1,2,141,190,169,254,22,87,191
    db 214,6,14,87,154,111,10,37,8,196,126,252,6,87,154,252,10,37,8,191,220,6,14,87,154,252,10,37
    db 8,160,98,83,80
    call pO108_2254
    db 136,70,234,138,70,234,58,6,99,83,117,30,255,118,254,255,118,252,184,254,1,80,154,84,2,37,8,139
    db 70,248,139,86,250,163,238,156,137,22,240,156,235,74,255,118,254,255,118,252
    push cs
    call near ptr pO075_21EE
    db 255,118,254,255,118,252
    push cs
    call near ptr pO075_5478
    db 255,118,254,255,118,252,141,126,168,22,87,191,106,6,14,87,154,111,10,37,8
    call pO06E_0AD8
    db 255,118,254,255,118,252,184,254,1,80,154,84,2,37,8,139,70,248,139,86,250,163,238,156,137,22,240,156
  end;
end;

{ 21EE }
procedure pO075_21EE(a0: pointer);
var
  _f1: array[1..1] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  {@21F4-2202}
  if PR342_byte(a0)^.v <= 0 then
    Exit;
  asm
  db 198,70,255,1,235,3,254,70,255,138,70,255,48,228,139,248,177,4,211,231,129,199,26,101,137,126,251,140
  db 94,253,196,126,251,38,128,61,2,117,26,196,126,251,38,128,125,1,4,115,16,138,70,255,48,228,196,126
  db 6,3,248,38,198,133,178,0,1,128,126,255,126,117,191
  end;
  {@2249-229C}
  with PW2_5_21EE(a0)^ do
  begin
    if _w5_402byte > 0 then
    begin
      {@225D-2266}
      _w5_260byte := 1;
      {@2266-226F}
      _w5_262byte := 1;
      {@226F-2278}
      _w5_266byte := 1;
      {@2278-2281}
      _w5_259byte := 1;
      {@2281-228A}
      _w5_261byte := 1;
      {@228A-2293}
      _w5_263byte := 1;
      {@2293-229C}
      _w5_265byte := 1;
    end;
    {@229C-22CB}
    if _w5_403byte > 0 then
    begin
      {@22A7-22B0}
      _w5_269byte := 1;
      {@22B0-22B9}
      _w5_270byte := 1;
      {@22B9-22C2}
      _w5_296byte := 1;
      {@22C2-22CB}
      _w5_297byte := 1;
    end;
    {@22CB-22FA}
    if _w5_404byte > 0 then
    begin
      {@22D6-22DF}
      _w5_291byte := 1;
      {@22DF-22E8}
      _w5_292byte := 1;
      {@22E8-22F1}
      _w5_290byte := 1;
      {@22F1-22FA}
      _w5_289byte := 1;
    end;
    {@22FA-2317}
    if _w5_405byte > 0 then
    begin
      {@2305-230E}
      _w5_293byte := 1;
      {@230E-2317}
      _w5_295byte := 1;
    end;
    {@2317-235F}
    if _w5_407byte > 0 then
      asm
  db 198,70,255,1,235,3,254,70,255,138,70,255,48,228,139,248,177,4,211,231,129,199,26,101,137,126,247,140
  db 94,249,196,126,247,38,128,61,2,117,16,138,70,255,48,228,196,126,6,3,248,38,198,133,178,0,1,128
  db 126,255,126,117,201
      end;
  end;
end;

{ 23CA }
procedure pO075_23CA;
begin
  if false then begin
    if LV = 'Drop ' then;
    if LV = ' forever? ' then;
    if LV = 'Are you sure? ' then;
    if LV = 'You dump ' then;
    if LV = ' out back.' then;
    if LV = ' bids you farewell.' then;
    if LV = ' breathes a sigh of relief.' then;
  end;
  {@23D1-23DD}
  if pO0AA_3594 = 0 then
    Exit;
  {@23DD-24D5}
  if p9CEE <> nil then
  begin
    {@23E9-24D5}
    with PW2_4_23CA(p9CEE)^ do
    begin
if (Byte(pO108_2254('Drop ' + _w4_0string + ' forever? ', b5363)) = b5362)
          and (Byte(pO108_2254('Are you sure? ', b5363)) = b5362) then
      begin
        {@2448-249D}
        if _w4_494byte = 0 then
          pO0EC_1AAC('You dump ' + _w4_0string + ' out back.')
        else
          pO0EC_1AAC(_w4_0string + ' bids you farewell.');
        {@249D-24AA}
        pO06E_09F2(p9CEE);
        {@24AA-24B4}
        pO075_3770(0, 1);
      end
      else
        pO0EC_1AAC(_w4_0string + ' breathes a sigh of relief.');
    end;
  end;
  {@24D5-24E2}
  pO0EC_07C0(p9CEE);
end;

{ 2668 }
procedure pO075_2668;
var
c49: record case byte of 0: (v49a2: string[48]); 1: (v49a: string[40]); 2: (_p2: array[1..41] of byte;
      v8b: byte); 3: (_p3: array[1..42] of byte; v7b: byte); 4: (_p4: array[1..43] of byte;
      v6a: array[0..5] of byte) end;
  _f1: array[1..1] of byte;
  v51b: byte;
  v52b: byte;
  v53b: byte;
  v54b: byte;
  v55b: byte;
  v56b: byte;
  _f2: array[1..7] of byte;
  v64b: byte;
  v65b: byte;
  v52sb: shortint absolute v52b;
  v51sb: shortint absolute v51b;
  { 24E6 }
  procedure pO075_24E6;
  var
    w1b: byte;
    _f1: array[1..1] of byte;
  begin
    {@24EC-251E}
    for w1b := 1 to 126 do
    begin
      {@24F5-2518}
      if a651A_3981[w1b].f = 2 then
        PRA178_byte(p9CEE)^.a[w1b] := 0;
    end;
  end;

  { 2526 }
  procedure pO075_2526(b0: byte);
  begin
    if false then begin
      if LV = '%' then;
    end;
    {@252D-263A}
    case v56b of
      0..5: pO0AA_0AE5(v56b, b0);
      7: pO0EC_0BAA(p9CEE, 31, 3, b0, 0);
      6: begin
        {@2578-2623}
        if b0 <> 0 then
        begin
          {@2581-259A}
          pR47F_030B(PR0_byte(p9CEE)^.v + 1, 1, 0, 1);
          {@259A-25B1}
          pR47F_0354(1, 1, 13, 0, PR0_string(p9CEE)^.v);
          if PRA0_byte(p9CEE)^.a[v64b] = 32 then
            pR47F_0354(v64b, 1, 15, 0, '%')
          else
            pR47F_0354(v64b, 1, 15, 0, Chr(PRA0_byte(p9CEE)^.a[v64b]));
          {@2621-2623}
          Exit;
        end;
        {@2623-263A}
        pR47F_0354(1, 1, 10, 0, PR0_string(p9CEE)^.v);
      end;
    end;
  end;

begin
  if false then begin
    if LV = 'HALIBUT' then;
    if LSV = [49..57, 92] then;
  end;
  {@266F-267B}
  if pO0AA_3594 = 0 then
    Exit;
  {@267B-26FE}
if (PR370_longint(p9CEE)^.v <> 1500001) and (PR370_longint(p9CEE)^.v <> 750000)
      and (PR370_longint(p9CEE)^.v <> 500000) and (ParamStr(3) <> 'HALIBUT') then
  begin
    {@26D5-26FB}
    pR47F_0CC0(PR0_string(p9CEE)^.v + s1C2F, 14, 0);
    {@26FB-26FE}
    Exit;
  end;
  {@26FE-2703}
  bAB0C := 255;
  {@2703-2708}
  bAE86 := 1;
  {@2708-270D}
  pO0AA_0041;
  for v52b := 0 to 5 do
    c49.v6a[v52sb] := PRA17_byte(p9CEE)^.a[v52sb * 2];
  {@2735-2740}
  c49.v7b := PR28_byte(p9CEE)^.v;
  {@2740-274C}
  c49.v8b := PR178_byte(p9CEE)^.v;
  {@274C-2760}
  c49.v49a := PR0_string(p9CEE)^.v;
  {@2760-2764}
  v64b := 1;
  {@2764-2768}
  v56b := 7;
  {@2768-2770}
  pO075_2526(0);
  {@2770-2774}
  v56b := 0;
  {@2774-277C}
  pO075_2526(1);
  {@277C-2786}
  with PW27_69_2668(p9CEE)^ do
  begin
    {@2786-332A}
    repeat
      {@2786-3321}
      repeat
        {@2786-28E7}
        if v56b = 6 then
        begin
          {@278F-2793}
          v55b := 0;
          {@2793-279C}
          repeat
          until pR670_0277 <> 0;
          {@279C-27A4}
          v54b := pR670_0187;
          if v54b in [49..57, 92] then
          begin
            {@27B4-27D1}
            if v54b = 92 then
              v54b := 55
            else
              v54b := a5364_ec3f[v54b - 49];
            {@27D1-27D5}
            v55b := 1;
          end;
          {@27D5-27E7}
          if v54b = 0 then
          begin
            {@27DB-27E3}
            v54b := pR670_0187;
            {@27E3-27E7}
            v55b := 1;
          end;
          {@27E7-27F1}
          if v54b = 27 then
            v54b := 0;
          {@27F1-28B3}
          if v55b = 0 then
            case v54b of
              8: begin
                {@2801-2863}
                if v64b > 1 then
                begin
                  {@2807-2846}
                  for v65b := v64b to PR0_byte(p9CEE)^.v do
                    PRA0_byte(p9CEE)^.a[v65b - 1] := PRA0_byte(p9CEE)^.a[v65b];
                  {@2846-284D}
                  Dec(PR0_byte(p9CEE)^.v);
                  if v64b > PR0_byte(p9CEE)^.v then
                    v64b := PR0_byte(p9CEE)^.v;
                end;
              end;
              32..122: begin
                {@286D-28B3}
                if v64b <= 15 then
                begin
                  {@2873-2884}
                  PRA0_byte(p9CEE)^.a[v64b] := v54b;
                  {@2884-2887}
                  Inc(v64b);
                  if v64b > 15 then
                    v64b := 15;
                  {@2891-28B3}
                  if v64b > PR0_byte(p9CEE)^.v then
                  begin
                    {@289D-28A4}
                    Inc(PR0_byte(p9CEE)^.v);
                    {@28A4-28B3}
                    PRA0_byte(p9CEE)^.a[v64b] := 32;
                  end;
                end;
              end;
            end;
        end
        else
        begin
          {@28B5-28BD}
          pO108_00CB(3);
          {@28BD-28D5}
          v53b := pO108_1009(s2882, s2DF2, 1, 0);
          {@28D5-28DB}
          v55b := bAAE6;
          if v55b <> 0 then
            v54b := v53b;
        end;
        {@28E7-28EF}
        pO075_2526(0);
        if v55b <> 0 then
          case v54b of
            83: begin
              {@28FF-2977}
              if (v56b = 6) and (PR0_byte(p9CEE)^.v > 1) then
              begin
                {@290F-2977}
                if v64b = PR0_byte(p9CEE)^.v then
                begin
                  {@291B-2922}
                  Dec(PR0_byte(p9CEE)^.v);
                  {@2922-292C}
                  v64b := PR0_byte(p9CEE)^.v;
                end
                else
                begin
                  {@292E-2970}
                  for v65b := v64b to PR0_byte(p9CEE)^.v - 1 do
                    PRA0_byte(p9CEE)^.a[v65b] := PRA0_byte(p9CEE)^.a[v65b + 1];
                  {@2970-2977}
                  Dec(PR0_byte(p9CEE)^.v);
                end;
              end;
            end;
            80: begin
              {@297E-2983}
              bAB0C := 255;
              {@2983-2986}
              Inc(v56b);
              if v56b > 7 then
                v56b := 0;
            end;
            72: begin
              {@2997-299C}
              bAB0C := 255;
              {@299C-299F}
              Dec(v56b);
              if v56b = 255 then
                v56b := 7;
            end;
            71: begin
              {@29B0-29C4}
              if (bC5C5 <> 0) and (bAB0C <> 255) then
                v56b := bAB0C;
            end;
            27: begin
              {@29CA-29F2}
              for v52b := 0 to 5 do
                PRA17_byte(p9CEE)^.a[v52sb * 2] := c49.v6a[v52sb];
              {@29F2-29FD}
              PR28_byte(p9CEE)^.v := c49.v7b;
              {@29FD-2A09}
              PR178_byte(p9CEE)^.v := c49.v8b;
              {@2A09-2A1D}
              PR0_string_15_(p9CEE)^.v := c49.v49a2;
              {@2A1D-2A2E}
              PR508_byte(p9CEE)^.v := _w69_178byte;
              {@2A2E-2A3B}
              pO0EC_0EBF(p9CEE);
              {@2A3B-2A40}
              bAE86 := 0;
              {@2A40-2A43}
              Exit;
            end;
          end
        else
          case v53b of
            1: begin
              {@2A50-2F37}
              if v56b < 6 then
              begin
                {@2A59-2A5F}
                v52b := v56b;
                {@2A5F-2A6E}
                Dec(_w69_17r2_0[v52sb].f);
                case v52b of
                  0: begin
                    {@2A78-2AFC}
                    if _w69_28byte > 0 then
                    begin
                      {@2A82-2A89}
                      Dec(_w69_28byte);
                      {@2A89-2A98}
                      Inc(_w69_17r2_0[v52sb].f);
                    end
                    else
                    begin
                      {@2A9A-2AFC}
                      if _w69_17r2_0[v52sb].f < a6EF7_9d21[_w69_173shortint, _w69_358shortint] then
                        _w69_17r2_0[v52sb].f := a6EF7_9d21[_w69_173shortint, _w69_358shortint];
                    end;
                    {@2AFC-2B4C}
                    if _w69_17r2_0[v52sb].f < a708F_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a708F_07d2[_w69_174shortint].f;
                  end;
                  1: begin
                    {@2B56-2B9E}
                    if _w69_17r2_0[v52sb].f < a6EFD_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6EFD_3981[_w69_173shortint].f;
                    {@2B9E-2BEE}
                    if _w69_17r2_0[v52sb].f < a7090_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a7090_07d2[_w69_174shortint].f;
                  end;
                  2: begin
                    {@2BF8-2C40}
                    if _w69_17r2_0[v52sb].f < a6EFF_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6EFF_3981[_w69_173shortint].f;
                    {@2C40-2C90}
                    if _w69_17r2_0[v52sb].f < a7091_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a7091_07d2[_w69_174shortint].f;
                    {@2C90-2CA4}
                    if _w69_381byte > 0 then
                      _w69_381byte := 1;
                  end;
                  3: begin
                    {@2CAE-2CF6}
                    if _w69_17r2_0[v52sb].f < a6F01_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F01_3981[_w69_173shortint].f;
                    {@2CF6-2D46}
                    if _w69_17r2_0[v52sb].f < a7092_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a7092_07d2[_w69_174shortint].f;
                  end;
                  4: begin
                    {@2D50-2D98}
                    if _w69_17r2_0[v52sb].f < a6F03_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F03_3981[_w69_173shortint].f;
                    {@2D98-2DE8}
                    if _w69_17r2_0[v52sb].f < a7093_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a7093_07d2[_w69_174shortint].f;
                    {@2DE8-2E14}
                    if Byte(pO0AA_3975(p9CEE)) < _w69_178byte then
                      _w69_178byte := pO0AA_3975(p9CEE);
                    {@2E14-2E24}
                    _w69_508byte := _w69_178byte;
                    {@2E24-2E28}
                    v56b := 6;
                    {@2E28-2E30}
                    pO075_2526(0);
                    {@2E30-2E34}
                    v56b := 4;
                  end;
                  5: begin
                    {@2E3E-2E86}
                    if _w69_17r2_0[v52sb].f < a6F05_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F05_3981[_w69_173shortint].f;
                    {@2E86-2ED6}
                    if _w69_17r2_0[v52sb].f < a7094_07d2[_w69_174shortint].f then
                      _w69_17r2_0[v52sb].f := a7094_07d2[_w69_174shortint].f;
                  end;
                end;
              end
              else
              begin
                {@2ED8-2F37}
                if v56b = 7 then
                begin
                  {@2EDE-2EE6}
                  Dec(_w69_178byte);
                  if Byte(pO075_441E(p9CEE)) > _w69_178byte then
                    _w69_178byte := pO075_441E(p9CEE);
                  {@2F10-2F20}
                  _w69_508byte := _w69_178byte;
                end
                else
                begin
                  {@2F22-2F37}
                  if v64b = 1 then
                    v64b := PR0_byte(p9CEE)^.v
                  else
                    Dec(v64b);
                end;
              end;
            end;
            0: begin
              {@2F41-327F}
              if v56b < 6 then
              begin
                {@2F4A-2F50}
                v52b := v56b;
                {@2F50-2F5F}
                Inc(_w69_17r2_0[v52sb].f);
                case v52b of
                  0: begin
                    {@2F69-3031}
                    if _w69_17r2_0[v52sb].f > a6EF9_9d21[_w69_173shortint, _w69_358shortint] then
                    begin
                      {@2F9F-3002}
if (_w69_17r2_0[v52sb].f > 18) and ((_w69_339byte > 0) or ((_w69_340byte > 0)
                          or (_w69_341byte > 0))) and (a6EFB_9d21[_w69_173shortint,
                          _w69_358shortint] > _w69_28byte) then
                        Inc(_w69_28byte);
                      {@3002-3031}
                      _w69_17r2_0[v52sb].f := a6EF9_9d21[_w69_173shortint, _w69_358shortint];
                    end;
                  end;
                  1: begin
                    {@3038-3080}
                    if _w69_17r2_0[v52sb].f > a6EFE_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6EFE_3981[_w69_173shortint].f;
                  end;
                  2: begin
                    {@3087-30CF}
                    if _w69_17r2_0[v52sb].f > a6F00_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F00_3981[_w69_173shortint].f;
                    {@30CF-30E3}
                    if _w69_381byte > 0 then
                      _w69_381byte := 1;
                  end;
                  3: begin
                    {@30EA-3132}
                    if _w69_17r2_0[v52sb].f > a6F02_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F02_3981[_w69_173shortint].f;
                  end;
                  4: begin
                    {@313C-3184}
                    if _w69_17r2_0[v52sb].f > a6F04_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F04_3981[_w69_173shortint].f;
                    {@3184-31AE}
                    if Byte(pO075_441E(p9CEE)) > _w69_178byte then
                      _w69_178byte := pO075_441E(p9CEE);
                    {@31AE-31BE}
                    _w69_508byte := _w69_178byte;
                    {@31BE-31C2}
                    v56b := 6;
                    {@31C2-31CA}
                    pO075_2526(0);
                    {@31CA-31CE}
                    v56b := 4;
                  end;
                  5: begin
                    {@31D4-321C}
                    if _w69_17r2_0[v52sb].f > a6F06_3981[_w69_173shortint].f then
                      _w69_17r2_0[v52sb].f := a6F06_3981[_w69_173shortint].f;
                  end;
                end;
              end
              else
              begin
                {@321E-327F}
                if v56b = 7 then
                begin
                  {@3224-322C}
                  Inc(_w69_178byte);
                  if Byte(pO0AA_3975(p9CEE)) < _w69_178byte then
                    _w69_178byte := pO0AA_3975(p9CEE);
                  {@3258-3268}
                  _w69_508byte := _w69_178byte;
                end
                else
                begin
                  {@326A-327F}
                  if v64b = PR0_byte(p9CEE)^.v then
                    v64b := 1
                  else
                    Inc(v64b);
                end;
              end;
            end;
            3: begin
              {@3285-32AD}
              for v52b := 0 to 5 do
                PRA17_byte(p9CEE)^.a[v52sb * 2] := c49.v6a[v52sb];
              {@32AD-32B8}
              PR28_byte(p9CEE)^.v := c49.v7b;
              {@32B8-32C4}
              PR178_byte(p9CEE)^.v := c49.v8b;
              {@32C4-32D5}
              PR508_byte(p9CEE)^.v := _w69_178byte;
              {@32D5-32E9}
              PR0_string_15_(p9CEE)^.v := c49.v49a2;
              {@32E9-32F6}
              pO0EC_0EBF(p9CEE);
              {@32F6-32FB}
              bAE86 := 0;
              {@32FB-32FE}
              Exit;
            end;
          end;
        {@32FE-330B}
        pO0EC_0EBF(p9CEE);
        {@330B-3310}
        pO0AA_0791;
        {@3310-3318}
        pO075_2526(1);
      until v55b = 0;
    until v53b = 2;
  end;
  {@332A-3337}
  pO102_0000(p9CEE);
  if PR342_byte(p9CEE)^.v > 0 then
  begin
    {@3343-3348}
    pO075_24E6;
    {@3348-3354}
    pO075_21EE(p9CEE);
  end;
  {@3354-342E}
  with PW29_69_2668(p9CEE)^ do
  begin
    c49.v8b := 0;
    v65b := 0;
    for v51b := 0 to 6 do
    begin
      {@336F-3425}
      if _w69_337abyte[v51sb] > 0 then
      begin
        {@3383-3422}
        if _w69_337abyte[v51sb] < a6DC9_ec3f[v51sb] then
        begin
          {@339F-33FA}
          if v51b = 4 then
            Inc(c49.v8b, (_w69_337abyte[v51sb] + 1) * pO0EC_3D89(p9CEE, v51b))
          else
            Inc(c49.v8b, _w69_337abyte[v51sb] * pO0EC_3D89(p9CEE, v51b));
        end
        else
          Inc(c49.v8b, (a6DC9_ec3f[v51sb] - 1) * pO0EC_3D89(p9CEE, v51b));
        {@3422-3425}
        Inc(v65b);
      end;
    end;
    {@342E-3440}
    c49.v8b := Byte(c49.v8b div v65b);
    {@3440-345B}
    _w69_380byte := _w69_178byte - c49.v8b;
  end;
  for v52b := 0 to 5 do
    PRA16_byte(p9CEE)^.a[v52sb * 2] := PRA17_byte(p9CEE)^.a[v52sb * 2];
  {@348A-349A}
  PR29_byte(p9CEE)^.v := PR28_byte(p9CEE)^.v;
  {@349A-349F}
  bAE86 := 0;
end;

{ 34C0 }
procedure pO075_34C0;
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v20p: pointer;
  v24p: pointer;
  v26w: word;
  v27b: byte;
  _f1: array[1..1] of byte;
  v29b: byte;
  v30b: byte;
  v31b: byte;
  _f2: array[1..1] of byte;
  v26b: byte absolute v26w;
  v12b: byte absolute v12p;
  v8b: byte absolute v8p;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = '* ' then;
    if LV = 'too many rangers in party' then;
    if LV = FS then;
  end;
  {@34C7-34CB}
  v31b := 0;
  {@34CB-34DC}
  pR142_0217(1, 1, 38, 22);
  {@34DC-34E4}
  pO108_00CB(2);
  {@34E4-34FC}
  v27b := pO108_1009(s1C58, s2E1B, 0, 0);
  if (bAAE6 <> 0) and (v27b = 27) then
    v27b := 2;
  asm
  db 138,70,229,60,0,117,7,198,6,131,174,1,235,18,60,1,117,7,198,6,131,174,0,235,7,60,2,117
  db 3,233,63,2
  end;
  {@352D-353C}
  pO06E_033C(@v4b, @v8b);
  {@353C-3547}
  if v4p = nil then
    Exit;
  {@3547-354C}
  v26w := 0;
  {@354C-3558}
  v12p := v4p;
  {@3558-355C}
  v29b := 1;
  {@355C-3762}
  repeat
    {@355C-3564}
    pO108_00CB(0);
    {@3564-359D}
    v27b := pO108_1D45(s1C81, s2E44, 1, 2, 38, 22, v4p, 1, 0, @v29b, @v26b, @v12b);
    if (bAAE6 <> 0) and (v27b = 27) then
      v27b := 1;
    {@35AE-3748}
    if (v27b = 0) and (PR1_byte(v12p)^.v <> 42) then
    begin
      {@35C4-35C9}
      pO108_167D;
      {@35C9-35D8}
      GetMem(v20p, 510);
      {@35D8-35EC}
      v16p := pO108_0000(v26w, v8p);
      {@35EC-3602}
      pO06E_10BA(PR0_string(v16p)^.v, v20p, 0, 1);
      {@3602-362A}
      PR0_string_40_(v12p)^.v := '* ' + PR0_string(v12p)^.v;
      {@362A-362E}
      v30b := 0;
      if p9CF2 = nil then
      begin
        {@3637-3640}
        PR31_byte(p87F8)^.v := 0;
        {@3640-364B}
        pO06E_1EA6(v20p);
        {@364B-3653}
        pO06E_07FF(1);
      end
      else
      begin
        {@3656-3663}
        v24p := p9CF2;
        {@3663-3667}
        v31b := 0;
        {@3667-36B1}
        while (v24p <> nil) and (PR0_string(v24p)^.v <> PR0_string(v20p)^.v) do
        begin
          {@3680-368E}
          if PR327_byte(v24p)^.v < 128 then
            Inc(v30b);
          {@368E-369C}
          if PR341_byte(v24p)^.v > 0 then
            Inc(v31b);
          {@369C-36AF}
          v24p := PR483_pointer(v24p)^.v;
        end;
        {@36B1-3748}
if (v24p = nil) and ((PR327_byte(v20p)^.v < 128) and (v30b < 6) or (PR327_byte(v20p)^.v > 127)
            and (PR31_byte(p87F8)^.v < 8)) and ((PR341_byte(v20p)^.v = 0) or (v31b < 3)) then
        begin
          {@36F1-36FC}
          pO06E_1EA6(v20p);
          {@36FC-3704}
          pO06E_07FF(1);
          if PR327_byte(v20p)^.v < 128 then
            Inc(v30b);
        end
        else
        begin
          {@3714-3739}
          if (PR341_byte(v20p)^.v > 0) and (v31b > 2) then
            pO0EC_1AAC('too many rangers in party');
          {@3739-3748}
          FreeMem(v20p, 510);
        end;
      end;
    end;
  until (v27b = 1) or (v30b > 5) or (PR31_byte(p87F8)^.v > 7);
  {@3762-376C}
  pO108_2363(@v4b);
end;

{ 3770 }
procedure pO075_3770(a0: byte; a1: byte);
var
  v4p: pointer;
begin
  {@3776-3782}
  if p9CF2 = nil then
    Exit;
  {@3782-378F}
  v4p := p9CF2;
  if v4p <> p9CEE then
  begin
    {@37A4-37E1}
    while (PR483_pointer(v4p)^.v <> p9CEE) and (PR483_pointer(v4p)^.v <> nil) do
      v4p := PR483_pointer(v4p)^.v;
    {@37E1-3844}
    if PR483_pointer(v4p)^.v <> nil then
    begin
      {@37F0-3805}
      if a1 <> 0 then
        pO13E_0101(PR412_byte(p9CEE)^.v);
      {@3805-3820}
      PR483_pointer(v4p)^.v := PR483_pointer(p9CEE)^.v;
      {@3820-3829}
      pO075_0015(@b9CEE);
      {@3829-3836}
      p9CEE := v4p;
      if a0 = 0 then
        Dec(PR31_byte(p87F8)^.v);
    end;
  end
  else
  begin
    {@3846-385B}
    if a1 <> 0 then
      pO13E_0101(PR412_byte(p9CEE)^.v);
    {@385B-3870}
    p9CF2 := PR483_pointer(p9CEE)^.v;
    {@3870-3884}
    v4p := PR483_pointer(p9CEE)^.v;
    {@3884-388D}
    pO075_0015(@b9CEE);
    {@388D-389A}
    p9CEE := v4p;
    if a0 = 0 then
      Dec(PR31_byte(p87F8)^.v);
  end;
  {@38A8-38BF}
  if p9CEE = nil then
    p9CEE := p9CF2;
end;

{ 38C5 }
procedure pO075_38C5;
begin
  {@38CB-3936}
  with PW0_4_38C5(p9CEE)^ do
  begin
    if _w4_173byte = 4 then
      _w4_410byte := 3
    else
    begin
      {@38EB-3936}
      if _w4_358byte = 1 then
      begin
        {@38F6-3915}
        if _w4_413byte = 2 then
          _w4_410byte := 9
        else
          _w4_410byte := 7;
      end
      else
      begin
        {@3917-3936}
        if _w4_413byte = 2 then
          _w4_410byte := 5
        else
          _w4_410byte := 0;
      end;
    end;
    {@3936-394C}
    if _w4_337byte > 0 then
    begin
      {@3941-394A}
      _w4_411byte := 23;
      {@394A-394C}
      Exit;
    end;
    {@394C-3962}
    if _w4_341byte > 0 then
    begin
      {@3957-3960}
      _w4_411byte := 1;
      {@3960-3962}
      Exit;
    end;
    {@3962-3983}
    if (_w4_340byte > 0) or (_w4_339byte > 0) then
    begin
      {@3978-3981}
      _w4_411byte := 24;
      {@3981-3983}
      Exit;
    end;
    {@3983-3999}
    if _w4_342byte > 0 then
    begin
      {@398E-3997}
      _w4_411byte := 29;
      {@3997-3999}
      Exit;
    end;
    {@3999-39A2}
    _w4_411byte := 5;
  end;
end;

{ 3D36 }
procedure pO075_3D36;
var
  _f1: array[1..1] of byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  _f2: array[1..6] of byte;
  _v14: byte;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  v20b: byte;
  v21b: byte;
  _f3: array[1..256] of byte;
  v14a: X6 absolute _v14;
  { 39A6 }
  procedure pO075_39A6(b0: byte);
  var
    w1b: byte;
    w2b: byte;
  begin
    {@39AC-39B6}
    v7b := b0;
    {@39B6-39C7}
    pO108_00CB(a09B7_ec3f[b0]);
    case b0 of
      3: begin
        {@39CE-39E2}
        if v16b <> 0 then
          w1b := 2
        else
          w1b := 3;
        {@39E2-3A0C}
        for w2b := w1b to 6 do
          aAB0E_71c0[w2b].f := w2b + 1;
        {@3A0C-3A11}
        bAB1C := 255;
      end;
      4: begin
        {@3A17-3A2D}
        if PR413_byte(p9CEE)^.v = 2 then
          w1b := 1
        else
          w1b := 0;
        {@3A2D-3A57}
        for w2b := w1b to 2 do
          aAB0E_71c0[w2b].f := w2b + 1;
        {@3A57-3A5C}
        bAB14 := 255;
      end;
    end;
  end;

  { 3A62 }
  procedure pO075_3A62(b0: byte; b1: byte);
  begin
    {@3A65-3A99}
    pR1C3_1AF7(b0 * 3, b1 * 24, 12, 24, 0, g3DC0_87e6, p8836);
    {@3A99-3AAF}
    pO13E_04B3(b0, b1, 0, 0, 28);
    {@3AAF-3ACA}
    pO13E_04B3(b0 + 3, b1, 0, 0, 28);
    {@3ACA-3AE0}
    pO13E_04B3(b0, b1, 0, 0, 12);
    {@3AE0-3AFB}
    pO13E_04B3(b0 + 3, b1, 0, 1, 12);
    {@3AFB-3B00}
    pR1C3_10FD;
  end;

  { 3B04 }
  procedure pO075_3B04(b0: byte; b1: byte; b2: byte);
  var
    w1b: byte;
    w18a: array[0..16] of byte;
    w34a: array[0..15] of byte;
    w36w: word;
    w18a2: B16 absolute w18a;
    w34a2: B16 absolute w34a;
  begin
    {@3B0A-3B20}
    w36w := PR18_word(a9DC4_7c92[b1].f)^.v;
    {@3B20-3B62}
    Move(PR27_byte(a9DC4_7c92[b0].f)^.v, PR27_byte(a9DC4_7c92[b1].f)^.v, PR18_word(a9DC4_7c92[b1].f)^.v);
    {@3B62-3BA4}
    Move(PR27_byte(a9DC8_7c92[b0].f)^.v, PR27_byte(a9DC8_7c92[b1].f)^.v, PR18_word(a9DC8_7c92[b1].f)^.v);
    if PR23_pointer(a9DC4_7c92[b0].f)^.v <> nil then
  Move(PR0_byte(PR23_pointer(a9DC4_7c92[b0].f)^.v)^.v, PR0_byte(PR23_pointer(a9DC4_7c92[b1].f)^.v)^.v,
          w36w);
    {@3BEF-3C3A}
    if PR23_pointer(a9DC8_7c92[b0].f)^.v <> nil then
  Move(PR0_byte(PR23_pointer(a9DC8_7c92[b0].f)^.v)^.v, PR0_byte(PR23_pointer(a9DC8_7c92[b1].f)^.v)^.v,
          w36w);
    {@3C3A-3C43}
    if b2 = 0 then
      Exit;
    {@3C43-3C76}
    with PW9_40_3B04(p9CEE)^ do
    begin
      for w1b := 0 to 15 do
      begin
        {@3C56-3C63}
        w18a[w1b] := w1b;
        {@3C63-3C70}
        w34a[w1b] := w1b;
      end;
      {@3C76-3CD9}
      for w1b := 1 to 6 do
      begin
        {@3C7F-3CA4}
        w34a[a6DDD_ec3f[w1b]] := _w40_413abyte[w1b] and 15;
        {@3CA4-3CD3}
        w34a[a6DDD_ec3f[w1b] + 8] := _w40_413abyte[w1b] and 240 shr 4;
      end;
    end;
    {@3CD9-3D01}
    pR1C3_1421(w18a2, w34a2, 0, 0, pointer(a9DC4_7c92[b1].f));
    {@3D01-3D29}
    pR1C3_1421(w18a2, w34a2, 0, 0, pointer(a9DC8_7c92[b1].f));
  end;

begin
  if false then begin
    if LV = 'COMSPR' then;
  end;
  {@3D3D-3D58}
  pO13E_0182('COMSPR', 15, 28);
  {@3D58-3D6A}
  pR1C3_1F24(64, 32, gD51E_9554);
  {@3D6A-3D72}
  pR142_00D4(0);
  {@3D72-4393}
  repeat
    {@3D72-3D7A}
    pO06E_07FF(0);
    {@3D7A-3E70}
    with PW515_281_3D36(p9CEE)^ do
    begin
      pO075_39A6(1);
      v14a := _w281_414X6;
      v6b := _w281_412byte;
      _w281_412byte := 12;
      pO06E_07FF(0);
      _w281_412byte := v6b;
      v3b := _w281_410byte;
      v4b := _w281_411byte;
      v5b := _w281_413byte;
      pO075_3B04(_w281_412byte, 12, 1);
      pO075_3A62(1, 2);
      pR47F_0354(8, 6, 15, 0, s1D25);
      pR47F_0354(3, 10, 15, 0, s1CD3);
      pR47F_0354(8, 12, 15, 0, s1CFC);
      pR47F_0354(3, 16, 15, 0, s1CD3);
      v21b := 0;
      {@3E70-4309}
      repeat
        {@3E70-3E7B}
        pO075_3A62(1, 4);
        {@3E7B-3EA0}
        v2b := pO108_1009(s278C, a3191_738a[v7b], 0, 0);
        if bAAE6 = 0 then
          case v7b of
            1: begin
              {@3EB1-3EB5}
              v19b := 1;
              case v2b of
                0: pO075_39A6(2);
                1: begin
                  {@3ECA-3ECE}
                  v16b := 0;
                  {@3ECE-3ED6}
                  pO075_39A6(3);
                end;
                2: begin
                  {@3EDC-3EE0}
                  v16b := 1;
                  {@3EE0-3EE8}
                  pO075_39A6(3);
                end;
                3: pO075_39A6(4);
                4: v21b := 1;
              end;
            end;
            2: begin
              {@3F07-3F0B}
              v19b := 2;
              if (v2b = 2) or (bAAE6 <> 0) and (v2b = 27) then
                pO075_39A6(1)
              else
              begin
                {@3F28-3F2E}
                v20b := v2b;
                {@3F2E-3F36}
                pO075_39A6(5);
              end;
            end;
            3: begin
              {@3F3D-3F41}
              v19b := 3;
              if (bAAE6 <> 0) and (v2b = 27) then
                v2b := 7;
              {@3F52-3F56}
              v7b := 5;
              case v2b of
                0: v15b := 6;
                1: v15b := 1;
                2, 3: v15b := 4;
                4: v15b := 5;
                5: v15b := 2;
                6: v15b := 3;
                7: begin
                  {@3F9D-3FA1}
                  v15b := 1;
                  {@3FA1-3FA5}
                  v7b := 1;
                end;
              end;
              {@3FA5-3FAE}
              pO075_39A6(v7b);
            end;
            4: begin
              {@3FB8-3FC9}
              if (bAAE6 <> 0) and (v2b = 27) then
                v2b := 3;
              {@3FC9-403E}
              case v2b of
                0: begin
                  {@3FD0-3FDA}
                  _w281_413byte := 1;
                  {@3FDA-3FE2}
                  pO06E_07FF(0);
                  {@3FE2-3FEA}
                  pO075_39A6(4);
                end;
                1: begin
                  {@3FF0-3FFA}
                  _w281_413byte := 2;
                  {@3FFA-4002}
                  pO06E_07FF(0);
                  {@4002-400A}
                  pO075_39A6(4);
                end;
                2: begin
                  {@4010-401C}
                  v5b := _w281_413byte;
                  {@401C-4024}
                  pO075_39A6(1);
                end;
                3: begin
                  {@402A-4036}
                  _w281_413byte := v5b;
                  {@4036-403E}
                  pO075_39A6(1);
                end;
              end;
              {@403E-4046}
              pO06E_07FF(0);
            end;
            5: case v19b of
                2: begin
                  {@405A-406B}
                  if (bAAE6 <> 0) and (v2b = 27) then
                    v2b := 3;
                  {@406B-41B1}
                  case v20b of
                    0: begin
                      {@4075-4106}
                      case v2b of
                        0: begin
                          {@407C-409D}
                          if _w281_410byte < 13 then
                            Inc(_w281_410byte)
                          else
                            _w281_410byte := 0;
                        end;
                        1: begin
                          {@40A3-40C4}
                          if _w281_410byte > 0 then
                            Dec(_w281_410byte)
                          else
                            _w281_410byte := 13;
                        end;
                        2: begin
                          {@40CA-40D6}
                          with PW509_285_3D36(p9CEE)^ do
                          begin
                            {@40D6-40E2}
                            v3b := _w285_410byte;
                          end;
                          {@40E2-40EB}
                          pO075_39A6(v19b);
                        end;
                        3: begin
                          {@40F1-40FD}
                          _w281_410byte := v3b;
                          {@40FD-4106}
                          pO075_39A6(v19b);
                        end;
                      end;
                      {@4106-410E}
                      pO06E_07FF(0);
                    end;
                    1: begin
                      {@4118-41A9}
                      case v2b of
                        0: begin
                          {@411F-4140}
                          if _w281_411byte < 31 then
                            Inc(_w281_411byte)
                          else
                            _w281_411byte := 0;
                        end;
                        1: begin
                          {@4146-4167}
                          if _w281_411byte > 0 then
                            Dec(_w281_411byte)
                          else
                            _w281_411byte := 31;
                        end;
                        2: begin
                          {@416D-4179}
                          with PW513_285_3D36(p9CEE)^ do
                          begin
                            {@4179-4185}
                            v4b := _w285_411byte;
                          end;
                          {@4185-418E}
                          pO075_39A6(v19b);
                        end;
                        3: begin
                          {@4194-41A0}
                          _w281_411byte := v4b;
                          {@41A0-41A9}
                          pO075_39A6(v19b);
                        end;
                      end;
                      {@41A9-41B1}
                      pO06E_07FF(0);
                    end;
                  end;
                end;
                3: begin
                  {@41BB-41D0}
                  v17b := _w281_413abyte[v15b] and 15;
                  {@41D0-41EC}
                  v18b := _w281_413abyte[v15b] and 240 shr 4;
                  if (bAAE6 <> 0) and (v2b = 27) then
                    v2b := 3;
                  {@41FD-42EB}
                  case v2b of
                    0: begin
                      {@4204-422C}
                      if v16b <> 0 then
                        v18b := Byte((v18b + 1) mod 16)
                      else
                        v17b := Byte((v17b + 1) mod 16);
                      {@422C-4251}
                      _w281_413abyte[v15b] := v18b shl 4 + v17b;
                    end;
                    1: begin
                      {@4258-4278}
                      if v16b <> 0 then
                        v18b := (v18b - 1) and 15
                      else
                        v17b := (v17b - 1) and 15;
                      {@4278-429D}
                      _w281_413abyte[v15b] := v18b shl 4 + v17b;
                    end;
                    2: begin
                      {@42A3-42BB}
                      v14a := _w281_414X6;
                      {@42BB-42C4}
                      pO075_39A6(v19b);
                    end;
                    3: begin
                      {@42CA-42E2}
                      _w281_414X6 := v14a;
                      {@42E2-42EB}
                      pO075_39A6(v19b);
                    end;
                  end;
                end;
              end;
          end;
        {@42EB-4300}
        pO075_3B04(_w281_412byte, 12, 1);
      until v21b <> 0;
      {@4309-4315}
      _w281_410byte := v3b;
      {@4315-4321}
      _w281_411byte := v4b;
      {@4321-432D}
      _w281_413byte := v5b;
      {@432D-4345}
      _w281_414X6 := v14a;
      {@4345-435A}
      pO075_3B04(_w281_412byte, 12, 1);
      {@435A-436F}
      pO075_3B04(12, _w281_412byte, 0);
    end;
    {@436F-4374}
    pO108_167D;
    {@4374-437C}
    pO13E_0101(12);
  until Byte(pO108_2254(s1D4E, b5362)) = b5362;
  {@4393-439B}
  pO13E_0101(28);
end;

{ 439F }
function pO075_439F(a0: pointer; a1: byte): shortint;
var
  v2b: byte;
  _f1: array[1..2] of byte;
  v2sb: shortint absolute v2b;
begin
  {@43A5-43A9}
  v2b := 0;
  {@43A9-43BB}
  Inc(v2b, a719C_ec3f[PR25_byte(a0)^.v]);
  if (a1 = 2) or (a1 = 4) or (a1 = 3) then
    case PR25_byte(a0)^.v of
      17: Inc(v2b);
      18: Inc(v2b, 2);
      19, 20: Inc(v2b, 3);
      21..23: Inc(v2b, 4);
      24, 25: Inc(v2b, 5);
    end;
  {@440F-4415}
  pO075_439F := v2sb;
end;

{ 441E }
function pO075_441E(a0: pointer): byte;
var
  v2b: byte;
  v4w: word;
  v6w: word;
  v7b: byte;
  v8b: byte;
  v7sb: shortint absolute v7b;
  v6b: byte absolute v6w;
begin
  {@4424-4575}
  with PW0_12_441E(a0)^ do
  begin
    v4w := 0;
    v2b := 0;
    v6w := 0;
    for v7b := 0 to 6 do
    begin
      {@4444-456C}
      if _w12_337abyte[v7sb] > 0 then
      begin
        {@4458-456C}
        if _w12_337abyte[v7sb] < a6DC9_ec3f[v7sb] then
        begin
          {@4474-4487}
          Inc(v6w, _w12_337abyte[v7sb]);
          {@4487-448A}
          Inc(v2b);
          if v7b = 4 then
            Inc(v6w);
          {@4493-44B9}
          Inc(v4w, _w12_337abyte[v7sb] * pO075_439F(pointer(a0), v7b));
        end
        else
        begin
          {@44BC-44BF}
          Inc(v2b);
          {@44BF-44E3}
          v8b := _w12_337abyte[v7sb] - a6DC9_ec3f[v7sb] + 1;
          case v7b of
            0: Inc(v6w, v8b * 2 + 9);
            2, 3: Inc(v6w, v8b * 3 + 9);
            4: Inc(v6w, v8b * 2 + 11);
            5: Inc(v6w, v8b + 11);
            6: Inc(v6w, v8b * 2 + 10);
          end;
          {@4549-456C}
          Inc(v4w, (a6DC9_ec3f[v7sb] - 1) * pO075_439F(pointer(a0), v7b));
        end;
      end;
    end;
  end;
  asm
  db 131,126,252,0,126,21,138,70,254,48,228,139,200,139,70,250,3,70,252,153,247,249,137,70,250,235,16,138
  db 70,254,48,228,139,200,139,70,250,153,247,249,137,70,250
  end;
  {@45A0-45A6}
  pO075_441E := v6b;
end;

{ 4638 }
procedure pO075_4638;
var
  v1b: byte;
  v5l: longint;
  v9l: longint;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  _f1: array[1..5] of byte;
  v18b: byte;
  _f2: array[1..2] of byte;
  v21b: byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  v25b: byte;
  v27w: word;
  v28b: byte;
  _f3: array[1..2] of byte;
  v34l: longint;
  _f4: array[1..1] of byte;
  v36sb: shortint;
  _f5: array[1..3] of byte;
  v40b: byte;
  v27b: byte absolute v27w;
  v18sb: shortint absolute v18b;
begin
  if false then begin
    if LV = 'we only train conscious people' then;
    if LV = 'Not Enough Experience' then;
    if LV = ' will become:' then;
    if LV = '    a level ' then;
    if LV = ' ' then;
    if LV = 'and a level ' then;
    if LV = 'Do you wish to train? ' then;
    if LV = 'Congratulations...' then;
  end;
  {@463F-4652}
  if (bAE87 = 0) and (pO0AA_3594 = 0) then
    Exit;
  {@4652-467B}
  if PR493_byte(p9CEE)^.v <> 0 then
  begin
    {@465E-4678}
    pR47F_0CC0('we only train conscious people', 14, 0);
    {@4678-467B}
    Exit;
  end;
  {@467B-467F}
  v10b := 0;
  {@467F-4683}
  v11b := 0;
  {@4683-468B}
  v5l := 0;
  with PW6_44_4638(p9CEE)^ do
  begin
    v5l := 0;
    for v18b := 0 to 6 do
    begin
      {@46A6-498D}
      if _w44_337abyte[v18sb] > 0 then
      begin
        {@46BA-46C7}
        Inc(v11b, a6DB9_ec3f[v18sb]);
        {@46C7-46CB}
        v1b := 0;
        {@46CB-46DC}
        v24b := _w44_337abyte[v18sb];
        case _w44_173byte of
          2: begin
            {@46E8-4718}
if (v18b = 2) and ((v24b = 9) or (v24b = 8) and (_w44_17byte = 17) or (v24b = 7)
                and (_w44_17byte < 17)) then
              v1b := 1;
          end;
          0: begin
            {@471F-474F}
if (v18b = 2) and ((v24b = 7) or (v24b = 6) and (_w44_17byte = 17) or (v24b = 5)
                and (_w44_17byte < 17)) then
              v1b := 1;
            {@474F-477F}
if (v18b = 5) and ((v24b = 11) or (v24b = 9) and (_w44_19byte < 17) or (v24b = 10)
                and (_w44_19byte = 17)) then
              v1b := 1;
          end;
          3: begin
            {@4786-47A6}
            if (v18b = 2) and ((v24b = 6) or (v24b = 5) and (_w44_17byte < 18)) then
              v1b := 1;
            {@47A6-47B6}
            if (v18b = 0) and (v24b >= 7) then
              v1b := 1;
          end;
          1: begin
            {@47BD-4835}
            if (v18b = 0) and (v24b = 5) then
              v1b := 1
            else
            begin
              {@47CF-4805}
if ((v18b = 2) or (v18b = 4)) and ((v24b = 8) or (v24b = 7) and (_w44_17byte = 17)
                  or (v24b = 6) and (_w44_17byte < 17)) then
                v1b := 1;
              {@4805-4835}
if (v18b = 5) and ((v24b = 8) or (v24b = 7) and (_w44_19byte = 17) or (v24b = 6)
                  and (_w44_19byte < 17)) then
                v1b := 1;
            end;
          end;
          4: begin
            {@483B-486B}
if (v18b = 2) and ((v24b = 6) or (v24b = 5) and (_w44_17byte = 17) or (v24b = 4)
                and (_w44_17byte < 17)) then
              v1b := 1;
          end;
        end;
        {@486B-4875}
        if v24b = 40 then
          v1b := 1;
        asm
  db 128,126,255,0,116,3,233,15,1,255,54,240,156,255,54,238,156,138,70,232,254,192,80,138,70,238,80
  call pO102_12D1
  db 196,126,212,38,59,149,116,1,124,15,126,3,233,233,0,38,59,133,114,1,118,3,233,223,0,138,70,238
  db 152,139,248,138,133,185,109,0,70,246,255,54,240,156,255,54,238,156,138,70,232,254,192,254,192,80,138,70
  db 238,80
  call pO102_12D1
  db 137,70,247,137,86,249,198,70,221,0,235,3,254,70,221,138,70,221,152,196,126,212,3,248,38,128,189,81
  db 1,0,118,86,255,54,240,156,255,54,238,156,138,70,221,152,196,126,212,3,248,38,138,133,81,1,254,192
  db 80,138,70,221,80
  call pO102_12D1
  db 59,86,249,127,7,124,45,59,70,247,118,40,255,54,240,156,255,54,238,156,138,70,221,152,196,126,212,3
  db 248,38,138,133,81,1,254,192,80,138,70,221,80
  call pO102_12D1
  db 137,70,247,137,86,249,128,126,221,6,117,144,196,126,212,38,139,133,114,1,38,139,149,116,1,59,86,249
  db 127,7,124,41,59,70,247,114,36,139,70,247,139,86,249,59,86,253,127,7,124,23,59,70,251,118,18,139
  db 70,247,139,86,249,45,1,0,131,218,0,137,70,251,137,86,253
        end;
      end;
    end;
    {@4996-4AA1}
    if bAE87 = 0 then
    begin
      {@49A0-49A8}
      v34l := 0;
      {@49A8-49B0}
      v9l := 0;
      for v18b := 0 to 6 do
        asm
  db 138,70,238,152,139,248,138,133,185,109,34,70,246,8,192,116,70,255,54,240,156,255,54,238,156,138,70,232
  db 254,192,80,138,70,238,80
  call pO102_12D1
  db 59,86,224,127,7,124,40,59,70,222,118,35,255,54,240,156,255,54,238,156,138,70,232,254,192,80,138,70
  db 238,80
  call pO102_12D1
  db 137,70,222,137,86,224,138,70,238,136,70,220
        end;
      {@4A16-4AA1}
      if v34l > 0 then
      begin
        {@4A27-4A37}
        v10b := a6DB9_ec3f[v36sb] or v10b;
        asm
  db 255,54,240,156,255,54,238,156,138,70,232,254,192,254,192,80,138,70,220,80
  call pO102_12D1
  db 137,70,247,137,86,249
        end;
        if (v9l > 0) and (_w44_370longint >= v9l) and (v9l > v5l) then
          v5l := v9l - 1;
      end;
    end;
    {@4AA1-4AC9}
    if (v5l > 0) and (bAE87 = 0) then
      _w44_370longint := v5l;
    {@4AC9-4AF8}
    if v10b = 0 then
    begin
      {@4ACF-4AD4}
      bAE84 := 1;
      if bAE87 = 0 then
        pR47F_0CC0('Not Enough Experience', 14, 0);
      {@4AF5-4AF8}
      Exit;
    end;
    {@4AF8-4C9A}
    if bAE87 = 0 then
    begin
      {@4B02-4B13}
      pR142_0217(1, 1, 38, 22);
      {@4B13-4B17}
      v21b := 4;
      {@4B17-4B2E}
      pO0EC_1C22(p9CEE, 4, v21b, 0);
      {@4B2E-4B58}
      pR47F_0354(_w44_0byte + 4, v21b, 10, 0, ' will become:');
      for v18b := 0 to 6 do
      begin
        {@4B61-4C5C}
        if (_w44_337abyte[v18sb] > 0) and ((a6DB9_ec3f[v18sb] and v10b) > 0) then
        begin
          {@4B89-4B8C}
          Inc(v21b);
          if v21b = 5 then
pR47F_0354(6, v21b, 10, 0, '    a level ' + pR47F_0FB2(_w44_337abyte[v18sb] + 1) + ' '
                + a0E57_b7cc[v18sb])
          else
pR47F_0354(6, v21b, 10, 0, 'and a level ' + pR47F_0FB2(_w44_337abyte[v18sb] + 1) + ' '
                + a0E57_b7cc[v18sb]);
        end;
      end;
      {@4C65-4C86}
      if Byte(pO108_2254('Do you wish to train? ', b5362)) <> b5362 then
        Exit;
      {@4C86-4C9A}
      pO0EC_1AAC('Congratulations...');
    end;
    {@4C9A-4C9E}
    v12b := 0;
    {@4C9E-4CA9}
    v22b := _w44_342byte;
    {@4CA9-4CB4}
    v23b := _w44_341byte;
    {@4CB4-4CBD}
    _w44_379byte := 0;
    for v18b := 0 to 6 do
    begin
      {@4CC6-4CF9}
      if _w44_337abyte[v18sb] > 0 then
      begin
        {@4CD7-4CDA}
        Inc(v12b);
        if (a6DB9_ec3f[v18sb] and v10b) > 0 then
          Inc(_w44_337abyte[v18sb]);
      end;
    end;
    {@4CFF-4D0C}
    pO102_02F5(p9CEE);
    if bAE87 = 0 then
    begin
      {@4D16-4D6D}
      if (_w44_342byte > v22b) or (_w44_341byte > 8) then
      begin
        {@4D2E-4D33}
        v27w := 65535;
        {@4D33-4D57}
        repeat
          {@4D33-4D4B}
          v25b := pO0AA_30F3(4, 4, @v27b, @v28b);
        until (v25b > 0) or (v28b = 0);
        {@4D57-4D6D}
        if v25b > 0 then
          _w44_178abyte[v25b] := 1;
      end;
      {@4D6D-4DFA}
      if pO102_0C12(p9CEE) <> 0 then
      begin
        {@4D7E-4DBC}
        if (PR348_byte(p9CEE)^.v > 0) and (pO0EC_27C1(p9CEE, 105, @v40b) = 0) then
          pO0E2_13E5(p9CEE, 105, 0, 255, 0);
        {@4DBC-4DFA}
        if (PR347_byte(p9CEE)^.v > 0) and (pO0EC_27C1(p9CEE, 8, @v40b) = 0) then
          pO0E2_13E5(p9CEE, 8, 0, 255, 0);
      end;
    end;
    {@4DFA-4E24}
    if _w44_312byte > _w44_313byte then
      pO0AA_36BA(p9CEE, v10b, v12b, 1);
    {@4E24-4E39}
    _w44_492byte := pO0EC_38FA(p9CEE);
  end;
end;

{ 4E86 }
procedure pO075_4E86;
var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v13w: word;
  _f1: array[1..6] of byte;
  v23p: pointer;
  v279a: text;
  v535a: text;
  v536b: byte;
  _f2: array[1..512] of byte;
  v1304a: string;
  v2072a: array[1..2] of string[255];
  v1857a: string[40];
  v1898a: string[40];
  v1939a: string[40];
  _f3: array[1..1] of byte;
  v1980a: array[1..1] of string[40] absolute v1939a;
  v23b: byte absolute v23p;
  v13b: byte absolute v13w;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'krynn.cfg' then;
    if LV = 'mouse ON' then;
    if LV = 'mouse OFF' then;
    if LV = 'joystick ON' then;
    if LV = 'joystick OFF' then;
    if LV = 'disable both' then;
    if LV = 'M' then;
    if LV = 'N' then;
    if LV = 'J' then;
  end;
  {@4E8D-4E9B}
  pO108_22B0(3, @v4b);
  {@4E9B-4E9F}
  v11b := 1;
  {@4E9F-4EA3}
  v9b := 0;
  {@4EA3-4EAF}
  v23p := v4p;
  {@4EAF-4EB4}
  v13w := 0;
  {@4EB4-546A}
  repeat
    {@4EB4-4EC4}
    Assign(v279a, 'krynn.cfg');
    {@4EC4-4ECF}
    Reset(v279a);
    for v536b := 1 to 5 do
      ReadLn(v279a, v2072a[v536b]);
    {@4F07-4F12}
    Close(v279a);
    if bC5C4 <> 0 then
      v1939a := 'mouse ON'
    else
      v1939a := 'mouse OFF';
    {@4F43-4F74}
    if bC60C <> 0 then
      v1898a := 'joystick ON'
    else
      v1898a := 'joystick OFF';
    {@4F74-4F88}
    v1857a := 'disable both';
    {@4F88-4F94}
    v8p := v4p;
    for v536b := 1 to 3 do
    begin
      {@4F9F-4FC0}
      PR0_string_40_(v8p)^.v := v1980a[v536b];
      {@4FC0-4FC8}
      PR41_byte(v8p)^.v := 0;
      {@4FC8-4FD9}
      v8p := PR42_pointer(v8p)^.v;
    end;
    {@4FE0-4FE4}
    v11b := 1;
    {@4FE4-4FEC}
    pO108_00CB(0);
    {@4FEC-5025}
    v10b := pO108_1D45(s28AB, s2B8D, 9, 12, 38, 22, v4p, 1, 0, @v11b, @v13b, @v23b);
    if v10b = 0 then
      case v13w of
        0: begin
          {@5039-5046}
          bC5C4 := Ord(bC5C4 = 0);
          {@5046-5056}
          Assign(v535a, 'krynn.cfg');
          {@5056-5061}
          Rewrite(v535a);
          if bC5C4 <> 0 then
          begin
            {@506B-5070}
            bC5C3 := 1;
            {@5070-5075}
            bC5C6 := 0;
            {@5075-507A}
            pR6DD_0000;
            if bC5C4 <> 0 then
            begin
              asm
  db 184,14,125,140,218,163,207,197,137,22,209,197,49,192,80,49,192,80,255,54,209,197,255,54,207,197
  call pR6DD_0107
  db 198,6,194,197,1,184,127,2,80,184,100,0,80
  call pR6DD_00C9
  db 141,126,241,22,87,141,126,239,22,87,141,126,237,22,87
  call pR6DD_0072
  db 129,126,239,65,1,176,0,124,1,64,8,192,176,0,117,1,64,162,194,197,198,6,12,198,0
  call pR6DD_0030
  db 191,128,78,14,87,141,190,232,250,22,87,184,255,0,80,154,137,10,37,8,198,134,232,253,1,235,4,254
  db 134,232,253,141,190,233,253,22,87,138,134,232,253,48,228,139,248,177,8,211,231,141,187,232,247,22,87,49
  db 192,80,154,196,8,37,8,154,245,7,37,8,128,190,232,253,5,117,208
              end;
              {@5132-515A}
              for v536b := 0 to 13 do
                WriteLn(v535a, Chr(48));
              {@515A-5165}
              Close(v535a);
              {@5165-516B}
              wC5C7 := 160;
              {@516B-5171}
              wC5C9 := 100;
              asm
  db 49,192,163,203,197,49,192,163,205,197
              end;
            end;
          end;
          {@517B-5212}
          if bC5C4 = 0 then
          begin
            {@5185-5199}
            v1304a := 'N';
            for v536b := 1 to 5 do
              WriteLn(v535a, v2072a[v536b]);
            {@51D0-51F8}
            for v536b := 0 to 13 do
              WriteLn(v535a, Chr(48));
            {@51F8-5203}
            Close(v535a);
            {@5203-5208}
            bC5C4 := 1;
            {@5208-520D}
            pR6DD_0051;
            {@520D-5212}
            bC5C4 := 0;
          end;
        end;
        1: begin
          {@521D-522A}
          bC60C := Ord(bC60C = 0);
          {@522A-523A}
          Assign(v535a, 'krynn.cfg');
          {@523A-5245}
          Rewrite(v535a);
          if bC60C <> 0 then
          begin
            {@524F-5253}
            pO075_5700;
            if bC60C <> 0 then
            begin
              {@525D-5271}
              v1304a := 'J';
              for v536b := 1 to 5 do
                WriteLn(v535a, v2072a[v536b]);
              {@52A8-5304}
              for v536b := 0 to 6 do
              begin
                {@52B3-52D8}
                WriteLn(v535a, aC5D4_2fc5[v536b]);
                {@52D8-52FD}
                WriteLn(v535a, aC5E2_2fc5[v536b]);
              end;
              {@5304-530F}
              Close(v535a);
              if bC60C <> 0 then
              begin
                {@5316-531B}
                pR6DD_0051;
                {@531B-5320}
                bC5C4 := 0;
              end;
            end;
          end;
          {@5320-53A8}
          if bC60C = 0 then
          begin
            {@532A-533E}
            v1304a := 'N';
            for v536b := 1 to 5 do
              WriteLn(v535a, v2072a[v536b]);
            {@5375-539D}
            for v536b := 0 to 13 do
              WriteLn(v535a, Chr(48));
            {@539D-53A8}
            Close(v535a);
          end;
        end;
        2: begin
          {@53B3-53B8}
          bC60C := 0;
          {@53B8-53BD}
          pR6DD_0051;
          {@53BD-53C2}
          bC5C4 := 0;
          {@53C2-53D2}
          Assign(v535a, 'krynn.cfg');
          {@53D2-53DD}
          Rewrite(v535a);
          {@53DD-53F1}
          v1304a := 'N';
          for v536b := 1 to 5 do
            WriteLn(v535a, v2072a[v536b]);
          {@5428-5450}
          for v536b := 0 to 13 do
            WriteLn(v535a, Chr(48));
          {@5450-545B}
          Close(v535a);
        end;
      end
    else
      v9b := 1;
  until v9b <> 0;
  {@546A-5474}
  pO108_2363(@v4b);
end;

{ 5478 }
procedure pO075_5478(a0: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  _f1: array[1..1] of byte;
begin
  {@547E-54CB}
  if (PR339_byte(a0)^.v > 0) or (PR341_byte(a0)^.v > 0) or (PR340_byte(a0)^.v > 0) then
    v9b := 1
  else
  begin
    {@54A5-54CB}
    if PR343_byte(a0)^.v > 0 then
      v9b := 2
    else
    begin
      {@54B6-54CB}
      if PR337_byte(a0)^.v > 0 then
        v9b := 3
      else
        v9b := 4;
    end;
  end;
  {@54CB-54D4}
  PR422_byte(a0)^.v := 0;
  for v11b := 1 to 6 do
  begin
    {@54DD-54E8}
    v8p := pR670_037F;
    {@54E8-54F9}
    FillChar(PR0_byte(v8p)^.v, 63, 0);
    {@54F9-5518}
    v10b := a09B7_c768[v9b, v11b];
    if (v10b <> 0) and (PAL17_byte(p9CFF)^[v10b * 17] <> 255) then
    begin
      {@553B-5543}
      Inc(PR422_byte(a0)^.v);
      {@5543-556B}
      Move(PAL17_byte(p9CFF)^[v10b * 17], PR46_byte(v8p)^.v, 17);
      {@556B-5578}
      PR42_longint(v8p)^.v := 0;
      {@5578-5580}
      PR41_byte(v8p)^.v := 0;
      if PR423_pointer(a0)^.v = nil then
        PR423_pointer(a0)^.v := v8p
      else
      begin
        {@55A4-55B7}
        v4p := PR423_pointer(a0)^.v;
        {@55B7-55CA}
        PR423_pointer(a0)^.v := v8p;
        {@55CA-55E0}
        PR42_pointer(PR423_pointer(a0)^.v)^.v := v4p;
      end;
      {@55E0-55FA}
      PR53_byte(PR423_pointer(a0)^.v)^.v := PR53_byte(PR423_pointer(a0)^.v)^.v and 248;
      if (v11b = 5) and (v9b = 1) or (v11b = 4) and (v9b = 4) then
        PR57_byte(PR423_pointer(a0)^.v)^.v := 50;
      {@561F-5632}
      if v11b <> 4 then
        PR52_byte(PR423_pointer(a0)^.v)^.v := 1;
    end;
  end;
  {@563B-5646}
  pO0EC_0EBF(pointer(a0));
  {@5646-564F}
  PR422_byte(a0)^.v := 3;
end;

{ 5700 }
procedure pO075_5700;
var
  v2w: word;
  v4w: word;
  v5b: byte;
  _f1: array[1..5] of byte;
  v12w: word;
  _f2: array[1..1] of byte;
begin
  if false then begin
    if LV = 'Push JOYSTICK #1 to the extreme upper' then;
    if LV = 'left position and press button #1.' then;
    if LV = 'Unable to read joystick' then;
    if LV = 'Push JOYSTICK #1 to the extreme lower' then;
    if LV = 'right position and press button #1.' then;
    with LPR^ do LM1_0('left position and press button #1.');
  end;
  {@5706-570B}
  pR716_0000;
  {@570B-5715}
  if bC60C = 0 then
    Exit;
  asm
  db 49,192,137,70,254,49,192,137,70,252,199,70,244,1,0,235,3,255,70,244,176,1,80,141,126,249,22,87
  db 141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,139,70,249,1,70,254,139,70,247,1,70,252,131,126,244,20,117,209
  end;
  {@5755-5762}
  wC5DA := v2w div 20;
  {@5762-576F}
  wC5E8 := v4w div 20;
  {@576F-58E3}
  repeat
    {@576F-5780}
    pR142_0217(1, 1, 38, 22);
    {@5780-57A0}
    pR47F_0354(1, 3, 13, 0, 'Push JOYSTICK #1 to the extreme upper');
    {@57A0-57C0}
    pR47F_0354(1, 5, 13, 0, 'left position and press button #1.');
    {@57C0-57C5}
    v12w := 0;
    asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,255,70,244,129,126,244,32,78,119,15,128,126,251,0,116,214,138,70,243,36,1,8,192,116,205
    end;
    {@57F8-583C}
    if v12w > 20000 then
    begin
      {@57FF-5810}
      pR142_0217(1, 1, 38, 22);
      {@5810-5830}
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      asm
  db 184,208,7,80
  call Delay
      end;
      asm
  db 233,246,2
      end;
    end;
    asm
  db 199,70,254,255,255
    end;
    asm
  db 199,70,252,255,255
    end;
    for bB16D := 1 to 20 do
      asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 8,192,116,39,138,70,243,36,1,8,192,116,28,139,70,249,59,70,254,115,6,139,70,249,137,70,254,139
  db 70,247,59,70,252,115,6,139,70,247,137,70,252,235,61,176,1,80,176,1,80,176,38,80,176,22,80
  call pR142_0217
  db 176,1,80,176,3,80,176,13,80,176,0,80,141,126,219,22,87,191,158,86,14,87,154,111,10,37,8
  call pR47F_0354
  db 184,208,7,80
  call Delay
  db 233,98,2
      end;
  until v5b <> 0;
  {@58E3-58E9}
  wC5D4 := v2w;
  {@58E9-58FE}
  wC5D6 := (wC5DA - wC5D4) div 3 + wC5D4;
  {@58FE-5915}
  wC5D8 := (wC5DA - wC5D4) * 2 div 3 + wC5D4;
  {@5915-591B}
  wC5E2 := v4w;
  {@591B-5930}
  wC5E4 := (wC5E8 - wC5E2) div 3 + wC5E2;
  {@5930-5947}
  wC5E6 := (wC5E8 - wC5E2) * 2 div 3 + wC5E2;
  {@5947-5956}
  repeat
  until pR716_0107(1, 1) = 0;
  {@5956-5AC9}
  repeat
    {@5956-5967}
    pR142_0217(1, 1, 38, 22);
    {@5967-5987}
    pR47F_0354(1, 3, 13, 0, 'Push JOYSTICK #1 to the extreme lower');
    {@5987-59A7}
    pR47F_0354(1, 5, 13, 0, 'right position and press button #1.');
    {@59A7-59AC}
    v12w := 0;
    asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,255,70,244,129,126,244,32,78,119,15,128,126,251,0,116,214,138,70,243,36,1,8,192,116,205
    end;
    {@59DF-5A23}
    if v12w > 20000 then
    begin
      {@59E6-59F7}
      pR142_0217(1, 1, 38, 22);
      {@59F7-5A17}
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      {@5A17-5A20}
      Delay(2000);
      {@5A20-5A23}
      Exit;
    end;
    {@5A23-5A28}
    v2w := 0;
    {@5A28-5A2D}
    v4w := 0;
    for bB16D := 1 to 20 do
      asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 8,192,116,39,138,70,243,36,1,8,192,116,28,139,70,249,59,70,254,118,6,139,70,249,137,70,254,139
  db 70,247,59,70,252,118,6,139,70,247,137,70,252,235,60,176,1,80,176,1,80,176,38,80,176,22,80
  call pR142_0217
  db 176,1,80,176,3,80,176,13,80,176,0,80,141,126,219,22,87,191,158,86,14,87,154,111,10,37,8
  call pR47F_0354
  db 184,208,7,80
  call Delay
  db 235,124
      end;
  until v5b <> 0;
  {@5AC9-5ACF}
  wC5E0 := v2w;
  {@5ACF-5AE4}
  wC5DC := (wC5E0 - wC5DA) div 3 + wC5DA;
  {@5AE4-5AFB}
  wC5DE := (wC5E0 - wC5DA) * 2 div 3 + wC5DA;
  {@5AFB-5B01}
  wC5EE := v4w;
  {@5B01-5B16}
  wC5EA := (wC5EE - wC5E8) div 3 + wC5E8;
  {@5B16-5B2D}
  wC5EC := (wC5EE - wC5E8) * 2 div 3 + wC5E8;
  {@5B2D-5B32}
  bC60C := 1;
end;

{ 5B36 }
begin
end.

