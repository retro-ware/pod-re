{ O0E2: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0E2;

interface

uses GAMEDATA;

procedure pO0E2_0000(a0: pointer; a1: byte; a2: S40);
procedure pO0E2_00BD(a0: byte; a1: pointer; a2: longint; a3: byte);
procedure pO0E2_0104(a0: pointer; a1: byte; a2: pointer);
procedure pO0E2_04DD(a0: byte; a1: pointer);
procedure pO0E2_0CAF(a0: pointer; a1: byte; a2: byte);
function pO0E2_112C(a0: pointer; a1: byte): byte;
function pO0E2_11C2(a0: pointer; a1: longint; a2: byte): byte;
function pO0E2_12C9(a0: pointer; a1: byte; a2: shortint): byte;
function pO0E2_1374(a0: byte; a1: byte): byte;
function pO0E2_13BF(a0: byte; a1: byte): word;
procedure pO0E2_13E5(a0: pointer; a1: byte; a2: word; a3: byte; a4: byte);
procedure pO0E2_149C(a0: pointer; a1: byte; a2: S40);
procedure pO0E2_1568(a0: pointer);
procedure pO0E2_15A0(a0: pointer);
function pO0E2_160B(a0: pointer; a1: byte): byte;
function pO0E2_16E6(a0: pointer; a1: byte; a2: byte; a3: pointer): byte;
procedure pO0E2_1D19(a0: pointer; a1: word; a2: byte; a3: byte);
procedure pO0E2_2039(a0: longint; a1: byte; a2: word; a3: byte; a4: byte; a5: byte; a6: byte; a7: S40);
function pO0E2_212C(a0: pointer; a1: byte; a2: byte): byte;
function pO0E2_21FC(a0: pointer; a1: byte; a2: S40): byte;
procedure pO0E2_186E(a0: pointer; a1: shortint);
procedure pO0E2_237B(a0: byte);

implementation

uses LIT, O0EC, O130, O135, R1C3, R47F;

type
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  E7_byte = record f: byte; _r: array[1..6] of byte end;
  E7_longint = record f: longint; _r: array[1..3] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R0_pointer = record v: pointer end;
  R16_byte = record _p: array[1..16] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R1_word = record _p: array[1..1] of byte; v: word end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R26_shortint = record _p: array[1..26] of byte; v: shortint end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R27_shortint = record _p: array[1..27] of byte; v: shortint end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R28_shortint = record _p: array[1..28] of byte; v: shortint end;
  R29_byte = record _p: array[1..29] of byte; v: byte end;
  R30_byte = record _p: array[1..30] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R313_byte = record _p: array[1..313] of byte; v: byte end;
  R314_byte = record _p: array[1..314] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R339_byte = record _p: array[1..339] of byte; v: byte end;
  R340_byte = record _p: array[1..340] of byte; v: byte end;
  R341_byte = record _p: array[1..341] of byte; v: byte end;
  R380_byte = record _p: array[1..380] of byte; v: byte end;
  R38_byte = record _p: array[1..38] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R480_shortint = record _p: array[1..480] of byte; v: shortint end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R491_byte = record _p: array[1..491] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R497_byte = record _p: array[1..497] of byte; v: byte end;
  R498_byte = record _p: array[1..498] of byte; v: byte end;
  R4_byte = record _p: array[1..4] of byte; v: byte end;
  R4_pointer = record _p: array[1..4] of byte; v: pointer end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R5_longint = record _p: array[1..5] of byte; v: longint end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R62_byte = record _p: array[1..62] of byte; v: byte end;
  RA16_byte = record _p: array[1..16] of byte; a: array[0..32000] of byte end;
  RA17_byte = record _p: array[1..17] of byte; a: array[0..32000] of byte end;
  RA306_byte = record _p: array[1..306] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA344_byte = record _p: array[1..344] of byte; a: array[0..32000] of byte end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
  TPV_var_longint_byte = procedure(var p0; p1: longint; p2: byte);
W10_23_237B = record case byte of 0: (_p0: array[1..7] of byte; _w23_7abyte: array[0..32000] of byte);
      1: (_p1: array[1..16] of byte; _w23_16abyte: array[0..32000] of byte); 2: (_p2: array[1..26] of byte;
      _w23_26shortint: shortint); 3: (_p3: array[1..27] of byte; _w23_27shortint: shortint) end;
W12_23_237B = record case byte of 0: (_p0: array[1..7] of byte; _w23_7abyte: array[0..32000] of byte);
      1: (_p1: array[1..16] of byte; _w23_16abyte: array[0..32000] of byte); 2: (_p2: array[1..26] of byte;
      _w23_26shortint: shortint); 3: (_p3: array[1..27] of byte; _w23_27shortint: shortint) end;
W14_23_237B = record case byte of 0: (_p0: array[1..7] of byte; _w23_7abyte: array[0..32000] of byte);
      1: (_p1: array[1..16] of byte; _w23_16abyte: array[0..32000] of byte); 2: (_p2: array[1..26] of byte;
      _w23_26shortint: shortint); 3: (_p3: array[1..27] of byte; _w23_27shortint: shortint) end;
W16_23_237B = record case byte of 0: (_p0: array[1..7] of byte; _w23_7abyte: array[0..32000] of byte);
      1: (_p1: array[1..16] of byte; _w23_16abyte: array[0..32000] of byte); 2: (_p2: array[1..26] of byte;
      _w23_26shortint: shortint); 3: (_p3: array[1..27] of byte; _w23_27shortint: shortint) end;
  PR0_byte = ^R0_byte;
  PR0_pointer = ^R0_pointer;
  PR16_byte = ^R16_byte;
  PR173_byte = ^R173_byte;
  PR178_byte = ^R178_byte;
  PR17_byte = ^R17_byte;
  PR1_word = ^R1_word;
  PR25_byte = ^R25_byte;
  PR26_shortint = ^R26_shortint;
  PR27_byte = ^R27_byte;
  PR27_shortint = ^R27_shortint;
  PR28_byte = ^R28_byte;
  PR28_shortint = ^R28_shortint;
  PR29_byte = ^R29_byte;
  PR30_byte = ^R30_byte;
  PR312_byte = ^R312_byte;
  PR313_byte = ^R313_byte;
  PR314_byte = ^R314_byte;
  PR323_pointer = ^R323_pointer;
  PR327_byte = ^R327_byte;
  PR339_byte = ^R339_byte;
  PR340_byte = ^R340_byte;
  PR341_byte = ^R341_byte;
  PR380_byte = ^R380_byte;
  PR38_byte = ^R38_byte;
  PR3_byte = ^R3_byte;
  PR421_byte = ^R421_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR480_shortint = ^R480_shortint;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR491_byte = ^R491_byte;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR497_byte = ^R497_byte;
  PR498_byte = ^R498_byte;
  PR4_byte = ^R4_byte;
  PR4_pointer = ^R4_pointer;
  PR508_byte = ^R508_byte;
  PR52_byte = ^R52_byte;
  PR5_longint = ^R5_longint;
  PR5_pointer = ^R5_pointer;
  PR61_byte = ^R61_byte;
  PR62_byte = ^R62_byte;
  PRA16_byte = ^RA16_byte;
  PRA17_byte = ^RA17_byte;
  PRA306_byte = ^RA306_byte;
  PRA337_byte = ^RA337_byte;
  PRA344_byte = ^RA344_byte;
  PRB7_50_byte = ^RB7_50_byte;
  PW10_23_237B = ^W10_23_237B;
  PW12_23_237B = ^W12_23_237B;
  PW14_23_237B = ^W14_23_237B;
  PW16_23_237B = ^W16_23_237B;
var
  a0C6D_ec3f: array[0..32759] of byte absolute d0C6D;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  a53E5_ec3f: array[0..32759] of byte absolute d53E5;
  a6DC9_ec3f: array[0..32759] of byte absolute d6DC9;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA6A0_9cf4: array[0..4679] of E7_longint absolute dA6A0;
  aA6A4_30da: array[0..4679] of E7_byte absolute dA6A4;
  aA6A5_30da: array[0..4679] of E7_byte absolute dA6A5;
  aA7E6_891c: array[0..8189] of TPV_var_longint_byte absolute dA7E6;
  b880C: byte absolute d880C;
  bA6DF: byte absolute dA6DF;
  bA6E5: byte absolute dA6E5;
  bA7D0: byte absolute dA7D0;
  bA7D1: byte absolute dA7D1;
  bA7D2: byte absolute dA7D2;
  bA7D5: byte absolute dA7D5;
  bA7D6: byte absolute dA7D6;
  bA7D8: byte absolute dA7D8;
  bA7DC: byte absolute dA7DC;
  bA7DE: byte absolute dA7DE;
  bA7E6: byte absolute dA7E6;
  bA7E7: byte absolute dA7E7;
  bA7E9: byte absolute dA7E9;
  bAE80: byte absolute dAE80;
  bAEF0: byte absolute dAEF0;
  gA9E2_6770: TPV_var_longint_byte absolute dA9E2;
  iA7D8: integer absolute dA7D8;
  l9CEE: longint absolute d9CEE;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pA6E0: pointer absolute dA6E0;
  pAE5D: pointer absolute dAE5D;
  sbA7DE: shortint absolute dA7DE;
  wA7D8: word absolute dA7D8;

procedure pO0E2_026D(a0: pointer; a1: byte); far; forward;
procedure pO0E2_0406(a0: pointer); far; forward;
procedure pO0E2_0487(a0: pointer); far; forward;
function pO0E2_166E(a0: byte; a1: byte): byte; far; forward;
procedure pO0E2_1697(a0: pointer; a1: pointer; a2: pointer); far; forward;
procedure pO0E2_22B0; far; forward;

{ 0000 }
procedure pO0E2_0000(a0: pointer; a1: byte; a2: S40);
var
  _f1: array[1..1] of byte;
begin
  {@0019-002F}
  pO0EC_1B08(pointer(a0), a2, 10, 0);
  case PR493_byte(a0)^.v of
    7, 6, 8: ;
  else
    {@0045-0050}
    PR493_byte(a0)^.v := a1;
    {@0050-0059}
    PR494_byte(a0)^.v := 0;
    {@0059-0062}
    PR508_byte(a0)^.v := 0;
    {@0062-006C}
    pO0E2_15A0(pointer(a0));
    {@006C-0078}
    pO0E2_04DD(13, @PV4_0_byte(a0).v);
    if (PR494_byte(a0)^.v = 0) and (PR493_byte(a0)^.v <> 10) then
      pO135_0F14(pointer(a0));
    {@0099-009E}
    pR47F_0D1A;
    {@009E-00A3}
    pO0EC_1BEF;
    if b880C <> 5 then
      pO0EC_07C0(p9CEE);
  end;
end;

{ 00BD }
procedure pO0E2_00BD(a0: byte; a1: pointer; a2: longint; a3: byte);
begin
  {@00C0-00DC}
  if bAE80 <> 0 then
  begin
    {@00C7-00DA}
    gA9E2_6770(PR0_byte(a1)^.v, a2, a3);
    {@00DA-00DC}
    Exit;
  end;
  {@00DC-0100}
  if a0 < 127 then
    aA7E6_891c[a0](PR0_byte(a1)^.v, a2, a3);
end;

{ 0104 }
procedure pO0E2_0104(a0: pointer; a1: byte; a2: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v8l: longint absolute v8p;
begin
  {@010A-0116}
  v8p := a2;
  if v8p = nil then
  begin
    {@011E-0131}
    v8p := PR323_pointer(a0)^.v;
    {@0131-0157}
    while (v8p <> nil) and (PR0_byte(v8p)^.v <> a1) do
      v8p := PR5_pointer(v8p)^.v;
  end;
  {@0157-0162}
  if v8p = nil then
    Exit;
  {@0162-0182}
  if PR4_byte(v8p)^.v <> 0 then
    pO0E2_00BD(a1, @PV4_0_byte(a0).v, v8l, 1);
  {@0182-020C}
  if PR323_pointer(a0)^.v = v8p then
    PR323_pointer(a0)^.v := PR5_pointer(v8p)^.v
  else
  begin
    {@01B3-01C6}
    v4p := PR323_pointer(a0)^.v;
    {@01C6-01F6}
    while (v4p <> nil) and (PR5_pointer(v4p)^.v <> v8p) do
      v4p := PR5_pointer(v4p)^.v;
    {@01F6-020C}
    PR5_pointer(v4p)^.v := PR5_pointer(v8p)^.v;
  end;
  {@020C-021B}
  FreeMem(v8p, 9);
  if a1 = 14 then
    pO0E2_186E(pointer(a0), 5);
  {@022E-0247}
  if (a1 = 12) or (a1 = 38) then
    pO0E2_186E(pointer(a0), 0);
end;

{ 026D }
procedure pO0E2_026D(a0: pointer; a1: byte);
var
  _f1: array[1..215] of byte;
  v216b: byte;
  v220p: pointer;
  v224l: longint;
  v225b: byte;
  _f2: array[1..1] of byte;
  v227b: byte;
  _f3: array[1..1] of byte;
  v224b: byte absolute v224l;
begin
  if false then begin
    if LSV = [21, 45..46, 49] then;
  end;
  {@0274-0279}
  v225b := 0;
  {@0279-0288}
  v220p := p9CF2;
  if pO0EC_27C1(pointer(PR0_pointer(a0)^.v), a1, @v224b) <> 0 then
    v225b := 1
  else
  begin
    {@02AD-03E1}
    if a1 in [21, 45..46, 49] then
    begin
      {@02C0-02D4}
      Move(bA6E5, v216b, 216);
      {@02D4-03CD}
      while (v220p <> nil) and (v225b = 0) do
      begin
        {@02EB-03B4}
        if pO0EC_27C1(v220p, a1, @v224b) <> 0 then
        begin
          {@0309-03B4}
          if b880C = 5 then
          begin
            {@0313-0325}
            if a1 = 49 then
              v227b := 6
            else
              v227b := 1;
            asm
  db 255,182,38,255,255,182,36,255
  call pO135_0CA2
  db 80,255,182,38,255,255,182,36,255
  call pO135_0CCA
  db 80,138,134,29,255,48,228,80,176,255,80,255,182,38,255,255,182,36,255
  call pO135_0CF2
  db 80
  call pO130_08D7
  db 160,228,166,136,134,28,255,176,1,58,134,28,255,119,64,136,134,30,255,235,4,254,134,30,255,196,126,8
  db 38,255,117,2,38,255,53
  call pO135_0D1A
  db 138,208,138,134,30,255,48,228,139,248,139,247,209,231,1,247,138,133,226,166,58,194,117,5,198,134,31,255
  db 1,138,134,30,255,58,134,28,255,117,198
            end;
          end
          else
            v225b := 1;
        end;
        {@03B4-03CA}
        v220p := PR483_pointer(v220p)^.v;
      end;
      {@03CD-03E1}
      Move(v216b, bA6E5, 216);
    end;
  end;
  {@03E1-0400}
  if v225b <> 0 then
    pO0E2_00BD(a1, @PR0_byte(a0)^.v, v224l, 0);
end;

{ 0406 }
procedure pO0E2_0406(a0: pointer);
var
  v1b: byte;
  v3w: word;
  v5w: word;
  _f1: array[1..1] of byte;
  v5i: integer absolute v5w;
begin
  {@040C-0419}
  v3w := PR491_byte(a0)^.v;
  if (v3w <> 0) and ((bA7D1 <> 0) or ((bA7D2 and 8) <> 0)) then
  begin
    {@042F-043E}
    v1b := pO0EC_2D90(bA7D5, 0);
    {@043E-0458}
    v5w := (11 - v1b) * 5 + v3w;
    if pO0E2_1374(1, 100) <= v5i then
    begin
      {@0469-046E}
      wA7D8 := 0;
      if (bA7D1 <> 91) and (bA7D1 <> 82) then
        bA7D1 := 0;
    end;
  end;
end;

{ 0487 }
procedure pO0E2_0487(a0: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@048D-0491}
  v1b := 0;
  if ((bA7D2 and 128) <> 0) and ((PR421_byte(a0)^.v and 16) <> 0) then
    v1b := 1;
  {@04AC-04C7}
  if ((bA7D2 and 64) <> 0) and ((PR421_byte(a0)^.v and 8) <> 0) then
    v1b := 1;
  {@04C7-04D7}
  if v1b <> 0 then
  begin
    {@04CD-04D2}
    wA7D8 := 0;
    {@04D2-04D7}
    bA7D1 := 0;
  end;
end;

{ 04DD }
procedure pO0E2_04DD(a0: byte; a1: pointer);
var
  _f1: array[1..4] of byte;
begin
  {@04E3-0C49}
  case a0 of
    0: ;
    1: begin
      {@04F1-04FD}
      pO0E2_026D(@PR0_byte(a1)^.v, 25);
      {@04FD-0509}
      pO0E2_026D(@PR0_byte(a1)^.v, 69);
      {@0509-0515}
      pO0E2_026D(@PR0_byte(a1)^.v, 37);
    end;
    2: begin
      {@051C-0528}
      pO0E2_026D(@PR0_byte(a1)^.v, 86);
      {@0528-0534}
      pO0E2_026D(@PR0_byte(a1)^.v, 101);
      {@0534-0540}
      pO0E2_026D(@PR0_byte(a1)^.v, 102);
      {@0540-054C}
      pO0E2_026D(@PR0_byte(a1)^.v, 121);
      {@054C-0558}
      pO0E2_026D(@PR0_byte(a1)^.v, 65);
      {@0558-0564}
      pO0E2_026D(@PR0_byte(a1)^.v, 115);
      {@0564-0570}
      pO0E2_026D(@PR0_byte(a1)^.v, 32);
      {@0570-057C}
      pO0E2_026D(@PR0_byte(a1)^.v, 88);
    end;
    3: begin
      {@0583-058F}
      pO0E2_026D(@PR0_byte(a1)^.v, 64);
      {@058F-059B}
      pO0E2_026D(@PR0_byte(a1)^.v, 101);
      {@059B-05A7}
      pO0E2_026D(@PR0_byte(a1)^.v, 102);
      {@05A7-05B3}
      pO0E2_026D(@PR0_byte(a1)^.v, 121);
      {@05B3-05BF}
      pO0E2_026D(@PR0_byte(a1)^.v, 65);
      {@05BF-05CB}
      pO0E2_026D(@PR0_byte(a1)^.v, 32);
      {@05CB-05D7}
      pO0E2_026D(@PR0_byte(a1)^.v, 104);
      {@05D7-05E3}
      pO0E2_026D(@PR0_byte(a1)^.v, 108);
    end;
    4: begin
      {@05EA-05F6}
      pO0E2_026D(@PR0_byte(a1)^.v, 29);
      {@05F6-0602}
      pO0E2_026D(@PR0_byte(a1)^.v, 105);
      {@0602-060E}
      pO0E2_026D(@PR0_byte(a1)^.v, 120);
      {@060E-061A}
      pO0E2_026D(@PR0_byte(a1)^.v, 75);
      {@061A-0626}
      pO0E2_026D(@PR0_byte(a1)^.v, 116);
    end;
    5: begin
      {@0630-063C}
      pO0E2_026D(@PR0_byte(a1)^.v, 28);
      {@063C-0648}
      pO0E2_026D(@PR0_byte(a1)^.v, 41);
      {@0648-0654}
      pO0E2_026D(@PR0_byte(a1)^.v, 60);
      {@0654-0660}
      pO0E2_026D(@PR0_byte(a1)^.v, 66);
      {@0660-066C}
      pO0E2_026D(@PR0_byte(a1)^.v, 67);
      {@066C-0678}
      pO0E2_026D(@PR0_byte(a1)^.v, 80);
      {@0678-0684}
      pO0E2_026D(@PR0_byte(a1)^.v, 81);
      {@0684-0690}
      pO0E2_026D(@PR0_byte(a1)^.v, 112);
      {@0690-069C}
      pO0E2_026D(@PR0_byte(a1)^.v, 82);
      {@069C-06A8}
      pO0E2_026D(@PR0_byte(a1)^.v, 103);
      {@06A8-06B4}
      pO0E2_026D(@PR0_byte(a1)^.v, 125);
    end;
    6: begin
      {@06BE-06CC}
      pO0E2_0406(pointer(PR0_pointer(a1)^.v));
      {@06CC-06D8}
      pO0E2_026D(@PR0_byte(a1)^.v, 10);
      {@06D8-06E4}
      pO0E2_026D(@PR0_byte(a1)^.v, 17);
      {@06E4-06F0}
      pO0E2_026D(@PR0_byte(a1)^.v, 20);
      {@06F0-06FC}
      pO0E2_026D(@PR0_byte(a1)^.v, 28);
      {@06FC-0708}
      pO0E2_026D(@PR0_byte(a1)^.v, 63);
      {@0708-0714}
      pO0E2_026D(@PR0_byte(a1)^.v, 57);
      {@0714-0720}
      pO0E2_026D(@PR0_byte(a1)^.v, 6);
      {@0720-072C}
      pO0E2_026D(@PR0_byte(a1)^.v, 40);
      {@072C-0738}
      pO0E2_026D(@PR0_byte(a1)^.v, 50);
      {@0738-0744}
      pO0E2_026D(@PR0_byte(a1)^.v, 54);
      {@0744-0750}
      pO0E2_026D(@PR0_byte(a1)^.v, 61);
      {@0750-075C}
      pO0E2_026D(@PR0_byte(a1)^.v, 73);
      {@075C-0768}
      pO0E2_026D(@PR0_byte(a1)^.v, 79);
      {@0768-0774}
      pO0E2_026D(@PR0_byte(a1)^.v, 93);
      {@0774-0780}
      pO0E2_026D(@PR0_byte(a1)^.v, 98);
      {@0780-078C}
      pO0E2_026D(@PR0_byte(a1)^.v, 119);
      {@078C-079A}
      pO0E2_0487(pointer(PR0_pointer(a1)^.v));
    end;
    7: begin
      {@07A1-07AD}
      pO0E2_026D(@PR0_byte(a1)^.v, 3);
      {@07AD-07B9}
      pO0E2_026D(@PR0_byte(a1)^.v, 27);
      {@07B9-07C5}
      pO0E2_026D(@PR0_byte(a1)^.v, 31);
      {@07C5-07D1}
      pO0E2_026D(@PR0_byte(a1)^.v, 52);
      {@07D1-07DD}
      pO0E2_026D(@PR0_byte(a1)^.v, 53);
      {@07DD-07E9}
      pO0E2_026D(@PR0_byte(a1)^.v, 106);
      {@07E9-07F5}
      pO0E2_026D(@PR0_byte(a1)^.v, 51);
    end;
    8: begin
      {@07FC-0808}
      pO0E2_026D(@PR0_byte(a1)^.v, 56);
      {@0808-0814}
      pO0E2_026D(@PR0_byte(a1)^.v, 89);
      {@0814-0820}
      pO0E2_026D(@PR0_byte(a1)^.v, 100);
    end;
    9: begin
      {@082A-0838}
      pO0E2_0406(pointer(PR0_pointer(a1)^.v));
      {@0838-0844}
      pO0E2_026D(@PR0_byte(a1)^.v, 18);
      {@0844-0850}
      pO0E2_026D(@PR0_byte(a1)^.v, 28);
      {@0850-085C}
      pO0E2_026D(@PR0_byte(a1)^.v, 40);
      {@085C-0868}
      pO0E2_026D(@PR0_byte(a1)^.v, 57);
      {@0868-0874}
      pO0E2_026D(@PR0_byte(a1)^.v, 63);
      {@0874-0880}
      pO0E2_026D(@PR0_byte(a1)^.v, 76);
      {@0880-088C}
      pO0E2_026D(@PR0_byte(a1)^.v, 79);
      {@088C-0898}
      pO0E2_026D(@PR0_byte(a1)^.v, 92);
      {@0898-08A4}
      pO0E2_026D(@PR0_byte(a1)^.v, 95);
      {@08A4-08B0}
      pO0E2_026D(@PR0_byte(a1)^.v, 123);
    end;
    10: begin
      {@08B7-08C3}
      pO0E2_026D(@PR0_byte(a1)^.v, 1);
      {@08C3-08CF}
      pO0E2_026D(@PR0_byte(a1)^.v, 2);
      {@08CF-08DB}
      pO0E2_026D(@PR0_byte(a1)^.v, 26);
      {@08DB-08E7}
      pO0E2_026D(@PR0_byte(a1)^.v, 33);
      {@08E7-08F3}
      pO0E2_026D(@PR0_byte(a1)^.v, 36);
      {@08F3-08FF}
      pO0E2_026D(@PR0_byte(a1)^.v, 49);
      {@08FF-090B}
      pO0E2_026D(@PR0_byte(a1)^.v, 120);
    end;
    11: begin
      {@0915-0921}
      pO0E2_026D(@PR0_byte(a1)^.v, 4);
      {@0921-092D}
      pO0E2_026D(@PR0_byte(a1)^.v, 8);
      {@092D-0939}
      pO0E2_026D(@PR0_byte(a1)^.v, 9);
      {@0939-0945}
      pO0E2_026D(@PR0_byte(a1)^.v, 13);
      {@0945-0951}
      pO0E2_026D(@PR0_byte(a1)^.v, 17);
      {@0951-095D}
      pO0E2_026D(@PR0_byte(a1)^.v, 30);
      {@095D-0969}
      pO0E2_026D(@PR0_byte(a1)^.v, 33);
      {@0969-0975}
      pO0E2_026D(@PR0_byte(a1)^.v, 45);
      {@0975-0981}
      pO0E2_026D(@PR0_byte(a1)^.v, 46);
      {@0981-098D}
      pO0E2_026D(@PR0_byte(a1)^.v, 118);
      {@098D-0999}
      pO0E2_026D(@PR0_byte(a1)^.v, 71);
      {@0999-09A5}
      pO0E2_026D(@PR0_byte(a1)^.v, 122);
    end;
    12: begin
      {@09AF-09BB}
      pO0E2_026D(@PR0_byte(a1)^.v, 8);
      {@09BB-09C7}
      pO0E2_026D(@PR0_byte(a1)^.v, 9);
      {@09C7-09D3}
      pO0E2_026D(@PR0_byte(a1)^.v, 10);
      {@09D3-09DF}
      pO0E2_026D(@PR0_byte(a1)^.v, 13);
      {@09DF-09EB}
      pO0E2_026D(@PR0_byte(a1)^.v, 17);
      {@09EB-09F7}
      pO0E2_026D(@PR0_byte(a1)^.v, 20);
      {@09F7-0A03}
      pO0E2_026D(@PR0_byte(a1)^.v, 33);
      {@0A03-0A0F}
      pO0E2_026D(@PR0_byte(a1)^.v, 36);
      {@0A0F-0A1B}
      pO0E2_026D(@PR0_byte(a1)^.v, 45);
      {@0A1B-0A27}
      pO0E2_026D(@PR0_byte(a1)^.v, 46);
      {@0A27-0A33}
      pO0E2_026D(@PR0_byte(a1)^.v, 49);
      {@0A33-0A3F}
      pO0E2_026D(@PR0_byte(a1)^.v, 50);
      {@0A3F-0A4B}
      pO0E2_026D(@PR0_byte(a1)^.v, 54);
      {@0A4B-0A57}
      pO0E2_026D(@PR0_byte(a1)^.v, 61);
      {@0A57-0A63}
      pO0E2_026D(@PR0_byte(a1)^.v, 94);
      {@0A63-0A6F}
      pO0E2_026D(@PR0_byte(a1)^.v, 97);
      {@0A6F-0A7B}
      pO0E2_026D(@PR0_byte(a1)^.v, 126);
    end;
    13: ;
    14: begin
      {@0A89-0A95}
      pO0E2_026D(@PR0_byte(a1)^.v, 70);
      {@0A95-0AA1}
      pO0E2_026D(@PR0_byte(a1)^.v, 83);
      {@0AA1-0AAD}
      pO0E2_026D(@PR0_byte(a1)^.v, 84);
      {@0AAD-0AB9}
      pO0E2_026D(@PR0_byte(a1)^.v, 85);
      {@0AB9-0AC5}
      pO0E2_026D(@PR0_byte(a1)^.v, 90);
      {@0AC5-0AD1}
      pO0E2_026D(@PR0_byte(a1)^.v, 91);
      {@0AD1-0ADD}
      pO0E2_026D(@PR0_byte(a1)^.v, 96);
      {@0ADD-0AE9}
      pO0E2_026D(@PR0_byte(a1)^.v, 58);
      {@0AE9-0AF5}
      pO0E2_026D(@PR0_byte(a1)^.v, 117);
    end;
    15: begin
      {@0AFC-0B08}
      pO0E2_026D(@PR0_byte(a1)^.v, 11);
      {@0B08-0B14}
      pO0E2_026D(@PR0_byte(a1)^.v, 21);
      {@0B14-0B20}
      pO0E2_026D(@PR0_byte(a1)^.v, 30);
      {@0B20-0B2C}
      pO0E2_026D(@PR0_byte(a1)^.v, 68);
      {@0B2C-0B38}
      pO0E2_026D(@PR0_byte(a1)^.v, 82);
    end;
    16: begin
      {@0B3F-0B4B}
      pO0E2_026D(@PR0_byte(a1)^.v, 25);
      {@0B4B-0B57}
      pO0E2_026D(@PR0_byte(a1)^.v, 69);
      {@0B57-0B63}
      pO0E2_026D(@PR0_byte(a1)^.v, 37);
      {@0B63-0B6F}
      pO0E2_026D(@PR0_byte(a1)^.v, 47);
      {@0B6F-0B7B}
      pO0E2_026D(@PR0_byte(a1)^.v, 48);
      {@0B7B-0B87}
      pO0E2_026D(@PR0_byte(a1)^.v, 89);
    end;
    17: begin
      {@0B8E-0B9A}
      pO0E2_026D(@PR0_byte(a1)^.v, 1);
      {@0B9A-0BA6}
      pO0E2_026D(@PR0_byte(a1)^.v, 11);
    end;
    18: begin
      {@0BAD-0BB9}
      pO0E2_026D(@PR0_byte(a1)^.v, 74);
      {@0BB9-0BC5}
      pO0E2_026D(@PR0_byte(a1)^.v, 39);
      {@0BC5-0BD1}
      pO0E2_026D(@PR0_byte(a1)^.v, 42);
      {@0BD1-0BDD}
      pO0E2_026D(@PR0_byte(a1)^.v, 99);
    end;
    19: begin
      {@0BE3-0BEF}
      pO0E2_026D(@PR0_byte(a1)^.v, 11);
      {@0BEF-0BFB}
      pO0E2_026D(@PR0_byte(a1)^.v, 23);
    end;
    20: begin
      {@0C01-0C0D}
      pO0E2_026D(@PR0_byte(a1)^.v, 50);
      {@0C0D-0C19}
      pO0E2_026D(@PR0_byte(a1)^.v, 54);
    end;
    21: pO0E2_026D(@PR0_byte(a1)^.v, 35);
    22: ;
    23: ;
    24: pO0E2_026D(@PR0_byte(a1)^.v, 100);
  end;
end;

{ 0CAF }
procedure pO0E2_0CAF(a0: pointer; a1: byte; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v6l: longint;
  v10l: longint;
  v11b: byte;
  v15l: longint;
  v16b: byte;
  v17b: byte;
  v10b: byte absolute v10l;
  v6b: byte absolute v6l;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'starts to cough' then;
    if LV = 'lost a spell' then;
    if LV = 'chokes and gags from nausea' then;
    if LV = 'is Poisoned' then;
    if LV = 'is killed' then;
    if LV = 'is cut by knives' then;
    LM2_0('is Poisoned', 'is cut by knives');
  end;
  {@0CB5-0CC3}
  if PR494_byte(a0)^.v = 0 then
    Exit;
  {@0CC3-0CC8}
  bA7DC := 1;
  {@0CC8-0CE5}
  pO135_0D94(longint(a0), 8, @v2b, @v1b, @v17b);
  if (v17b <> 0) and ((v17b <> 29) or (a2 = 0)) then
  begin
    {@0CFD-0D39}
    if (pO135_0805(longint(a0), 1) = 0) or (bAEF0 = 0) then
      asm
  db 255,118,12,255,118,10
  call pO135_0CA2
  db 80,255,118,12,255,118,10
  call pO135_0CCA
  db 80,176,255,80,176,8,80
  call pO135_0A4D
      end;
    {@0D39-1121}
    case v17b of
      29: begin
        {@0D43-0D48}
        bA7D5 := 34;
if (PR314_byte(a0)^.v = 0) and (pO0EC_27C1(pointer(a0), 31, @v6b) = 0) and ((PR421_byte(a0)^.v
            and 24) = 0) then
        begin
          {@0D81-0D94}
          v11b := pO0E2_12C9(pointer(a0), 0, 0);
          if v11b <> 0 then
          begin
            {@0D9D-0DAA}
            v15l := l9CEE;
            {@0DAA-0DE1}
            pO0E2_2039(longint(a0), 30, pO0E2_1374(1, 4) + 1, 255, 0, 0, v11b, 'starts to cough');
            {@0DE1-0DE9}
            v10l := 0;
            if pO0EC_27C1(pointer(a0), 30, @v10b) <> 0 then
            begin
              {@0E00-0E15}
              pO0E2_00BD(30, @PV4_0_byte(a0).v, v6l, 0);
              if PR0_byte(PR487_pointer(a0)^.v)^.v > 0 then
              begin
                {@0E23-0E43}
                pO0EC_1B08(pointer(a0), 'lost a spell', 12, 1);
                {@0E43-0E5A}
                pO0EC_186D(pointer(a0), PR0_byte(PR487_pointer(a0)^.v)^.v);
                {@0E5A-0E68}
                v16b := pO0EC_2CF6(pointer(a0));
              end;
            end;
            {@0E68-0E75}
            l9CEE := v15l;
          end
          else
          begin
            {@0E77-0E84}
            v15l := l9CEE;
            {@0E84-0EBB}
            pO0E2_2039(longint(a0), 31, pO0E2_1374(1, 4) + 1, 255, 0, 0, v11b, 'chokes and gags from nausea');
            if pO0EC_27C1(pointer(a0), 31, @v6b) <> 0 then
              pO0E2_00BD(31, @PV4_0_byte(a0).v, v6l, 0);
            {@0EE7-0EF4}
            l9CEE := v15l;
          end;
        end;
      end;
      28: begin
        {@0EFE-0F03}
        bA7D5 := 91;
        if (PR494_byte(a0)^.v <> 0) and ((PR421_byte(a0)^.v and 16) = 0) then
          case PR312_byte(a0)^.v of
            0..4: begin
              {@0F32-0F52}
              pO0EC_1B08(pointer(a0), 'is Poisoned', 10, 0);
              {@0F52-0F57}
              pR47F_0D1A;
              {@0F57-0F6D}
              pO0E2_13E5(pointer(a0), 55, 0, 255, 0);
              {@0F6D-0F89}
              pO0E2_0000(pointer(a0), 6, 'is killed');
            end;
            5: begin
              {@0F90-0FFB}
              if pO0E2_12C9(pointer(a0), 0, -4) = 0 then
              begin
                {@0FA4-0FC4}
                pO0EC_1B08(pointer(a0), 'is Poisoned', 10, 0);
                {@0FC4-0FC9}
                pR47F_0D1A;
                {@0FC9-0FDF}
                pO0E2_13E5(pointer(a0), 55, 0, 255, 0);
                {@0FDF-0FFB}
                pO0E2_0000(pointer(a0), 6, 'is killed');
              end;
            end;
            6: begin
              {@1002-106D}
              if pO0E2_12C9(pointer(a0), 0, 0) = 0 then
              begin
                {@1016-1036}
                pO0EC_1B08(pointer(a0), 'is Poisoned', 10, 0);
                {@1036-103B}
                pR47F_0D1A;
                {@103B-1051}
                pO0E2_13E5(pointer(a0), 55, 0, 255, 0);
                {@1051-106D}
                pO0E2_0000(pointer(a0), 6, 'is killed');
              end;
            end;
          else
            {@106F-1074}
            bA7D2 := 136;
            {@1074-108F}
            pO0E2_1D19(pointer(a0), pO0E2_13BF(1, 10), 0, 0);
          end;
      end;
      27: begin
        {@1099-109E}
        bA7D5 := 101;
        {@109E-10A3}
        bA7D2 := 8;
        {@10A3-10A9}
        wA7D8 := 255;
        {@10A9-10B5}
        pO0E2_04DD(9, @PV4_0_byte(a0).v);
if (PR494_byte(a0)^.v <> 0) and (wA7D8 <> 0) and ((a1 = 0) or (pO0E2_12C9(pointer(a0), 4,
            0) = 0)) then
        begin
          {@10E1-1101}
          pO0EC_1B08(pointer(a0), 'is cut by knives', 10, 0);
          {@1101-1106}
          pR47F_0D1A;
          {@1106-1121}
          pO0E2_1D19(pointer(a0), pO0E2_13BF(8, 8), 0, 0);
        end;
      end;
    end;
  end;
  {@1121-1126}
  bA7DC := 0;
end;

{ 112C }
function pO0E2_112C(a0: pointer; a1: byte): byte;
var
  v2b: byte;
begin
  {@1132-1136}
  v2b := 0;
  {@1136-1143}
  bA7DE := pO0E2_1374(1, 20);
  if sbA7DE > 1 then
  begin
    {@114A-115D}
    if sbA7DE > 16 then
      bA7E9 := 1
    else
      bA7E9 := 0;
    {@115D-1169}
    if bA7DE = 20 then
      bA7DE := 100;
    {@1169-1175}
    pO0E2_04DD(16, @PV4_0_byte(a0).v);
    if (sbA7DE >= 0) and ((sbA7DE + a1) > PR498_byte(pointer(a0))^.v) then
      v2b := 1;
    {@119D-11B3}
    bA7E9 := Ord((bA7E9 <> 0) and (v2b <> 0));
  end;
  {@11B3-11B9}
  pO0E2_112C := v2b;
end;

{ 11C2 }
function pO0E2_11C2(a0: pointer; a1: longint; a2: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
  v2sb: shortint absolute v2b;
begin
  {@11C8-11CC}
  v3b := 0;
  {@11CC-11D0}
  pO0E2_11C2 := 0;
  {@11D0-11DA}
  pO0E2_1568(pointer(a0));
  {@11DA-11E7}
  bA7DE := pO0E2_1374(1, 20);
  {@11E7-11F1}
  if sbA7DE <= 1 then
    Exit;
  {@11F1-1204}
  if sbA7DE > 16 then
    bA7E9 := 1
  else
    bA7E9 := 0;
  {@1204-1210}
  if bA7DE = 20 then
    bA7DE := 100;
  {@1210-121C}
  pO0E2_04DD(10, @PV4_0_byte(a0).v);
  {@121C-1228}
  pO0E2_04DD(16, @PV4_0_byte(a1).v);
  if PR495_byte(a0)^.v = 0 then
  begin
    {@1233-123E}
    v2b := PR46_byte(p87F8)^.v;
    case PR38_byte(p87F8)^.v of
      1: Inc(v2b, 2);
      2: Inc(v2b);
      4: Dec(v2b);
      5: Dec(v2b, 2);
    end;
  end
  else
    v2b := PR0_byte(p87F8)^.v;
  {@1276-12AA}
  if (sbA7DE >= 0) and ((Integer(sbA7DE + PR497_byte(a0)^.v) + v2sb) >= a2) then
  begin
    {@12A2-12A6}
    v3b := 1;
    {@12A6-12AA}
    pO0E2_11C2 := 1;
  end;
  {@12AA-12C0}
  bA7E9 := Ord((bA7E9 <> 0) and (v3b <> 0));
end;

{ 12C9 }
function pO0E2_12C9(a0: pointer; a1: byte; a2: shortint): byte;
var
  _f1: array[1..5] of byte;
  v7b: byte;
  _f2: array[1..1] of byte;
begin
  {@12CF-12D4}
  bA7E7 := 1;
  {@12D4-12E1}
  bA7D0 := pO0E2_1374(1, 20);
  if pO0EC_27C1(pointer(a0), 118, @v7b) <> 0 then
    bA7D0 := 1;
  {@12FD-1365}
  case bA7D0 of
    1: bA7E7 := 0;
    20: bA7E7 := 1;
  else
    {@1316-1333}
    bA7D0 := Integer(bA7D0 + PR480_shortint(a0)^.v) + a2;
    {@1333-1339}
    bA7E6 := a1;
    {@1339-1345}
    pO0E2_04DD(12, @PV4_0_byte(a0).v);
    if PRA306_byte(a0)^.a[shortint(a1)] <= bA7D0 then
      bA7E7 := 1
    else
      bA7E7 := 0;
  end;
  {@1365-136B}
  pO0E2_12C9 := bA7E7;
end;

{ 1374 }
function pO0E2_1374(a0: byte; a1: byte): byte;
var
  v2b: byte;
  v3b: byte;
begin
  {@137A-137E}
  v3b := 0;
  if a0 > 0 then
    for v2b := 1 to a0 do
      Inc(v3b, Random(a1) + 1);
  {@13B0-13B6}
  pO0E2_1374 := v3b;
end;

{ 13BF }
function pO0E2_13BF(a0: byte; a1: byte): word;
begin
  {@13C5-13CB}
  bA7D6 := a0;
  {@13CB-13DC}
  pO0E2_13BF := pO0E2_1374(a0, a1);
end;

{ 13E5 }
procedure pO0E2_13E5(a0: pointer; a1: byte; a2: word; a3: byte; a4: byte);
var
  v4p: pointer;
  v8p: pointer;
begin
  {@13EB-13FA}
  GetMem(v4p, 9);
  if PR323_pointer(a0)^.v = nil then
    PR323_pointer(a0)^.v := v4p
  else
  begin
    {@141E-1431}
    v8p := PR323_pointer(a0)^.v;
    {@1431-1451}
    while PR5_pointer(v8p)^.v <> nil do
      v8p := PR5_pointer(v8p)^.v;
    {@1451-1462}
    PR5_pointer(v8p)^.v := v4p;
  end;
  {@1462-146F}
  PR5_longint(v4p)^.v := 0;
  {@146F-1478}
  PR0_byte(v4p)^.v := a1;
  {@1478-1482}
  PR1_word(v4p)^.v := a2;
  {@1482-148C}
  PR4_byte(v4p)^.v := a4;
  {@148C-1496}
  PR3_byte(v4p)^.v := a3;
end;

{ 149C }
procedure pO0E2_149C(a0: pointer; a1: byte; a2: S40);
var
  v42b: byte;
begin
  {@14B5-14C3}
  if PR494_byte(a0)^.v = 0 then
    Exit;
  {@14C3-14D1}
  v42b := pO135_0D1A(longint(a0));
  {@14D1-14E2}
  pO135_141F(longint(a0), 3, 0);
  {@14E2-14F8}
  pO0EC_1B08(pointer(a0), a2, 10, 1);
  {@14F8-1501}
  PR494_byte(a0)^.v := 0;
  {@1501-150C}
  PR493_byte(a0)^.v := a1;
  if PR493_byte(a0)^.v <> 3 then
    PR508_byte(a0)^.v := 0;
  {@1520-152F}
  pO135_067C(0, 0, v42b);
  {@152F-1534}
  pR1C3_10FD;
  {@1534-1544}
  a9EF4_2a50[v42b].f := 0;
  {@1544-1549}
  pO135_04F4;
  if pO0EC_2CF6(pointer(a0)) <> 0 then
    pO0E2_15A0(pointer(a0));
end;

{ 1568 }
procedure pO0E2_1568(a0: pointer);
var
  v4p: pointer;
  v4b: byte absolute v4p;
begin
  {@156E-159A}
  while pO0EC_27C1(pointer(a0), 25, @v4b) <> 0 do
    pO0E2_0104(pointer(a0), 25, v4p);
end;

{ 15A0 }
procedure pO0E2_15A0(a0: pointer);
var
  v1b: byte;
  _f1: array[1..3] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@15A6-15D1}
  for v1b := 1 to 16 do
    pO0E2_0104(pointer(a0), a0C6D_ec3f[v1b], nil);
  {@15D1-15FC}
  if (pO0EC_27C1(pointer(a0), 77, @v5b) <> 0) and (PR327_byte(a0)^.v = 179) then
    PR495_byte(a0)^.v := 0;
end;

{ 160B }
function pO0E2_160B(a0: pointer; a1: byte): byte;
var
  v5p: pointer;
  v5b: byte absolute v5p;
begin
  if false then begin
    if LV = 'is Cured' then;
  end;
  {@1611-1615}
  pO0E2_160B := 0;
  if pO0EC_27C1(pointer(a0), a1, @v5b) <> 0 then
  begin
    {@162D-164D}
    pO0EC_1B08(pointer(a0), 'is Cured', 10, 1);
    {@164D-1661}
    pO0E2_0104(pointer(a0), a1, v5p);
    {@1661-1665}
    pO0E2_160B := 1;
  end;
end;

{ 166E }
function pO0E2_166E(a0: byte; a1: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@1674-167F}
  pO0E2_166E := a0 + 100;
  if a0 = 18 then
    pO0E2_166E := a1 + 1;
end;

{ 1697 }
procedure pO0E2_1697(a0: pointer; a1: pointer; a2: pointer);
begin
  {@169A-16A1}
  PR0_byte(a2)^.v := 0;
  {@16A1-16B0}
  PR0_byte(a1)^.v := PR3_byte(a0)^.v and 127;
  if PR0_byte(a1)^.v <= 101 then
  begin
    {@16B9-16C8}
    PR0_byte(a2)^.v := PR0_byte(a1)^.v - 1;
    {@16C8-16CF}
    PR0_byte(a1)^.v := 18;
    {@16CF-16D1}
    Exit;
  end;
  {@16D1-16E2}
  PR0_byte(a1)^.v := PR0_byte(a1)^.v - 100;
end;

{ 16E6 }
function pO0E2_16E6(a0: pointer; a1: byte; a2: byte; a3: pointer): byte;
var
  _f1: array[1..11] of byte;
begin
  {@16EC-1722}
  if (a1 > PR16_byte(a0)^.v) or (a1 = 18) and (a2 > PR29_byte(a0)^.v) then
  begin
    {@170A-170E}
    pO0E2_16E6 := 1;
    {@170E-1720}
    PR0_byte(a3)^.v := pO0E2_166E(a1, a2);
    {@1720-1722}
    Exit;
  end;
  {@1722-1726}
  pO0E2_16E6 := 0;
end;

{ 186E }
procedure pO0E2_186E(a0: pointer; a1: shortint);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  v16p: pointer;
  v17b: byte;
  v18b: byte;
  v12sb: shortint absolute v12b;
  v8b: byte absolute v8p;
  { 172F }
  procedure pO0E2_172F;
  begin
    {@1732-1778}
    if (v2b > v1b) or (v2b = 18) and (v4b > v3b) then
    begin
      {@175C-176A}
      v1b := v2b;
      {@176A-1778}
      v3b := v4b;
    end;
  end;

  { 177C }
  procedure pO0E2_177C(b0: shortint; b1: byte);
  begin
    {@177F-179E}
    if a6DC9_ec3f[b0] <= b1 then
      b1 := a6DC9_ec3f[b0] - 1;
    {@179E-17A7}
    if byte(b0) = 4 then
      Inc(b1);
    {@17A7-183C}
    if (byte(b0) = 2) or (byte(b0) = 4) or (byte(b0) = 3) then
    begin
      {@17BC-183A}
      case v1b of
        15..19: Inc(v10b, (v1b - 14) * b1);
        20: Inc(v10b, b1 * 5);
        21..23: Inc(v10b, b1 * 6);
        24..25: Inc(v10b, b1 * 7);
      end;
      {@183A-183C}
      Exit;
    end;
    {@183C-1856}
    if v1b > 15 then
    begin
      {@1846-1854}
      Inc(v10b, b1 * 2);
      {@1854-1856}
      Exit;
    end;
    {@1856-186A}
    if v1b = 15 then
      Inc(v10b, b1);
  end;

begin
  {@1874-1878}
  v10b := 0;
  {@1878-187C}
  v2b := 0;
  {@187C-1880}
  v4b := 0;
  {@1880-1893}
  v16p := PR423_pointer(a0)^.v;
  {@1893-18A5}
  v1b := PRA16_byte(a0)^.a[a1 * 2];
  {@18A5-18AF}
  v3b := PR29_byte(a0)^.v;
  {@18AF-1923}
  while v16p <> nil do
  begin
    {@18B7-1910}
    if (PR62_byte(v16p)^.v > 128) and (PR52_byte(v16p)^.v <> 0) then
    begin
      {@18CB-18D7}
      v17b := PR62_byte(v16p)^.v and 127;
      if byte(a1) = 0 then
      begin
        {@18DD-190B}
        case v17b of
          3: begin
            {@18E4-18E8}
            v2b := 18;
            {@18E8-18EC}
            v4b := 100;
          end;
          5: begin
            {@18F2-1901}
            v2b := PR61_byte(v16p)^.v + 18;
            if v2b = 18 then
              v4b := 100;
          end;
        end;
        {@190B-1910}
        pO0E2_172F;
      end;
    end;
    {@1910-1921}
    v16p := PR42_pointer(v16p)^.v;
  end;
  {@1923-1C60}
  case byte(a1) of
    0: begin
      {@192D-19D5}
      if pO0EC_27C1(pointer(a0), 38, @v8b) <> 0 then
      begin
        {@1947-195B}
        pO0E2_1697(v8p, @v2b, @v4b);
        if (v1b <= 18) and (v3b < 100) then
        begin
          {@1967-1978}
          v2b := v1b + v2b;
          if v2b > 18 then
          begin
            {@197E-19D0}
            if (PR339_byte(a0)^.v > 0) or (PR340_byte(a0)^.v > 0) or (PR341_byte(a0)^.v > 0) then
            begin
              {@199F-19BC}
              v4b := PR28_byte(a0)^.v + (v2b - 18) * 10;
              if v4b > 100 then
                v4b := 100;
              {@19C6-19CA}
              v2b := 18;
            end
            else
              v2b := 18;
          end;
        end;
        {@19D0-19D5}
        pO0E2_172F;
      end;
      {@19D5-1A05}
      if pO0EC_27C1(pointer(a0), 113, @v8b) <> 0 then
      begin
        {@19EC-1A00}
        pO0E2_1697(v8p, @v2b, @v4b);
        {@1A00-1A05}
        pO0E2_172F;
      end;
      {@1A05-1A35}
      if pO0EC_27C1(pointer(a0), 12, @v8b) <> 0 then
      begin
        {@1A1C-1A30}
        pO0E2_1697(v8p, @v2b, @v4b);
        {@1A30-1A35}
        pO0E2_172F;
      end;
      {@1A35-1A3F}
      PR17_byte(a0)^.v := v1b;
      {@1A3F-1A49}
      PR28_byte(a0)^.v := v3b;
    end;
    4: begin
      {@1A53-1A57}
      v18b := 0;
      {@1A57-1A62}
      v9b := PR178_byte(a0)^.v;
      {@1A62-1A72}
      PR178_byte(a0)^.v := PR380_byte(a0)^.v;
      for v12b := 0 to 6 do
      begin
        {@1A7B-1A8C}
        v11b := PRA344_byte(a0)^.a[v12sb];
        if v11b > 0 then
          pO0E2_177C(v12b, v11b);
        {@1A9F-1AB0}
        v11b := PRA337_byte(a0)^.a[v12sb];
        if v11b > 0 then
        begin
          {@1AB6-1AB9}
          Inc(v18b);
          if a6DC9_ec3f[v12sb] < v11b then
            v11b := a6DC9_ec3f[v12sb];
          {@1AD5-1B14}
          if PR173_byte(a0)^.v = 5 then
          begin
            {@1AE0-1B05}
            if v11b > PR313_byte(a0)^.v then
            begin
              {@1AED-1AF8}
              Dec(v11b, PR313_byte(a0)^.v);
              {@1AF8-1B05}
              pO0E2_177C(v12b, v11b);
            end;
          end
          else
            pO0E2_177C(v12b, v11b);
        end;
      end;
      {@1B1D-1B2F}
      v10b := Byte(v10b div v18b);
      {@1B2F-1B3A}
      Inc(PR178_byte(a0)^.v, v10b);
      if PR178_byte(a0)^.v > v9b then
        Inc(PR508_byte(a0)^.v, PR178_byte(a0)^.v - v9b);
      {@1B62-1BB8}
      if PR178_byte(a0)^.v < v9b then
      begin
        {@1B6F-1BB8}
        if PR508_byte(a0)^.v > (v9b - PR178_byte(a0)^.v) then
          Dec(PR508_byte(a0)^.v, v9b - PR178_byte(a0)^.v)
        else
          PR508_byte(a0)^.v := 0;
      end;
      {@1BB8-1BC2}
      PR25_byte(a0)^.v := v1b;
      if PR25_byte(a0)^.v >= 20 then
        pO0E2_13E5(pointer(a0), 62, 60, 255, 1)
      else
        pO0E2_0104(pointer(a0), 62, nil);
    end;
    5: begin
      {@1BFE-1C1F}
      if pO0EC_27C1(pointer(a0), 14, @v8b) <> 0 then
        Inc(v1b, PR3_byte(v8p)^.v);
      {@1C1F-1C29}
      PR27_byte(a0)^.v := v1b;
    end;
    1, 2: begin
      {@1C33-1C4E}
      if pO0EC_27C1(pointer(a0), 68, @v8b) <> 0 then
        v1b := 3;
      {@1C4E-1C60}
      PRA17_byte(a0)^.a[a1 * 2] := v1b;
    end;
  end;
end;

{ 1D19 }
procedure pO0E2_1D19(a0: pointer; a1: word; a2: byte; a3: byte);
var
  v81a: string[80];
  _f1: array[1..1] of byte;
  v81a2: string[80] absolute v81a;
begin
  if false then begin
    if LV = 'takes ' then;
    if LV = ' points of damage ' then;
    if LV = 'takes 1 point of damage ' then;
    if LV = 'from Fire' then;
    if LV = 'from Cold' then;
    if LV = 'from Electricity' then;
    if LV = 'from Magic' then;
    if LV = 'lost a spell' then;
    if LV = 'Goes Down' then;
    if LV = ', and is Dying' then;
    if LSV = [6..8] then;
    if LV = 'is killed' then;
    if FS = FS then;
  end;
  asm
  db 139,70,10,163,216,167
  end;
  asm
  db 176,6,80,141,126,12,22,87
  push cs
  call near ptr pO0E2_04DD
  end;
  if a3 <> 0 then
    asm
  db 138,70,8,60,1,117,7,49,192,163,216,167,235,16,60,2,117,12,161,216,167,153,185,2,0,247,249,163
  db 216,167
    end
  else
    asm
  db 176,20,80,141,126,12,22,87
  push cs
  call near ptr pO0E2_04DD
    end;
  {@1D64-2025}
  if (iA7D8 > 0) and (PR494_byte(pointer(a0))^.v <> 0) then
  begin
    {@1D7C-1DD4}
    if wA7D8 <> 1 then
      v81a := 'takes ' + pR47F_0FB2(bA7D8) + ' points of damage '
    else
      v81a := 'takes 1 point of damage ';
    {@1DD4-1E97}
    case bA7D2 and 247 of
      1: v81a := v81a2 + 'from Fire';
      2: v81a := v81a2 + 'from Cold';
      4: v81a := v81a2 + 'from Electricity';
    else
      {@1E64-1E97}
      if (bA7D2 and 8) = bA7D2 then
        v81a := v81a2 + 'from Magic';
    end;
    asm
  db 198,6,239,174,1
    end;
    asm
  db 255,118,14,255,118,12
  call pO0EC_0C95
    end;
    asm
  db 255,118,14,255,118,12,176,0,80,141,126,175,22,87
  call pO0EC_2601
    end;
    asm
  db 255,118,14,255,118,12,255,54,216,167
  call pO0EC_2851
    end;
    if b880C = 5 then
    begin
      asm
  db 196,126,12,38,196,189,231,1,38,198,69,1,0
      end;
      if PR0_byte(PR487_pointer(pointer(a0))^.v)^.v > 0 then
      begin
        {@1EEB-1F0B}
        pO0EC_1B08(pointer(pointer(a0)), 'lost a spell', 12, 1);
        asm
  db 255,118,14,255,118,12,196,126,12,38,196,189,231,1,38,138,5,80
  call pO0EC_186D
        end;
        asm
  db 255,118,14,255,118,12
  call pO0EC_2CF6
  db 136,70,174
        end;
      end;
    end;
    {@1F30-2020}
    if PR494_byte(pointer(a0))^.v = 0 then
    begin
      {@1F3E-1F51}
      v81a := 'Goes Down';
      if (PR421_byte(pointer(a0))^.v and 8) = 0 then
      begin
        {@1F5F-1F92}
        if PR493_byte(pointer(a0))^.v = 5 then
          v81a := v81a2 + ', and is Dying';
        {@1F92-1FBA}
        if PR493_byte(pointer(a0))^.v in [6..8] then
          v81a := 'is killed';
      end;
      asm
  db 255,118,14,255,118,12,141,126,175,22,87,160,147,157,48,228,64,80,176,0,80
  call pO0EC_1B08
      end;
      if b880C <> 5 then
        asm
  call pR47F_0D1A
        end
      else
      begin
        asm
  db 255,118,14,255,118,12
  push cs
  call near ptr pO0E2_15A0
        end;
        asm
  db 176,13,80,141,126,12,22,87
  push cs
  call near ptr pO0E2_04DD
        end;
        if (PR494_byte(pointer(a0))^.v = 0) and (PR493_byte(pointer(a0))^.v <> 10) then
          asm
  db 255,118,14,255,118,12
  call pO135_0F14
          end
        else
          asm
  call pR47F_0D1A
          end;
      end;
    end;
    asm
  call pO0EC_1BEF
    end;
  end;
end;

{ 2039 }
procedure pO0E2_2039(a0: longint; a1: byte; a2: word; a3: byte; a4: byte; a5: byte; a6: byte; a7: S40);
var
  v45p: pointer;
  _f1: array[1..1] of byte;
  v45b: byte absolute v45p;
begin
  if false then begin
    if LV = 'is Unaffected' then;
  end;
  {@2052-2058}
  bA7D1 := a1;
  {@2058-2064}
  pO0E2_04DD(9, @PV4_0_byte(a0).v);
  if (bA7D1 = 0) or (a6 <> 0) and (a5 = 1) then
  begin
    {@2077-2097}
    pO0EC_1B08(pointer(pointer(a0)), 'is Unaffected', 10, 1);
    {@2097-2099}
    Exit;
  end;
  {@2099-20CF}
  if (pO0EC_27C1(pointer(pointer(a0)), a1, @v45b) <> 0) and (PR1_word(v45p)^.v > 0) then
    pO0E2_0104(pointer(pointer(a0)), a1, v45p);
  {@20CF-20E8}
  pO0E2_13E5(pointer(pointer(a0)), a1, a2, a3, a4);
  if Length(a7) <> 0 then
  begin
    {@20EE-2101}
    pO0EC_2601(pointer(pointer(a0)), 1, a7);
    {@2101-2106}
    pO0EC_1BEF;
  end;
end;

{ 212C }
function pO0E2_212C(a0: pointer; a1: byte; a2: byte): byte;
var
  _f1: array[1..5] of byte;
begin
  if false then begin
    if LSV = [0..1, 4..5] then;
  end;
  {@2132-2136}
  pO0E2_212C := 0;
if (PR493_byte(a0)^.v in [0..1, 4..5]) and ((PR508_byte(a0)^.v < PR178_byte(a0)^.v) and (a2 <> 0)
      or (a2 = 0)) then
  begin
    {@216F-218A}
    PR508_byte(a0)^.v := PR508_byte(a0)^.v + a1;
    if PR508_byte(a0)^.v > PR178_byte(a0)^.v then
      PR508_byte(a0)^.v := PR178_byte(a0)^.v;
    {@21AC-21EF}
    if PR494_byte(a0)^.v = 0 then
    begin
      {@21B7-21CB}
      if PR493_byte(a0)^.v = 5 then
        PR493_byte(a0)^.v := 4;
      {@21CB-21EF}
      if (PR493_byte(a0)^.v = 4) and (b880C <> 5) then
      begin
        {@21DD-21E6}
        PR493_byte(a0)^.v := 0;
        {@21E6-21EF}
        PR494_byte(a0)^.v := 1;
      end;
    end;
    {@21EF-21F3}
    pO0E2_212C := 1;
  end;
end;

{ 21FC }
function pO0E2_21FC(a0: pointer; a1: byte; a2: S40): byte;
var
  _f1: array[1..2] of byte;
begin
  asm
  db 255,118,14,255,118,12,255,118,14,255,118,12
  call pO135_0CA2
  db 80,255,118,14,255,118,12
  call pO135_0CCA
  db 80,176,1,80
  call pO135_122B
  db 8,192,116,100,196,126,12,38,198,133,237,1,0,196,126,12,38,198,133,238,1,1,138,70,10,196,126,12
  db 38,136,133,252,1,128,62,12,136,5,117,34,160,240,174,136,70,213,198,6,240,174,1,255,118,14,255,118
  db 12,176,3,80,176,0,80
  call pO135_141F
  db 138,70,213,162,240,174,255,118,14,255,118,12,176,1,80,141,126,214,22,87
  call pO0EC_2601
  call pO0EC_2A17
  db 198,70,255,1,235,4
  end;
  {@22A3-22A7}
  pO0E2_21FC := 0;
end;

{ 22B0 }
procedure pO0E2_22B0;
var
  v4p: pointer;
  v5b: byte;
  _f1: array[1..1] of byte;
begin
  {@22B6-22C3}
  v4p := pAE5D;
  {@22C3-235C}
  while v4p <> nil do
  begin
    {@22CE-2348}
    for v5b := 1 to 9 do
    begin
      {@22D7-2342}
      if PRA16_byte(v4p)^.a[v5b] <> 0 then
PRB7_50_byte(pA6E0)^.a[PR27_shortint(v4p)^.v + a3EB5_ff2a[a53E5_ec3f[v5b]], PR26_shortint(v4p)^.v
            + a3EAC_ff2a[a53E5_ec3f[v5b]]] := PR30_byte(v4p)^.v;
    end;
    {@2348-2359}
    v4p := PR4_pointer(v4p)^.v;
  end;
end;

{ 237B }
procedure pO0E2_237B(a0: byte);
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v13b: byte;
  v14b: byte;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  v16sb: shortint absolute v16b;
  v15sb: shortint absolute v15b;
begin
  if false then begin
    if LV = 'The air clears a little...' then;
  end;
  {@2381-2389}
  v4p := nil;
  {@2389-2396}
  v8p := pAE5D;
  {@2396-239A}
  v13b := 0;
  {@239A-2573}
  while v8p <> nil do
  begin
    {@23A5-23B6}
    v12p := PR4_pointer(v8p)^.v;
    if a0 <> 0 then
      v19b := Ord(PR28_byte(v8p)^.v = 255)
    else
      v19b := Ord(PR28_shortint(v8p)^.v <= 1);
    {@23DE-2564}
    if v19b <> 0 then
    begin
      {@23E7-250E}
      with PW16_23_237B(v8p)^ do
      begin
        for v14b := 1 to 9 do
        begin
          {@23F9-2505}
          if _w23_16abyte[v14b] <> 0 then
          begin
            {@240D-2430}
            v15b := _w23_26shortint + a3EAC_ff2a[a53E5_ec3f[v14b]];
            {@2430-2453}
            v16b := _w23_27shortint + a3EB5_ff2a[a53E5_ec3f[v14b]];
            {@2453-2457}
            v18b := 0;
            for v17b := 1 to bA6DF do
            begin
              {@246C-24B0}
if (aA6A0_9cf4[v17b].f <> 0) and (aA6A4_30da[v17b].f = v15b)
                  and (aA6A5_30da[v17b].f = v16b) then
                v18b := 1;
            end;
            {@24B8-2505}
            if v18b <> 0 then
              PRB7_50_byte(pA6E0)^.a[v16sb, v15sb] := 31
            else
              PRB7_50_byte(pA6E0)^.a[v16sb, v15sb] := _w23_7abyte[v14b];
          end;
        end;
      end;
      {@250E-2512}
      v13b := 1;
      if v4p = nil then
        pAE5D := v12p
      else
        PR4_pointer(v4p)^.v := v12p;
      {@253A-2549}
      FreeMem(v8p, 31);
    end
    else
    begin
      {@254B-2557}
      v4p := v8p;
      if a0 = 0 then
        Dec(PR28_byte(v8p)^.v);
    end;
    {@2564-2570}
    v8p := v12p;
  end;
  {@2573-2591}
  if v13b <> 0 then
  begin
    {@2579-257D}
    pO0E2_22B0;
    {@257D-2591}
    pO0EC_1AAC('The air clears a little...');
  end;
end;

{ 2597 }
begin
end.

