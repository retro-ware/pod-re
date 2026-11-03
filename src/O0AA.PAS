{ O0AA: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0AA;

interface

uses GAMEDATA;

procedure pO0AA_0041;
procedure pO0AA_0791;
procedure pO0AA_0AE5(a0: shortint; a1: byte);
procedure pO0AA_063D;
procedure pO0AA_0C9D(a0: pointer);
procedure pO0AA_1067(a0: pointer);
procedure pO0AA_1845(a0: pointer);
function pO0AA_2DD0(a0: pointer; a1: byte; a2: pointer): byte;
procedure pO0AA_2F7B(a0: byte);
function pO0AA_30F3(a0: byte; a1: byte; a2: pointer; a3: pointer): byte;
function pO0AA_3C48(a0: word; a1: word): word;
procedure pO0AA_36BA(a0: pointer; a1: byte; a2: byte; a3: byte);
function pO0AA_3975(a0: pointer): byte;
procedure pO0AA_1C04(a0: pointer);
function pO0AA_3594: byte;
procedure pO0AA_2A8A(a0: byte);

implementation

uses LIT, O0B5, O0BB, O0E2, O0EC, O102, O108, O135, R142, R47F;

type
  E11_byte = record f: byte; _r: array[1..10] of byte end;
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E9_byte = record f: byte; _r: array[1..8] of byte end;
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  R0_byte = record v: byte end;
  R0_integer = record v: integer end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R174_byte = record _p: array[1..174] of byte; v: byte end;
  R174_shortint = record _p: array[1..174] of byte; v: shortint end;
  R175_byte = record _p: array[1..175] of byte; v: byte end;
  R176_word = record _p: array[1..176] of byte; v: word end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R29_byte = record _p: array[1..29] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R331_word = record _p: array[1..331] of byte; v: word end;
  R347_byte = record _p: array[1..347] of byte; v: byte end;
  R358_shortint = record _p: array[1..358] of byte; v: shortint end;
  R359_shortint = record _p: array[1..359] of byte; v: shortint end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R403_byte = record _p: array[1..403] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_longint = record _p: array[1..423] of byte; v: longint end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R427_pointer = record _p: array[1..427] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R435_pointer = record _p: array[1..435] of byte; v: pointer end;
  R467_longint = record _p: array[1..467] of byte; v: longint end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R471_longint = record _p: array[1..471] of byte; v: longint end;
  R475_longint = record _p: array[1..475] of byte; v: longint end;
  R479_byte = record _p: array[1..479] of byte; v: byte end;
  R47_byte = record _p: array[1..47] of byte; v: byte end;
  R481_word = record _p: array[1..481] of byte; v: word end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R48_byte = record _p: array[1..48] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R493_shortint = record _p: array[1..493] of byte; v: shortint end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R496_byte = record _p: array[1..496] of byte; v: byte end;
  R497_byte = record _p: array[1..497] of byte; v: byte end;
  R498_byte = record _p: array[1..498] of byte; v: byte end;
  R49_byte = record _p: array[1..49] of byte; v: byte end;
  R502_byte = record _p: array[1..502] of byte; v: byte end;
  R504_byte = record _p: array[1..504] of byte; v: byte end;
  R506_byte = record _p: array[1..506] of byte; v: byte end;
  R506_shortint = record _p: array[1..506] of byte; v: shortint end;
  R509_byte = record _p: array[1..509] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R51_byte = record _p: array[1..51] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R53_byte = record _p: array[1..53] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R55_word = record _p: array[1..55] of byte; v: word end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R58_word = record _p: array[1..58] of byte; v: word end;
  R60_byte = record _p: array[1..60] of byte; v: byte end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R62_byte = record _p: array[1..62] of byte; v: byte end;
  RA16_byte = record _p: array[1..16] of byte; a: array[0..32000] of byte end;
  RA17_byte = record _p: array[1..17] of byte; a: array[0..32000] of byte end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA331_word = record _p: array[1..331] of byte; a: array[0..16000] of word end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA344_byte = record _p: array[1..344] of byte; a: array[0..32000] of byte end;
  RA427_longint = record _p: array[1..427] of byte; a: array[0..8000] of longint end;
  RA427_pointer = record _p: array[1..427] of byte; a: array[0..8000] of pointer end;
W0_14_3975 = record case byte of 0: (_p0: array[1..313] of byte; _w14_313byte: byte);
      1: (_p1: array[1..337] of byte; _w14_337abyte: array[0..32000] of byte);
      2: (_p2: array[1..344] of byte; _w14_344abyte: array[0..32000] of byte) end;
W2_12_36BA = record case byte of 0: (_p0: array[1..178] of byte; _w12_178byte: byte);
      1: (_p1: array[1..380] of byte; _w12_380byte: byte); 2: (_p2: array[1..508] of byte;
      _w12_508byte: byte) end;
  PR0_X63 = ^R0_X63;
  PR0_byte = ^R0_byte;
  PR0_integer = ^R0_integer;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR174_byte = ^R174_byte;
  PR174_shortint = ^R174_shortint;
  PR175_byte = ^R175_byte;
  PR176_word = ^R176_word;
  PR17_byte = ^R17_byte;
  PR19_byte = ^R19_byte;
  PR1_byte = ^R1_byte;
  PR25_byte = ^R25_byte;
  PR28_byte = ^R28_byte;
  PR29_byte = ^R29_byte;
  PR2_byte = ^R2_byte;
  PR327_byte = ^R327_byte;
  PR331_word = ^R331_word;
  PR347_byte = ^R347_byte;
  PR358_shortint = ^R358_shortint;
  PR359_shortint = ^R359_shortint;
  PR370_longint = ^R370_longint;
  PR403_byte = ^R403_byte;
  PR41_byte = ^R41_byte;
  PR422_byte = ^R422_byte;
  PR423_longint = ^R423_longint;
  PR423_pointer = ^R423_pointer;
  PR427_pointer = ^R427_pointer;
  PR42_pointer = ^R42_pointer;
  PR435_pointer = ^R435_pointer;
  PR467_longint = ^R467_longint;
  PR46_byte = ^R46_byte;
  PR471_longint = ^R471_longint;
  PR475_longint = ^R475_longint;
  PR479_byte = ^R479_byte;
  PR47_byte = ^R47_byte;
  PR481_word = ^R481_word;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR48_byte = ^R48_byte;
  PR493_byte = ^R493_byte;
  PR493_shortint = ^R493_shortint;
  PR494_byte = ^R494_byte;
  PR496_byte = ^R496_byte;
  PR497_byte = ^R497_byte;
  PR498_byte = ^R498_byte;
  PR49_byte = ^R49_byte;
  PR502_byte = ^R502_byte;
  PR504_byte = ^R504_byte;
  PR506_byte = ^R506_byte;
  PR506_shortint = ^R506_shortint;
  PR509_byte = ^R509_byte;
  PR50_byte = ^R50_byte;
  PR51_byte = ^R51_byte;
  PR52_byte = ^R52_byte;
  PR53_byte = ^R53_byte;
  PR54_byte = ^R54_byte;
  PR55_word = ^R55_word;
  PR57_byte = ^R57_byte;
  PR58_word = ^R58_word;
  PR60_byte = ^R60_byte;
  PR61_byte = ^R61_byte;
  PR62_byte = ^R62_byte;
  PRA16_byte = ^RA16_byte;
  PRA17_byte = ^RA17_byte;
  PRA30_byte = ^RA30_byte;
  PRA331_word = ^RA331_word;
  PRA337_byte = ^RA337_byte;
  PRA344_byte = ^RA344_byte;
  PRA427_longint = ^RA427_longint;
  PRA427_pointer = ^RA427_pointer;
  PW0_14_3975 = ^W0_14_3975;
  PW2_12_36BA = ^W2_12_36BA;
var
  a0E57_b7cc: array[0..1212] of string[26] absolute d0E57;
  a103D_c528: array[0..3639] of string[8] absolute d103D;
  a107C_6df8: array[0..1926] of string[16] absolute d107C;
  a1115_ae45: array[0..4679] of string[6] absolute d1115;
  a1123_31ca: array[0..2977] of string[10] absolute d1123;
  a1123_8ce8: array[0..2977] of E11_byte absolute d1123;
  a1144_6be1: array[0..2519] of string[12] absolute d1144;
  a651A_3981: array[0..2046] of E16_byte absolute d651A;
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  a6DB9_ec3f: array[0..32759] of byte absolute d6DB9;
  a6DC9_ec3f: array[0..32759] of byte absolute d6DC9;
  a6DD0_ec3f: array[0..32759] of byte absolute d6DD0;
  a6DD7_ec3f: array[0..32759] of byte absolute d6DD7;
  a719C_ec3f: array[0..32759] of byte absolute d719C;
  a77BA_26c4: array[0..3639] of E9_byte absolute d77BA;
  a94D6_3981: array[0..2046] of E16_byte absolute d94D6;
  a94D7_3981: array[0..2046] of E16_byte absolute d94D7;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  b9CEE: byte absolute d9CEE;
  b9D92: byte absolute d9D92;
  b9D93: byte absolute d9D93;
  bA7DB: byte absolute dA7DB;
  bA7DD: byte absolute dA7DD;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bAE61: byte absolute dAE61;
  bAE80: byte absolute dAE80;
  bC5C3: byte absolute dC5C3;
  bC5C4: byte absolute dC5C4;
  bC5C5: byte absolute dC5C5;
  l82DE: longint absolute d82DE;
  l82E2: longint absolute d82E2;
  lA7BE: longint absolute dA7BE;
  p82DE: pointer absolute d82DE;
  p82E2: pointer absolute d82E2;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CF6: pointer absolute d9CF6;
  pA7CA: pointer absolute dA7CA;
  pAB3A: pointer absolute dAB3A;
  pD926: pointer absolute dD926;
  s13DB: string absolute d13DB;
  s1575: string absolute d1575;
  s166B: string absolute d166B;
  s1694: string absolute d1694;
  s16BD: string absolute d16BD;
  s1738: string absolute d1738;
  s1761: string absolute d1761;
  s178A: string absolute d178A;
  s17B3: string absolute d17B3;
  s17DC: string absolute d17DC;
  s194D: string absolute d194D;
  s1976: string absolute d1976;
  s278C: string absolute d278C;
  s2859: string absolute d2859;
  s2B8D: string absolute d2B8D;
  s2D50: string absolute d2D50;
  s2DA1: string absolute d2DA1;

function pO0AA_0F54(a0: pointer): byte; far; forward;
procedure pO0AA_1675(a0: pointer; a1: byte); far; forward;
procedure pO0AA_1A95(a0: pointer); far; forward;
procedure pO0AA_1B54(a0: pointer); far; forward;
procedure pO0AA_1E0A(a0: pointer; a1: pointer); far; forward;
procedure pO0AA_21E2(a0: pointer); far; forward;
procedure pO0AA_2564(a0: pointer; a1: pointer); far; forward;
procedure pO0AA_274E; far; forward;
function pO0AA_3249(a0: pointer): byte; far; forward;
function pO0AA_32AF(a0: pointer): byte; far; forward;
procedure pO0AA_3332(a0: pointer); far; forward;
procedure pO0AA_3455(a0: pointer); far; forward;
function pO0AA_363B(a0: pointer; a1: byte): shortint; far; forward;

{ 0041 }
procedure pO0AA_0041;
var
  _f1: array[1..4] of byte;
  v5b: byte;
  v6b: byte;
  v262a: string;
  v263b: byte;
  v264b: byte;
  v262b: byte absolute v262a;
  v6sb: shortint absolute v6b;
  v5sb: shortint absolute v5b;
begin
  if false then begin
    if LV = 'Status:' then;
    if LV = ' years' then;
    if LV = '/' then;
    if LV = 'Level' then;
    if LV = 'Experience:' then;
    if LV = 'STR ' then;
    if LV = 'INT ' then;
    if LV = 'WIS ' then;
    if LV = 'DEX ' then;
    if LV = 'CON ' then;
    if LV = 'CHA ' then;
  end;
  {@0048-0056}
  p82DE := p9CEE;
  {@0056-005B}
  pR142_01C7;
  {@005B-0071}
  pO0EC_1C22(p82DE, 1, 1, 0);
  {@0071-0092}
  pR47F_0354(20, 1, 15, 0, 'Status:');
  {@0092-00BA}
  pR47F_0354(27, 1, 10, 0, a1144_6be1[PR493_shortint(p82DE)^.v]);
  {@00BA-00E0}
  v262a := a1115_ae45[PR358_shortint(p82DE)^.v];
  {@00E0-00F7}
  pR47F_0354(1, 3, 15, 0, v262a);
  {@00F7-0126}
  pR47F_0354(8, 3, 15, 0, pO0EC_146B(PR176_word(p82DE)^.v) + ' years');
  {@0126-014C}
  v262a := a107C_6df8[PR359_shortint(p82DE)^.v];
  {@014C-0163}
  pR47F_0354(1, 4, 15, 0, v262a);
  {@0163-0189}
  v262a := a103D_c528[PR173_shortint(p82DE)^.v];
  {@0189-01A0}
  pR47F_0354(20, 4, 15, 0, v262a);
  {@01A0-01A5}
  v264b := 0;
  {@01A5-01CB}
  v262a := a0E57_b7cc[PR174_shortint(p82DE)^.v];
  if PR173_byte(p82DE)^.v = 5 then
    for v6b := 0 to 6 do
    begin
      {@01E3-0260}
      if PRA344_byte(p82DE)^.a[v6sb] > 0 then
      begin
        {@01F5-01FA}
        v264b := 1;
        if PRA344_byte(p82DE)^.a[v6sb] < Byte(pO102_0BA1(p82DE)) then
        begin
          {@021C-025C}
          v262a := v262a + '/' + a0E57_b7cc[v6sb];
          {@025C-0260}
          v6b := 6;
        end;
      end;
    end;
  {@0269-0280}
  pR47F_0354(1, 5, 15, 0, v262a);
  {@0280-02A1}
  pR47F_0354(1, 7, 15, 0, 'Level');
  {@02A1-02A6}
  v262b := 0;
  if v264b <> 0 then
  begin
    {@02B0-0315}
    for v6b := 0 to 6 do
    begin
      {@02B9-030F}
      if PRA337_byte(p82DE)^.a[v6sb] > 0 then
      begin
        {@02CB-030B}
        v262a := v262a + pO0EC_142F(PRA337_byte(p82DE)^.a[v6sb]);
        {@030B-030F}
        v6b := 6;
      end;
    end;
    {@0315-03A9}
    for v6b := 0 to 6 do
    begin
      {@031E-03A0}
      if (PRA344_byte(p82DE)^.a[v6sb] < Byte(pO102_0BA1(p82DE))) and (PRA344_byte(p82DE)^.a[v6sb] > 0) then
      begin
        {@0352-039C}
        v262a := Concat(v262a + '/', pO0EC_142F(PRA344_byte(p82DE)^.a[v6sb]));
        {@039C-03A0}
        v6b := 6;
      end;
    end;
  end
  else
  begin
    {@03AC-03B1}
    v263b := 0;
    for v6b := 0 to 6 do
    begin
      {@03BA-045C}
      if PRA337_byte(p82DE)^.a[v6sb] > 0 then
      begin
        {@03CF-0400}
        if v263b <> 0 then
          v262a := v262a + '/';
        {@0400-0457}
        v262a := v262a + pO0EC_142F(PRA337_byte(p82DE)^.a[v6sb] + PRA344_byte(p82DE)^.a[v6sb]);
        {@0457-045C}
        v263b := 1;
      end;
    end;
  end;
  {@0465-047C}
  pR47F_0354(7, 7, 15, 0, v262a);
  {@047C-049D}
  pR47F_0354(24, 6, 15, 0, 'Experience:');
  {@049D-04C5}
  v262a := pO0EC_14A5(longint(PR370_longint(p82DE)^.v));
  {@04C5-04EC}
  pR47F_0354((20 - v262b) shr 1 + 20, 7, 10, 0, v262a);
  for v5b := 0 to 5 do
  begin
    {@04F5-0593}
    case v5b of
      0: v262a := 'STR ';
      1: v262a := 'INT ';
      2: v262a := 'WIS ';
      3: v262a := 'DEX ';
      4: v262a := 'CON ';
      5: v262a := 'CHA ';
    end;
    {@0593-05AF}
    pR47F_0354(1, v5sb + 9, 10, 0, v262a);
    {@05AF-05BA}
    pO0AA_0AE5(v5b, 0);
  end;
  {@05C3-05C7}
  pO0AA_063D;
  {@05C7-05CB}
  pO0AA_0791;
  if PR427_pointer(p82DE)^.v <> nil then
    pO0EC_0484(l82DE, pointer(PR427_pointer(p82DE)^.v), 1, 21, 0, 1);
  {@0602-0639}
  if PR435_pointer(p82DE)^.v <> nil then
    pO0EC_0484(l82DE, pointer(PR435_pointer(p82DE)^.v), 1, 22, 0, 1);
end;

{ 063D }
procedure pO0AA_063D;
var
c43: record case byte of 0: (v43a2: string[42]); 1: (v43a: string[40]); 2: (v43b: byte);
      3: (_p3: array[1..41] of byte; v2b: byte); 4: (_p4: array[1..41] of byte; v2sb: shortint);
      5: (_p5: array[1..42] of byte; v1b: byte) end;
begin
  {@0644-0655}
  pR142_0217(20, 9, 38, 15);
  {@0655-0659}
  c43.v1b := 9;
  for c43.v2b := 0 to 2 do
  begin
    {@0662-06FD}
    if PRA331_word(p9CEE)^.a[c43.v2sb] > 0 then
    begin
      {@0679-0698}
      c43.v43a := a1123_31ca[c43.v2sb];
      {@0698-06AF}
      pR47F_0354(20, c43.v1b, 10, 0, c43.v43a2);
      {@06AF-06D9}
      c43.v43a := pO0EC_146B(PRA331_word(p9CEE)^.a[c43.v2sb]);
      {@06D9-06FA}
      pR47F_0354(38 - c43.v43b, c43.v1b, 10, 0, c43.v43a2);
      {@06FA-06FD}
      Inc(c43.v1b);
    end;
  end;
end;

{ 0791 }
procedure pO0AA_0791;
var
c48: record case byte of 0: (v48a2: string[47]); 1: (v48a: string[40]); 2: (v48b: byte);
      3: (_p3: array[1..41] of byte; v7b: byte); 4: (_p4: array[1..42] of byte; v6b: byte);
      5: (_p5: array[1..44] of byte; v4p: pointer) end;
  _f1: array[1..4] of byte;
  { 070C }
  procedure pO0AA_070C(b0: pointer; b1: byte);
  begin
    if false then begin
      if LV = ' ' then;
    end;
    {@0713-0748}
    while PR0_byte(b0)^.v < b1 do
      PR0_string_40_(b0)^.v := ' ' + PR0_string(b0)^.v;
  end;

begin
  if false then begin
    if LV = 'Hit Points ' then;
    if LV = 'Armor Class' then;
    if LV = 'Encumbrance' then;
    if LV = 'THAC0   ' then;
    if LV = 'Movement' then;
    if LV = 'd' then;
    if LV = '+' then;
    if LV = '-' then;
    if LV = 'Damage' then;
  end;
  {@0798-07A5}
  c48.v4p := p9CEE;
  {@07A5-07B0}
  pO0EC_0EBF(c48.v4p);
  {@07B0-07D0}
  pR47F_0354(20, 3, 15, 0, 'Hit Points ');
  {@07D0-07E1}
  pR142_0217(31, 3, 37, 3);
  {@07E1-07F8}
  pO0EC_0BAA(c48.v4p, 31, 3, 0, 1);
  {@07F8-0818}
  pR47F_0354(1, 17, 15, 0, 'Armor Class');
  case PR498_byte(c48.v4p)^.v of
    1..50: c48.v6b := 16;
    51..60: c48.v6b := 17;
    61..69: c48.v6b := 16;
  else
    {@084A-084E}
    c48.v6b := 15;
  end;
  {@084E-085F}
  pR142_0217(15, 17, 17, 17);
  {@085F-0871}
  pO0EC_0B21(c48.v4p, c48.v6b, 17);
  {@0871-0891}
  pR47F_0354(20, 17, 15, 0, 'Encumbrance');
  {@0891-08B2}
  c48.v48a := pO0EC_146B(PR481_word(c48.v4p)^.v);
  {@08B2-08BF}
  pO0AA_070C(@c48.v48b, 5);
  {@08BF-08D5}
  pR47F_0354(33, 17, 10, 0, c48.v48a2);
  {@08D5-08F5}
  pR47F_0354(1, 18, 15, 0, 'THAC0   ');
  {@08F5-091A}
  Str(60 - PR497_byte(c48.v4p)^.v, c48.v48a);
  {@091A-0927}
  pO0AA_070C(@c48.v48b, 2);
  {@0927-093D}
  pR47F_0354(16, 18, 10, 0, c48.v48a2);
  {@093D-095D}
  pR47F_0354(20, 18, 15, 0, 'Movement');
  {@095D-096B}
  c48.v7b := pO0EC_12E6(c48.v4p);
  {@096B-098D}
  c48.v48a := pO0EC_142F(PR509_byte(c48.v4p)^.v);
  {@098D-099A}
  pO0AA_070C(@c48.v48b, 3);
  {@099A-09B0}
  pR47F_0354(35, 18, 10, 0, c48.v48a2);
  {@09B0-09F5}
  c48.v48a := Concat(pO0EC_142F(PR502_byte(c48.v4p)^.v) + 'd', pO0EC_142F(PR504_byte(c48.v4p)^.v));
  if PR506_shortint(c48.v4p)^.v > 0 then
    c48.v48a := Concat(c48.v48a2 + '+', pO0EC_142F(PR506_byte(c48.v4p)^.v));
  {@0A41-0A93}
  if PR506_shortint(c48.v4p)^.v < 0 then
    c48.v48a := Concat(c48.v48a2 + '-', pO0EC_142F(Abs(PR506_shortint(c48.v4p)^.v)));
  {@0A93-0AB3}
  pR47F_0354(1, 19, 15, 0, 'Damage');
  {@0AB3-0AC0}
  pO0AA_070C(@c48.v48b, 7);
  {@0AC0-0AD6}
  pR47F_0354(11, 19, 10, 0, c48.v48a2);
end;

{ 0AE5 }
procedure pO0AA_0AE5(a0: shortint; a1: byte);
var
  v41a: string[40];
  v42b: byte;
  v43b: byte;
  v41a2: string[40] absolute v41a;
begin
  if false then begin
    if LV = '0' then;
    if LV = '00' then;
    if LV = '(' then;
    if LV = ')' then;
    if LV = '*' then;
  end;
  {@0AEC-0AFC}
  if a1 <> 0 then
    v43b := 13
  else
    v43b := 10;
  {@0AFC-0B00}
  v42b := 5;
  {@0B00-0B1C}
  pR142_0217(v42b, a0 + 9, 11, a0 + 9);
  if PRA17_byte(p9CEE)^.a[a0 * 2] < 10 then
    Inc(v42b);
  {@0B32-0B66}
  pR47F_0354(v42b, a0 + 9, v43b, 0, pO0EC_142F(PRA17_byte(p9CEE)^.a[a0 * 2]));
  if (byte(a0) = 0) and (PR17_byte(p9CEE)^.v = 18) and (PR28_byte(p9CEE)^.v > 0) then
  begin
    {@0B8B-0BAD}
    v41a := pO0EC_142F(PR28_byte(p9CEE)^.v);
    if PR28_byte(p9CEE)^.v < 10 then
      v41a := '0' + v41a2;
    {@0BE0-0BFE}
    if PR28_byte(p9CEE)^.v = 100 then
      v41a := '00';
    {@0BFE-0C34}
    pR47F_0354(7, 9, v43b, 0, '(' + v41a2 + ')');
  end;
  {@0C34-0C96}
if (PRA17_byte(p9CEE)^.a[a0 * 2] <> PRA16_byte(p9CEE)^.a[a0 * 2]) or (byte(a0) = 0)
      and (PR29_byte(p9CEE)^.v <> PR28_byte(p9CEE)^.v) then
    pR47F_0354(12, a0 + 9, v43b, 0, '*');
end;

{ 0C9D }
procedure pO0AA_0C9D(a0: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  _f2: array[1..1] of byte;
  v6b: byte;
  v7b: byte;
  v9w: word;
  v10b: byte;
  v11b: byte;
  v9b: byte absolute v9w;
  v7sb: shortint absolute v7b;
begin
  if false then begin
    if Pos('', LV) = 0 then;
  end;
  {@0CA3-0CAA}
  PR0_byte(a0)^.v := 0;
  {@0CAA-0CAE}
  v1b := 255;
  {@0CAE-0CBC}
  p82E2 := p9CEE;
  {@0CBC-0CC0}
  pO0AA_0041;
  {@0CC0-0CD1}
  FillChar(bAB0E, 40, 255);
  {@0CD1-0CD5}
  v11b := 1;
  {@0CD5-0EED}
  while (v1b <> 7) and (PR0_byte(a0)^.v = 0) do
  begin
    {@0CEA-0CEE}
    v10b := 0;
    {@0CEE-0CF2}
    v4b := 0;
    {@0CF2-0CF6}
    v3b := 0;
    for v6b := 0 to 140 do
    begin
      {@0CFF-0D18}
      if (PRA30_byte(p82DE)^.a[v6b] and 127) > 0 then
        v4b := 1;
    end;
    {@0D1E-0D45}
    for v7b := 0 to 2 do
    begin
      {@0D27-0D3F}
      if PRA331_word(p82DE)^.a[v7sb] > 0 then
        v3b := 1;
    end;
    {@0D45-0D62}
    if PR423_longint(p82DE)^.v <> 0 then
      pO108_00AB(0, @v10b);
    {@0D62-0D75}
    if v4b <> 0 then
      pO108_00AB(1, @v10b);
    {@0D75-0DB3}
if ((PR327_byte(p82DE)^.v < 128) or (PR494_byte(p82DE)^.v = 0) or (PR493_byte(p82DE)^.v = 1))
        and (v3b <> 0) and (b880C <> 5) then
      pO108_00AB(2, @v10b);
    {@0DB3-0DDC}
    if v3b <> 0 then
    begin
      {@0DB9-0DDC}
      if b880C = 10 then
        pO108_00AB(3, @v10b)
      else
        pO108_00AB(4, @v10b);
    end;
    {@0DDC-0DF9}
    if pO0AA_3249(p9CEE) <> 0 then
      pO108_00AB(5, @v10b);
    {@0DF9-0E16}
    if pO0AA_32AF(p9CEE) <> 0 then
      pO108_00AB(6, @v10b);
    {@0E16-0E23}
    pO108_00AB(7, @v10b);
    {@0E23-0E29}
    bAAE5 := v11b;
    {@0E29-0E4B}
    v1b := pO108_1009('', s2D50, 0, 0);
    if (bAAE6 <> 0) and (v1b = 27) then
      v1b := 7;
    {@0E5C-0E62}
    v11b := bAAE5;
    {@0E62-0E67}
    v9w := 65535;
    case v1b of
      0: pO0AA_1067(@PR0_byte(a0)^.v);
      1: v6b := pO0AA_30F3(0, 0, @v9b, @v4b);
      2: pO0AA_274E;
      3, 4: begin
        {@0EA8-0EAF}
        pO0AA_2A8A(1);
        {@0EAF-0EB3}
        pO0AA_063D;
      end;
      5: pO0AA_3332(p9CEE);
      6: pO0AA_3455(p9CEE);
    end;
    {@0ED7-0EEA}
    if (PR0_byte(a0)^.v = 0) and (v1b < 3) then
      pO0AA_0041;
  end;
  {@0EED-0EF9}
  if b880C = 5 then
    pO135_00E5;
  {@0EF9-0EFE}
  pO0EC_2ED1;
end;

{ 0F54 }
function pO0AA_0F54(a0: pointer): byte;
var
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LV = 'Must be unreadied' then;
    if LV = ' was going to scribe from that scroll' then;
    if LV = 'is it Okay to lose it? ' then;
  end;
  {@0F5A-0F5E}
  pO0AA_0F54 := 0;
  if PR52_byte(a0)^.v <> 0 then
    pO0EC_1AAC('Must be unreadied')
  else
  begin
    {@0F7F-102D}
    if pO0BB_6C36(pointer(a0)) = 0 then
      pO0AA_0F54 := 1
    else
    begin
      {@0F95-102D}
      if (PR60_byte(a0)^.v > 127) or (PR61_byte(a0)^.v > 127) or (PR62_byte(a0)^.v > 127) then
      begin
        {@0FB3-0FC9}
        pO0EC_1C22(p9CEE, 1, 21, 0);
        {@0FC9-0FD7}
        b9D92 := PR0_byte(p9CEE)^.v + 2;
        {@0FD7-0FDC}
        b9D93 := 21;
        {@0FDC-1005}
        pR47F_0498(1, 21, 38, 22, 14, 0, 0, ' was going to scribe from that scroll');
        if Byte(pO108_2254('is it Okay to lose it? ', b5363)) = b5362 then
          pO0AA_0F54 := 1;
      end
      else
        pO0AA_0F54 := 1;
    end;
  end;
  {@102D-103E}
  pR142_0217(1, 21, 38, 22);
end;

{ 1067 }
procedure pO0AA_1067(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..1] of byte;
  v4b: byte;
  v5b: byte;
  v9p: pointer;
  v13p: pointer;
  v15w: word;
  _f2: array[1..4] of byte;
  v23p: pointer;
  v24b: byte;
  _f3: array[1..1] of byte;
  v26b: byte;
  v23l: longint absolute v23p;
  v15b: byte absolute v15w;
  v13b: byte absolute v13p;
begin
  if false then begin
    if LV = 'Your ' then;
    if LV = 'will be left in the vault' then;
  end;
  {@106E-107B}
  v23p := p9CEE;
  {@107B-108E}
  v13p := PR423_pointer(v23p)^.v;
  {@108E-1093}
  v15w := 0;
  {@1093-1097}
  v5b := 1;
  {@1097-109B}
  v4b := 1;
  {@109B-109F}
  v2b := 255;
  {@109F-10A3}
  v26b := 1;
  {@10A3-166F}
  while (v2b <> 9) and (PR0_byte(a0)^.v = 0) and (PR422_byte(v23p)^.v > 0) do
  begin
    {@10C6-10D1}
    v24b := PR422_byte(v23p)^.v;
    if PR423_pointer(v23p)^.v <> nil then
    begin
      {@10E3-10F4}
      FillChar(bAB0E, 40, 255);
      {@10F4-10F8}
      v1b := 0;
      {@10F8-1105}
      pO108_00AB(0, @v1b);
if (PR494_byte(v23p)^.v <> 0) and (PR1_byte(p87F8)^.v = 0) and ((b880C = 2) or (b880C = 3)
          or (b880C = 4) or (b880C = 5) and (PR2_byte(PR487_pointer(v23p)^.v)^.v <> 0)) then
        pO108_00AB(1, @v1b);
      {@1153-1188}
if ((PR327_byte(v23p)^.v < 128) or ((PR494_byte(v23p)^.v = 0) or (PR493_byte(v23p)^.v = 1)))
          and (b880C <> 5) then
        pO108_00AB(2, @v1b);
      {@1188-11AB}
      if b880C = 10 then
        pO108_00AB(3, @v1b)
      else
        pO108_00AB(4, @v1b);
      {@11AB-11C3}
      if PR422_byte(v23p)^.v < 16 then
        pO108_00AB(5, @v1b);
      {@11C3-11D0}
      pO108_00AB(6, @v1b);
if ((PR327_byte(v23p)^.v < 128) or (PR494_byte(v23p)^.v = 0) or (PR493_byte(v23p)^.v = 1))
          and (b880C = 1) and (PR19_byte(p87F8)^.v <> 1) then
        pO108_00AB(7, @v1b);
      {@1210-122F}
      if (b880C = 1) and (PR19_byte(p87F8)^.v <> 1) then
        pO108_00AB(8, @v1b);
      {@122F-1242}
      v9p := PR423_pointer(v23p)^.v;
      {@1242-127A}
      while v9p <> nil do
      begin
        {@124A-1267}
        pO0EC_0484(v23l, v9p, 0, 0, 1, 0);
        {@1267-1278}
        v9p := PR42_pointer(v9p)^.v;
      end;
      {@127A-12E2}
      if (v4b <> 0) or (bA7DD <> 0) then
      begin
        {@1287-128C}
        pR142_01EF;
        {@128C-12A0}
        pO0EC_1C22(v23p, 1, 1, 1);
        {@12A0-12BF}
        pR47F_0354(PR0_byte(v23p)^.v + 4, 1, 10, 0, s1738);
        {@12BF-12D5}
        pR47F_0354(1, 3, 15, 0, s1761);
        {@12D5-12D9}
        v5b := 1;
        {@12D9-12DD}
        v4b := 0;
        {@12DD-12E2}
        bA7DD := 0;
      end;
      {@12E2-12E8}
      bAAE5 := v26b;
      {@12E8-1328}
v2b := pO108_1D45(s278C, s2DA1, 1, 5, 38, 22, pointer(PR423_pointer(v23p)^.v), 1, 8, @v5b, @v15b,
          @v13b);
      {@1328-132E}
      v26b := bAAE5;
      if (bAAE6 <> 0) and (v2b = 27) then
        v2b := 9;
      {@133F-1650}
      if v13p <> nil then
        case v2b of
          0: pO0AA_1845(v13p);
          1: begin
            {@1362-13C9}
            if PR52_byte(v13p)^.v = 0 then
            begin
              {@136C-1376}
              pO0EC_1AAC(s17DC);
              {@1376-137A}
              v2b := 255;
            end
            else
            begin
              {@137C-13C9}
              if (pO0BB_6C36(v13p) <> 0) or (PR61_byte(v13p)^.v > 0) and (PR62_byte(v13p)^.v < 128) then
              begin
                {@139F-13AE}
                pO0AA_1E0A(v13p, @PR0_byte(a0)^.v);
                if b880C <> 5 then
                  PR0_byte(a0)^.v := 0;
                {@13BC-13C9}
                if PR0_byte(a0)^.v = 0 then
                  v4b := 1;
              end;
            end;
          end;
          2: begin
            {@13D0-13EE}
            if pO0AA_0F54(v13p) <> 0 then
              pO0AA_1A95(v13p)
            else
              v2b := 255;
            {@13EE-13F2}
            v4b := 1;
          end;
          3: begin
            {@13FC-153F}
            if pO0AA_0F54(v13p) <> 0 then
            begin
              {@140D-141B}
              pD926 := pA7CA;
              {@141B-1447}
              while (pD926 <> nil) and (PR42_pointer(pD926)^.v <> nil) do
                pD926 := PR42_pointer(pD926)^.v;
              {@1447-1464}
              pO0EC_0484(v23l, v13p, 0, 0, 0, 0);
              if b880C = 10 then
              begin
                {@146E-14AC}
pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'Your ' + PR0_string(v13p)^.v
                    + 'will be left in the vault');
                {@14AC-14B1}
                pR47F_0D1A;
                if pA7CA = nil then
                begin
                  {@14BA-14CA}
                  GetMem(pA7CA, 63);
                  {@14CA-14D8}
                  pD926 := pA7CA;
                end
                else
                begin
                  {@14DA-14EF}
                  GetMem(PR42_pointer(pD926)^.v, 63);
                  {@14EF-1502}
                  pD926 := PR42_pointer(pD926)^.v;
                end;
                {@1502-1516}
                PR0_X63(pD926)^.v := PR0_X63(v13p)^.v;
                {@1516-1524}
                PR42_pointer(pD926)^.v := nil;
                {@1524-1535}
                pO0EC_18EF(v23p, v13p);
                {@1535-1539}
                v5b := 1;
              end;
            end
            else
              v2b := 255;
          end;
          4: begin
            {@1549-15F7}
            if pO0AA_0F54(v13p) <> 0 then
            begin
              {@155A-1577}
              pO0EC_0484(v23l, v13p, 0, 0, 0, 0);
              {@1577-15B5}
              pR47F_0498(1, 21, 38, 22, 14, 0, 1, s178A + PR0_string(v13p)^.v + s17B3);
              if Byte(pO108_2254(s13DB, b5363)) = b5362 then
              begin
                {@15C9-15DC}
                pO0EC_18EF(p9CEE, v13p);
                {@15DC-15E0}
                v5b := 1;
              end;
              {@15E0-15F1}
              pR142_0217(1, 21, 38, 22);
            end
            else
              v2b := 255;
          end;
          5: pO0AA_1B54(v13p);
          6: pO0AA_1C04(v13p);
          7: begin
            {@161D-163B}
            if pO0AA_0F54(v13p) <> 0 then
              pO0AA_21E2(v13p)
            else
              v2b := 255;
          end;
          8: pO0AA_2564(v13p, @v5b);
        end;
      {@1650-165B}
      pO0EC_0EBF(v23p);
    end;
    {@165B-166C}
    if PR422_byte(v23p)^.v <> v24b then
      v5b := 1;
  end;
end;

{ 1675 }
procedure pO0AA_1675(a0: pointer; a1: byte);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..1] of byte;
  v7p: pointer;
  _f2: array[1..1] of byte;
  v9b: byte;
  _f3: array[1..1] of byte;
  v11b: byte;
  _f4: array[1..1] of byte;
  v13b: byte;
  _f5: array[1..1] of byte;
  v7b: byte absolute v7p;
