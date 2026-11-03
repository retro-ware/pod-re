{ O040: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O040;

interface

uses GAMEDATA;

procedure pO040_2A30;

implementation

uses LIT, Crt, O043, O046, O04C, O04F, O052, O055, O05F, O068, O06B, O06E, O075, O0AA, O0B2, O0E2, O0EC, O0FF, O108,
     O10E, O111, O12A, O13E, R142, R1C3, R47F, R5A0, R670, R6DD;

type
  AL17_byte = array[17..32017] of byte;
  AL32768_byte = array[32768..64768] of byte;
  X510 = array[0..509] of byte;
  R0_X510 = record v: X510 end;
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  X9 = array[0..8] of byte;
  R0_X9 = record v: X9 end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R0_word = record v: word end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R23_byte = record _p: array[1..23] of byte; v: byte end;
  R24_byte = record _p: array[1..24] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R2_pointer = record _p: array[1..2] of byte; v: pointer end;
  R314_byte = record _p: array[1..314] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R32_byte = record _p: array[1..32] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R38_byte = record _p: array[1..38] of byte; v: byte end;
  R40_byte = record _p: array[1..40] of byte; v: byte end;
  R412_byte = record _p: array[1..412] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R423_longint = record _p: array[1..423] of byte; v: longint end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R48_byte = record _p: array[1..48] of byte; v: byte end;
  R492_byte = record _p: array[1..492] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R55_byte = record _p: array[1..55] of byte; v: byte end;
  R56_byte = record _p: array[1..56] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  X17 = array[0..16] of byte;
  PAL17_byte = ^AL17_byte;
  PAL32768_byte = ^AL32768_byte;
  PR0_X510 = ^R0_X510;
  PR0_X63 = ^R0_X63;
  PR0_X9 = ^R0_X9;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR0_word = ^R0_word;
  PR178_byte = ^R178_byte;
  PR18_byte = ^R18_byte;
  PR19_byte = ^R19_byte;
  PR21_byte = ^R21_byte;
  PR22_byte = ^R22_byte;
  PR23_byte = ^R23_byte;
  PR24_byte = ^R24_byte;
  PR2_byte = ^R2_byte;
  PR2_pointer = ^R2_pointer;
  PR314_byte = ^R314_byte;
  PR31_byte = ^R31_byte;
  PR323_pointer = ^R323_pointer;
  PR327_byte = ^R327_byte;
  PR32_byte = ^R32_byte;
  PR33_byte = ^R33_byte;
  PR35_byte = ^R35_byte;
  PR370_longint = ^R370_longint;
  PR38_byte = ^R38_byte;
  PR40_byte = ^R40_byte;
  PR412_byte = ^R412_byte;
  PR41_byte = ^R41_byte;
  PR423_longint = ^R423_longint;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR483_pointer = ^R483_pointer;
  PR48_byte = ^R48_byte;
  PR492_byte = ^R492_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR508_byte = ^R508_byte;
  PR50_byte = ^R50_byte;
  PR52_byte = ^R52_byte;
  PR54_byte = ^R54_byte;
  PR55_byte = ^R55_byte;
  PR56_byte = ^R56_byte;
  PR57_byte = ^R57_byte;
  PR5_pointer = ^R5_pointer;
  PRA30_byte = ^RA30_byte;
  PRA337_byte = ^RA337_byte;
var
  a000C_ec3f: array[0..32759] of byte absolute d000C;
  a0017_ec3f: array[0..32759] of byte absolute d0017;
  a7D08_ec3f: array[0..32759] of byte absolute d7D08;
  aB01D_ec3f: array[0..32759] of byte absolute dB01D;
  aB06E_e1c0: array[0..126] of string[255] absolute dB06E;
  aB0EB_ec3f: array[0..32759] of byte absolute dB0EB;
  aB12B_ec3f: array[0..32759] of byte absolute dB12B;
  b5362: byte absolute d5362;
  b7DE6: byte absolute d7DE6;
  b7DE7: byte absolute d7DE7;
  b7DE8: byte absolute d7DE8;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  b880E: byte absolute d880E;
  b880F: byte absolute d880F;
  b8811: byte absolute d8811;
  b8814: byte absolute d8814;
  b8815: byte absolute d8815;
  b94D5: byte absolute d94D5;
  b9CEE: byte absolute d9CEE;
  b9D92: byte absolute d9D92;
  b9D93: byte absolute d9D93;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bA9F7: byte absolute dA9F7;
  bAA08: byte absolute dAA08;
  bAA32: byte absolute dAA32;
  bAA33: byte absolute dAA33;
  bAA34: byte absolute dAA34;
  bAACC: byte absolute dAACC;
  bAAD5: byte absolute dAAD5;
  bAAD6: byte absolute dAAD6;
  bAAD7: byte absolute dAAD7;
  bAADB: byte absolute dAADB;
  bAAE5: byte absolute dAAE5;
  bAE7E: byte absolute dAE7E;
  bAEE8: byte absolute dAEE8;
  bB01E: byte absolute dB01E;
  bB01F: byte absolute dB01F;
  bB024: byte absolute dB024;
  bB025: byte absolute dB025;
  bB027: byte absolute dB027;
  bB028: byte absolute dB028;
  bB029: byte absolute dB029;
  bB0AC: byte absolute dB0AC;
  bB0AD: byte absolute dB0AD;
  bB0AE: byte absolute dB0AE;
  bB0EC: byte absolute dB0EC;
  bB0ED: byte absolute dB0ED;
  bB0EE: byte absolute dB0EE;
  bB0EF: byte absolute dB0EF;
  bB0F0: byte absolute dB0F0;
  bB0F1: byte absolute dB0F1;
  bB12C: byte absolute dB12C;
  bB12D: byte absolute dB12D;
  bB12E: byte absolute dB12E;
  bB12F: byte absolute dB12F;
  bB130: byte absolute dB130;
  bB131: byte absolute dB131;
  bB16D: byte absolute dB16D;
  bC56E: byte absolute dC56E;
  bC56F: byte absolute dC56F;
  bC580: byte absolute dC580;
  bC581: byte absolute dC581;
  bC582: byte absolute dC582;
  bC583: byte absolute dC583;
  bC584: byte absolute dC584;
  bC586: byte absolute dC586;
  bC587: byte absolute dC587;
  bC58A: byte absolute dC58A;
  bC58E: byte absolute dC58E;
  bC58F: byte absolute dC58F;
  bC591: byte absolute dC591;
  bC592: byte absolute dC592;
  bC594: byte absolute dC594;
  bC595: byte absolute dC595;
  bC615: byte absolute dC615;
  bC616: byte absolute dC616;
  bC61A: byte absolute dC61A;
  bD91E: byte absolute dD91E;
  l7DE9: longint absolute d7DE9;
  l9CEE: longint absolute d9CEE;
  l9CF2: longint absolute d9CF2;
  lA7BE: longint absolute dA7BE;
  lA7C2: longint absolute dA7C2;
  lA7C6: longint absolute dA7C6;
  p7DE9: pointer absolute d7DE9;
  p87F8: pointer absolute d87F8;
  p87FC: pointer absolute d87FC;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CFF: pointer absolute d9CFF;
  pA7CA: pointer absolute dA7CA;
  pB01A: pointer absolute dB01A;
  s0E34: string absolute d0E34;
  s278C: string absolute d278C;
  sB16E: string absolute dB16E;
  sB26E: string absolute dB26E;
  sB36E: string absolute dB36E;
  sB46E: string absolute dB46E;
  w8800: word absolute d8800;
  w8802: word absolute d8802;
  w8804: word absolute d8804;
  w8806: word absolute d8806;
  w8808: word absolute d8808;
  w880A: word absolute d880A;
  wA9F8: word absolute dA9F8;

procedure pO040_0000; far; forward;
procedure pO040_008A; far; forward;
procedure pO040_00A7; far; forward;
procedure pO040_00BC; far; forward;
procedure pO040_010E; far; forward;
procedure pO040_01A5; far; forward;
procedure pO040_0207; far; forward;
procedure pO040_0259; far; forward;
procedure pO040_02E3; far; forward;
procedure pO040_037C; far; forward;
procedure pO040_07A0; far; forward;
procedure pO040_07DB(a0: byte); far; forward;
procedure pO040_08E8; far; forward;
procedure pO040_0903; far; forward;
procedure pO040_0963; far; forward;
procedure pO040_09E9; far; forward;
procedure pO040_0AA2; far; forward;
procedure pO040_0AF9; far; forward;
procedure pO040_0BE5; far; forward;
procedure pO040_0C04; far; forward;
procedure pO040_0C58; far; forward;
procedure pO040_0D0B; far; forward;
procedure pO040_0D7E; far; forward;
procedure pO040_0DE4; far; forward;
procedure pO040_0E35; far; forward;
procedure pO040_0FE1(a0: byte); far; forward;
procedure pO040_114C; far; forward;
procedure pO040_115A; far; forward;
procedure pO040_11FD; far; forward;
procedure pO040_134B; far; forward;
procedure pO040_13E0; far; forward;
procedure pO040_1556; far; forward;
procedure pO040_1641; far; forward;
procedure pO040_1677; far; forward;
procedure pO040_16B8; far; forward;
procedure pO040_176A; far; forward;
procedure pO040_17BB; far; forward;
procedure pO040_1B23; far; forward;
procedure pO040_1B58; far; forward;
procedure pO040_1B81; far; forward;
procedure pO040_1BB5; far; forward;
procedure pO040_1C1B; far; forward;
procedure pO040_1C84; far; forward;
procedure pO040_1D47; far; forward;
procedure pO040_1E4A; far; forward;
procedure pO040_1EC2; far; forward;
procedure pO040_1F1F; far; forward;
procedure pO040_1FE6; far; forward;
procedure pO040_2015; far; forward;
procedure pO040_2066; far; forward;
procedure pO040_21BF; far; forward;
procedure pO040_23FD; far; forward;
procedure pO040_24AE; far; forward;
procedure pO040_24CD; far; forward;
procedure pO040_2516; far; forward;
procedure pO040_251F; far; forward;
procedure pO040_2685; far; forward;
procedure pO040_290D(a0: word); far; forward;
procedure pO040_2960; far; forward;

{ 0000 }
procedure pO040_0000;
var
  v4p: pointer;
begin
  {@0006-0020}
  if b7DE8 <> 0 then
  begin
    {@000D-001B}
    l9CEE := l7DE9;
    {@001B-0020}
    b7DE8 := 0;
  end;
  {@0020-002E}
  XR670_046E(@bC56E, 2);
  {@002E-0033}
  bC584 := 0;
  {@0033-0038}
  b7DE6 := 1;
  {@0038-003C}
  Inc(w880A);
  {@003C-0077}
  while pB01A <> nil do
  begin
    {@0045-0057}
    v4p := PR2_pointer(pB01A)^.v;
    {@0057-0068}
    FreeMem(pB01A, 6);
    {@0068-0075}
    pB01A := v4p;
  end;
  {@0077-007C}
  b9D93 := 17;
  {@007C-0081}
  b9D92 := 1;
  {@0081-0086}
  bC582 := 0;
end;

{ 008A }
procedure pO040_008A;
begin
  {@008D-0095}
  pO055_0000(1);
  {@0095-00A5}
  w880A := pO055_0567(bB12C, bB0EC);
end;

{ 00A7 }
procedure pO040_00A7;
begin
  {@00AA-00B2}
  pO055_0000(1);
  {@00B2-00BA}
  pO055_11F8(1);
end;

{ 00BC }
procedure pO040_00BC;
var
  c4: record case byte of 0: (v4l: longint); 1: (v4w: word); 2: (_p2: array[1..2] of byte; v2w: word) end;
begin
  {@00C2-00CA}
  pO055_0000(2);
  if (bB0AC >= 128) or (bB0AD >= 128) then
  begin
    {@00D8-00E7}
    pO055_10C2(sB16E, sB26E);
    {@00E7-00E9}
    Exit;
  end;
  {@00E9-00F4}
  c4.v2w := pO055_0136(1);
  {@00F4-00FF}
  c4.v4w := pO055_0136(2);
  {@00FF-010A}
  pO055_1195(c4.v4l);
end;

{ 010E }
procedure pO040_010E;
var
  v2w: word;
  v4w: word;
  v6w: word;
  _f1: array[1..1] of byte;
  v9w: word;
  _f2: array[1..1] of byte;
begin
  {@0114-011C}
  pO055_0000(3);
  {@011C-0127}
  v6w := pO055_0136(1);
  {@0127-0132}
  v4w := pO055_0136(2);
  {@0132-0142}
  v2w := pO055_0567(bB12E, bB0EE);
  case bB025 of
    4: v9w := v6w + v4w;
    5: v9w := v4w - v6w;
    6: begin
      {@0167-0172}
      v9w := v6w div v4w;
      {@0172-0183}
      PR40_byte(p87F8)^.v := v6w mod v4w;
    end;
    7: v9w := v6w * v4w;
  end;
  {@0192-01A1}
  pO055_0766(v2w, v9w, bB0AE);
end;

{ 01A5 }
procedure pO040_01A5;
var
  v1b: byte;
  v2b: byte;
  v4w: word;
begin
  {@01AB-01B3}
  pO055_0000(2);
  {@01B3-01BE}
  v1b := pO055_0136(1);
  if v1b < 255 then
    Inc(v1b);
  {@01C7-01D7}
  v4w := pO055_0567(bB12D, bB0ED);
  {@01D7-01F1}
  v2b := Trunc(Random(v1b));
  {@01F1-0203}
  pO055_0766(v4w, v2b, bB0AD);
end;

{ 0207 }
procedure pO040_0207;
var
  v2w: word;
  v4w: word;
begin
  {@020D-0215}
  pO055_0000(2);
  {@0215-0225}
  v4w := pO055_0567(bB12D, bB0ED);
  if bB0AC < 128 then
  begin
    {@022C-0237}
    v2w := pO055_0136(1);
    {@0237-0246}
    pO055_0766(v4w, v2w, bB0AD);
    {@0246-0248}
    Exit;
  end;
  {@0248-0255}
  pO055_0A94(v4w, sB16E);
end;

{ 0259 }
procedure pO040_0259;
var
  v4p: pointer;
  _f1: array[1..1] of byte;
  v6b: byte;
  v7b: byte;
  _f2: array[1..1] of byte;
begin
  {@025F-0264}
  b7DE8 := 1;
  {@0264-026C}
  pO055_0000(1);
  {@026C-0270}
  v7b := 0;
  {@0270-027B}
  v6b := pO055_0136(1);
  {@027B-0288}
  v4p := p9CF2;
  {@0288-0290}
  v6b := v6b and 127;
  if v6b > 0 then
    while (v7b < v6b) and (v4p <> nil) do
    begin
      {@02A6-02B9}
      v4p := PR483_pointer(v4p)^.v;
      {@02B9-02BC}
      Inc(v7b);
    end;
  {@02BE-02DA}
  if v4p <> nil then
  begin
    {@02C6-02D3}
    p9CEE := v4p;
    {@02D3-02D8}
    bC58E := 0;
    {@02D8-02DA}
    Exit;
  end;
  {@02DA-02DF}
  bC58E := 1;
end;

{ 02E3 }
procedure pO040_02E3;
begin
  {@02E6-02EE}
  pO055_0000(4);
  {@02EE-02F9}
  bB027 := pO055_0136(1);
  {@02F9-0309}
  PR55_byte(p87F8)^.v := pO055_0136(2);
  {@0309-0314}
  bB028 := pO055_0136(3);
  {@0314-031F}
  bAEE8 := pO055_0136(4);
  {@031F-0338}
  PR54_byte(p87F8)^.v := pO055_03D7(bA9F3, bA9F4, bA9F5);
  if PR55_byte(p87F8)^.v < PR54_byte(p87F8)^.v then
    PR54_byte(p87F8)^.v := PR55_byte(p87F8)^.v;
  {@035A-0375}
  pO055_046D(bB027, bB028, PR54_byte(p87F8)^.v, @bC56E);
end;

{ 037C }
procedure pO040_037C;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v20l: longint;
  v24p: pointer;
  v28p: pointer;
  v32p: pointer;
  v36p: pointer;
  v40p: pointer;
  v44p: pointer;
  v36b: byte absolute v36p;
  v24b: byte absolute v24p;
  v16b: byte absolute v16p;
begin
  if false then begin
    if LV = 'CPIC' then;
  end;
  {@0382-038F}
  v20l := l9CEE;
  {@038F-0393}
  v4b := 1;
  {@0393-039B}
  pO055_0000(3);
  {@039B-03A5}
  if bC595 >= 48 then
    Exit;
  {@03A5-03AD}
  v8p := nil;
  {@03AD-03B5}
  v12p := nil;
  {@03B5-03C0}
  v1b := pO055_0136(1);
  {@03C0-03D8}
  pO055_0367(v1b, @v16b, @v24b, @v36b);
  if (PR495_byte(v16p)^.v = 1) and (PR38_byte(p87F8)^.v > 0) and (PR38_byte(p87F8)^.v < 6) then
  begin
    {@03FF-0424}
    PR508_byte(v16p)^.v := PR508_byte(v16p)^.v * (PR38_byte(p87F8)^.v + 1) shr 1 shr 1;
    {@0424-0449}
    PR178_byte(v16p)^.v := PR178_byte(v16p)^.v * (PR38_byte(p87F8)^.v + 1) shr 1 shr 1;
    if (PR508_byte(v16p)^.v = 0) or (PR178_byte(v16p)^.v = 0) then
    begin
      {@045F-0468}
      PR508_byte(v16p)^.v := 1;
      {@0468-0471}
      PR178_byte(v16p)^.v := 1;
    end;
  end;
  {@0471-0480}
  if PR314_byte(v16p)^.v <> 0 then
    Inc(bC592);
  {@0480-048C}
  v32p := v24p;
  {@048C-0498}
  v44p := v36p;
  {@0498-04A3}
  v2b := pO055_0136(2);
  if v2b <= 0 then
    v2b := 1;
  {@04AD-04B8}
  v3b := pO055_0136(3);
  {@04B8-04C5}
  v8p := p9CF2;
  {@04C5-04E1}
  pO13E_0182('CPIC', v3b, bB029);
  {@04E1-04EC}
  PR412_byte(v16p)^.v := bB029;
  {@04EC-0510}
  while PR483_pointer(v8p)^.v <> nil do
    v8p := PR483_pointer(v8p)^.v;
  {@0510-0523}
  PR483_pointer(v8p)^.v := v16p;
  {@0523-0536}
  v8p := PR483_pointer(v8p)^.v;
  {@0536-0545}
  PR483_pointer(v8p)^.v := nil;
  {@0545-0549}
  Inc(bC595);
  {@0549-054C}
  Inc(v4b);
  {@054C-0786}
  while (v4b <= v2b) and (bC595 < 63) do
  begin
    {@0561-0570}
    GetMem(v12p, 510);
    {@0570-0583}
    PR483_pointer(v8p)^.v := v12p;
    {@0583-0596}
    v8p := PR483_pointer(v8p)^.v;
    {@0596-05A9}
    PR0_X510(v8p)^.v := PR0_X510(v16p)^.v;
    {@05A9-05B8}
    PR483_pointer(v8p)^.v := nil;
    {@05B8-05C7}
    PR323_pointer(v8p)^.v := nil;
    {@05C7-05D6}
    PR423_pointer(v8p)^.v := nil;
    {@05D6-05D9}
    Inc(v4b);
    {@05D9-05DD}
    Inc(bC595);
    {@05DD-06A4}
    while v24p <> nil do
    begin
      {@05E8-0690}
      if PR423_pointer(v8p)^.v = nil then
      begin
        {@05F7-060D}
        GetMem(PR423_pointer(v8p)^.v, 63);
        {@060D-0625}
        PR0_X63(PR423_pointer(v8p)^.v)^.v := PR0_X63(v24p)^.v;
        {@0625-0637}
        PR42_pointer(PR423_pointer(v8p)^.v)^.v := nil;
      end
      else
      begin
        {@0639-064C}
        v28p := PR423_pointer(v8p)^.v;
        {@064C-0662}
        GetMem(PR423_pointer(v8p)^.v, 63);
        {@0662-067A}
        PR0_X63(PR423_pointer(v8p)^.v)^.v := PR0_X63(v24p)^.v;
        {@067A-0690}
        PR42_pointer(PR423_pointer(v8p)^.v)^.v := v28p;
      end;
      {@0690-06A1}
      v24p := PR42_pointer(v24p)^.v;
    end;
    {@06A4-06B0}
    v24p := v32p;
    {@06B0-0777}
    while v36p <> nil do
    begin
      {@06BB-0763}
      if PR323_pointer(v8p)^.v = nil then
      begin
        {@06CA-06E0}
        GetMem(PR323_pointer(v8p)^.v, 9);
        {@06E0-06F8}
        PR0_X9(PR323_pointer(v8p)^.v)^.v := PR0_X9(v36p)^.v;
        {@06F8-070A}
        PR5_pointer(PR323_pointer(v8p)^.v)^.v := nil;
      end
      else
      begin
        {@070C-071F}
        v40p := PR323_pointer(v8p)^.v;
        {@071F-0735}
        GetMem(PR323_pointer(v8p)^.v, 9);
        {@0735-074D}
        PR0_X9(PR323_pointer(v8p)^.v)^.v := PR0_X9(v36p)^.v;
        {@074D-0763}
        PR5_pointer(PR323_pointer(v8p)^.v)^.v := v40p;
      end;
      {@0763-0774}
      v36p := PR5_pointer(v36p)^.v;
    end;
    {@0777-0783}
    v36p := v44p;
  end;
  {@0786-078A}
  Inc(bB029);
  {@078A-078F}
  bC58A := 1;
  {@078F-079C}
  l9CEE := v20l;
end;

{ 07A0 }
procedure pO040_07A0;
begin
  {@07A3-07D1}
  if PR54_byte(p87F8)^.v > 0 then
  begin
    {@07AE-07B6}
    Dec(PR54_byte(p87F8)^.v);
    {@07B6-07D1}
    pO055_046D(bB027, bB028, PR54_byte(p87F8)^.v, @bC56E);
  end;
  {@07D1-07D5}
  Inc(w880A);
end;

{ 07DB }
procedure pO040_07DB(a0: byte);
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'PIC' then;
  end;
  {@07E1-089E}
  if a0 <> 255 then
  begin
    {@07EA-07EF}
    bD91E := 1;
    {@07EF-07F4}
    bC56F := 1;
    {@07F4-07F9}
    bC584 := 1;
    if a0 >= 240 then
    begin
      {@07FF-083C}
      if (PR35_byte(p87F8)^.v = 1) and (PR33_byte(p87F8)^.v = 0) then
      begin
        {@0815-081F}
        pR1C3_1A83(@bC61A);
        {@081F-0829}
        pR1C3_1A83(@bC616);
        {@0829-0837}
        XR670_046E(@bC616, 8);
        {@0837-083C}
        bC615 := 0;
      end;
      {@083C-0845}
      pO111_0B1C(a0);
      {@0845-084A}
      pO111_0BAF;
      {@084A-084F}
      bD91E := 1;
      if b880C = 3 then
        pO0FF_0000
      else
        b880F := 1;
      {@0862-0867}
      bAE7E := 0;
    end
    else
    begin
      {@0869-0884}
      pO111_01F1('PIC', a0, 0);
      asm
  db 184,3,0,80,184,3,0,80,176,1,80,176,0,80
  call pO111_00A8
      end;
      {@0897-089C}
      bD91E := 1;
    end;
    {@089C-089E}
    Exit;
  end;
  {@089E-08D8}
  if ((b880D <> 4) or (b880C = 4)) and ((bC584 <> 0) or (bC586 <> 0)) then
  begin
    {@08BA-08BF}
    bAA08 := 0;
    {@08BF-08C4}
    bD91E := 1;
    {@08C4-08C9}
    bAE7E := 1;
    {@08C9-08CE}
    pO10E_0000;
    {@08CE-08D3}
    bC584 := 0;
    {@08D3-08D8}
    bC586 := 0;
  end;
  {@08D8-08DD}
  bC56E := 0;
  {@08DD-08E2}
  bC56F := 0;
end;

{ 08E8 }
procedure pO040_08E8;
begin
  {@08EB-08F3}
  pO055_0000(1);
  {@08F3-0900}
  pO040_07DB(pO055_0136(1));
end;

{ 0903 }
procedure pO040_0903;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v6b: byte absolute v6w;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@0909-0911}
  pO055_0000(2);
  {@0911-091C}
  v6w := pO055_0136(1);
  {@091C-092C}
  v4w := pO055_0567(bB12D, bB0ED);
  {@092C-094D}
  v2w := pR47F_0A0A('', 10, 0, v6b);
  {@094D-095C}
  pO055_0766(v4w, v2w, bB0AD);
