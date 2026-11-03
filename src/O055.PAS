{ O055: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O055;

interface

uses GAMEDATA;

function pO055_0136(a0: shortint): word;
procedure pO055_0000(a0: byte);
procedure pO055_01C1;
procedure pO055_02BE(a0: byte);
procedure pO055_0367(a0: byte; a1: pointer; a2: pointer; a3: pointer);
function pO055_03D7(a0: byte; a1: byte; a2: byte): byte;
procedure pO055_046D(a0: byte; a1: byte; a2: byte; a3: pointer);
function pO055_0567(a0: byte; a1: byte): word;
procedure pO055_0766(a0: word; a1: word; a2: byte);
function pO055_0929(a0: word; a1: byte): word;
procedure pO055_0A94(a0: word; a1: string);
function pO055_0F49(a0: S40; a1: string; a2: byte; a3: byte): byte;
procedure pO055_1031
  (a0: S40; a1: string; a2: byte; a3: byte; a4: byte; a5: byte; a6: longint; a7: byte; a8: pointer;
   a9: pointer; a10: pointer);
procedure pO055_10C2(a0: string; a1: string);
procedure pO055_1195(a0: longint);
procedure pO055_11F8(a0: byte);
procedure pO055_1285;
procedure pO055_1314(a0: real; a1: pointer);
procedure pO055_1399(a0: byte; a1: pointer);
procedure pO055_1464;
procedure pO055_157F(a0: word; a1: pointer);
procedure pO055_16B9;
procedure pO055_1740;
procedure pO055_1ABE(a0: pointer);

implementation

uses LIT, O06E, O0AA, O0E2, O0EC, O108, O10E, O111, O12A, O13E, O17E, R1C3, R47F, R5C0, R5C3, R670;

type
  AL1_byte = array[1..32001] of byte;
  AL32768_byte = array[32768..64768] of byte;
  E256_byte = record f: byte; _r: array[1..255] of byte end;
  PV2_0_byte = record v: byte; _r: array[1..1] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  PV4_0_word = record v: word; _r: array[1..2] of byte end;
  PV4_2_word = record _p: array[1..2] of byte; v: word end;
  X510 = array[0..509] of byte;
  R0_X510 = record v: X510 end;
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  X9 = array[0..8] of byte;
  R0_X9 = record v: X9 end;
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R0_word = record v: word end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R2_pointer = record _p: array[1..2] of byte; v: pointer end;
  R323_longint = record _p: array[1..323] of byte; v: longint end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R331_word = record _p: array[1..331] of byte; v: word end;
  R333_word = record _p: array[1..333] of byte; v: word end;
  R335_word = record _p: array[1..335] of byte; v: word end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R412_byte = record _p: array[1..412] of byte; v: byte end;
  R423_longint = record _p: array[1..423] of byte; v: longint end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R55_byte = record _p: array[1..55] of byte; v: byte end;
  R55_word = record _p: array[1..55] of byte; v: word end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  RA0_byte = record a: array[0..32000] of byte end;
  WE2_word = record f: word end;
W4_5_0654 = record case byte of 0: (_p0: array[1..30] of byte; _w5_30abyte: array[0..32000] of byte);
      1: (_p1: array[1..176] of byte; _w5_176word: word); 2: (_p2: array[1..311] of byte; _w5_311byte: byte);
      3: (_p3: array[1..331] of byte; _w5_331r2_0: array[0..16000] of WE2_word);
      4: (_p4: array[1..359] of byte; _w5_359byte: byte); 5: (_p5: array[1..368] of byte; _w5_368byte: byte);
      6: (_p6: array[1..491] of byte; _w5_491byte: byte); 7: (_p7: array[1..493] of byte; _w5_493byte: byte);
      8: (_p8: array[1..494] of byte; _w5_494byte: byte); 9: (_p9: array[1..495] of byte; _w5_495byte: byte);
      10: (_p10: array[1..508] of byte; _w5_508byte: byte) end;
  PAL1_byte = ^AL1_byte;
  PAL32768_byte = ^AL32768_byte;
  PR0_X510 = ^R0_X510;
  PR0_X63 = ^R0_X63;
  PR0_X9 = ^R0_X9;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR0_word = ^R0_word;
  PR1_byte = ^R1_byte;
  PR2_byte = ^R2_byte;
  PR2_pointer = ^R2_pointer;
  PR323_longint = ^R323_longint;
  PR323_pointer = ^R323_pointer;
  PR327_byte = ^R327_byte;
  PR331_word = ^R331_word;
  PR333_word = ^R333_word;
  PR335_word = ^R335_word;
  PR33_byte = ^R33_byte;
  PR412_byte = ^R412_byte;
  PR423_longint = ^R423_longint;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR483_pointer = ^R483_pointer;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR508_byte = ^R508_byte;
  PR52_byte = ^R52_byte;
  PR55_byte = ^R55_byte;
  PR55_word = ^R55_word;
  PR57_byte = ^R57_byte;
  PR5_pointer = ^R5_pointer;
  PRA0_byte = ^RA0_byte;
  PW4_5_0654 = ^W4_5_0654;
var
  a08D8_ec3f: array[0..32759] of byte absolute d08D8;
  a08DD_ec3f: array[0..32759] of byte absolute d08DD;
  aB06E_475b: array[0..126] of E256_byte absolute dB06E;
  aB06E_e1c0: array[0..126] of string[255] absolute dB06E;
  aB0AB_ec3f: array[0..32759] of byte absolute dB0AB;
  aB0EB_ec3f: array[0..32759] of byte absolute dB0EB;
  aB12B_ec3f: array[0..32759] of byte absolute dB12B;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  b9D92: byte absolute d9D92;
  b9D93: byte absolute d9D93;
  bA9F2: byte absolute dA9F2;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bA9F6: byte absolute dA9F6;
  bA9F7: byte absolute dA9F7;
  bAAE6: byte absolute dAAE6;
  bAE7E: byte absolute dAE7E;
  bB01F: byte absolute dB01F;
  bB020: byte absolute dB020;
  bB021: byte absolute dB021;
  bB022: byte absolute dB022;
  bB023: byte absolute dB023;
  bB025: byte absolute dB025;
  bB029: byte absolute dB029;
  bC584: byte absolute dC584;
  bC586: byte absolute dC586;
  bC588: byte absolute dC588;
  bC589: byte absolute dC589;
  bC58B: byte absolute dC58B;
  bC595: byte absolute dC595;
  bD21E: byte absolute dD21E;
  bD91E: byte absolute dD91E;
  gD51E_9554: B768 absolute dD51E;
  l9CEE: longint absolute d9CEE;
  p87F8: pointer absolute d87F8;
  p87FC: pointer absolute d87FC;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pB01A: pointer absolute dB01A;
  s0E12: string absolute d0E12;
  s2B8D: string absolute d2B8D;
  sbA9F3: shortint absolute dA9F3;
  sbA9F4: shortint absolute dA9F4;
  w880A: word absolute d880A;
  wA9F8: word absolute dA9F8;

function pO055_058B(a0: byte): byte; far; forward;
function pO055_05B3(a0: word): byte; far; forward;
function pO055_05FF(a0: word; a1: byte): word; far; forward;
procedure pO055_0654(a0: longint); far; forward;
procedure pO055_0B27(a0: byte; a1: byte); far; forward;
procedure pO055_0CD7(a0: byte; a1: word); far; forward;
procedure pO055_0E45(a0: pointer; a1: pointer; a2: pointer); far; forward;

{ 0000 }
procedure pO055_0000(a0: byte);
var
  v1b: byte;
  v2b: byte;
  v4w: word;
  v6w: word;
  v6b: byte absolute v6w;
begin
  {@0006-000A}
  v2b := 0;
  for v1b := 1 to a0 do
  begin
    {@0022-003C}
    aB0AB_ec3f[v1b] := PAL32768_byte(p87FC)^[w880A + 1];
    {@003C-0057}
    aB12B_ec3f[v1b] := PAL32768_byte(p87FC)^[w880A + 2];
    {@0057-005F}
    w880A := w880A + 2;
    case aB0AB_ec3f[v1b] of
      1, 2, 3: begin
        {@0076-007A}
        Inc(w880A);
        {@007A-0093}
        aB0EB_ec3f[v1b] := PAL32768_byte(p87FC)^[w880A];
      end;
      128: begin
        {@009A-009D}
        Inc(v2b);
        {@009D-00AD}
        v6w := aB12B_ec3f[v1b];
        if v6w > 0 then
          pO055_0B27(v6b, v2b)
        else
          aB06E_475b[v2b].f := 0;
      end;
      129: begin
        {@00D7-00DA}
        Inc(v2b);
        {@00DA-00DE}
        Inc(w880A);
        {@00DE-00F7}
        aB0EB_ec3f[v1b] := PAL32768_byte(p87FC)^[w880A];
        {@00F7-0116}
        v4w := pO055_0567(aB12B_ec3f[v1b], aB0EB_ec3f[v1b]);
        {@0116-0121}
        pO055_0CD7(v2b, v4w);
      end;
    end;
  end;
  {@012C-0130}
  Inc(w880A);
end;

{ 0136 }
function pO055_0136(a0: shortint): word;
var
  _f1: array[1..6] of byte;
  v9b: byte;
  v10b: byte;
begin
  {@013C-0149}
  v9b := aB12B_ec3f[a0];
  {@0149-0156}
  v10b := aB0EB_ec3f[a0];
  case aB0AB_ec3f[a0] of
    0: pO055_0136 := v9b;
    1, 3, 128: pO055_0136 := pO055_0929(v10b * 256 + v9b, aB0AB_ec3f[a0]);
    2, 129: pO055_0136 := pO055_0567(v9b, v10b);
  end;
end;

{ 01C1 }
procedure pO055_01C1;
begin
  {@01C4-01C9}
  bC584 := 0;
  {@01C9-01CE}
  bC588 := 1;
  asm
  db 191,110,197,30,87,184,2,0,80
  call XR670_046E
  db 198,6,41,176,8,199,6,10,136,0,128,198,6,108,177,0,49,192,163,26,176,163,28,176,191,30,176,30
  db 87,184,6,0,80
  call XR670_046E
  db 196,62,248,135,38,198,69,42,0,196,62,248,135,38,198,69,43,0,176,1,80
  push cs
  call near ptr pO055_0000
  db 160,44,177,80,160,236,176,80
  push cs
  call near ptr pO055_0567
  db 163,0,136,176,1,80
  push cs
  call near ptr pO055_0000
  db 160,44,177,80,160,236,176,80
  push cs
  call near ptr pO055_0567
  db 163,2,136,176,1,80
  push cs
  call near ptr pO055_0000
  db 160,44,177,80,160,236,176,80
  push cs
  call near ptr pO055_0567
  db 163,4,136,176,1,80
  push cs
  call near ptr pO055_0000
  db 160,44,177,80,160,236,176,80
  push cs
  call near ptr pO055_0567
  db 163,6,136,176,1,80
  push cs
  call near ptr pO055_0000
  db 160,44,177,80,160,236,176,80
  push cs
  call near ptr pO055_0567
  db 163,8,136,128,62,17,136,0,117,19
  end;
  asm
  db 196,62,248,135,129,199,150,0,6,87,184,50,0,80
  call XR670_046E
  end;
end;

{ 02BE }
procedure pO055_02BE(a0: byte);
var
  v2w: word;
  v6p: pointer;
  v6b: byte absolute v6p;
  v2b: byte absolute v2w;
begin
  if false then begin
    if LV = 'Loading...Please Wait' then;
    if LV = 'ECL1' then;
    if LV = '.dax' then;
    LP1('Loading...Please Wait');
  end;
  asm
  db 196,62,252,135,6,87,184,0,30,80
  call XR670_046E
  db 198,6,212,148,0
  end;
  {@02D8-0334}
  repeat
    {@02D8-02DD}
    pO108_167D;
    {@02DD-02FD}
    pR47F_0354(0, 24, 10, 0, 'Loading...Please Wait');
    {@02FD-032E}
    pR5C3_0915('ECL1', '.dax', a0, @v2b, @v6b);
  until v2w >= 2;
  {@0334-034E}
  Move(PR2_byte(v6p)^.v, PR0_byte(p87FC)^.v, v2w - 2);
  {@034E-035C}
  pR5C0_0000(v6p, v2w);
  {@035C-0361}
  pO108_167D;
end;

{ 0367 }
procedure pO055_0367(a0: byte; a1: pointer; a2: pointer; a3: pointer);
begin
  {@036A-0376}
  PR0_pointer(a1)^.v := nil;
  {@0376-0389}
  GetMem(PR0_pointer(a1)^.v, 510);
  {@0389-039F}
  pO06E_1AA3(a0, 0, pointer(PR0_pointer(a1)^.v));
  {@039F-03B9}
  PR0_longint(a2)^.v := PR423_longint(PR0_pointer(a1)^.v)^.v;
  {@03B9-03D3}
  PR0_longint(a3)^.v := PR323_longint(PR0_pointer(a1)^.v)^.v;
end;

{ 03D7 }
function pO055_03D7(a0: byte; a1: byte; a2: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@03DD-03E1}
  v3b := 0;
  {@03E1-03E5}
  v2b := 0;
  {@03E5-03E9}
  pO055_03D7 := 0;
  if PR33_byte(p87F8)^.v = 0 then
  begin
    {@03F4-03F8}
    pO055_03D7 := 2;
    {@03F8-0401}
    PR55_byte(p87F8)^.v := 2;
    {@0401-0403}
    Exit;
  end;
  {@0403-045A}
  while (v3b < 2) and (v2b = 0) do
  begin
    {@040F-0458}
    if pO12A_05B9(a0, a1, a2) = 0 then
    begin
      {@0424-0427}
      Inc(v3b);
      {@0427-042D}
      pO055_03D7 := v3b;
      case a2 of
        0: Dec(a1);
        2: Inc(a0);
        4: Inc(a1);
        6: Dec(a0);
      end;
    end
    else
      v2b := 1;
  end;
end;

{ 046D }
procedure pO055_046D(a0: byte; a1: byte; a2: byte; a3: pointer);
var
  _f1: array[1..8] of byte;
  v9b: byte;
begin
  if false then begin
    if LV = 'SPRIT' then;
    if LV = 'PIC' then;
  end;
  {@0473-047C}
  v9b := a2 + 1;
  if (PR1_byte(a3)^.v = 0) and (a0 <> 255) then
  begin
    {@048C-04EE}
    if PR0_byte(a3)^.v = 0 then
    begin
      {@0495-04B0}
      if bA9F2 <> 0 then
      begin
        {@049C-04A1}
        bA9F2 := 0;
        {@04A1-04A6}
        bAE7E := 1;
        {@04A6-04AB}
        bD91E := 1;
        {@04AB-04B0}
        pO10E_0000;
      end;
      {@04B0-04E2}
      if PR33_byte(p87F8)^.v <> 0 then
      begin
        {@04BB-04D6}
        pO111_01F1('SPRIT', a0, 1);
        {@04D6-04DD}
        PR0_byte(a3)^.v := 1;
        {@04DD-04E2}
        bC586 := 1;
      end;
    end
    else
    begin
      {@04E4-04E9}
      bAE7E := 1;
      {@04E9-04EE}
      pO10E_0000;
    end;
    {@04EE-04FE}
    if b880C = 4 then
      pO111_0A91(v9b);
  end;
  {@04FE-0561}
  if (PR1_byte(a3)^.v = 0) and (a1 <> 255) and ((a2 = 0) or (a0 = 255)) and (b880C = 4) then
  begin
    {@0521-0526}
    bC584 := 1;
    {@0526-0541}
    pO111_01F1('PIC', a1, 0);
    {@0541-0549}
    PR1_byte(a3)^.v := 1;
    {@0549-055C}
    pO111_00A8(3, 3, 1, 0);
    {@055C-0561}
    bD91E := 1;
  end;
end;

{ 0567 }
function pO055_0567(a0: byte; a1: byte): word;
begin
  {@056D-0582}
  pO055_0567 := a1 * 256 + a0;
end;

{ 058B }
function pO055_058B(a0: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0591-059F}
  if a0 > 31 then
  begin
    {@0597-059D}
    pO055_058B := a0;
    {@059D-059F}
    Exit;
  end;
  {@059F-05AA}
  pO055_058B := a0 + 64;
end;

{ 05B3 }
function pO055_05B3(a0: word): byte;
var
  _f1: array[1..1] of byte;
begin
  {@05B9-05BD}
  pO055_05B3 := 4;
  if (a0 >= 1) and (a0 <= 1024) then
  begin
    {@05CA-05CE}
    pO055_05B3 := 0;
    {@05CE-05D0}
    Exit;
  end;
  {@05D0-05E4}
  if (a0 >= 1025) and (a0 <= 2048) then
  begin
    {@05DE-05E2}
    pO055_05B3 := 1;
    {@05E2-05E4}
    Exit;
  end;
  {@05E4-05F6}
  if (a0 >= 32768) and (a0 <= 40447) then
    pO055_05B3 := 2;
end;

{ 05FF }
function pO055_05FF(a0: word; a1: byte): word;
var
  v602a: array[0..599] of byte;
  v604w: word;
  v604b: byte absolute v604w;
  v602b: byte absolute v602a;
begin
  {@0606-060C}
  v604w := 0;
  {@060C-0615}
  a0 := a0 - 1025;
  {@0615-062A}
  Move(PR0_byte(p9CEE)^.v, v602b, 510);
  {@062A-0644}
  Move(v602a[a0], v604b, a1);
  {@0644-064B}
  pO055_05FF := v604w;
end;

{ 0654 }
procedure pO055_0654(a0: longint);
var
  v1b: byte;
  v1sb: shortint absolute v1b;
begin
  asm
  db 139,70,8,45,1,4,137,70,8
  end;
  with PW4_5_0654(p9CEE)^ do
  begin
    case PV4_2_word(a0).v of
      30..170: _w5_30abyte[PV4_2_word(a0).v - 30] := PV4_0_byte(a0).v;
      176: _w5_176word := PV4_0_word(a0).v;
      311: _w5_311byte := PV4_0_byte(a0).v;
      331..336: begin
        {@06BF-06CA}
        v1b := (PV4_2_word(a0).v - 331) shr 1;
        {@06CA-06DD}
        _w5_331r2_0[v1sb].f := PV4_0_word(a0).v;
      end;
      359: _w5_359byte := PV4_0_byte(a0).v;
      368: _w5_368byte := PV4_0_byte(a0).v;
      491: _w5_491byte := PV4_0_byte(a0).v;
      493: begin
        {@071B-0726}
        _w5_493byte := PV4_0_byte(a0).v;
        {@0726-073C}
        _w5_494byte := Ord(_w5_493byte = 0);
      end;
      495: _w5_495byte := PV4_0_byte(a0).v;
      508: _w5_508byte := PV4_0_byte(a0).v;
    end;
  end;
end;

{ 0766 }
procedure pO055_0766(a0: word; a1: word; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@076C-077C}
  if a2 > 1 then
    v3b := 2
  else
    v3b := 1;
  {@077C-0786}
  v1b := pO055_05B3(a0);
  case v1b of
    0: begin
      {@0790-08CF}
      case a0 - 1 of
        25: begin
          {@0799-07B0}
          if (bA9F2 <> 0) and (a1 <> 0) then
          begin
            {@07A6-07AB}
            bA9F2 := 0;
            {@07AB-07B0}
            pO10E_0000;
          end;
        end;
        51: begin
          {@07B8-07BE}
          bA9F3 := a1;
          {@07BE-07C3}
          bC589 := 1;
        end;
        52: begin
          {@07CB-07D1}
          bA9F4 := a1;
          {@07D1-07D6}
          bC589 := 1;
        end;
        16: begin
          {@07DE-0823}
          repeat
            {@07DE-07E2}
            v2b := 1;
            case a1 of
              0: bA9F5 := 0;
              1: bA9F5 := 2;
              2: bA9F5 := 4;
              3: bA9F5 := 6;
            else
              {@0815-0819}
              v2b := 0;
              {@0819-081D}
              Dec(a1, 4);
            end;
          until v2b = 1;
          {@0823-0828}
          bC589 := 1;
        end;
        33: begin
          {@0830-0861}
          if PR33_byte(p87F8)^.v <> a1 then
          begin
            {@083F-0844}
            bA9F2 := 0;
            {@0844-084A}
            b880D := b880C;
            if a1 = 0 then
            begin
              {@0850-0855}
              b880C := 3;
              {@0855-085A}
              wA9F8 := 0;
            end
            else
              b880C := 4;
          end;
        end;
        57: begin
          {@0868-08CF}
          if (PR57_byte(p87F8)^.v <> a1) and (a1 < 5) then
          begin
            {@087D-089C}
            if a1 = 4 then
              pO17E_004B(0, 2)
            else
              pO17E_004B(a1, 2);
            {@089C-08AD}
            pR1C3_1E9D(16, 16, @bD21E);
            {@08AD-08BF}
            pR1C3_1F24(16, 16, gD51E_9554);
            {@08BF-08CA}
            PR57_byte(p87F8)^.v := a1;
            {@08CA-08CF}
            pO0EC_2ED1;
          end;
        end;
      end;
      {@08CF-08EE}
      Move(PV2_0_byte(a1).v, PAL1_byte(p87F8)^[a0], v3b);
    end;
    1: asm
  db 255,118,10,255,118,8
  push cs
  call near ptr pO055_0654
      end;
    2: Move(PV2_0_byte(a1).v, PAL32768_byte(p87FC)^[a0], v3b);
  end;
end;

{ 0929 }
function pO055_0929(a0: word; a1: byte): word;
var
  v3b: byte;
  v4b: byte;
  _f1: array[1..1] of byte;
  v7w: word;
  v8b: byte;
  v12p: pointer;
  _f2: array[1..3] of byte;
  v16b: byte;
  v7b: byte absolute v7w;
begin
  {@092F-093F}
  if a1 > 1 then
    v8b := 2
  else
    v8b := 1;
  {@093F-0949}
  v3b := pO055_05B3(a0);
  {@0949-094D}
  v4b := 0;
  {@094D-0952}
  v7w := 0;
  case v3b of
    0: case a0 - 1 of
        15: begin
          {@0965-0972}
          v12p := p9CF2;
          {@0972-09A6}
          while (v12p <> nil) and (pO0EC_27C1(v12p, 5, @v16b) = 0) do
            v12p := PR483_pointer(v12p)^.v;
          {@09A6-09BA}
          if v12p = nil then
            v7w := 0
          else
            v7w := 1;
        end;
        34: v7w := bA9F5;
        51: v7w := sbA9F3;
        52: v7w := sbA9F4;
        16: begin
          {@09EE-0A0D}
          if PR33_byte(p87F8)^.v = 0 then
            v7w := bA9F5
          else
            v7w := bA9F5 shr 1;
        end;
        49: v7w := bA9F6;
        44: v7w := bA9F7;
      else
        {@0A2D-0A4C}
        Move(PAL1_byte(p87F8)^[a0], v7b, v8b);
      end;
    1: v7w := pO055_05FF(a0, v8b);
    2: Move(PAL32768_byte(p87FC)^[a0], v7b, v8b);
  end;
  {@0A85-0A8B}
  pO055_0929 := v7w;
end;

{ 0A94 }
procedure pO055_0A94(a0: word; a1: string);
var loc: array[1..4] of byte;
begin
  asm
    db 255,118,10
    push cs
    call near ptr pO055_05B3
    db 136,134,255,254,138,134,0,255,136,134,254,254,138,134,255,254,60,0,117,55,141,190,1,255,22,87,139,70
    db 10,196,62,248,135,3,248,129,199,255,255,6,87,138,134,254,254,48,228,80,154,92,26,37,8,138,134,254
    db 254,48,228,3,70,10,196,62,248,135,3,248,38,198,69,255,0,235,32,60,1,117,28,129,126,10,1,4
    db 117,21,141,190,0,255,22,87,196,62,238,156,6,87,184,15,0,80,154,137,10,37,8
  end;
end;

{ 0B27 }
procedure pO055_0B27(a0: byte; a1: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v7a: char absolute v7b;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for a0 := a0 to a0 do LM1_8(FS, [LB], [LB], [LB], [LB], [LB], [LB], [LB], [LB]);
  end;
  {@0B2E-0B3E}
  aB06E_475b[a1].f := 0;
  {@0B3E-0B42}
  v1b := 0;
  {@0B42-0B46}
  v6b := 1;
  {@0B46-0C68}
  while v1b < a0 do
  begin
    {@0B51-0B75}
    if v6b < 4 then
    begin
      {@0B57-0B5B}
      Inc(w880A);
      {@0B5B-0B61}
      v4b := v3b;
      {@0B61-0B72}
      v3b := PAL32768_byte(p87FC)^[w880A];
      {@0B72-0B75}
      Inc(v1b);
    end;
    asm
  db 138,70,250,60,1,117,15,138,70,253,48,228,185,2,0,211,232,136,70,251,235,112,60,2,117,46,138,70
  db 253,48,228,185,2,0,211,232,48,228,139,208,138,70,252,48,228,185,6,0,211,224,48,228,3,194,136,70
  db 251,138,70,251,48,228,185,2,0,211,232,136,70,251,235,62,60,3,117,46,138,70,253,48,228,185,4,0
  db 211,232,48,228,139,208,138,70,252,48,228,185,4,0,211,224,48,228,3,194,136,70,251,138,70,251,48,228
  db 185,2,0,211,232,136,70,251,235,12,60,4,117,8,138,70,253,36,63,136,70,251
    end;
    {@0BFB-0C0A}
    if v6b < 4 then
      Inc(v6b)
    else
      v6b := 1;
    {@0C0A-0C65}
    if v5b <> 0 then
    begin
      {@0C10-0C1B}
      v7b := pO055_058B(v5b);
      {@0C1B-0C65}
      aB06E_e1c0[a1] := aB06E_e1c0[a1] + v7a;
    end;
  end;
  {@0C68-0CD1}
  if v6b = 4 then
  begin
    {@0C6E-0C76}
    v5b := v3b and 63;
    if v5b <> 0 then
    begin
      {@0C7C-0C87}
      v7b := pO055_058B(v5b);
      {@0C87-0CD1}
      aB06E_e1c0[a1] := Concat(aB06E_e1c0[a1], v7a);
    end;
  end;
end;

{ 0CD7 }
procedure pO055_0CD7(a0: byte; a1: word);
var
  v1b: byte;
  v2b: byte;
begin
  {@0CDE-0CE8}
  v1b := pO055_05B3(a1);
  {@0CE8-0CF8}
  aB06E_475b[a0].f := 0;
  {@0CF8-0CFC}
  v2b := 0;
  case v1b of
    0: while PAL1_byte(p87F8)^[v2b + a1] <> 0 do
      begin
        {@0D18-0D71}
        aB06E_e1c0[a0] := aB06E_e1c0[a0] + Chr(PAL1_byte(p87F8)^[v2b + a1]);
        {@0D71-0D74}
        Inc(v2b);
      end;
    1: begin
      {@0D7D-0DA4}
      if a1 = 1025 then
        aB06E_e1c0[a0] := PR0_string(p9CEE)^.v;
    end;
    2: while PAL32768_byte(p87FC)^[v2b + a1] <> 0 do
      begin
        {@0DC0-0E1A}
        aB06E_e1c0[a0] := aB06E_e1c0[a0] + Chr(PAL32768_byte(p87FC)^[v2b + a1]);
        {@0E1A-0E1D}
        Inc(v2b);
      end;
  end;
end;

{ 0E45 }
procedure pO055_0E45(a0: pointer; a1: pointer; a2: pointer);
var
  v1b: byte;
begin
  if false then begin
    if LSV = [48..57, 65..90] then;
  end;
  {@0E4C-0E53}
  PR0_byte(a1)^.v := 0;
  {@0E53-0E5A}
  PR0_byte(a2)^.v := 0;
  for v1b := 1 to PR0_byte(a0)^.v do
  begin
    {@0E75-0EB0}
    if PRA0_byte(a0)^.a[v1b] in [48..57, 65..90] then
      PRA0_byte(a0)^.a[v1b] := PRA0_byte(a0)^.a[v1b] + 32;
    {@0EB0-0F38}
    if PRA0_byte(a0)^.a[v1b] = 126 then
    begin
      {@0EC0-0ED4}
      Delete(PR0_string(a0)^.v, v1b, 1);
      {@0ED4-0EF6}
      PRA0_byte(a0)^.a[v1b] := Ord(UpCase(Chr(PRA0_byte(a0)^.a[v1b])));
      {@0EF6-0F32}
      PR0_string_40_(a1)^.v := PR0_string(a1)^.v + Chr(PRA0_byte(a0)^.a[v1b]);
      {@0F32-0F38}
      Inc(PR0_byte(a2)^.v);
    end;
  end;
end;

{ 0F49 }
function pO055_0F49(a0: S40; a1: string; a2: byte; a3: byte): byte;
var
  _f1: array[1..40] of byte;
  v339b: byte;
  _f2: array[1..1] of byte;
  v341b: byte;
  v342b: byte;
begin
  {@0F77-0F8D}
  pO055_0E45(@a1, @v339b, @v342b);
  {@0F8D-0F9A}
  pO108_00CB(v342b - 1);
  {@0F9A-1014}
  repeat
    {@0F9A-0FB5}
    v341b := pO108_1009(a0, a1, 1, a3);
    if (bAAE6 <> 0) and (b880C <> 3) and (PR33_byte(p87F8)^.v = 1) then
    begin
      {@0FCE-0FDE}
      pO0EC_0987(p9CEE, 0);
      {@0FDE-0FE8}
      pO0AA_2F7B(v341b);
      {@0FE8-0FF8}
      pO0EC_0987(p9CEE, 1);
      {@0FF8-0FFD}
      v341b := 255;
    end;
  until (v341b < v342b) or (v341b = 27) and (a2 <> 0);
  {@1014-1021}
  if v341b = 27 then
  begin
    {@101B-101F}
    pO055_0F49 := 0;
    {@101F-1021}
    Exit;
  end;
  {@1021-1028}
  pO055_0F49 := v341b;
end;

{ 1031 }
procedure pO055_1031
  (a0: S40; a1: string; a2: byte; a3: byte; a4: byte; a5: byte; a6: longint; a7: byte; a8: pointer;
   a9: pointer; a10: pointer);
var
  v298b: byte;
  _f1: array[1..40] of byte;
  v339b: byte;
  v340b: byte;
begin
  {@105F-1075}
  pO055_0E45(@a1, @v339b, @v340b);
  {@1075-107D}
  pO108_00CB(1);
  {@107D-10BC}
v298b := pO108_1D45(a0, s2B8D, a2, a3, a4, a5, pointer(pointer(a6)), a7, 0, @PR0_byte(a8)^.v,
      @PR0_byte(a9)^.v, @PR0_byte(a10)^.v);
end;

{ 10C2 }
procedure pO055_10C2(a0: string; a1: string);
begin
  asm
  db 191,30,176,30,87,184,6,0,80
  call XR670_046E
  db 141,190,0,255,22,87,141,190,0,254,22,87,154,116,11,37,8,117,5,198,6,30,176,1
  end;
  {@1117-112F}
  if a0 <> a1 then
    bB01F := 1;
  {@112F-1147}
  if a0 < a1 then
    bB020 := 1;
  {@1147-115F}
  if a0 > a1 then
    bB021 := 1;
  {@115F-1177}
  if a0 <= a1 then
    bB022 := 1;
  {@1177-118F}
  if a0 >= a1 then
    bB023 := 1;
end;

{ 1195 }
procedure pO055_1195(a0: longint);
begin
  asm
  db 191,30,176,30,87,184,6,0,80
  call XR670_046E
  db 139,70,8,59,70,6,117,5,198,6,30,176,1
  end;
  {@11B3-11C0}
  if PV4_2_word(a0).v <> PV4_0_word(a0).v then
    bB01F := 1;
  {@11C0-11CD}
  if PV4_2_word(a0).v < PV4_0_word(a0).v then
    bB020 := 1;
  {@11CD-11DA}
  if PV4_2_word(a0).v > PV4_0_word(a0).v then
    bB021 := 1;
  {@11DA-11E7}
  if PV4_2_word(a0).v <= PV4_0_word(a0).v then
    bB022 := 1;
  {@11E7-11F4}
  if PV4_2_word(a0).v >= PV4_0_word(a0).v then
    bB023 := 1;
end;

{ 11F8 }
procedure pO055_11F8(a0: byte);
var
  v4p: pointer;
begin
  {@11FE-1256}
  if pB01A = nil then
  begin
    {@1207-1217}
    GetMem(pB01A, 6);
    {@1217-1225}
    PR2_pointer(pB01A)^.v := nil;
  end
  else
  begin
    {@1227-1234}
    v4p := pB01A;
    {@1234-1244}
    GetMem(pB01A, 6);
    {@1244-1256}
    PR2_pointer(pB01A)^.v := v4p;
  end;
  {@1256-1260}
  PR0_word(pB01A)^.v := w880A;
  {@1260-127F}
  w880A := pO055_0567(aB12B_ec3f[a0], aB0EB_ec3f[a0]);
end;

{ 1285 }
procedure pO055_1285;
begin
  {@1288-12E9}
  case bA9F5 of
    0: begin
      {@128F-12A1}
      if sbA9F4 > 0 then
        Dec(bA9F4)
      else
        bA9F4 := 15;
    end;
    2: begin
      {@12A7-12B9}
      if sbA9F3 < 15 then
        Inc(bA9F3)
      else
        bA9F3 := 0;
    end;
    4: begin
      {@12BF-12D1}
      if sbA9F4 < 15 then
        Inc(bA9F4)
      else
        bA9F4 := 0;
    end;
    6: begin
      {@12D7-12E9}
      if sbA9F3 > 0 then
        Dec(bA9F3)
      else
        bA9F3 := 15;
    end;
  end;
  {@12E9-12F9}
  bA9F7 := pO12A_06BC(bA9F3, bA9F4);
  {@12F9-130D}
  bA9F6 := pO12A_05B9(bA9F3, bA9F4, bA9F5);
  {@130D-1312}
  bC589 := 1;
end;

{ 1314 }
procedure pO055_1314(a0: real; a1: pointer);
begin
  {@1317-1341}
  PR331_word(a1)^.v := Trunc(PR331_word(a1)^.v * a0);
  {@1341-136B}
  PR333_word(a1)^.v := Trunc(PR333_word(a1)^.v * a0);
  {@136B-1395}
  PR335_word(a1)^.v := Trunc(PR335_word(a1)^.v * a0);
end;

{ 1399 }
procedure pO055_1399(a0: byte; a1: pointer);
var
  v1b: byte;
  v5p: pointer;
  v9p: pointer;
  _f1: array[1..1] of byte;
begin
  {@139F-13B2}
  v5p := PR423_pointer(a1)^.v;
  {@13B2-145E}
  while v5p <> nil do
  begin
    {@13BD-1402}
    if PR55_word(v5p)^.v > 255 then
    begin
      {@13C8-13DF}
      if a0 > 90 then
        a0 := a0 - 90
      else
        a0 := 0;
    end
    else
    begin
      {@13E1-1402}
      if PR55_word(v5p)^.v > 24 then
      begin
        {@13EB-1402}
        if a0 > 50 then
          a0 := a0 - 50
        else
          a0 := 0;
      end;
    end;
    {@1402-1410}
    v1b := pO0E2_1374(1, 100);
    {@1410-1421}
    v9p := PR42_pointer(v5p)^.v;
    if v1b <= a0 then
    begin
      {@1429-143E}
      if PR52_byte(v5p)^.v <> 0 then
        pO0AA_1845(v5p);
      {@143E-144F}
      pO0EC_18EF(pointer(a1), v5p);
    end;
    {@144F-145B}
    v5p := v9p;
  end;
end;

{ 1464 }
procedure pO055_1464;
begin
  {@1467-1478}
  bB025 := PAL32768_byte(p87FC)^[w880A];
  case bB025 of
    1, 2, 10, 14, 17, 18, 31, 32, 44, 45, 50, 52, 54, 56, 57, 60, 63, 64: pO055_0000(1);
    3, 8, 9, 15, 16, 65, 33, 55: pO055_0000(2);
    4..7, 11, 40, 42, 47, 48, 53, 59: pO055_0000(3);
    12, 20: pO055_0000(4);
    46: pO055_0000(5);
    30: pO055_0000(6);
  else
    {@154E-1552}
    Inc(w880A);
  end;
end;

{ 157F }
procedure pO055_157F(a0: word; a1: pointer);
var
c87: record case byte of 0: (v87a2: string[86]); 1: (v87a: string[3]); 2: (_p2: array[1..4] of byte;
      v83a2: string[82]); 3: (_p3: array[1..4] of byte; v83a: string[80]) end;
  v88b: byte;
begin
  if false then begin
    if LV = '  ' then;
    if LV = ' dies. ' then;
    if LV = ' is hit FOR ' then;
    if LV = ' points of Damage.' then;
  end;
  {@1586-1594}
  if PR494_byte(a1)^.v = 0 then
    Exit;
  {@1594-1598}
  v88b := 0;
  {@1598-15B0}
  Str(a0, c87.v87a);
  if (PR508_byte(a1)^.v + 10) < a0 then
    c87.v83a := '  ' + PR0_string(a1)^.v + ' dies. '
  else
    c87.v83a := '  ' + PR0_string(a1)^.v + ' is hit FOR ' + c87.v87a2 + ' points of Damage.';
  {@163C-1662}
  if b9D93 > 22 then
  begin
    {@1643-1648}
    b9D93 := 17;
    {@1648-164C}
    v88b := 1;
    {@164C-165C}
    pR47F_0B2E(15, 0, s0E12);
  end
  else
    v88b := 0;
  {@1662-1667}
  b9D92 := 38;
  {@1667-1687}
  pR47F_0498(1, 17, 38, 22, 15, 0, v88b, c87.v83a2);
  {@1687-1695}
  pO0EC_2851(pointer(a1), a0);
  {@1695-16A6}
  pR47F_0F07(17, 1, 38, 15);
  {@16A6-16B3}
  pO0EC_07C0(p9CEE);
end;

{ 16B9 }
procedure pO055_16B9;
begin
  {@16BC-16CC}
  bA9F7 := pO12A_06BC(bA9F3, bA9F4);
  if (bC584 <> 0) or (bC586 <> 0) or (bC588 <> 0) or (bC589 <> 0) or (bC58B <> 0) then
    asm
  db 191,110,197,30,87,184,2,0,80
  call XR670_046E
  db 198,6,126,174,1
  call pO10E_0000
  call pO0EC_301C
  db 198,6,139,197,0,198,6,136,197,0,198,6,137,197,0,198,6,132,197,0,198,6,134,197,0,160,243,169
  db 80,160,244,169,80,160,245,169,80
  call pO12A_05B9
  db 162,246,169
    end;
end;

{ 1740 }
procedure pO055_1740;
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
  {@1746-1753}
  v20l := l9CEE;
  {@1753-1757}
  v4b := 1;
  {@1757-175F}
  v8p := nil;
  {@175F-1767}
  v12p := nil;
  {@1767-177A}
  v1b := a08D8_ec3f[PR57_byte(p87F8)^.v];
  {@177A-1791}
  pO055_0367(v1b, @v16b, @v24b, @v36b);
  {@1791-179A}
  PR493_byte(v16p)^.v := 9;
  {@179A-17AC}
  PR327_byte(v16p)^.v := PR327_byte(v16p)^.v or 50;
  {@17AC-17B8}
  v32p := v24p;
  {@17B8-17C4}
  v44p := v36p;
  {@17C4-17C8}
  v2b := 10;
  {@17C8-17DB}
  v3b := a08DD_ec3f[PR57_byte(p87F8)^.v];
  {@17DB-17E8}
  v8p := p9CF2;
  {@17E8-1804}
  pO13E_0182('CPIC', v3b, bB029);
  {@1804-180F}
  PR412_byte(v16p)^.v := bB029;
  {@180F-1833}
  while PR483_pointer(v8p)^.v <> nil do
    v8p := PR483_pointer(v8p)^.v;
  {@1833-1846}
  PR483_pointer(v8p)^.v := v16p;
  {@1846-1859}
  v8p := PR483_pointer(v8p)^.v;
  {@1859-1868}
  PR483_pointer(v8p)^.v := nil;
  {@1868-186C}
  Inc(bC595);
  {@186C-186F}
  Inc(v4b);
  {@186F-1AA9}
  while (v4b <= v2b) and (bC595 < 63) do
  begin
    {@1884-1893}
    GetMem(v12p, 510);
    {@1893-18A6}
    PR483_pointer(v8p)^.v := v12p;
    {@18A6-18B9}
    v8p := PR483_pointer(v8p)^.v;
    {@18B9-18CC}
    PR0_X510(v8p)^.v := PR0_X510(v16p)^.v;
    {@18CC-18DB}
    PR483_pointer(v8p)^.v := nil;
    {@18DB-18EA}
    PR323_pointer(v8p)^.v := nil;
    {@18EA-18F9}
    PR423_pointer(v8p)^.v := nil;
    {@18F9-18FC}
    Inc(v4b);
    {@18FC-1900}
    Inc(bC595);
    {@1900-19C7}
    while v24p <> nil do
    begin
      {@190B-19B3}
      if PR423_pointer(v8p)^.v = nil then
      begin
        {@191A-1930}
        GetMem(PR423_pointer(v8p)^.v, 63);
        {@1930-1948}
        PR0_X63(PR423_pointer(v8p)^.v)^.v := PR0_X63(v24p)^.v;
        {@1948-195A}
        PR42_pointer(PR423_pointer(v8p)^.v)^.v := nil;
      end
      else
      begin
        {@195C-196F}
        v28p := PR423_pointer(v8p)^.v;
        {@196F-1985}
        GetMem(PR423_pointer(v8p)^.v, 63);
        {@1985-199D}
        PR0_X63(PR423_pointer(v8p)^.v)^.v := PR0_X63(v24p)^.v;
        {@199D-19B3}
        PR42_pointer(PR423_pointer(v8p)^.v)^.v := v28p;
      end;
      {@19B3-19C4}
      v24p := PR42_pointer(v24p)^.v;
    end;
    {@19C7-19D3}
    v24p := v32p;
    {@19D3-1A9A}
    while v36p <> nil do
    begin
      {@19DE-1A86}
      if PR323_pointer(v8p)^.v = nil then
      begin
        {@19ED-1A03}
        GetMem(PR323_pointer(v8p)^.v, 9);
        {@1A03-1A1B}
        PR0_X9(PR323_pointer(v8p)^.v)^.v := PR0_X9(v36p)^.v;
        {@1A1B-1A2D}
        PR5_pointer(PR323_pointer(v8p)^.v)^.v := nil;
      end
      else
      begin
        {@1A2F-1A42}
        v40p := PR323_pointer(v8p)^.v;
        {@1A42-1A58}
        GetMem(PR323_pointer(v8p)^.v, 9);
        {@1A58-1A70}
        PR0_X9(PR323_pointer(v8p)^.v)^.v := PR0_X9(v36p)^.v;
        {@1A70-1A86}
        PR5_pointer(PR323_pointer(v8p)^.v)^.v := v40p;
      end;
      {@1A86-1A97}
      v36p := PR5_pointer(v36p)^.v;
    end;
    {@1A9A-1AA6}
    v36p := v44p;
  end;
  {@1AA9-1AAD}
  Inc(bB029);
  {@1AAD-1ABA}
  l9CEE := v20l;
end;

{ 1ABE }
procedure pO055_1ABE(a0: pointer);
var
  _f1: array[1..6] of byte;
begin
  asm
  db 196,126,6,6,87,184,17,0,80
  call XR670_046E
  db 196,126,6,137,126,250,140,70,252,196,126,250,38,198,5,39,196,126,250,38,198,69,3,40,196,126,250,38
  db 198,69,2,39,196,126,250,38,198,69,1,102,196,126,250,38,198,69,4,1,196,126,250,38,199,69,9,1
  db 0,196,126,250,38,199,69,12,184,11,198,6,109,177,1,235,4,254,6,109,177,198,70,254,0,176,1,80
  db 176,126,80
  call pO0E2_1374
  db 136,70,255,138,70,255,48,228,139,248,177,4,211,231,128,189,26,101,2,117,4,198,70,254,1,128,126,254
  db 0,116,214,138,86,255,160,109,177,152,196,126,250,3,248,38,136,85,13,128,62,109,177,3,117,183
  end;
end;

{ 1B6A }
begin
end.