begin
  asm
  db 161,238,156,139,22,240,156,137,70,249,137,86,251
  end;
  asm
  db 196,126,8,38,138,69,62,36,127,136,70,255
  end;
  case v1b of
    0: begin
      {@169B-16A0}
      bAE80 := 1;
      {@16A0-16C2}
      pO0E2_00BD(PR61_byte(a0)^.v, @v7b, longint(a0), Ord(a1 = 0));
    end;
    1: begin
      {@16CC-17BA}
      if a1 <> 0 then
      begin
        {@16D2-16E1}
        v11b := PR403_byte(v7p)^.v * 2;
        {@16E1-16EC}
        PR403_byte(v7p)^.v := v11b;
      end
      else
      begin
        {@16EF-1700}
        v2b := pO102_1276(v7p, 5);
        {@1700-1706}
        v9b := v2b;
        {@1706-170F}
        PR403_byte(v7p)^.v := 0;
        if v9b > 29 then
          v9b := 29
        else
        begin
          {@171B-1725}
          if v9b < 2 then
            v9b := 2;
        end;
        {@1725-173D}
        Inc(PR403_byte(v7p)^.v, a77BA_26c4[v9b].f);
        {@173D-1741}
        v13b := 0;
        for v11b := 0 to 140 do
        begin
          {@174A-17B4}