end;

{ 0963 }
procedure pO040_0963;
var
c43: record case byte of 0: (v43a2: string[42]); 1: (v43a: string[40]); 2: (v43b: byte);
      3: (_p3: array[1..41] of byte; v2w: word) end;
  v45w: word;
  v45b: byte absolute v45w;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LV = ' ' then;
  end;
  {@096A-0972}
  pO055_0000(2);
  {@0972-097D}
  v45w := pO055_0136(1);
  {@097D-098D}
  c43.v2w := pO055_0567(bB12D, bB0ED);
  {@098D-09BF}
  c43.v43a := pR47F_0711('', 10, 0, v45b);
  if c43.v43b = 0 then
    c43.v43a := ' ';
  {@09D8-09E5}
  pO055_0A94(c43.v2w, c43.v43a2);
end;

{ 09E9 }
procedure pO040_09E9;
var
  v1b: byte;
begin
  {@09F0-09FB}
  v1b := PR56_byte(p87F8)^.v;
  if (v1b > 15) or (v1b = 0) then
    v1b := 10;
  {@0A0B-0A13}
  pO055_0000(1);
  {@0A13-0A18}
  bC587 := 0;
  {@0A18-0A1D}
  b8815 := 1;
  if bB0AC < 128 then
    sB16E := pO0EC_146B(pO055_0136(1));
  {@0A46-0A99}
  if bB025 = 17 then
    pR47F_0498(1, 17, 38, 22, v1b, 0, 0, sB16E)
  else
  begin
    {@0A6F-0A74}
    b9D93 := 17;
    {@0A74-0A79}
    b9D92 := 1;
    {@0A79-0A99}
    pR47F_0498(1, 17, 38, 22, v1b, 0, 1, sB16E);
  end;
  {@0A99-0A9E}
  b8815 := 0;