if (PRA30_byte(v7p)^.a[v11b] <> 0) and (a651A_3981[PRA30_byte(v7p)^.a[v11b]].f = 2)
              and (a651B_3981[PRA30_byte(v7p)^.a[v11b]].f = 5) then
          begin
            {@1795-1798}
            Inc(v13b);
            if v13b > PR403_byte(v7p)^.v then
              PRA30_byte(v7p)^.a[v11b] := 0;
          end;
        end;
      end;
    end;
    3: pO0E2_186E(v7p, 0);
    5: pO0E2_186E(v7p, 0);
    9: begin
      {@17E8-1802}
      if a1 = 0 then
        pO0E2_0104(v7p, 23, nil);
    end;
  end;
end;

{ 1845 }
procedure pO0AA_1845(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v7p: pointer;
  v7l: longint absolute v7p;
  v3sb: shortint absolute v3b;
begin
  if false then begin
    if LV = 'It''s Cursed!' then;
    if LV = 'Wrong Class' then;
    if LV = 'already using ' then;
    if LV = 'Your hands are full!' then;
  end;
  {@184C-185C}
  v1b := Ord(PR62_byte(a0)^.v > 127);
  {@185C-1869}
  v7p := p9CEE;
  if PR52_byte(a0)^.v <> 0 then
  begin
    {@1873-18AE}
    if PR54_byte(a0)^.v <> 0 then
      pO0EC_1AAC('It''s Cursed!')
    else
    begin
      {@1893-189B}
      PR52_byte(a0)^.v := 0;
      if v1b <> 0 then
        pO0AA_1675(pointer(a0), 0);
    end;
    {@18AE-18B1}
    Exit;
  end;
  {@18B1-18B5}
  v2b := 0;
  if (PR479_byte(v7p)^.v + a94D7_3981[PR46_byte(a0)^.v].f) > 2 then
    v2b := 3;
  {@18E1-18F7}
  v3b := a94D6_3981[PR46_byte(a0)^.v].f;
  case v3b of
    0..8: begin
      {@1902-191F}
      if PRA427_pointer(v7p)^.a[v3sb] <> nil then
        v2b := 2;
    end;
    9: begin
      {@1925-1938}
      if PR467_longint(v7p)^.v <> 0 then
        v2b := 2;
    end;
  end;
  {@1938-1959}
  if (PR46_byte(a0)^.v = 30) and (PR471_longint(v7p)^.v <> 0) then
  begin
    {@1951-1955}
    v2b := 2;
    {@1955-1959}
    v3b := 11;
  end;
  {@1959-1984}
  if ((PR46_byte(a0)^.v = 12) or (PR46_byte(a0)^.v = 74)) and (PR475_longint(v7p)^.v <> 0) then
  begin
    asm
  db 198,70,254,2
    end;
    asm
  db 198,70,253,12
    end;
  end;
  asm
  db 196,126,6,38,138,69,46,48,228,139,248,177,4,211,231,138,133,227,148,196,126,249,38,34,133,123,1,8
  db 192,117,4,198,70,254,1
  end;
  {@19A7-1A73}
  case v2b of
    0: begin
      {@19AE-19B6}
      PR52_byte(a0)^.v := 1;
      if v1b <> 0 then
        pO0AA_1675(pointer(a0), 1);
    end;
    1: pO0EC_1AAC('Wrong Class');
    2: begin
      {@19EB-1A19}
      pO0EC_0484(v7l, pointer(PRA427_longint(v7p)^.a[v3sb]), 0, 0, 0, 0);
      {@1A19-1A47}
      pO0EC_1AAC('already using ' + PR0_string(PRA427_pointer(v7p)^.a[v3sb])^.v);
    end;
    3: begin
      {@1A4D-1A73}
      if (b880C <> 5) or (PR496_byte(v7p)^.v = 0) then
        pO0EC_1AAC('Your hands are full!');
    end;
  end;
end;

{ 1A95 }
procedure pO0AA_1A95(a0: pointer);
var
  v4p: pointer;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'Trade with Whom?' then;
    if LV = 'Overloaded' then;
  end;
  {@1A9B-1AA8}
  v4p := p82E2;
  {@1AA8-1AAD}
  pO0EC_2ED1;
  {@1AAD-1ACC}
  pO0EC_3497('Trade with Whom?', 1, 1, @v4b);
  if v4p <> nil then
  begin
    {@1AD4-1AE1}
    p82E2 := v4p;
    if pO0AA_2DD0(v4p, 0, pointer(a0)) <> 0 then
    begin
      {@1AF8-1B0C}
      pO0EC_1AAC('Overloaded');
      {@1B0C-1B0E}
      Exit;
    end;
    {@1B0E-1B1F}
    pO0EC_19DE(v4p, pointer(a0));
    {@1B1F-1B32}
    pO0EC_18EF(p9CEE, pointer(a0));
    {@1B32-1B3D}
    pO0EC_0EBF(v4p);
  end;
end;

{ 1B54 }
procedure pO0AA_1B54(a0: pointer);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
begin
  if false then begin
    if LV = 'Can''t halve that' then;
  end;
  {@1B5A-1B68}
  v5b := PR57_byte(a0)^.v shr 1;
  if v5b > 0 then
  begin
    {@1B6E-1B83}
    v6b := PR57_byte(a0)^.v - v5b;
    {@1B83-1B92}
    GetMem(v4p, 63);
    {@1B92-1BA5}
    Move(PR0_byte(a0)^.v, PR0_byte(v4p)^.v, 63);
    {@1BA5-1BAF}
    PR57_byte(v4p)^.v := v5b;
    {@1BAF-1BB7}
    PR52_byte(v4p)^.v := 0;
    {@1BB7-1BCD}
    PR42_pointer(v4p)^.v := PR42_pointer(a0)^.v;
    {@1BCD-1BD7}
    PR57_byte(a0)^.v := v6b;
    {@1BD7-1BE8}
    PR42_pointer(a0)^.v := v4p;
    {@1BE8-1BEA}
    Exit;
  end;
  {@1BEA-1BFE}
  pO0EC_1AAC('Can''t halve that');
end;

{ 1C04 }
procedure pO0AA_1C04(a0: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v13b: byte;
  _f1: array[1..1] of byte;
begin
  {@1C0A-1C16}
  v12p := a0;
  {@1C16-1C20}
  v13b := PR57_byte(v12p)^.v;
  {@1C20-1C34}
  v4p := PR423_pointer(p9CEE)^.v;
  {@1C34-1DE1}
  while v4p <> nil do
  begin
    {@1C3F-1C50}
    v8p := PR42_pointer(v4p)^.v;
if (v4p <> v12p) and (PR57_byte(v4p)^.v > 0) and (PR47_byte(v4p)^.v = PR47_byte(v12p)^.v)
        and (PR48_byte(v4p)^.v = PR48_byte(v12p)^.v) and (PR49_byte(v4p)^.v = PR49_byte(v12p)^.v)
        and (PR53_byte(v4p)^.v = PR53_byte(v12p)^.v) and (PR46_byte(v4p)^.v = PR46_byte(v12p)^.v)
        and (PR50_byte(v4p)^.v = PR50_byte(v12p)^.v) and (PR51_byte(v4p)^.v = PR51_byte(v12p)^.v)
        and (PR54_byte(v4p)^.v = PR54_byte(v12p)^.v) and (PR55_word(v4p)^.v = PR55_word(v12p)^.v)
        and (PR60_byte(v4p)^.v = PR60_byte(v4p)^.v) and (PR60_byte(v4p)^.v < 2)
        and (PR61_byte(v4p)^.v = PR61_byte(v4p)^.v) and (PR62_byte(v4p)^.v = PR62_byte(v4p)^.v) then
    begin
      {@1D5E-1DD2}
      if (v13b + PR57_byte(v4p)^.v) <= 255 then
      begin
        {@1D75-1D7F}
        Inc(v13b, PR57_byte(v4p)^.v);
        {@1D7F-1D92}
        pO0EC_18EF(p9CEE, v4p);
      end
      else
      begin
        {@1D94-1D9C}
        PR57_byte(v12p)^.v := 255;
        {@1D9C-1DBC}
        PR57_byte(v4p)^.v := PR57_byte(v4p)^.v - (255 - v13b);
        {@1DBC-1DC6}
        v13b := PR57_byte(v4p)^.v;
        {@1DC6-1DD2}
        v12p := v4p;
      end;
    end;
    {@1DD2-1DDE}
    v4p := v8p;
  end;
  {@1DE1-1DEB}
  PR57_byte(v12p)^.v := v13b;
end;

{ 1E0A }
procedure pO0AA_1E0A(a0: pointer; a1: pointer);
var
  v1b: byte;
  v3w: word;
  v4b: byte;
  _f1: array[1..14] of byte;
  v3b: byte absolute v3w;
begin
  if false then begin
    if LV = 'uses an item' then;
    if LV = 'Item:' then;
    if LV = 'oops!' then;
  end;
  {@1E10-1E15}
  v3w := 65535;
  {@1E15-1E1A}
  bAE61 := 0;
  {@1E1A-1E1E}
  v1b := 0;
  if pO0BB_6C36(pointer(a0)) <> 0 then
  begin
    {@1E2D-1E3A}
    pAB3A := a0;
    {@1E3A-1E51}
    v1b := pO0AA_30F3(2, 1, @v3b, @v4b);
  end
  else
  begin
    {@1E53-1E78}
    if (PR61_byte(a0)^.v > 0) and (PR62_byte(a0)^.v < 128) then
    begin
      {@1E67-1E6C}
      bAE61 := 1;
      {@1E6C-1E78}
      v1b := PR61_byte(a0)^.v and 127;
    end;
  end;
  asm
  db 128,126,255,0,117,10,196,126,6,38,198,5,0,233,197,1,128,62,12,136,5,117,17,196,62,238,156,38
  db 128,189,240,1,0,117,5
  call pO0EC_324C
  db 128,62,97,174,0,117,3,233,147,0,255,54,240,156,255,54,238,156,141,126,239,22,87,191,241,29,14,87
  db 154,111,10,37,8,176,10,80,176,0,80
  call pO0EC_1B08
  db 128,62,12,136,5,117,65,176,0,80,176,23,80,176,10,80,176,0,80,141,126,246,22,87,191,254,29,14
  db 87,154,111,10,37,8
  call pR47F_0354
  db 255,54,240,156,255,54,238,156,255,118,12,255,118,10,176,5,80,176,23,80,176,0,80,176,1,80
  call pO0EC_0484
  db 235,31,255,54,240,156,255,54,238,156,255,118,12,255,118,10,176,1,80,176,22,80,176,0,80,176,1,80
  call pO0EC_0484
  call pR47F_0D1A
  call pO0EC_1BEF
  db 198,6,97,174,1,255,118,12,255,118,10
  call pO0BB_6C36
  db 8,192,117,3,233,173,0,255,54,240,156,255,54,238,156,176,5,80
  call pO102_1276
  db 8,192,119,20,255,54,240,156,255,54,238,156,176,0,80
  call pO102_1276
  db 8,192,118,29,138,70,255,80,196,62,238,156,38,138,133,240,1,80,176,0,80,196,126,6,6,87
  call pO0BB_121C
  db 235,102,255,54,240,156,255,54,238,156,176,6,80
  call pO102_1276
  db 60,9,118,44,176,1,80,176,100,80
  call pO0E2_1374
  db 60,75,119,29,138,70,255,80,196,62,238,156,38,138,133,240,1,80,176,0,80,196,126,6,6,87
  call pO0BB_121C
  db 235,38,255,54,240,156,255,54,238,156,141,126,246,22,87,191,4,30,14,87,154,111,10,37,8,160,147,157
  db 48,228,64,80,176,1,80
  call pO0EC_1B08
  db 235,27,138,70,255,80,196,62,238,156,38,138,133,240,1,80,176,0,80,196,126,6,6,87
  call pO0BB_121C
  db 198,6,97,174,0,128,62,12,136,5,117,37,138,70,255,48,228,139,248,177,4,211,231,128,189,37,101,0
  db 116,19,255,54,240,156,255,54,238,156
  call pO0EC_2CF6
  db 196,126,6,38,136,5
  end;
  {@204D-20BF}
  if PR0_byte(a1)^.v <> 0 then
  begin
    {@2056-207E}
    if pO0BB_6C36(pointer(a0)) <> 0 then
    begin
      {@2065-207C}
      pO0BB_6C6B(p9CEE, pointer(a0), v1b);
      {@207C-207E}
      Exit;
    end;
    {@207E-20BF}
    if PR60_byte(a0)^.v > 0 then
    begin
      {@2088-209B}
      if PR57_byte(a0)^.v > 1 then
      begin
        {@2092-2099}
        Dec(PR57_byte(a0)^.v);
        {@2099-209B}
        Exit;
      end;
      {@209B-20A2}
      Dec(PR60_byte(a0)^.v);
      if PR60_byte(a0)^.v = 0 then
        pO0EC_18EF(p9CEE, pointer(a0));
    end;
  end;
end;

{ 21E2 }
procedure pO0AA_21E2(a0: pointer);
var
c53: record case byte of 0: (v53a2: string[52]); 1: (v53a: string[40]); 2: (_p2: array[1..45] of byte;
      v8w: word); 3: (_p3: array[1..45] of byte; v8b: byte); 4: (_p4: array[1..49] of byte; v4w: word);
      5: (_p5: array[1..51] of byte; v2w: word) end;
begin
  if false then begin
    if LV = 'I''ll give you ' then;
    if LV = ' platinum pieces for your ' then;
    if LV = 'Will you sell ' then;
    if LV = 'it? ' then;
    if LV = 'them? ' then;
    if LV = 'Your ' then;
    if LV = ' is worthless to me.' then;
    if LV = 'Shall I dispose of it for you? ' then;
    if LV = ' are worthless.' then;
    if LV = 'Would you like to discard them? ' then;
    if LV = 'Sold!' then;
    if LV = 'I will give it to one of my sons.' then;
    if LV = 'Very well.  I''ll take them.' then;
    if LV = 'Overloaded.  Money will be put in pool.' then;
  end;
  asm
  db 49,192,137,70,252
  end;
  if PR58_word(a0)^.v > 0 then
    c53.v4w := PR58_word(a0)^.v shr 1;
  asm
  db 196,126,6,38,128,125,57,1,118,59,196,126,6,38,128,125,46,30,116,10,196,126,6,38,128,125,46,12
  db 117,24,196,126,6,38,138,69,57,48,228,247,102,252,49,210,185,20,0,247,241,137,70,252,235,15,196,126
  db 6,38,138,69,57,48,228,247,102,252,137,70,252
  end;
  {@2249-2268}
  pO0EC_0484(l82DE, pointer(a0), 0, 0, 0, 0);
  if c53.v4w > 0 then
  begin
    {@2271-22C2}
pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'I''ll give you ' + pO0EC_146B(c53.v4w) + ' platinum pieces for your '
        + PR0_string(a0)^.v);
    {@22C2-22D5}
    c53.v53a := 'Will you sell ';
    if PR57_byte(a0)^.v < 2 then
      c53.v53a := c53.v53a2 + 'it? '
    else
      c53.v53a := c53.v53a2 + 'them? ';
  end
  else
  begin
    {@2334-23E2}
    if PR57_byte(a0)^.v < 2 then
    begin
      {@233E-237C}
      pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'Your ' + PR0_string(a0)^.v + ' is worthless to me.');
      {@237C-238F}
      c53.v53a := 'Shall I dispose of it for you? ';
    end
    else
    begin
      {@2391-23CF}
      pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'Your ' + PR0_string(a0)^.v + ' are worthless.');
      {@23CF-23E2}
      c53.v53a := 'Would you like to discard them? ';
    end;
  end;
  {@23E2-24C0}
  if Byte(pO108_2254(c53.v53a2, b5362)) = b5362 then
  begin
    {@23F9-2449}
    if c53.v4w > 0 then
      pO0EC_1AAC('Sold!')
    else
    begin
      {@2415-2449}
      if PR57_byte(a0)^.v < 2 then
        pO0EC_1AAC('I will give it to one of my sons.')
      else
        pO0EC_1AAC('Very well.  I''ll take them.');
    end;
    {@2449-245C}
    pO0EC_18EF(p9CEE, pointer(a0));
    {@245C-2462}
    c53.v2w := c53.v4w;
    if pO0B5_005E(p9CEE, longint(c53.v2w), @c53.v8b) <> 0 then
    begin
      {@247F-2493}
      pO0EC_1AAC('Overloaded.  Money will be put in pool.');
      {@2493-249F}
      Inc(PR331_word(p9CEE)^.v, c53.v8w);
      {@249F-24A5}
      Dec(c53.v4w, c53.v8w);
      {@24A5-24B2}
      Inc(lA7BE, c53.v4w);
    end
    else
      Inc(PR331_word(p9CEE)^.v, c53.v4w);
  end;
  {@24C0-24D1}
  pR142_0217(1, 21, 38, 22);
end;

{ 2564 }
procedure pO0AA_2564(a0: pointer; a1: pointer);
var
  v4l: longint;
  v8l: longint;
  v9b: byte;
begin
  if false then begin
    if LV = 'For 20 platinum pieces I''ll identify your ' then;
    if LV = 'Is It a Deal? ' then;
    if LV = 'Not Enough Money' then;
    if LV = 'I can''t tell anything new about your ' then;
    if LV = 'It looks like some sort of ' then;
  end;
  {@256B-256F}
  v9b := 0;
  {@256F-258E}
  pO0EC_0484(l82DE, pointer(a0), 0, 0, 0, 0);
  {@258E-25C2}
  pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'For 20 platinum pieces I''ll identify your ' + PR0_string(a0)^.v);
  if Byte(pO108_2254('Is It a Deal? ', b5362)) = b5362 then
  begin
    {@25E3-25F0}
    v8l := lA7BE;
    {@25F0-2601}
    v4l := PR331_word(p9CEE)^.v;
    if v4l >= 20 then
    begin
      {@260F-2613}
      v9b := 1;
      {@2613-261D}
      Dec(PR331_word(p9CEE)^.v, 20);
    end
    else
    begin
      {@261F-2674}
      if (v8l + v4l) >= 20 then
      begin
        {@2637-263B}
        v9b := 1;
        {@263B-2646}
        PR331_word(p9CEE)^.v := 0;
        {@2646-2659}
        Dec(lA7BE, 20 - v4l);
      end
      else
      begin
        {@265B-266F}
        pO0EC_1AAC('Not Enough Money');
        {@266F-2674}
        pR47F_0D1A;
      end;
    end;
  end;
  {@2674-272A}
  if v9b <> 0 then
  begin
    {@267D-272A}
    if (PR53_byte(a0)^.v and 7) = 0 then
      pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'I can''t tell anything new about your ' + PR0_string(a0)^.v)
    else
    begin
      {@26C0-26D0}
      PR53_byte(a0)^.v := PR53_byte(a0)^.v and 248;
      {@26D0-26EF}
      pO0EC_0484(l82DE, pointer(a0), 0, 0, 0, 0);
      {@26EF-2723}
      pR47F_0498(1, 21, 38, 22, 14, 0, 1, 'It looks like some sort of ' + PR0_string(a0)^.v);
      {@2723-272A}
      PR0_byte(a1)^.v := 1;
    end;
  end;
  {@272A-2735}
  if v9b <> 0 then
    pR47F_0D1A;
  {@2735-2746}
  pR142_0217(1, 21, 38, 22);