end;

{ 0AA2 }
procedure pO040_0AA2;
var
  v4p: pointer;
begin
  {@0AA8-0AAC}
  Inc(w880A);
  if pB01A <> nil then
  begin
    {@0AB5-0ABF}
    w880A := PR0_word(pB01A)^.v;
    {@0ABF-0AD1}
    v4p := PR2_pointer(pB01A)^.v;
    {@0AD1-0AE2}
    FreeMem(pB01A, 6);
    {@0AE2-0AEF}
    pB01A := v4p;
    {@0AEF-0AF1}
    Exit;
  end;
  {@0AF1-0AF5}
  pO040_0000;
end;

{ 0AF9 }
procedure pO040_0AF9;
var
  v1b: byte;
  v2b: byte;
begin
  {@0AFF-0B0D}
  XR670_046E(@bB01E, 6);
  {@0B0D-0B15}
  pO055_0000(4);
  if bB0AC >= 128 then
  begin
    {@0B1C-0B33}
    v1b := Ord(sB16E = sB26E);
    if bB0AE >= 128 then
      v2b := Ord(sB36E = sB46E)
    else
      v2b := Ord(pO055_0136(3) = pO055_0136(4));
  end
  else
  begin
    {@0B71-0B8D}
    v1b := Ord(pO055_0136(1) = pO055_0136(2));
    if bB0AE >= 128 then
      v2b := Ord(sB16E = sB26E)
    else
      v2b := Ord(pO055_0136(3) = pO055_0136(4));
  end;
  {@0BC9-0BDC}
  if (v1b <> 0) and (v2b <> 0) then
  begin
    {@0BD5-0BDA}
    bB01E := 1;
    {@0BDA-0BDC}
    Exit;
  end;
  {@0BDC-0BE1}
  bB01F := 1;
end;

{ 0BE5 }
procedure pO040_0BE5;
begin
  {@0BE8-0BEC}
  Inc(w880A);
  if aB01D_ec3f[bB025 - 21] = 0 then
    pO055_1464;
end;

{ 0C04 }
procedure pO040_0C04;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0C0A-0C12}
  pO055_0000(1);
  {@0C12-0C1D}
  PR21_byte(p87F8)^.v := bC580;
  {@0C1D-0C28}
  v1b := pO055_0136(1);
  {@0C28-0C2E}
  bC580 := v1b;
  {@0C2E-0C37}
  pO055_02BE(v1b);
  {@0C37-0C3C}
  pO055_01C1;
  {@0C3C-0C41}
  b7DE6 := 1;
  {@0C41-0C46}
  b7DE7 := 1;
  {@0C46-0C54}
  XR670_046E(@bC56E, 2);
end;