end;

{ 274E }
procedure pO0AA_274E;
var
c56: record case byte of 0: (v56a2: string[55]); 1: (v56a: string[15]); 2: (v56b: byte);
      3: (_p3: array[1..16] of byte; v40a2: string[39]); 4: (_p4: array[1..16] of byte; v40a: string[15]);
      5: (_p5: array[1..32] of byte; v24w: word); 6: (_p6: array[1..32] of byte; v24b: byte);
      7: (_p7: array[1..34] of byte; v22w: word); 8: (_p8: array[1..36] of byte; v20p: pointer);
      9: (_p9: array[1..36] of byte; v20b: byte); 10: (_p10: array[1..40] of byte; v16p: pointer);
      11: (_p11: array[1..40] of byte; v16b: byte); 12: (_p12: array[1..44] of byte; v12p: pointer);
      13: (_p13: array[1..48] of byte; v8b: byte); 14: (_p14: array[1..49] of byte; v7b: byte);
      15: (_p15: array[1..50] of byte; v6b: byte); 16: (_p16: array[1..50] of byte; v6sb: shortint);
      17: (_p17: array[1..51] of byte; v5b: byte); 18: (_p18: array[1..51] of byte; v5sb: shortint);
      19: (_p19: array[1..52] of byte; v4l: longint); 20: (_p20: array[1..52] of byte; v4b: byte) end;
  v312a: string;
  v313b: byte;
  v315w: word;
  v316b: byte;
  v317b: byte;
  v318b: byte;
  v312b: byte absolute v312a;
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@2755-2A84}
  repeat
    {@2755-2762}
    c56.v4l := l82E2;
    {@2762-2767}
    pO0EC_2ED1;
    {@2767-277C}
    pO0EC_3497(s1694, 1, 1, @c56.v4b);
    if c56.v4l = 0 then
      v316b := 1
    else
    begin
      {@278C-2790}
      pO0AA_0041;
      {@2790-2A7A}
      repeat
        {@2790-2794}
        pO0AA_063D;
        {@2794-27A1}
        l82E2 := c56.v4l;
        {@27A1-27A9}
        c56.v12p := nil;
        {@27A9-27B1}
        c56.v16p := nil;
        {@27B1-27B9}
        c56.v20p := nil;
        {@27B9-27BE}
        c56.v22w := 0;
        for c56.v5b := 2 downto 0 do
        begin
          {@27C7-290A}
          if PRA331_word(p9CEE)^.a[c56.v5sb] <> 0 then
          begin
            {@27DE-27E1}
            Inc(c56.v22w);
            if c56.v12p = nil then
            begin
              {@27E9-27F8}
              GetMem(c56.v12p, 46);
              {@27F8-2805}
              PR42_pointer(c56.v12p)^.v := nil;
            end
            else
            begin
              {@2807-2813}
              c56.v16p := c56.v12p;
              {@2813-2822}
              GetMem(c56.v12p, 46);
              {@2822-2833}
              PR42_pointer(c56.v12p)^.v := c56.v16p;
            end;
            {@2833-285D}
            c56.v40a := pO0EC_146B(PRA331_word(p9CEE)^.a[c56.v5sb]);
            {@285D-2878}
            c56.v8b := 14 - a1123_8ce8[c56.v5sb].f;
            {@2878-287C}
            c56.v56b := 0;
            for c56.v7b := 1 to c56.v8b do
              c56.v56a := c56.v56a2 + ' ';
            {@28C4-2902}
            PR0_string_40_(c56.v12p)^.v := a1123_31ca[c56.v5sb] + c56.v56a2 + c56.v40a2;
            {@2902-290A}
            PR41_byte(c56.v12p)^.v := 0;
          end;
        end;
        {@2913-291F}
        c56.v20p := c56.v12p;
        {@291F-2924}
        c56.v24w := 0;
        {@2924-2929}
        v318b := 1;
        {@2929-2931}
        pO108_00CB(0);
        {@2931-296C}
        v313b := pO108_1D45(s166B, s2B8D, 20, 9, 38, 15, c56.v12p, 1, 1, @v318b, @c56.v24b, @c56.v16b);
        if (v313b = 1) or (bAAE6 <> 0) and (v313b = 27) then
          c56.v16p := nil;
        {@2989-2A5E}
        if c56.v16p = nil then
          v317b := 1
        else
        begin
          {@2999-299E}
          v312b := 0;
          {@299E-29B1}
          c56.v6b := pO0B5_0AF2(PR0_string(c56.v16p)^.v, @v312b);
          {@29B1-29E5}
          v312a := s1575 + v312a + s16BD;
          {@29E5-2A0C}
          v315w := pO0B5_019B(longint(PRA331_word(p9CEE)^.a[c56.v6sb]), v312a, 10);
          {@2A0C-2A27}
          pO0B5_0368(@b9CEE, @c56.v4b, longint(v315w), c56.v6b);
          {@2A27-2A2C}
          v317b := 1;
          {@2A2C-2A31}
          v316b := 1;
          for c56.v5b := 0 to 2 do
          begin
            {@2A3A-2A58}
            if PRA331_word(p9CEE)^.a[c56.v5sb] > 0 then
            begin
              {@2A4E-2A53}
              v316b := 0;
              {@2A53-2A58}
              v317b := 0;
            end;
          end;
        end;
        {@2A5E-2A70}
        if c56.v20p <> nil then
          pO108_2363(@c56.v20b);
      until v317b <> 0;
    end;
  until v316b <> 0;
end;

{ 2A8A }
procedure pO0AA_2A8A(a0: byte);
var
c54: record case byte of 0: (v54a2: string[53]); 1: (v54a: string[15]); 2: (v54b: byte);
      3: (_p3: array[1..16] of byte; v38a2: string[37]); 4: (_p4: array[1..16] of byte; v38a: string[15]);
      5: (_p5: array[1..16] of byte; v38b: byte); 6: (_p6: array[1..32] of byte; v22b: byte);
      7: (_p7: array[1..33] of byte; v21b: byte); 8: (_p8: array[1..34] of byte; v20p: pointer);
      9: (_p9: array[1..34] of byte; v20b: byte); 10: (_p10: array[1..38] of byte; v16p: pointer);
      11: (_p11: array[1..38] of byte; v16b: byte); 12: (_p12: array[1..42] of byte; v12p: pointer);
      13: (_p13: array[1..46] of byte; v8w: word); 14: (_p14: array[1..46] of byte; v8b: byte);
      15: (_p15: array[1..48] of byte; v6w: word); 16: (_p16: array[1..50] of byte; v4b: byte);
      17: (_p17: array[1..51] of byte; v3b: byte); 18: (_p18: array[1..52] of byte; v2b: byte);
      19: (_p19: array[1..52] of byte; v2sb: shortint); 20: (_p20: array[1..53] of byte; v1b: byte);
      21: (_p21: array[1..53] of byte; v1sb: shortint) end;
  v310a: string;
  v311b: byte;
  v313w: word;
  v314b: byte;
  v315b: byte;
  v316b: byte;
  v317b: byte;
  v310b: byte absolute v310a;
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@2A91-2DCA}
  repeat
    {@2A91-2A9B}
    if a0 <> 0 then
      pO0AA_063D;
    {@2A9B-2AA3}
    c54.v12p := nil;
    {@2AA3-2AAB}
    c54.v16p := nil;
    {@2AAB-2AB3}
    c54.v20p := nil;
    {@2AB3-2AB8}
    c54.v6w := 0;
    for c54.v1b := 2 downto 0 do
    begin
      {@2AC1-2C0D}
      if PRA331_word(p9CEE)^.a[c54.v1sb] <> 0 then
      begin
        {@2AD8-2ADB}
        Inc(c54.v6w);
        if c54.v12p = nil then
        begin
          {@2AE3-2AF2}
          GetMem(c54.v12p, 46);
          {@2AF2-2AFF}
          PR42_pointer(c54.v12p)^.v := nil;
        end
        else
        begin
          {@2B01-2B0D}
          c54.v16p := c54.v12p;
          {@2B0D-2B1C}
          GetMem(c54.v12p, 46);
          {@2B1C-2B2D}
          PR42_pointer(c54.v12p)^.v := c54.v16p;
        end;
        {@2B2D-2B57}
        c54.v38a := pO0EC_146B(PRA331_word(p9CEE)^.a[c54.v1sb]);
        {@2B57-2B7B}
        c54.v3b := 18 - a1123_8ce8[c54.v1sb].f - c54.v38b;
        {@2B7B-2B7F}
        c54.v54b := 0;
        for c54.v4b := 1 to c54.v3b do
          c54.v54a := c54.v54a2 + ' ';
        {@2BC7-2C05}
        PR0_string_40_(c54.v12p)^.v := a1123_31ca[c54.v1sb] + c54.v54a2 + c54.v38a2;
        {@2C05-2C0D}
        PR41_byte(c54.v12p)^.v := 0;
      end;
    end;
    {@2C16-2C22}
    c54.v20p := c54.v12p;
    {@2C22-2C27}
    c54.v8w := 0;
    {@2C27-2C2B}
    c54.v22b := 1;
    {@2C2B-2C33}
    pO108_00CB(1);
    if a0 <> 0 then
    begin
      {@2C39-2C3E}
      v314b := 20;
      {@2C3E-2C43}
      v315b := 38;
      {@2C43-2C48}
      v316b := 9;
      {@2C48-2C4D}
      v317b := 15;
    end
    else
    begin
      {@2C4F-2C54}
      v314b := 1;
      {@2C54-2C59}
      v315b := 38;
      {@2C59-2C5E}
      v316b := 17;
      {@2C5E-2C63}
      v317b := 22;
    end;
    {@2C63-2CA5}