{ 0C58 }
procedure pO040_0C58;
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..2] of byte;
begin
  {@0C5E-0C66}
  pO055_0000(2);
  {@0C66-0C71}
  v1b := pO055_0136(1);
  {@0C71-0C7C}
  v2b := pO055_0136(2);
  if (v1b < 127) and (PR33_byte(p87F8)^.v <> 0) then
  begin
    {@0C8D-0C98}
    PR18_byte(p87F8)^.v := v1b;
    {@0C98-0CA1}
    pO12A_1150(v1b);
    {@0CA1-0CAA}
    PR2_byte(p87F8)^.v := 0;
  end;
  {@0CAA-0CD6}
  if (v2b <> 255) and (v2b <> wA9F8) then
  begin
    {@0CBB-0CC5}
    pR1C3_1A83(@bAAD7);
    {@0CC5-0CCA}
    bAADB := 0;
    {@0CCA-0CD6}
    pO12A_0FDC(v2b, 0);
  end;
  {@0CD6-0D07}
  if (b880D = 3) and (b880C <> 3) and (bC58F <> 0) then
  begin
    {@0CEB-0CF0}
    pR142_011B;
    {@0CF0-0CFD}
    pO0EC_07C0(p9CEE);
    {@0CFD-0D02}
    pO0EC_301C;
    {@0D02-0D07}
    bC58F := 0;
  end;
end;

{ 0D0B }
procedure pO040_0D0B;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v7b: byte;
  _f1: array[1..1] of byte;
begin
  {@0D11-0D19}
  pO055_0000(3);
  {@0D19-0D24}
  v6w := pO055_0136(1);
  {@0D24-0D2F}
  v4w := pO055_0136(2);
  {@0D2F-0D3F}
  v2w := pO055_0567(bB12E, bB0EE);
  if bB025 = 47 then
    v7b := v6w and v4w
  else
    v7b := v6w or v4w;
  asm
  db 49,192,80,138,70,249,48,228,80
  call pO055_1195
  end;
  {@0D68-0D7A}
  pO055_0766(v2w, v7b, bB0AE);
end;

{ 0D7E }
procedure pO040_0D7E;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  v9b: byte;
  _f1: array[1..1] of byte;
begin
  {@0D84-0D8C}
  pO055_0000(3);
  {@0D8C-0D9C}
  v2w := pO055_0567(bB12C, bB0EC);
  {@0D9C-0DA7}
  v9b := pO055_0136(2);
  {@0DA7-0DB7}
  v4w := pO055_0567(bB12E, bB0EE);
  {@0DB7-0DC2}
  v6w := v9b + v2w;
  {@0DC2-0DD1}
  v8w := pO055_0929(v6w, bB0AE);
  {@0DD1-0DE0}
  pO055_0766(v4w, v8w, bB0AE);
end;

{ 0DE4 }
procedure pO040_0DE4;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
begin
  {@0DEA-0DF2}
  pO055_0000(3);
  {@0DF2-0DFD}
  v6w := pO055_0136(1);
  {@0DFD-0E0D}
  v4w := pO055_0567(bB12D, bB0ED);
  {@0E0D-0E18}
  v2w := pO055_0136(3);
  {@0E18-0E21}
  v8w := v4w + v2w;
  {@0E21-0E30}
  pO055_0766(v8w, v6w, bB0AC);
end;

{ 0E35 }
procedure pO040_0E35;
var
  v1b: byte;
  v2b: byte;
  v258a: string;
  v262p: pointer;
  v266p: pointer;
  v268w: word;
  v269b: byte;
  v271w: word;
  v272b: byte;
  v268b: byte absolute v268w;
  v262l: longint absolute v262p;
  v262b: byte absolute v262p;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@0E3C-0E41}
  bAAE5 := 1;
  {@0E41-0E46}
  bC587 := 0;
  {@0E46-0E4B}
  v269b := 1;
  {@0E4B-0E4F}
  v2b := 1;
  {@0E4F-0E57}
  pO055_0000(3);
  {@0E57-0E68}
  v271w := pO055_0567(bB12C, bB0EC);
  {@0E68-0E6F}
  v272b := bB0AC;
  {@0E6F-0E83}
  v258a := sB16E;
  {@0E83-0E8E}
  v1b := pO055_0136(3);
  {@0E8E-0E92}
  Dec(w880A);
  {@0E92-0E9B}
  pO055_0000(v1b);
  {@0E9B-0EAC}
  pO108_22B0(v1b, @v262b);
  {@0EAC-0EBC}
  v266p := v262p;
  {@0EBC-0EC1}
  b9D92 := 1;
  {@0EC1-0EC6}
  b9D93 := 17;
  {@0EC6-0EE6}
  pR47F_0498(1, 17, 38, 22, 10, 0, 1, v258a);
  {@0EE6-0F32}
  while v262p <> nil do
  begin
    {@0EF0-0F10}
    PR0_string_40_(v262p)^.v := aB06E_e1c0[v2b];
    {@0F10-0F19}
    PR41_byte(v262p)^.v := 0;
    {@0F19-0F2D}
    v262p := PR42_pointer(v262p)^.v;
    {@0F2D-0F30}
    Inc(v2b);
  end;
  {@0F32-0F42}
  v262p := v266p;
  {@0F42-0F48}
  v268w := 0;
  {@0F48-0F9A}
  pO055_1031('', '', 1, b9D93 + 1, 38, 22, v262l, 0, @v269b, @v268b, @v262b);
  {@0F9A-0FAC}
  pO055_0766(v271w, v268w, v272b);
  {@0FAC-0FB7}
  pO108_2363(@v262b);
  {@0FB7-0FC8}
  pR47F_0F07(1, 17, 38, 22);
end;

{ 0FE1 }
procedure pO040_0FE1(a0: byte);
var
c84: record case byte of 0: (v84a2: string[83]); 1: (v84a: string[80]); 2: (v84b: byte);
      3: (_p3: array[1..81] of byte; v3b: byte); 4: (_p4: array[1..82] of byte; v2b: byte);
      5: (_p5: array[1..83] of byte; v1b: byte) end;
  v86w: word;
  v87b: byte;
begin
  if false then begin
    if LV = 'what do you do?' then;
    if LV = '~' then;
    if LV = ' ' then;
    if Pos('', LV) = 0 then;
  end;
  {@0FE8-1017}
  if a0 <> 0 then
    pR47F_0498(1, 17, 38, 22, 10, 0, 0, 'what do you do?');
  {@1017-101C}
  bAAE5 := 1;
  {@101C-1020}
  c84.v84b := 0;
  {@1020-1028}
  pO055_0000(2);
  {@1028-1038}
  v86w := pO055_0567(bB12C, bB0EC);
  {@1038-103E}
  v87b := bB0AC;
  {@103E-1049}
  c84.v1b := pO055_0136(2);
  {@1049-104D}
  Dec(w880A);
  {@104D-1056}
  pO055_0000(c84.v1b);
  {@1056-105A}
  c84.v84b := 0;
  for c84.v3b := 1 to c84.v1b - 1 do
    c84.v84a := c84.v84a2 + '~' + aB06E_e1c0[c84.v3b] + ' ';
  {@10C2-1100}
  c84.v84a := c84.v84a2 + '~' + aB06E_e1c0[c84.v1b];
  {@1100-1123}
  c84.v2b := pO055_0F49('', c84.v84a2, 0, bC584);
  {@1123-1135}
  pO055_0766(v86w, c84.v2b, v87b);
  {@1135-1146}
  pR47F_0F07(0, 24, 39, 24);
end;

{ 114C }
procedure pO040_114C;
begin
  {@114F-1153}
  Inc(w880A);
  {@1153-1158}
  pO0EC_3E0E;
end;

{ 115A }
procedure pO040_115A;
var
  v2w: word;
  v4w: word;
  v5b: byte;
  v9l: longint;
  v10b: byte;
  _f1: array[1..5] of byte;
  v16b: byte;
  v17b: byte;
  v19w: word;
  v21w: word;
  v23w: word;
  v25w: word;
  v26b: byte;
  _f2: array[1..2] of byte;
begin
  {@1160-1168}
  pO055_0000(6);
  {@1168-1175}
  v9l := l9CF2;
  {@1175-1179}
  v10b := 0;
  if bB0AC = 1 then
    v2w := pO055_0567(bB12C, bB0EC)
  else
    v2w := pO055_0136(1);
  {@119D-11A8}
  v5b := pO055_0136(2);
  {@11A8-11B8}
  v19w := pO055_0567(bB12E, bB0EE);
  {@11B8-11C8}
  v21w := pO055_0567(bB12F, bB0EF);
  {@11C8-11D8}
  v23w := pO055_0567(bB130, bB0F0);
  {@11D8-11E8}
  v25w := pO055_0567(bB131, bB0F1);
  {@11E8-11ED}
  v4w := 0;
  {@11ED-11F1}
  v26b := 0;
  {@11F1-11F5}
  v17b := 255;
  {@11F5-11F9}
  v16b := 0;
end;

{ 11FD }
procedure pO040_11FD;
var
  v2w: word;
  v3b: byte;
  v4b: byte;
  v2b: byte absolute v2w;
begin
  {@1203-1208}
  b880F := 0;
  {@1208-120E}
  v4b := bC591;
  {@120E-1213}
  bC591 := 0;
  {@1213-1217}
  Inc(w880A);
  {@1217-121B}
  v3b := 1;
  {@121B-1220}
  bD91E := 1;
  if bC58A = 0 then
  begin
    {@1227-1271}
    if PR48_byte(p87F8)^.v = 1 then
    begin
      {@1232-123B}
      PR48_byte(p87F8)^.v := 0;
      {@123B-1240}
      pO046_000E;
    end
    else
    begin
      {@1242-1271}
      if PR19_byte(p87F8)^.v = 1 then
      begin
        {@124D-1252}
        pO04C_0B3C;
        {@1252-125B}
        PR19_byte(p87F8)^.v := 0;
        if PR33_byte(p87F8)^.v = 0 then
          v3b := 0;
      end
      else
        pO04F_145F;
    end;
  end
  else
  begin
    {@1273-1278}
    pO111_096E;
    {@1278-127D}
    pO055_1740;
    {@127D-1293}
    v2w := pO055_03D7(bA9F3, bA9F4, bA9F5);
    if PR54_byte(p87F8)^.v > v2w then
      PR54_byte(p87F8)^.v := v2b;
    {@12AD-12B2}
    pO05F_010E;
    {@12B2-12B7}
    pO04F_145F;
    if PR33_byte(p87F8)^.v = 0 then
      pO111_0B1C(a7D08_ec3f[PR57_byte(p87F8)^.v]);
  end;
  {@12D8-12EF}
  if PR33_byte(p87F8)^.v = 0 then
    b880C := 3
  else
    b880C := 4;
  {@12EF-1301}
  PR24_byte(p87F8)^.v := PR24_byte(p87F8)^.v and 1;
  {@1301-130F}
  XR670_046E(@bC56E, 2);
  {@130F-1314}
  bC584 := 0;
  if v3b <> 0 then
  begin
    {@131A-131F}
    pO0EC_2ED1;
    if (PR33_byte(p87F8)^.v = 0) and (b8814 = 0) and (PR35_byte(p87F8)^.v = 1) then
      pO0FF_0000;
  end;
  {@1341-1347}
  bC591 := v4b;
end;

{ 134B }
procedure pO040_134B;
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..1] of byte;
  v4b: byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@1351-1355}
  v5b := 0;
  {@1355-135D}
  pO055_0000(2);
  {@135D-1368}
  v1b := pO055_0136(1);
  {@1368-1373}
  v2b := pO055_0136(2);
  {@1373-1377}
  Dec(w880A);
  {@1377-1380}
  pO055_0000(v2b);
  {@1380-1384}
  v4b := 0;
  {@1384-13DC}
  while (v4b < v2b) and (v5b = 0) do
  begin
    {@1392-13DA}
    if v1b = v4b then
    begin
      {@139A-13D1}
      if bB025 = 37 then
        w880A := pO055_0567(aB12B_ec3f[v4b + 1], aB0EB_ec3f[v4b + 1])
      else
        pO055_11F8(v4b + 1);
      {@13D1-13D5}
      v5b := 1;
    end
    else
      Inc(v4b);
  end;
end;

{ 13E0 }
procedure pO040_13E0;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..16] of byte;
  v20b: byte;
  _f2: array[1..16] of byte;
  v37b: byte;
  v41l: longint;
  v42b: byte;
  _f3: array[1..40] of byte;
  _v83: byte;
  v87p: pointer;
  v83a: X63 absolute _v83;
begin
  {@13E6-13EE}
  pO055_0000(4);
  {@13EE-1400}
  Inc(lA7BE, pO055_0136(1));
  {@1400-1412}
  Inc(lA7C2, pO055_0136(2));
  {@1412-1424}
  Inc(lA7C6, pO055_0136(3));
  {@1424-142F}
  v1b := pO055_0136(4);
  {@142F-1433}
  Dec(w880A);
  {@1433-143C}
  pO055_0000(v1b);
  for v2b := 1 to v1b do
  begin
    {@1454-1460}
    v3b := pO055_0136(v2b);
    if (v3b = 255) or (PAL17_byte(p9CFF)^[v3b * 17] <> 255) then
    begin
      {@1480-14C9}
      if v3b = 255 then
      begin
        {@1486-1490}
        pO055_1ABE(@v20b);
        {@1490-14A3}
        Move(v20b, v37b, 17);
      end
      else
        Move(PAL17_byte(p9CFF)^[v3b * 17], v37b, 17);
      {@14C9-14D1}
      v41l := 0;
      {@14D1-14D5}
      v42b := 0;
      if pA7CA = nil then
      begin
        {@14DE-14EE}
        GetMem(pA7CA, 63);
        {@14EE-1502}
        PR0_X63(pA7CA)^.v := v83a;
      end
      else
      begin
        {@1504-1511}
        v87p := pA7CA;
        {@1511-1521}
        GetMem(pA7CA, 63);
        {@1521-1535}
        PR0_X63(pA7CA)^.v := v83a;
        {@1535-1547}
        PR42_pointer(pA7CA)^.v := v87p;
      end;
    end;
  end;
end;

{ 1556 }
procedure pO040_1556;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v7p: pointer;
  v11l: longint;
  v17r: real;
  _f1: array[1..1] of byte;
begin
  {@155C-1564}
  pO055_0000(3);
  {@1564-156F}
  v1b := pO055_0136(1);
  {@156F-157A}
  v2b := pO055_0136(2);
  {@157A-15A2}
  v17r := (100 - v2b) / 100.0;
  {@15A2-15AD}
  v3b := pO055_0136(3);
  if v1b = 0 then
  begin
    {@15B3-15C9}
    pO055_1314(v17r, p9CEE);
    {@15C9-15DA}
    pO055_1399(v3b, p9CEE);
    {@15DA-15DC}
    Exit;
  end;
  {@15DC-15E9}
  v7p := p9CF2;
  {@15E9-163C}
  while v7p <> nil do
  begin
    {@15F1-1604}
    v11l := PR423_longint(v7p)^.v;
    {@1604-1618}
    pO055_1314(v17r, v7p);
    {@1618-1627}
    pO055_1399(v3b, v7p);
    {@1627-163A}
    v7p := PR483_pointer(v7p)^.v;
  end;
end;

{ 1641 }
procedure pO040_1641;
var
  v1b: byte;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@1647-164B}
  Inc(w880A);
  {@164B-166E}
  v1b := pO055_0F49('', s0E34, 1, bC584);
  {@166E-1673}
  pO108_167D;
end;

{ 1677 }
procedure pO040_1677;
var
  _f1: array[1..2] of byte;
begin
  {@167D-1681}
  Inc(w880A);
  {@1681-168F}
  XR670_046E(@bB01E, 6);
  if Byte(pO108_2254(s278C, b5362)) = b5362 then
    bB01E := 1
  else
    bB01F := 1;
  {@16AF-16B4}
  pO108_167D;
end;

{ 16B8 }
procedure pO040_16B8;
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v6p: pointer;
  v10p: pointer;
  v11b: byte;
  _f2: array[1..1] of byte;
begin
  {@16BE-16C6}
  pO055_0000(1);
  {@16C6-16CA}
  v11b := 0;
  {@16CA-16D5}
  v1b := pO055_0136(1);
  {@16D5-16E3}
  XR670_046E(@bB01E, 6);
  {@16E3-16E8}
  bB01F := 1;
  {@16E8-16F5}
  v6p := p9CF2;
  {@16F5-1766}
  while (v6p <> nil) and (v11b = 0) do
  begin
    {@1703-1716}
    v10p := PR423_pointer(v6p)^.v;
    {@1716-1751}
    while (v10p <> nil) and (v11b = 0) do
    begin
      {@1724-173E}
      if v1b = PR46_byte(v10p)^.v then
      begin
        {@1730-1735}
        bB01E := 1;
        {@1735-173A}
        bB01F := 0;
        {@173A-173E}
        v11b := 1;
      end;
      {@173E-174F}
      v10p := PR42_pointer(v10p)^.v;
    end;
    {@1751-1764}
    v6p := PR483_pointer(v6p)^.v;
  end;
end;

{ 176A }
procedure pO040_176A;
begin
  {@176D-1771}
  Inc(w880A);
  {@1771-177A}
  Delay(600);
end;

{ 17BB }
procedure pO040_17BB;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v12w: word;
  v16p: pointer;
  v20p: pointer;
  v24p: pointer;
  v25b: byte;
  v26b: byte;
  v27b: byte;
begin
  if false then begin
    if LV = 'The entire party is killed!' then;
    if LV = 'press <enter>/<return> to continue' then;
    LM1_0('press <enter>/<return> to continue');
  end;
  {@17C1-17CE}
  v24p := p9CEE;
  {@17CE-17D2}
  v25b := 0;
  {@17D2-17D6}
  v26b := 0;
  {@17D6-17E3}
  v16p := p9CF2;
  {@17E3-17EB}
  pO055_0000(5);
  {@17EB-17F6}
  v1b := pO055_0136(1);
  {@17F6-1801}
  v2b := pO055_0136(2);
  {@1801-180C}
  v3b := pO055_0136(3);
  {@180C-1817}
  v7b := pO055_0136(4);
  {@1817-1822}
  v6b := pO055_0136(5);
  {@1822-183D}
  v12w := v7b + pO0E2_1374(v2b, v3b);
  {@183D-1845}
  v27b := v1b and 16;
  if (v1b and 64) <> 0 then
    v26b := 1
  else
    v8b := pO0E2_1374(1, PR31_byte(p87F8)^.v);
  {@1868-1A6E}
  if (v1b and 128) <> 0 then
  begin
    {@1874-187C}
    v5b := v1b and 15;
    {@187C-1884}
    v9b := v6b and 7;
    if v26b <> 0 then
      while v16p <> nil do
      begin
        asm
  db 138,70,255,36,32,8,192,116,16,255,118,244,255,118,242,255,118,240
  call pO055_157F
  db 235,62,255,118,242,255,118,240,138,70,247,80,138,70,251,80
  call pO0E2_12C9
  db 8,192,117,16,255,118,244,255,118,242,255,118,240
  call pO055_157F
  db 235,23,128,126,229,0,116,17,139,70,244,209,232,80,255,118,242,255,118,240
  call pO055_157F
        end;
        {@18E9-18FC}
        v16p := PR483_pointer(v16p)^.v;
      end
    else
    begin
      {@1901-19C7}
      if (v6b and 128) <> 0 then
      begin
        {@190A-1957}
        if (v9b = 0) or (pO0E2_12C9(p9CEE, v9b - 1, v5b) = 0) then
          pO055_157F(v12w, p9CEE)
        else
        begin
          {@193E-1957}
          if v27b <> 0 then
            pO055_157F(v12w shr 1, p9CEE);
        end;
      end
      else
      begin
        {@1959-1989}
        for v4b := 2 to v8b do
          v16p := PR483_pointer(v16p)^.v;
        asm
  db 255,118,242,255,118,240,138,70,247,80,138,70,251,80
  call pO0E2_12C9
  db 8,192,117,16,255,118,244,255,118,242,255,118,240
  call pO055_157F
  db 235,23,128,126,229,0,116,17,139,70,244,209,232,80,255,118,242,255,118,240
  call pO055_157F
        end;
      end;
    end;
  end
  else
    for v4b := 1 to v1b do
    begin
      {@19E2-19EF}
      v16p := p9CF2;
      {@19EF-1A03}
      v8b := pO0E2_1374(1, PR31_byte(p87F8)^.v);
      {@1A03-1A07}
      v10b := 1;
      {@1A07-1A27}
      while v10b < v8b do
      begin
        {@1A0F-1A22}
        v16p := PR483_pointer(v16p)^.v;
        {@1A22-1A25}
        Inc(v10b);
      end;
      {@1A27-1A48}
      if pO0E2_112C(v16p, v6b) <> 0 then
        asm
  db 255,118,244,255,118,242,255,118,240
  call pO055_157F
        end;
      {@1A48-1A63}
      v12w := v7b + pO0E2_1374(v2b, v3b);
    end;
  {@1A6E-1A7B}
  v20p := p9CF2;
  {@1A7B-1A80}
  b8814 := 1;
  {@1A80-1AAD}
  while v20p <> nil do
  begin
    {@1A88-1A98}
    if PR494_byte(v20p)^.v <> 0 then
      b8814 := 0;
    {@1A98-1AAB}
    v20p := PR483_pointer(v20p)^.v;
  end;
  {@1AAD-1AF8}
  if b8814 <> 0 then
  begin
    {@1AB4-1ABC}
    pR142_00D4(0);
    {@1ABC-1AC1}
    b9D92 := 2;
    {@1AC1-1AC6}
    b9D93 := 2;
    {@1AC6-1AEF}
    pR47F_0498(1, 1, 38, 22, 10, 0, 1, 'The entire party is killed!');
    {@1AEF-1AF8}
    Delay(3000);
  end;
  {@1AF8-1B05}
  p9CEE := v24p;
  {@1B05-1B1F}
  pR47F_0B2E(15, 0, 'press <enter>/<return> to continue');