v311b := pO108_1D45(s166B, s2B8D, v314b, v316b, v315b, v317b, c54.v12p, 1, 1, @c54.v22b, @c54.v8b,
        @c54.v16b);
    if (c54.v16p = nil) or (v311b = 1) then
      c54.v21b := 1
    else
    begin
      {@2CBB-2CC0}
      v310b := 0;
      {@2CC0-2CD3}
      c54.v2b := pO0B5_0AF2(PR0_string(c54.v16p)^.v, @v310b);
      if b880C = 10 then
        v310a := s1575 + v310a + s1976
      else
        v310a := s1575 + v310a + s194D;
      {@2D44-2D6B}
      v313w := pO0B5_019B(longint(PRA331_word(p9CEE)^.a[c54.v2sb]), v310a, 10);
      {@2D6B-2D84}
      pO0B5_0966(p9CEE, longint(v313w), c54.v2b);
      {@2D84-2D88}
      c54.v21b := 1;
      for c54.v1b := 0 to 2 do
      begin
        {@2D91-2DA9}
        if PRA331_word(p9CEE)^.a[c54.v1sb] > 0 then
          c54.v21b := 0;
      end;
    end;
    {@2DAF-2DC1}
    if c54.v20p <> nil then
      pO108_2363(@c54.v20b);
  until c54.v21b <> 0;
end;

{ 2DD0 }
function pO0AA_2DD0(a0: pointer; a1: byte; a2: pointer): byte;
var
  v2b: byte;
  v4w: word;
  v8p: pointer;
  v9b: byte;
  _f1: array[1..1] of byte;
begin
  {@2DD6-2DE1}
  pO0EC_0EBF(pointer(a0));
  {@2DE1-2DE5}
  v2b := 0;
  {@2DE5-2DE9}
  v9b := 0;
  {@2DE9-2DFC}
  v8p := PR423_pointer(a0)^.v;
  if (PR57_byte(a2)^.v > 0) and (a1 <> 0) then
    while (v9b = 0) and (v8p <> nil) do
    begin
      {@2E26-2EF2}
v9b := Ord((PR47_byte(v8p)^.v = PR47_byte(a2)^.v) and (PR48_byte(v8p)^.v = PR48_byte(a2)^.v)
          and (PR49_byte(v8p)^.v = PR49_byte(a2)^.v) and (PR46_byte(v8p)^.v = PR46_byte(a2)^.v)
          and (PR50_byte(v8p)^.v = PR50_byte(a2)^.v) and (PR51_byte(v8p)^.v = PR51_byte(a2)^.v)
          and (PR54_byte(v8p)^.v = PR54_byte(a2)^.v) and (PR55_word(v8p)^.v = PR55_word(a2)^.v)
          and (PR60_byte(v8p)^.v = PR60_byte(a2)^.v) and (PR60_byte(v8p)^.v < 2)
          and (PR61_byte(v8p)^.v = PR61_byte(a2)^.v) and (PR62_byte(v8p)^.v = PR62_byte(a2)^.v));
      {@2EF2-2F03}
      v8p := PR42_pointer(v8p)^.v;
    end;
  {@2F06-2F1B}
  if (PR422_byte(a0)^.v > 15) and (v9b = 0) then
    v2b := 1;
  {@2F1B-2F25}
  v4w := PR55_word(a2)^.v;
  if PR57_byte(a2)^.v > 0 then
    v4w := PR57_byte(a2)^.v * v4w;
  {@2F3E-2F6C}
  if (PR481_word(a0)^.v + v4w) > (pO0EC_178D(pointer(a0)) + 1500) then
    v2b := 1;
  {@2F6C-2F72}
  pO0AA_2DD0 := v2b;
end;

{ 2F7B }
procedure pO0AA_2F7B(a0: byte);
var
  v4p: pointer;
  v5b: byte;
  _f1: array[1..1] of byte;
begin
  {@2F81-2FB1}
  if (bC5C4 <> 0) and (bC5C5 <> 0) and (p9CF6 <> nil) then
  begin
    {@2F98-2FA6}
    p9CEE := p9CF6;
    {@2FA6-2FAE}
    p9CF6 := nil;
    {@2FAE-2FB1}
    Exit;
  end;
  {@2FB1-2FB7}
  v5b := a0;
  {@2FB7-2FC4}
  v4p := p9CF2;
  {@2FC4-2FCF}
  if v4p = nil then
    Exit;
  {@2FCF-309A}
  case v5b of
    72: begin
      {@2FD9-3047}
      if v4p = p9CEE then
        while PR483_pointer(v4p)^.v <> nil do
          v4p := PR483_pointer(v4p)^.v
      else
        while (v4p <> nil) and (PR483_pointer(v4p)^.v <> p9CEE) do
          v4p := PR483_pointer(v4p)^.v;
      {@3047-3054}
      p9CEE := v4p;
    end;
    80: begin
      {@305A-308D}
      if PR483_pointer(p9CEE)^.v <> nil then
        v4p := PR483_pointer(p9CEE)^.v
      else
        v4p := p9CF2;
      {@308D-309A}
      p9CEE := v4p;
    end;
  end;
end;

{ 30F3 }
function pO0AA_30F3(a0: byte; a1: byte; a2: pointer; a3: pointer): byte;
var
  v42a: string[40];
  v42a2: string[40] absolute v42a;
  v42b: byte absolute v42a;
begin
  if false then begin
    if LV = 'in Memory' then;
    if LV = 'in Grimoire' then;
    if LV = 'on Scroll' then;
    if LV = 'on Scrolls' then;
    if LV = 'to Choose' then;
    if LV = 'to Memorize' then;
    if LV = 'to Scribe' then;
    if LV = 'Spells ' then;
  end;
  {@30FA-31B2}
  case a0 of
    0: v42a := 'in Memory';
    1: v42a := 'in Grimoire';
    2: v42a := 'on Scroll';
    3: v42a := 'on Scrolls';
    4: v42a := 'to Choose';
    5: v42a := 'to Memorize';
    6: v42a := 'to Scribe';
  else
    {@31AE-31B2}
    v42b := 0;
  end;
  {@31B2-31C1}
  PR0_byte(a3)^.v := pO0BB_09DE(a0);
  if PR0_byte(a3)^.v <> 0 then
  begin
    {@31CA-31DE}
    if (PR0_integer(a2)^.v < 0) or (a1 = 1) then
      pR142_01EF;
    {@31DE-31F4}
    pO0EC_1C22(p9CEE, 1, 1, 1);
    {@31F4-3229}
    pR47F_0354(PR0_byte(p9CEE)^.v + 4, 1, 10, 0, 'Spells ' + v42a2);
    {@3229-323A}
    pO0AA_30F3 := pO0BB_0123(a1, @PR0_byte(a2)^.v);
    {@323A-323C}
    Exit;
  end;
  {@323C-3240}
  pO0AA_30F3 := 0;
end;

{ 3249 }
function pO0AA_3249(a0: pointer): byte;
var
  _f1: array[1..3] of byte;
  v5b: byte;
  _f2: array[1..1] of byte;
begin
  {@324F-32A6}
pO0AA_3249 := Ord(((PR174_byte(a0)^.v = 3) or (PR347_byte(a0)^.v > 0) and (pO102_0C12(pointer(a0)) <> 0))
      and (b880C <> 5) and (PR493_byte(a0)^.v = 0) and (pO0EC_27C1(pointer(a0), 109, @v5b) = 0));
end;

{ 32AF }
function pO0AA_32AF(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@32B5-3300}
pO0AA_32AF := Ord(((PR174_byte(a0)^.v = 3) or (PR347_byte(a0)^.v > 0) and (pO102_0C12(pointer(a0)) <> 0))
      and (b880C <> 5) and (PR493_byte(a0)^.v = 0) and (PR175_byte(a0)^.v > 0));
end;

{ 3332 }
procedure pO0AA_3332(a0: pointer);
var
  v4p: pointer;
begin
  if false then begin
    if LV = 'Heal whom? ' then;
    if LV = ' feels better' then;
    if LV = ' is unaffected' then;
  end;
  {@3339-333E}
  pO0EC_2ED1;
  {@333E-334B}
  v4p := p9CF2;
  asm
  db 141,126,240,22,87,191,9,51,14,87,154,111,10,37,8,176,1,80,176,0,80,141,126,252,22,87
  call pO0EC_3497
  end;
  if v4p = nil then
  begin
    asm
  push cs
  call near ptr pO0AA_0041
    end;
    asm
  db 233,143,0
    end;
  end;
  {@3379-33EC}
  if pO0E2_212C(v4p, pO102_1276(pointer(a0), 3) * 2, 0) <> 0 then
  begin
    {@339E-33AC}
    pO0EC_0987(v4p, 1);
    {@33AC-33CB}
    pO0EC_1AAC(PR0_string(v4p)^.v + ' feels better');
  end
  else
    pO0EC_1AAC(PR0_string(v4p)^.v + ' is unaffected');
  {@33EC-3404}
  pO0E2_13E5(pointer(a0), 109, 1440, 0, 0);
  {@3404-3408}
  pO0AA_0041;