end;

{ 1B23 }
procedure pO040_1B23;
var
  v1b: byte;
  v2b: byte;
begin
  {@1B29-1B31}
  pO055_0000(2);
  {@1B31-1B3C}
  v1b := pO055_0136(1);
  {@1B3C-1B47}
  v2b := pO055_0136(2);
  {@1B47-1B54}
  pO0B2_02E7(v1b, v2b);
end;

{ 1B58 }
procedure pO040_1B58;
begin
  {@1B5B-1B5F}
  Inc(w880A);
  if bC583 <> 0 then
  begin
    {@1B66-1B6B}
    b9D92 := 1;
    {@1B6B-1B6F}
    Inc(b9D93);
    {@1B6F-1B74}
    bC583 := 0;
    {@1B74-1B76}
    Exit;
  end;
  {@1B76-1B7B}
  b9D92 := 1;
  {@1B7B-1B7F}
  Inc(b9D93);
end;

{ 1B81 }
procedure pO040_1B81;
begin
  {@1B84-1B88}
  Inc(w880A);
  {@1B88-1B8D}
  b880F := 0;
  {@1B8D-1B92}
  pR142_011B;
  {@1B92-1B9F}
  pO0EC_07C0(p9CEE);
  {@1B9F-1BA4}
  pO0EC_301C;
  {@1BA4-1BA9}
  pO0EC_301C;
  {@1BA9-1BAE}
  bC58F := 0;
  {@1BAE-1BB3}
  bC582 := 1;
end;

{ 1BB5 }
procedure pO040_1BB5;
var
  v256a: string;
  v257b: byte;
  _f1: array[1..1] of byte;
begin
  {@1BBC-1BC3}
  v257b := bC591;
  {@1BC3-1BC8}
  bC591 := 0;
  {@1BC8-1BCD}
  bC58E := 0;
  {@1BCD-1BD5}
  pO055_0000(1);
  {@1BD5-1BE6}
  pR47F_0F07(1, 17, 38, 22);
  {@1BE6-1BFA}
  v256a := sB16E;
  {@1BFA-1C10}
  pO0EC_3497(v256a, 0, 0, @b9CEE);
  {@1C10-1C17}
  bC591 := v257b;
end;

{ 1C1B }
procedure pO040_1C1B;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  v6b: byte;
begin
  {@1C21-1C29}
  pO055_0000(2);
  {@1C29-1C34}
  v5b := pO055_0136(1);
  {@1C34-1C3D}
  pO06E_1E05(v5b);
  {@1C3D-1C48}
  v6b := pO055_0136(2);
  {@1C48-1C52}
  v6b := v6b shr 1;
  {@1C52-1C5A}
  v6b := v6b or 128;
  {@1C5A-1C66}
  PR327_byte(p9CEE)^.v := v6b;
  {@1C66-1C73}
  pO0EC_0EBF(p9CEE);
  {@1C73-1C80}
  pO0EC_07C0(p9CEE);
end;

{ 1C84 }
procedure pO040_1C84;
var
  v41a: string[40];
  v45p: pointer;
  v47w: word;
  v48b: byte;
  v49b: byte;
  _f1: array[1..1] of byte;
  v41a2: string[40] absolute v41a;
begin
  {@1C8A-1C92}
  pO055_0000(2);
  {@1C92-1CA5}
  v41a := sB16E;
  {@1CA5-1CB5}
  v47w := pO055_0567(bB12D, bB0ED);
  {@1CB5-1CC2}
  v45p := p9CF2;
  {@1CC2-1CC6}
  v48b := 0;
  {@1CC6-1CCA}
  v49b := 0;
  {@1CCA-1D12}
  while (v45p <> nil) and (v48b = 0) do
  begin
    {@1CD8-1D10}
    if (PR0_string(v45p)^.v = v41a2) and (PR327_byte(v45p)^.v > 127) then
      v48b := 1
    else
    begin
      {@1CFA-1D0D}
      v45p := PR483_pointer(v45p)^.v;
      {@1D0D-1D10}
      Inc(v49b);
    end;
  end;
  {@1D12-1D31}
  if v48b = 0 then
    v49b := 255
  else
  begin
    {@1D1E-1D31}
    if PR494_byte(v45p)^.v = 0 then
      v49b := v49b or 128;
  end;
  {@1D31-1D43}
  pO055_0766(v47w, v49b, bB0AC);
end;

{ 1D47 }
procedure pO040_1D47;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v7p: pointer;
  v8b: byte;
  v9b: byte;
  v11w: word;
  v13w: word;
  _f1: array[1..1] of byte;
begin
  {@1D4D-1D51}
  v9b := 0;
  {@1D51-1D55}
  v8b := 0;
  {@1D55-1D5D}
  pO055_0000(3);
  {@1D5D-1D68}
  v1b := pO055_0136(1);
  {@1D68-1D78}
  v11w := pO055_0567(bB12D, bB0ED);
  {@1D78-1D88}
  v13w := pO055_0567(bB12E, bB0EE);
  {@1D88-1D8C}
  v2b := 1;
  {@1D8C-1D90}
  v3b := 0;
  {@1D90-1D9D}
  v7p := p9CF2;
  {@1D9D-1E18}
  while (v7p <> nil) and (v8b = 0) do
  begin
    {@1DAB-1DAF}
    v2b := 0;
    if PR494_byte(v7p)^.v <> 0 then
      repeat
        {@1DBA-1DE2}
        if PRA30_byte(v7p)^.a[v2b] = v1b then
          v8b := 1
        else
        begin
          {@1DD3-1DE2}
          if v2b < 140 then
            Inc(v2b)
          else
            v9b := 1;
        end;
      until (v9b <> 0) or (v8b <> 0);
    {@1DEE-1DF2}
    v9b := 0;
    {@1DF2-1E05}
    v7p := PR483_pointer(v7p)^.v;
    if (v7p <> nil) and (v8b = 0) then
      Inc(v3b);
  end;
  {@1E18-1E22}
  if v8b = 0 then
    v2b := 255;
  {@1E22-1E34}
  pO055_0766(v11w, v2b, bB0AD);
  {@1E34-1E46}
  pO055_0766(v13w, v3b, bB0AE);
end;

{ 1E4A }
procedure pO040_1E4A;
var
  v2w: word;
begin
  {@1E50-1E58}
  pO055_0000(1);
  {@1E58-1E68}
  v2w := pO055_0567(bB12C, bB0EC);
  case v2w of
    1: pO055_16B9;
    2: pO055_1285;
    3: begin
      {@1E88-1E8D}
      pR6DD_0051;
      asm
  db 184,3,0,80,184,3,0,80,176,1,80,160,52,170,80
  call pO111_00A8
      end;
      {@1EA1-1EA6}
      pR6DD_0030;
      {@1EA6-1EAA}
      Inc(bAA34);
      if bAA34 > bAA33 then
        bAA34 := bAA32;
      {@1EB9-1EBE}
      pR47F_0D1A;
    end;
  end;
end;

{ 1EC2 }
procedure pO040_1EC2;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@1EC8-1ECC}
  v1b := 0;
  {@1ECC-1ED4}
  pO040_290D(w8804);
  {@1ED4-1EDE}
  pO06B_2829(@v1b);
  if v1b <> 0 then
  begin
    {@1EE4-1EE9}
    pO0EC_2ED1;
    {@1EE9-1EF1}
    pO040_290D(w8806);
  end;
  {@1EF1-1EF6}
  bAE7E := 1;
  {@1EF6-1EFB}
  pO10E_0000;
  {@1EFB-1F00}
  b94D5 := 0;
  if (PR33_byte(p87F8)^.v = 0) and (PR35_byte(p87F8)^.v = 1) then
    pO0FF_0000;
end;

{ 1F1F }
procedure pO040_1F1F;
var
  v1b: byte;
  v3w: word;
  _f1: array[1..5] of byte;
  v9b: byte;
  _f2: array[1..1] of byte;