end;

{ 3455 }
procedure pO0AA_3455(a0: pointer);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  _f1: array[1..3] of byte;
  v10b: byte;
  v4b: byte absolute v4p;
begin
  if false then begin
    if LV = 'Cure whom? ' then;
    if LV = 'is not diseased' then;
    if LV = 'cure anyway: ' then;
    if LV = ' is cured' then;
    if LV = ' cures the healthy' then;
  end;
  {@345C-3461}
  pO0EC_2ED1;
  {@3461-346E}
  v4p := p9CF2;
  {@346E-348D}
  pO0EC_3497('Cure whom? ', 1, 0, @v4b);
  if v4p = nil then
  begin
    {@3495-3499}
    pO0AA_0041;
    asm
  db 233,242,0
    end;
  end;
  asm
  db 198,70,251,0
  end;
  asm
  db 160,98,83,136,70,250
  end;
  if v5b = 0 then
  begin
    {@34AC-34CC}
    pO0EC_1B08(v4p, 'is not diseased', 0, 0);
    {@34CC-34E7}
    v6b := pO108_2254('cure anyway: ', b5363);
    {@34E7-34EC}
    pO0EC_1BEF;
  end;
  {@34EC-358A}
  if v6b = b5362 then
  begin
    {@34F8-34FD}
    bA7DB := 1;
    {@34FD-3502}
    bA7DB := 0;
    if PR175_byte(a0)^.v > 0 then
      Dec(PR175_byte(a0)^.v);
    {@3515-3544}
    if pO0EC_27C1(pointer(a0), 110, @v10b) = 0 then
      pO0E2_13E5(pointer(a0), 110, 10080, 0, 1);
    {@3544-358A}
    if v5b <> 0 then
      pO0EC_1AAC(PR0_string(v4p)^.v + ' is cured')
    else
      pO0EC_1AAC(PR0_string(a0)^.v + ' cures the healthy');
  end;
  {@358A-358E}
  pO0AA_0041;
end;

{ 3594 }
function pO0AA_3594: byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@359A-35A0}
  v3b := bC5C3;
  {@35A0-35A5}
  bC5C3 := 1;
  {@35A5-3612}
  repeat
    {@35A5-35AD}
    pO108_00CB(1);
    {@35AD-35C5}
    v2b := pO108_1009(s2859, s2B8D, 1, 0);
    if bAAE6 <> 0 then
    begin
      {@35CC-3605}
      if v2b = 27 then
      begin
        {@35D2-35D6}
        v2b := 1;
        {@35D6-35DB}
        bAAE6 := 0;
      end
      else
      begin
        {@35DD-35ED}
        pO0EC_0987(p9CEE, 0);
        {@35ED-35F5}
        pO0AA_2F7B(v2b);
        {@35F5-3605}
        pO0EC_0987(p9CEE, 1);
      end;
    end;
  until (bAAE6 = 0) and (v2b <= 1);
  {@3612-3622}
  pO0EC_0987(p9CEE, 1);
  {@3622-362E}
  pO0AA_3594 := Ord(v2b = 0);
  {@362E-3634}
  bC5C3 := v3b;
end;

{ 363B }
function pO0AA_363B(a0: pointer; a1: byte): shortint;
var
  v2b: byte;
  _f1: array[1..2] of byte;
  v2sb: shortint absolute v2b;
begin
  {@3641-3645}
  v2b := 0;
  {@3645-3657}
  Inc(v2b, a719C_ec3f[PR25_byte(a0)^.v]);
  if (a1 = 2) or (a1 = 3) or (a1 = 4) then
    case PR25_byte(a0)^.v of
      17: Inc(v2b);
      18: Inc(v2b, 2);
      19, 20: Inc(v2b, 3);
      21..23: Inc(v2b, 4);
      24, 25: Inc(v2b, 5);
    end;
  {@36AB-36B1}
  pO0AA_363B := v2sb;
end;

{ 36BA }
procedure pO0AA_36BA(a0: pointer; a1: byte; a2: byte; a3: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v6sb: shortint absolute v6b;
begin
  {@36C0-36C4}
  v3b := 0;
  {@36C4-36C8}
  v5b := 0;
  for v6b := 0 to 6 do
  begin
    {@36D1-37C6}
    if (PRA337_byte(a0)^.a[v6sb] > 0) and ((a6DB9_ec3f[v6sb] and a1) > 0) then
    begin
      {@36F9-37C6}
      if PRA337_byte(a0)^.a[v6sb] < a6DC9_ec3f[v6sb] then
      begin
        {@3718-373C}
        if PRA337_byte(a0)^.a[v6sb] > 1 then
          v4b := 1
        else
          v4b := a6DD0_ec3f[v6sb];
        {@373C-3753}
        v1b := pO0E2_1374(v4b, a6DD7_ec3f[v6sb]);
        {@3753-376A}
        v2b := pO0E2_1374(v4b, a6DD7_ec3f[v6sb]);
        if v2b > v1b then
          v1b := v2b;
        {@3778-377E}
        Inc(v3b, v1b);
        {@377E-3799}
        Inc(v5b, v4b * pO0AA_363B(pointer(a0), v6b));
      end
      else
        case v6b of
          2, 3: v3b := 3;
          4, 0, 6: v3b := 2;
          5: v3b := 1;
        end;
    end;
  end;
  {@37CF-3954}
  with PW2_12_36BA(a0)^ do
  begin
    if a2 > 0 then
    begin
      {@37E1-37F3}
      v3b := Byte(v3b div a2);
      if v3b < 1 then
        v3b := 1;
      {@37FD-380F}
      v5b := Byte(v5b div a2);
      {@380F-382A}
      v1b := _w12_178byte - _w12_508byte;
      if a3 <> 0 then
      begin
        {@3830-383B}
        Inc(_w12_380byte, v3b);
        {@383B-3851}
        Inc(_w12_178byte, v3b + v5b);
        if v1b > _w12_178byte then
          _w12_508byte := 0
        else
          _w12_508byte := _w12_178byte - v1b;
      end
      else
      begin
        {@3887-38AA}
        if _w12_380byte > v3b then
          Dec(_w12_380byte, v3b)
        else
          _w12_380byte := 0;
        {@38AA-38BB}
        v7b := v3b + v5b;
        {@38BB-38C8}
        v8b := pO0AA_3975(pointer(a0));
        if (_w12_178byte - v7b) > v8b then
          v7b := _w12_178byte - v8b;
        {@38FC-391F}
        if v7b > _w12_178byte then
          _w12_178byte := 0
        else
          Dec(_w12_178byte, v7b);
        {@391F-3952}
        if v1b > _w12_178byte then
          _w12_508byte := 0
        else
          _w12_508byte := _w12_178byte - v1b;
      end;
      {@3952-3954}
      Exit;
    end;
    {@3954-395D}
    _w12_508byte := 0;
    {@395D-3966}
    _w12_380byte := 0;
    {@3966-396F}
    _w12_178byte := 0;
  end;
end;

{ 3975 }
function pO0AA_3975(a0: pointer): byte;
var
  v2b: byte;
  v4w: word;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v6sb: shortint absolute v6b;
  v5sb: shortint absolute v5b;
  v4b: byte absolute v4w;
begin
  {@397B-3C10}
  with PW0_14_3975(a0)^ do
  begin
    v2b := 0;
    v4w := 0;
    for v6b := 0 to 6 do
    begin
      {@3996-3C07}
      if (_w14_337abyte[v6sb] > 0) and (_w14_337abyte[v6sb] > _w14_313byte) or (_w14_344abyte[v6sb] > 0) then
      begin
        {@39D3-39E5}
        v5b := pO0EC_3D89(pointer(a0), v6b);
        if _w14_344abyte[v6sb] > 0 then
        begin
          {@39F6-3A07}
          v7b := _w14_344abyte[v6sb];
          {@3A07-3A0B}
          v10b := 1;
        end
        else
        begin
          {@3A0D-3A10}
          Inc(v2b);
          {@3A10-3A21}
          v7b := _w14_337abyte[v6sb];
          {@3A21-3A32}
          v10b := Ord(_w14_313byte = 0);
        end;
        {@3A32-3C07}
        if a6DC9_ec3f[v6sb] > v7b then
        begin
          {@3A41-3A79}
          if (v10b = 0) and (v7b > _w14_313byte) then
          begin
            {@3A54-3A6A}
            v7b := v7b - _w14_313byte;
            {@3A6A-3A6E}
            v10b := 1;
          end
          else
          begin
            {@3A70-3A79}
            if v6b = 4 then
              Inc(v7b);
          end;
          {@3A79-3A9F}
          if v10b <> 0 then
            Inc(v4w, (a6DD7_ec3f[v6sb] + v5sb) * v7b);
        end
        else
        begin
          {@3AA2-3B8A}
          if (v10b = 0) and (v7b > _w14_313byte) then
          begin
            {@3ABB-3ABF}
            v10b := 1;
            if _w14_313byte >= (a6DC9_ec3f[v6sb] - 1) then
            begin
              {@3ADC-3AF2}
              v9b := v7b - _w14_313byte;
              {@3AF2-3AF6}
              v8b := 0;
            end
            else
            begin
              {@3AF8-3B2E}
              v8b := (a6DC9_ec3f[v6sb] - _w14_313byte - 1) * (a6DD7_ec3f[v6sb] + v5sb);
              {@3B2E-3B47}
              v9b := v7b - a6DC9_ec3f[v6sb] + 1;
            end;
          end
          else
          begin
            {@3B49-3B62}
            v9b := v7b - a6DC9_ec3f[v6sb] + 1;
            {@3B62-3B8A}
            v8b := (a6DC9_ec3f[v6sb] - 1) * (a6DD7_ec3f[v6sb] + v5sb);
          end;
          {@3B8A-3BA7}
          if v6b = 4 then
            Inc(v8b, a6DD7_ec3f[v6sb] + v5sb);
          {@3BA7-3C07}
          if v10b <> 0 then
            case v6b of
              0, 4, 6: Inc(v4w, v8b + v9b * 2);
              2, 3: Inc(v4w, v8b + v9b * 3);
              5: Inc(v4w, v8b + v9b);
            end;
        end;
      end;
    end;
    {@3C10-3C39}
    if v2b > 0 then
      v4w := v4w div v2b
    else
    begin
      {@3C29-3C39}
      if _w14_313byte = 0 then
        v4w := 0;
    end;
  end;
  {@3C39-3C3F}
  pO0AA_3975 := v4b;
end;

{ 3C48 }
function pO0AA_3C48(a0: word; a1: word): word;
begin
  {@3C4E-3C54}
  pO0AA_3C48 := a0;
  if a1 < a0 then
    pO0AA_3C48 := a1;
end;

{ 3C6B }
begin
end.