begin
  {@1F25-1F2B}
  v9b := bC591;
  {@1F2B-1F30}
  bC591 := 0;
  if b7DE8 <> 0 then
  begin
    {@1F37-1F45}
    l9CEE := l7DE9;
    {@1F45-1F4A}
    b7DE8 := 0;
  end;
  {@1F4A-1F52}
  pO055_0000(1);
  {@1F52-1F5D}
  v1b := pO055_0136(1);
  case v1b of
    0: begin
      {@1F64-1F69}
      pO075_011F;
      if (bAAD5 <> 9) and (PR33_byte(p87F8)^.v = 0) and (PR35_byte(p87F8)^.v = 1) and (bC594 = 0) then
      begin
        {@1F8D-1F92}
        pO0EC_2ED1;
        {@1F92-1F97}
        pO0FF_0000;
      end;
    end;
    1: pO043_0000;
    2: begin
      {@1FA8-1FB0}
      pR670_0000(0);
      {@1FB0-1FB7}
      Halt;
    end;
    9: begin
      {@1FBD-1FC3}
      v3w := w880A;
      {@1FC3-1FC7}
      pO040_1EC2;
      {@1FC7-1FCD}
      w880A := v3w;
      if PR35_byte(p87F8)^.v = 1 then
        pO040_0000;
    end;
  end;
  {@1FDC-1FE2}
  bC591 := v9b;
end;

{ 1FE6 }
procedure pO040_1FE6;
begin
  {@1FE9-1FED}
  Inc(w880A);
  {@1FED-1FF8}
  pO075_3770(0, 1);
  {@1FF8-2006}
  p7DE9 := p9CEE;
  {@2006-2013}
  pO0EC_07C0(p9CEE);
end;

{ 2015 }
procedure pO040_2015;
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@201B-2029}
  XR670_046E(@bB01E, 6);
  {@2029-2031}
  pO055_0000(1);
  {@2031-203C}
  v5b := pO055_0136(1);
  if pO0EC_27C1(p9CEE, v5b, @v4b) <> 0 then
  begin
    {@2056-205B}
    bB01E := 1;
    {@205B-205D}
    Exit;
  end;
  {@205D-2062}
  bB01F := 1;
end;

{ 2066 }
procedure pO040_2066;
var
  v1b: byte;
  v5p: pointer;
  v9p: pointer;
  v13p: pointer;
  v17p: pointer;
  v18b: byte;
begin
  {@206C-2074}
  pO055_0000(1);
  {@2074-207F}
  v1b := pO055_0136(1);
  {@207F-2087}
  v18b := v1b and 128;
  {@2087-208F}
  v1b := v1b and 127;
  {@208F-209C}
  v9p := p9CEE;
  {@209C-20A9}
  v5p := p9CF2;
  {@20A9-215E}
  while v5p <> nil do
  begin
    {@20B4-20C7}
    v13p := PR423_pointer(v5p)^.v;
    {@20C7-213D}
    while v13p <> nil do
    begin
      {@20CF-20E0}
      v17p := PR42_pointer(v13p)^.v;
      if (v1b = PR46_byte(v13p)^.v) and ((v18b = 0) or (PR50_byte(v13p)^.v <> 0)) then
      begin
        {@20FC-2109}
        p9CEE := v5p;
        if PR52_byte(v13p)^.v <> 0 then
          pO0AA_1845(v13p);
        {@211E-212F}
        pO0EC_18EF(v5p, v13p);
      end;
      {@212F-213B}
      v13p := v17p;
    end;
    {@213D-2148}
    pO0EC_0EBF(v5p);
    {@2148-215B}
    v5p := PR483_pointer(v5p)^.v;
  end;
  {@215E-216B}
  p9CEE := v9p;
end;

{ 21BF }
procedure pO040_21BF;
var
  v4l: longint;
  v8l: longint;
  v12l: longint;
  v13b: byte;
  v17p: pointer;
  v18b: byte;
  v19b: byte;
  v18sb: shortint absolute v18b;
begin
  if false then begin
    if LV = 'Congratulations the party gains experience!' then;
    if LV = 'Congratulations ' then;
    if LV = ' gains experience!' then;
  end;
  {@21C6-21CE}
  pO055_0000(2);
  {@21CE-21DE}
  v4l := pO055_0136(2);
  {@21DE-21F4}
  v12l := v4l * LongInt(100);
  {@21F4-21FF}
  v13b := pO055_0136(1);
  {@21FF-2204}
  b9D93 := 17;
  {@2204-2209}
  b9D92 := 1;
  if v13b <> 0 then
  begin
    {@2212-223B}
    pR47F_0498(1, 17, 38, 22, 10, 0, 1, 'Congratulations the party gains experience!');
    {@223B-2240}
    pR47F_0D1A;
    {@2240-224D}
    v17p := p9CF2;
    {@224D-22EF}
    while v17p <> nil do
    begin
      {@2258-22D9}
      if PR494_byte(v17p)^.v <> 0 then
      begin
        {@2263-2267}
        v19b := 0;
        for v18b := 0 to 6 do
        begin
          {@2270-2284}
          if PRA337_byte(v17p)^.a[v18sb] > 0 then
            Inc(v19b);
        end;
        {@228A-22A6}
        v8l := v12l div LongInt(v19b);
        {@22A6-22C6}
        PR370_longint(v17p)^.v := PR370_longint(v17p)^.v + v8l;
        {@22C6-22D9}
        PR492_byte(v17p)^.v := pO0EC_38FA(v17p);
      end;
      {@22D9-22EC}
      v17p := PR483_pointer(v17p)^.v;
    end;
    {@22EF-22FC}
    pO0EC_07C0(p9CEE);
    {@22FC-22FF}
    Exit;
  end;
  {@22FF-230C}
  v17p := p9CEE;
  {@230C-231A}
  if PR494_byte(v17p)^.v = 0 then
    Exit;
  {@231A-2358}
  pR47F_0498(1, 17, 38, 22, 10, 0, 1, 'Congratulations ' + PR0_string(v17p)^.v + ' gains experience!');
  {@2358-235D}
  pR47F_0D1A;
  {@235D-2361}
  v19b := 0;
  for v18b := 0 to 6 do
  begin
    {@236A-237E}
    if PRA337_byte(v17p)^.a[v18sb] > 0 then
      Inc(v19b);
  end;
  {@2384-23A0}
  v8l := v12l div LongInt(v19b);
  {@23A0-23C0}
  PR370_longint(v17p)^.v := PR370_longint(v17p)^.v + v8l;
  {@23C0-23D3}
  PR492_byte(v17p)^.v := pO0EC_38FA(v17p);
end;

{ 23FD }
procedure pO040_23FD;
var
  v256a: string;
  v257b: byte;
  v259w: word;
  v259b: byte absolute v259w;
begin
  if false then begin
    if LV = 'This is recorded as journal entry ' then;
    if LV = '.' then;
    if Pos('', LV) = 0 then;
  end;
  {@2404-240C}
  pO055_0000(1);
  {@240C-2418}
  v259w := pO055_0136(1);
  {@2418-241D}
  b9D93 := 17;
  {@241D-2422}
  b9D92 := 1;
  {@2422-2460}
  v256a := 'This is recorded as journal entry ' + pO0EC_142F(v259b) + '.';
  {@2460-2480}
  pR47F_0498(1, 17, 38, 22, 10, 0, 1, v256a);
  {@2480-24A5}
  v257b := pO055_0F49('', s0E34, 1, bC584);
  {@24A5-24AA}
  pO108_167D;
end;

{ 24AE }
procedure pO040_24AE;
begin
  {@24B1-24C2}
  pR47F_0F07(1, 17, 38, 22);
  {@24C2-24C7}
  pO055_16B9;
  {@24C7-24CB}
  pO040_0000;
end;

{ 24CD }
procedure pO040_24CD;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@24D3-24DB}
  pO055_0000(1);
  {@24DB-24E6}
  v1b := pO055_0136(1);
  if v1b > 127 then
  begin
    {@24EC-24F9}
    pR5A0_0031(v1b and 127);
    {@24F9-24FB}
    Exit;
  end;
  {@24FB-2512}
  if (v1b < 15) and (v1b > 1) then
    pR5A0_0000(v1b);
end;

{ 2516 }
procedure pO040_2516;
begin
  {@2519-251D}
  Inc(w880A);
end;

{ 251F }
procedure pO040_251F;
var
  _f1: array[1..16] of byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  _f2: array[1..9] of byte;
  v29b: byte;
  _f3: array[1..6] of byte;
  v36b: byte;
  v40l: longint;
  v41b: byte;
  _f4: array[1..40] of byte;
  _v82: byte;
  v86p: pointer;
  v88w: word;
  v90w: word;
  v91b: byte;
  v90b: byte absolute v90w;
  v88b: byte absolute v88w;
  v17a: X17 absolute v17b;
  v82a: X63 absolute _v82;
begin
  {@2525-252D}
  pO055_0000(1);
  {@252D-2532}
  pO0EC_3E0E;
  {@2532-253D}
  v18b := pO055_0136(1);
  if (v18b > 11) or (v18b < 1) then
    v18b := 1;
  asm
  db 138,70,238,48,228,139,248,138,133,1,0,48,228,137,70,168
  end;
  {@255D-256D}
  v90w := a000C_ec3f[v18b];
  for v91b := v88b to v90b do
  begin
    {@2586-2594}
    v19b := a0017_ec3f[v91b];
    if v19b = 255 then
      pO055_1ABE(@v17b)
    else
      asm
  db 138,70,237,48,228,186,17,0,247,226,196,62,255,156,3,248,129,199,239,255,6,87,141,126,239,22,87,184
  db 17,0,80,154,163,9,37,8
      end;
    {@25CA-266C}
    if v17b <> 255 then
    begin
      {@25D3-25E6}
      Move(v17b, v36b, 17);
      {@25E6-25EE}
      v29b := v29b and 248;
      {@25EE-25F6}
      v40l := 0;
      {@25F6-25FA}
      v41b := 0;
      if pA7CA = nil then
      begin
        {@2603-2613}
        GetMem(pA7CA, 63);
        {@2613-2627}
        PR0_X63(pA7CA)^.v := v82a;
      end
      else
      begin
        {@2629-2636}
        v86p := pA7CA;
        {@2636-2646}
        GetMem(pA7CA, 63);
        {@2646-265A}
        PR0_X63(pA7CA)^.v := v82a;
        {@265A-266C}
        PR42_pointer(pA7CA)^.v := v86p;
      end;
    end;
  end;
  {@2677-267C}
  pO052_071E;
  {@267C-2681}
  pO0EC_3E0E;
end;

{ 2685 }
procedure pO040_2685;
begin
  {@2688-290B}
  case bB025 of
    0: pO040_0000;
    1: pO040_008A;
    2: pO040_00A7;
    3: pO040_00BC;
    4, 5, 6, 7: pO040_010E;
    8: pO040_01A5;
    9: pO040_0207;
    10: pO040_0259;
    11: pO040_037C;
    12: pO040_02E3;
    13: pO040_07A0;
    14: pO040_08E8;
    15: pO040_0903;
    16: pO040_0963;
    17, 18: pO040_09E9;
    19: pO040_0AA2;
    20: pO040_0AF9;
    21: pO040_0E35;
    22, 23, 24, 25, 26, 27: pO040_0BE5;
    28: pO040_114C;
    29: pO040_1641;
    30: pO040_115A;
    31: pO040_23FD;
    32: pO040_0C04;
    33: pO040_0C58;
    34: pO040_1677;
    35: pO040_24AE;
    36: pO040_11FD;
    37, 38: pO040_134B;
    39: pO040_13E0;
    40: pO040_1556;
    41: pO040_2516;
    42: pO040_0D7E;
    43: pO040_0FE1(0);
    44: pO040_24CD;
    45: pO040_1E4A;
    46: pO040_17BB;
    47, 48: pO040_0D0B;
    49: pO040_0FE1(1);
    50: pO040_16B8;
    51: pO040_1B58;
    52: pO040_1B23;
    53: pO040_0DE4;
    54: pO040_1C1B;
    55: pO040_1C84;
    56: pO040_1F1F;
    57: pO040_1BB5;
    58: pO040_176A;
    59: pO040_1D47;
    60: pO040_251F;
    61: pO040_1B81;
    62: pO040_1FE6;
    63: pO040_2015;
    64: pO040_2066;
    65: pO040_21BF;
  end;
end;

{ 290D }
procedure pO040_290D(a0: word);
var
  _f1: array[1..2] of byte;
begin
  {@2913-2918}
  bB16D := 1;
  {@2918-291E}
  w880A := a0;
  {@291E-2923}
  b7DE6 := 0;
  {@2923-2955}
  while (b7DE6 = 0) and (b8814 = 0) and (bC594 = 0) do
  begin
    {@2938-293E}
    bB024 := bB025;
    {@293E-294F}
    bB025 := PAL32768_byte(p87FC)^[w880A];
    {@294F-2953}
    pO040_2685;
  end;
  {@2955-295A}
  b7DE6 := 0;
end;

{ 2960 }
procedure pO040_2960;
begin
  {@2963-2A28}
  repeat
    {@2963-2968}
    pO111_096E;
    {@2968-296D}
    bAACC := 0;
    {@296D-2972}
    bAAD6 := 255;
    {@2972-2977}
    b7DE7 := 0;
    {@2977-2987}
    bA9F7 := pO12A_06BC(bA9F3, bA9F4);
    {@2987-2990}
    PR32_byte(p87F8)^.v := 0;
    {@2990-299E}
    p7DE9 := p9CEE;
    {@299E-29A6}
    pO040_290D(w8808);
    if b7DE7 = 0 then
      PR21_byte(p87F8)^.v := bC580;
    {@29B8-2A1E}
    if b7DE7 = 0 then
    begin
      {@29BF-29E0}
      if (b880D <> 4) or (b880C = 4) or (b880D = 4) and (b880C = 4) then
        pO10E_0000;
      {@29E0-29E5}
      b7DE7 := 0;
      {@29E5-29ED}
      pO040_290D(w8800);
      if b7DE7 = 0 then
      begin
        {@29F4-29FC}
        pO040_290D(w8802);
        if b7DE7 = 0 then
        begin
          {@2A03-2A11}
          p9CEE := p7DE9;
          {@2A11-2A1E}
          pO0EC_07C0(p9CEE);
        end;
      end;
    end;
  until b7DE7 = 0;
  {@2A28-2A2E}
  b880D := b880C;
end;

{ 2A30 }
procedure pO040_2A30;
var
  v1b: byte;
  v5p: pointer;
  v6b: byte;
begin
  {@2A36-2CAE}
  repeat
    {@2A36-2A3B}
    bC594 := 0;
    {@2A3B-2A49}
    p7DE9 := p9CEE;
    {@2A49-2A4E}
    bAE7E := 1;
    {@2A4E-2A53}
    b7DE8 := 0;
    {@2A53-2A58}
    b880C := 4;
    {@2A58-2A5D}
    b7DE7 := 0;
    if PR21_byte(p87F8)^.v = 0 then
    begin
      {@2A68-2A88}
      if b880E <> 0 then
        bC580 := 4
      else
      begin
        {@2A76-2A7B}
        bC580 := 16;
        {@2A7B-2A88}
        pO0EC_07C0(p9CEE);
      end;
    end
    else
      bC580 := PR21_byte(p87F8)^.v;
    {@2A95-2AA5}
    if PR33_byte(p87F8)^.v = 0 then
      b880C := 3;
    {@2AA5-2AAE}
    pO055_02BE(bC580);
    {@2AAE-2AB3}
    pO055_01C1;
    {@2AB3-2ABB}
    pO040_290D(w8808);
    if b880E <> 0 then
    begin
      {@2AC2-2ACF}
      v5p := p9CF2;
      {@2ACF-2B04}
      while v5p <> nil do
      begin
        {@2AD7-2AE4}
        p9CEE := v5p;
        {@2AE4-2AF7}
        v5p := PR483_pointer(v5p)^.v;
        {@2AF7-2B02}
        pO075_3770(1, 1);
      end;
      {@2B04-2B07}
      Exit;
    end;
    {@2B07-2B1F}
    if b7DE7 = 0 then
      PR21_byte(p87F8)^.v := bC580
    else
      pO040_2960;
    {@2B1F-2B43}
    if (b880C <> 3) and (b8811 <> 0) then
    begin
      {@2B2D-2B39}
      if bC58F = 1 then
        pO0EC_2ED1;
      {@2B39-2B3E}
      bAE7E := 1;
      {@2B3E-2B43}
      pO10E_0000;
    end;
    {@2B43-2B48}
    b8811 := 0;
    {@2B48-2B4D}
    bC591 := 0;
    {@2B4D-2B51}
    v6b := 1;
    {@2B51-2CA4}
    repeat
      {@2B51-2B57}
      bAAE5 := v6b;
      {@2B57-2B5F}
      v1b := pO068_0214;
      {@2B5F-2B65}
      v6b := bAAE5;
      {@2B65-2B73}
      p7DE9 := p9CEE;
      if b7DE7 = 0 then
        PR21_byte(p87F8)^.v := bC580;
      {@2B85-2C2A}
      while ((PR24_byte(p87F8)^.v > 1) or (v1b = 4)) and (b8814 = 0) and (bC594 = 0) do
      begin
        {@2BAD-2BF7}
        if v1b = 4 then
          pO040_1EC2
        else
        begin
          {@2BB9-2BC6}
          bC581 := PR24_byte(p87F8)^.v and 1;
          {@2BC6-2BCF}
          PR24_byte(p87F8)^.v := 1;
          {@2BCF-2BD4}
          bAE7E := 1;
          {@2BD4-2BD9}
          pO10E_0000;
          {@2BD9-2BE1}
          pO040_290D(w8802);
          if b7DE7 <> 0 then
            pO040_2960;
          {@2BEC-2BF7}
          PR24_byte(p87F8)^.v := bC581;
        end;
        {@2BF7-2C27}
        if (b8814 = 0) and (bC594 = 0) then
        begin
          {@2C05-2C0B}
          bAAE5 := v6b;
          {@2C0B-2C13}
          v1b := pO068_0214;
          {@2C13-2C19}
          v6b := bAAE5;
          {@2C19-2C27}
          p7DE9 := p9CEE;
        end;
      end;
      {@2C2A-2C40}
      if (b8814 = 0) and (bC594 = 0) then
        pO040_290D(w8800);
      {@2C40-2C93}
      if b7DE7 <> 0 then
        pO040_2960
      else
      begin
        {@2C4D-2C93}
        if (b8814 = 0) and (bC594 = 0) then
        begin
          {@2C5B-2C66}
          PR22_byte(p87F8)^.v := bA9F3;
          {@2C66-2C71}
          PR23_byte(p87F8)^.v := bA9F4;
          {@2C71-2C76}
          pO068_0664;
          {@2C76-2C7B}
          pO10E_0000;
          {@2C7B-2C80}
          bC584 := 0;
          {@2C80-2C88}
          pO040_290D(w8802);
          if b7DE7 <> 0 then
            pO040_2960;
        end;
      end;
    until (b8814 <> 0) or (bC594 <> 0);
  until b8814 <> 0;
  {@2CAE-2CB3}
  b8814 := 0;
  {@2CB3-2CC0}
  v5p := p9CF2;
  {@2CC0-2CF5}
  while v5p <> nil do
  begin
    {@2CC8-2CD5}
    p9CEE := v5p;
    {@2CD5-2CE8}
    v5p := PR483_pointer(v5p)^.v;
    {@2CE8-2CF3}
    pO075_3770(0, 1);
  end;
end;

{ 2CF9 }
begin
end.

