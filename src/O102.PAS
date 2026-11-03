{ O102: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O102;

interface

uses GAMEDATA;

procedure pO102_02F5(a0: pointer);
procedure pO102_0594(a0: pointer);
procedure pO102_0738(a0: pointer);
procedure pO102_0970(a0: pointer);
function pO102_0E0C(a0: pointer): byte;
function pO102_0BA1(a0: pointer): byte;
function pO102_0C12(a0: pointer): byte;
function pO102_1276(a0: pointer; a1: shortint): byte;
function pO102_12D1(a0: longint; a1: byte; a2: shortint): longint;
procedure pO102_0000(a0: pointer);

implementation

uses LIT, O108, R47F, R670;

type
  E10_byte = record f: byte; _r: array[1..9] of byte end;
  E14_byte = record f: byte; _r: array[1..13] of byte end;
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R172_byte = record _p: array[1..172] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R174_byte = record _p: array[1..174] of byte; v: byte end;
  R189_byte = record _p: array[1..189] of byte; v: byte end;
  R190_byte = record _p: array[1..190] of byte; v: byte end;
  R196_byte = record _p: array[1..196] of byte; v: byte end;
  R199_byte = record _p: array[1..199] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R30_byte = record _p: array[1..30] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R313_byte = record _p: array[1..313] of byte; v: byte end;
  R343_byte = record _p: array[1..343] of byte; v: byte end;
  R351_byte = record _p: array[1..351] of byte; v: byte end;
  R359_byte = record _p: array[1..359] of byte; v: byte end;
  R360_byte = record _p: array[1..360] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R379_byte = record _p: array[1..379] of byte; v: byte end;
  R381_byte = record _p: array[1..381] of byte; v: byte end;
  R399_byte = record _p: array[1..399] of byte; v: byte end;
  R403_byte = record _p: array[1..403] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R62_byte = record _p: array[1..62] of byte; v: byte end;
  RA16_byte = record _p: array[1..16] of byte; a: array[0..32000] of byte end;
  RA306_byte = record _p: array[1..306] of byte; a: array[0..32000] of byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA344_byte = record _p: array[1..344] of byte; a: array[0..32000] of byte end;
  RA427_pointer = record _p: array[1..427] of byte; a: array[0..8000] of pointer end;
W0_15_0970 = record case byte of 0: (_p0: array[1..23] of byte; _w15_23byte: byte);
      1: (_p1: array[1..173] of byte; _w15_173shortint: shortint); 2: (_p2: array[1..314] of byte;
      _w15_314abyte: array[0..32000] of byte); 3: (_p3: array[1..423] of byte; _w15_423longint: longint) end;
W0_4_06D7 = record case byte of 0: (_p0: array[1..19] of byte; _w4_19byte: byte);
      1: (_p1: array[1..404] of byte; _w4_404byte: byte); 2: (_p2: array[1..405] of byte; _w4_405byte: byte);
      3: (_p3: array[1..406] of byte; _w4_406byte: byte); 4: (_p4: array[1..407] of byte;
      _w4_407byte: byte) end;
W0_6_0594 = record case byte of 0: (_p0: array[1..21] of byte; _w6_21byte: byte);
      1: (_p1: array[1..380] of byte; _w6_380abyte: array[0..32000] of byte); 2: (_p2: array[1..381] of byte;
      _w6_381byte: byte); 3: (_p3: array[1..382] of byte; _w6_382byte: byte); 4: (_p4: array[1..383] of byte;
      _w6_383byte: byte); 5: (_p5: array[1..384] of byte; _w6_384byte: byte); 6: (_p6: array[1..386] of byte;
      _w6_386byte: byte); 7: (_p7: array[1..387] of byte; _w6_387byte: byte) end;
W8_13_0000 = record case byte of 0: (_p0: array[1..380] of byte; _w13_380abyte: array[0..32000] of byte);
      1: (_p1: array[1..381] of byte; _w13_381byte: byte); 2: (_p2: array[1..389] of byte;
      _w13_389abyte: array[0..32000] of byte); 3: (_p3: array[1..398] of byte;
      _w13_398abyte: array[0..32000] of byte); 4: (_p4: array[1..423] of byte; _w13_423pointer: pointer) end;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR172_byte = ^R172_byte;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR174_byte = ^R174_byte;
  PR189_byte = ^R189_byte;
  PR190_byte = ^R190_byte;
  PR196_byte = ^R196_byte;
  PR199_byte = ^R199_byte;
  PR25_byte = ^R25_byte;
  PR30_byte = ^R30_byte;
  PR312_byte = ^R312_byte;
  PR313_byte = ^R313_byte;
  PR343_byte = ^R343_byte;
  PR351_byte = ^R351_byte;
  PR359_byte = ^R359_byte;
  PR360_byte = ^R360_byte;
  PR370_longint = ^R370_longint;
  PR379_byte = ^R379_byte;
  PR381_byte = ^R381_byte;
  PR399_byte = ^R399_byte;
  PR403_byte = ^R403_byte;
  PR41_byte = ^R41_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR493_byte = ^R493_byte;
  PR52_byte = ^R52_byte;
  PR54_byte = ^R54_byte;
  PR62_byte = ^R62_byte;
  PRA16_byte = ^RA16_byte;
  PRA306_byte = ^RA306_byte;
  PRA337_byte = ^RA337_byte;
  PRA344_byte = ^RA344_byte;
  PRA427_pointer = ^RA427_pointer;
  PW0_15_0970 = ^W0_15_0970;
  PW0_4_06D7 = ^W0_4_06D7;
  PW0_6_0594 = ^W0_6_0594;
  PW8_13_0000 = ^W8_13_0000;
var
  a0E57_b7cc: array[0..1212] of string[26] absolute d0E57;
  a6D18_9aee: array[0..1488, 0..21] of byte absolute d6D18;
  a6DB2_ec3f: array[0..32759] of byte absolute d6DB2;
  a6DDB_6a03: array[0..4094, 0..7] of byte absolute d6DDB;
  a6E73_081c: array[0..4094, 0..7] of shortint absolute d6E73;
  a6E76_d43c: array[0..6551, 0..4] of shortint absolute d6E76;
  a6F57_527e: array[0..2339, 0..13] of byte absolute d6F57;
  a6F57_9794: array[0..2339] of E14_byte absolute d6F57;
  a708F_c768: array[0..5459, 0..5] of byte absolute d708F;
  a70F5_7b1e: array[0..3275] of E10_byte absolute d70F5;
  a70F5_d37f: array[0..3275, 0..9] of byte absolute d70F5;
  a71D4_9b40: array[0..3639, 0..8] of byte absolute d71D4;
  a755B_9b40: array[0..3639, 0..8] of byte absolute d755B;
  a7688_9b40: array[0..3639, 0..8] of byte absolute d7688;
  a77B5_9b40: array[0..3639, 0..8] of byte absolute d77B5;
  a94E3_3981: array[0..2046] of E16_byte absolute d94E3;
  bAAE6: byte absolute dAAE6;
  p9CEE: pointer absolute d9CEE;
  sbB16D: shortint absolute dB16D;

procedure pO102_06D7(a0: pointer); far; forward;
function pO102_0AF3(a0: pointer): byte; far; forward;
function pO102_0B4A(a0: pointer): shortint; far; forward;
function pO102_0BF2(a0: pointer): byte; far; forward;

{ 0000 }
procedure pO102_0000(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..1] of byte;
  v9p: pointer;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  {@0006-029D}
  with PW8_13_0000(a0)^ do
  begin
    XR670_046E(@_w13_381byte, 27);
    for v1b := 0 to 6 do
    begin
      {@002A-003B}
      v2b := pO102_1276(pointer(a0), v1b);
      if v2b > 29 then
        v2b := 29;
      {@0045-0294}
      if v2b > 0 then
        case v1b of
          0: asm
  db 255,118,8,255,118,6
  push cs
  call near ptr pO102_0594
  db 198,70,251,1,235,3,254,70,251,138,70,251,48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140
  db 94,241,196,126,239,38,128,61,0,117,38,196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189
  db 124,1,0,118,16,138,70,251,48,228,196,126,243,3,248,38,198,133,178,0,1,128,126,251,126,117,179
            end;
          3: begin
            {@00BC-014F}
            if v2b > 8 then
            begin
              {@00C5-00FC}
              for v4b := 1 to 4 do
                Inc(_w13_380abyte[v4b], a755B_9b40[v2b, v4b]);
              asm
  db 198,70,251,1,235,3,254,70,251,138,70,251,48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140
  db 94,241,196,126,239,38,128,61,0,117,38,196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189
  db 124,1,0,118,16,138,70,251,48,228,196,126,243,3,248,38,198,133,178,0,1,128,126,251,126,117,179
              end;
            end;
          end;
          4: begin
            {@0159-024D}
            if v2b > 7 then
            begin
              {@0162-0199}
              for v4b := 1 to 3 do
                Inc(_w13_389abyte[v4b], a7688_9b40[v2b, v4b]);
              {@0199-01DB}
              for v4b := 5 to 6 do
              begin
                {@01A2-01AD}
                v3b := v4b - 4;
                {@01AD-01D5}
                Inc(_w13_398abyte[v3b], a7688_9b40[v2b, v4b]);
              end;
              asm
  db 198,70,251,1,235,3,254,70,251,138,70,251,48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140
  db 94,241,196,126,239,38,128,61,1,117,22,196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189
  db 133,1,0,119,31,196,126,239,38,128,61,2,117,38,196,126,239,38,138,69,1,48,228,196,126,243,3,248
  db 38,128,189,142,1,0,118,16,138,70,251,48,228,196,126,243,3,248,38,198,133,178,0,1,128,126,251,126
  db 117,148
              end;
            end;
          end;
          5: begin
            {@0253-028A}
            for v4b := 1 to 9 do
              Inc(_w13_398abyte[v4b], a77B5_9b40[v2b, v4b]);
            {@028A-0294}
            pO102_06D7(pointer(a0));
          end;
        end;
    end;
    {@029D-02B0}
    v9p := _w13_423pointer;
  end;
  {@02B0-02EF}
  while v9p <> nil do
  begin
    {@02B8-02DC}
    if (PR62_byte(v9p)^.v = 129) and (PR52_byte(v9p)^.v <> 0) then
      Inc(PR403_byte(a0)^.v, PR403_byte(a0)^.v);
    {@02DC-02ED}
    v9p := PR42_pointer(v9p)^.v;
  end;
end;

{ 02F5 }
procedure pO102_02F5(a0: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  _f2: array[1..1] of byte;
  v6b: byte;
  v6sb: shortint absolute v6b;
  v1sb: shortint absolute v1b;
begin
  {@02FB-0304}
  PR172_byte(a0)^.v := 0;
  for v1b := 0 to 6 do
  begin
    {@030D-031E}
    v4b := pO102_1276(pointer(a0), v1b);
    if v4b > 21 then
      v3b := 21
    else
      v3b := v4b;
    {@0330-0372}
    if a6D18_9aee[v1sb, v3b] > PR172_byte(a0)^.v then
      PR172_byte(a0)^.v := a6D18_9aee[v1sb, v3b];
    {@0372-038A}
    if PR312_byte(a0)^.v < v4b then
      PR312_byte(a0)^.v := v4b;
    {@038A-03D7}
    case v1b of
      3, 2: begin
        {@0395-03A4}
        if v4b > 6 then
          PR360_byte(a0)^.v := 3;
        {@03A4-03B3}
        if v4b > 12 then
          PR360_byte(a0)^.v := 4;
      end;
      4: begin
        {@03B9-03C8}
        if v4b > 7 then
          PR360_byte(a0)^.v := 3;
        {@03C8-03D7}
        if v4b > 14 then
          PR360_byte(a0)^.v := 4;
      end;
    end;
  end;
  {@03E0-03EA}
  pO102_0000(pointer(a0));
  {@03EA-03F4}
  pO102_0738(pointer(a0));
  if PR343_byte(a0)^.v > 0 then
    pO102_0970(pointer(a0));
  {@0409-0412}
  PR379_byte(a0)^.v := 0;
  for v1b := 0 to 6 do
  begin
    {@041B-0467}
if (PRA337_byte(a0)^.a[v1sb] > 0) or (PRA344_byte(a0)^.a[v1sb] > 0)
        and (PRA344_byte(a0)^.a[v1sb] < PR312_byte(a0)^.v) then
      Inc(PR379_byte(a0)^.v, a6DB2_ec3f[v1sb]);
  end;
  {@046D-04F3}
  for v6b := 0 to 12 do
  begin
    {@0476-04ED}
if (PRA427_pointer(a0)^.a[v6sb] <> nil) and ((a94E3_3981[PR46_byte(PRA427_pointer(a0)^.a[v6sb])^.v].f
        and PR379_byte(a0)^.v) = 0) and (PR54_byte(PRA427_pointer(a0)^.a[v6sb])^.v = 0) then
      PR52_byte(PRA427_pointer(a0)^.a[v6sb])^.v := 0;
  end;
  {@04F3-0504}
  if pO102_0C12(pointer(a0)) = 0 then
    Exit;
  {@0504-058E}
  for v1b := 0 to 6 do
  begin
    {@050D-051E}
    v4b := PRA344_byte(a0)^.a[v1sb];
    case v1b of
      2, 3: begin
        {@0529-0549}
        if v4b >= 13 then
          PR360_byte(a0)^.v := 4
        else
        begin
          {@053A-0549}
          if v4b >= 7 then
            PR360_byte(a0)^.v := 3;
        end;
      end;
      4: begin
        {@054F-056F}
        if v4b >= 15 then
          PR360_byte(a0)^.v := 4
        else
        begin
          {@0560-056F}
          if v4b >= 8 then
            PR360_byte(a0)^.v := 3;
        end;
      end;
      6: begin
        {@0575-0585}
        if v4b > 0 then
          pO102_0970(pointer(a0));
      end;
    end;
  end;
end;

{ 0594 }
procedure pO102_0594(a0: pointer);
var
  v1b: byte;
  v2b: byte;
begin
  {@059A-05AA}
  v2b := pO102_1276(pointer(a0), 0);
  {@05AA-05B3}
  if v2b <= 0 then
    Exit;
  {@05B3-05C6}
  with PW0_6_0594(a0)^ do
  begin
    if v2b > 29 then
      v2b := 29;
    {@05C6-05FD}
    for v1b := 1 to 7 do
      _w6_380abyte[v1b] := a71D4_9b40[v2b, v1b];
    {@05FD-061A}
    if (_w6_21byte > 12) and (_w6_381byte > 0) then
      Inc(_w6_381byte);
    {@061A-0637}
    if (_w6_21byte > 13) and (_w6_381byte > 0) then
      Inc(_w6_381byte);
    {@0637-0654}
    if (_w6_21byte > 14) and (_w6_382byte > 0) then
      Inc(_w6_382byte);
    {@0654-0671}
    if (_w6_21byte > 15) and (_w6_382byte > 0) then
      Inc(_w6_382byte);
    {@0671-068E}
    if (_w6_21byte > 16) and (_w6_383byte > 0) then
      Inc(_w6_383byte);
    {@068E-06AB}
    if (_w6_21byte > 17) and (_w6_384byte > 0) then
      Inc(_w6_384byte);
    {@06AB-06BE}
    if _w6_21byte < 17 then
      _w6_386byte := 0;
    {@06BE-06D1}
    if _w6_21byte < 18 then
      _w6_387byte := 0;
  end;
end;

{ 06D7 }
procedure pO102_06D7(a0: pointer);
begin
  {@06DD-06F9}
  with PW0_4_06D7(a0)^ do
  begin
    if _w4_19byte < 12 then
      _w4_404byte := 0;
    {@06F9-070C}
    if _w4_19byte < 14 then
      _w4_405byte := 0;
    {@070C-071F}
    if _w4_19byte < 16 then
      _w4_406byte := 0;
    {@071F-0732}
    if _w4_19byte < 18 then
      _w4_407byte := 0;
  end;
end;

{ 0738 }
procedure pO102_0738(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
  v5b: byte;
  v9p: pointer;
  v10b: byte;
  v11b: byte;
  _f2: array[1..1] of byte;
  v1sb: shortint absolute v1b;
begin
  {@073E-0742}
  v10b := 0;
  {@0742-0755}
  v9p := PR423_pointer(a0)^.v;
  {@0755-07A2}
  while (v9p <> nil) and (v10b = 0) do
  begin
    {@0763-078F}
    if (PR62_byte(v9p)^.v > 128) and (PR52_byte(v9p)^.v <> 0) then
    begin
      {@0777-0783}
      v5b := PR62_byte(v9p)^.v and 127;
      {@0783-078F}
      v10b := Ord(v5b = 6);
    end;
    {@078F-07A0}
    v9p := PR42_pointer(v9p)^.v;
  end;
  {@07A2-096A}
  for v1b := 0 to 4 do
  begin
    {@07AB-07BA}
    PRA306_byte(a0)^.a[v1sb] := 20;
    for v2b := 0 to 6 do
    begin
      {@07C3-07D4}
      v3b := pO102_1276(pointer(a0), v2b);
      if v3b > 0 then
      begin
        {@07DD-07EF}
        if v3b > 21 then
          v11b := 21
        else
          v11b := v3b;
        asm
  db 138,70,255,152,139,216,138,70,245,48,228,139,240,209,224,209,224,1,240,139,200,138,70,254,152,186,105,0
  db 247,226,139,248,3,249,3,251,138,149,250,121,138,70,255,152,196,126,6,3,248,38,138,133,50,1,58,194
  db 118,54,138,70,255,152,139,216,138,70,245,48,228,139,240,209,224,209,224,1,240,139,200,138,70,254,152,186
  db 105,0,247,226,139,248,3,249,3,251,138,149,250,121,138,70,255,152,196,126,6,3,248,38,136,149,50,1
        end;
        {@085F-08EE}
        if (v1b = 0) and (v10b <> 0) then
          case PR25_byte(a0)^.v of
            4..6: Inc(PRA306_byte(a0)^.a[v1sb]);
            7..10: Inc(PRA306_byte(a0)^.a[v1sb], 2);
            11..13: Inc(PRA306_byte(a0)^.a[v1sb], 3);
            14..17: Inc(PRA306_byte(a0)^.a[v1sb], 4);
            18: Inc(PRA306_byte(a0)^.a[v1sb], 5);
          end;
        {@08EE-0958}
        if v1b = 0 then
          case PR25_byte(a0)^.v of
            19, 20: Inc(PRA306_byte(a0)^.a[v1sb]);
            21, 22: Inc(PRA306_byte(a0)^.a[v1sb], 2);
            23, 24: Inc(PRA306_byte(a0)^.a[v1sb], 3);
            25: Inc(PRA306_byte(a0)^.a[v1sb], 4);
          end;
      end;
    end;
  end;
end;

{ 0970 }
procedure pO102_0970(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..1] of byte;
  v4b: byte;
  v5b: byte;
  v9l: longint;
  _f2: array[1..2] of byte;
begin
  {@0976-09B0}
  with PW0_15_0970(a0)^ do
  begin
    v2b := 0;
    v9l := _w15_423longint;
    v4b := pO102_1276(pointer(a0), 6);
    if v4b > 18 then
      v4b := 18;
    {@09B0-09B6}
    v5b := v4b;
    for v1b := 1 to 8 do
    begin
      {@09BF-0ADE}
if (a6E73_081c[_w15_173shortint, v1b] < 0) and (a6DDB_6a03[v4b,
          v1b] < (Abs(a6E73_081c[_w15_173shortint, v1b]) + v2b)) then
        _w15_314abyte[v1b] := 0
      else
      begin
        {@0A3C-0A91}
        _w15_314abyte[v1b] := v2b + (a6DDB_6a03[v4b, v1b] + a6E73_081c[_w15_173shortint, v1b]);
        if v1b < 6 then
          _w15_314abyte[v1b] := _w15_314abyte[v1b] + a6E76_d43c[_w15_23byte, v1b];
      end;
      {@0ADE-0AE4}
      v4b := v5b;
    end;
  end;
end;

{ 0AF3 }
function pO102_0AF3(a0: pointer): byte;
var
  v2b: byte;
  v2sb: shortint absolute v2b;
begin
  {@0AF9-0AFD}
  pO102_0AF3 := 17;
  if PR173_byte(a0)^.v <> 5 then
    Exit;
  {@0B0A-0B0E}
  v2b := 0;
  {@0B0E-0B2A}
  while (v2sb < 6) and (PRA344_byte(a0)^.a[v2sb] = 0) do
    Inc(v2b);
  {@0B2A-0B41}
  if PRA344_byte(a0)^.a[v2sb] > 0 then
    pO102_0AF3 := v2b;
end;

{ 0B4A }
function pO102_0B4A(a0: pointer): shortint;
var
  v2b: byte;
  v2sb: shortint absolute v2b;
begin
  {@0B50-0B54}
  pO102_0B4A := 17;
  if PR173_byte(a0)^.v <> 5 then
    Exit;
  {@0B61-0B65}
  v2b := 0;
  {@0B65-0B81}
  while (v2sb < 6) and (PRA337_byte(a0)^.a[v2sb] = 0) do
    Inc(v2b);
  {@0B81-0B98}
  if PRA337_byte(a0)^.a[v2sb] > 0 then
    pO102_0B4A := v2sb;
end;

{ 0BA1 }
function pO102_0BA1(a0: pointer): byte;
var
  v2b: byte;
  v2sb: shortint absolute v2b;
begin
  {@0BA7-0BB8}
  if PR173_byte(a0)^.v <> 5 then
  begin
    {@0BB2-0BB6}
    pO102_0BA1 := 0;
    {@0BB6-0BB8}
    Exit;
  end;
  {@0BB8-0BBC}
  v2b := 0;
  {@0BBC-0BD8}
  while (v2sb < 6) and (PRA337_byte(a0)^.a[v2sb] = 0) do
    Inc(v2b);
  {@0BD8-0BE9}
  pO102_0BA1 := PRA337_byte(a0)^.a[v2sb];
end;

{ 0BF2 }
function pO102_0BF2(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0BF8-0C09}
  pO102_0BF2 := Ord(PR173_byte(a0)^.v = 5);
end;

{ 0C12 }
function pO102_0C12(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0C18-0C32}
  pO102_0C12 := Ord(Byte(pO102_0BA1(pointer(a0))) > PR313_byte(a0)^.v);
end;

{ 0E0C }
function pO102_0E0C(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v8p: pointer;
  v12p: pointer;
  v14w: word;
  v15b: byte;
  v16b: byte;
  v20p: pointer;
  v14b: byte absolute v14w;
  v12b: byte absolute v12p;
  v8b: byte absolute v8p;
  v3sb: shortint absolute v3b;
  { 0C3B }
  function pO102_0C3B(b0: shortint): byte;
  var
    w2b: byte;
    w3b: byte;
    w4b: byte;
    w3sb: shortint absolute w3b;
  begin
    {@0C41-0C7C}
    w2b := Ord(a6F57_527e[PR173_shortint(a0)^.v, sbB16D] <> Byte(pO102_0B4A(pointer(a0))));
    {@0C7C-0C80}
    w3b := 0;
    {@0C80-0CCA}
  while (w3sb <= 5) and ((a708F_c768[pO102_0B4A(pointer(a0)), w3sb] < 9)
        or (PRA16_byte(a0)^.a[w3sb * 2] > 14)) do
      Inc(w3b);
    {@0CCA-0CDF}
    w2b := Ord((w2b <> 0) and (w3sb > 5));
    {@0CDF-0CE3}
    w3b := 0;
    {@0CE3-0D21}
    while (w3sb <= 5) and ((a708F_c768[b0, w3sb] < 9) or (PRA16_byte(a0)^.a[w3sb * 2] > 16)) do
      Inc(w3b);
    {@0D21-0D36}
    w2b := Ord((w2b <> 0) and (w3sb > 5));
    {@0D36-0D3A}
    w4b := 1;
    {@0D3A-0D79}
    while (a70F5_7b1e[b0].f >= w4b) and (a70F5_d37f[b0, w4b] <> PR359_byte(a0)^.v) do
      Inc(w4b);
    {@0D79-0D9C}
    w2b := Ord((w2b <> 0) and (a70F5_7b1e[b0].f >= w4b));
    {@0D9C-0DA2}
    pO102_0C3B := w2b;
  end;

begin
  if false then begin
    if LV = 'only conscious humans may change' then;
    if LV = ' doesn''t qualify.' then;
    if LV = 'Pick New Class' then;
    if Pos('', LV) = 0 then;
    if LV = 'Select' then;
    if LV = ' is now a 1st level ' then;
    if LV = '.' then;
  end;
  {@0E13-0E17}
  pO102_0E0C := 17;
  if PR493_byte(p9CEE)^.v <> 0 then
  begin
    {@0E23-0E3D}
    pR47F_0CC0('only conscious humans may change', 14, 0);
    {@0E3D-0E40}
    Exit;
  end;
  {@0E40-0E88}
  if (pO102_0BF2(p9CEE) = 0) or (pO102_0AF3(p9CEE) <> 17) then
  begin
    {@0E60-0E85}
    pR47F_0CC0(PR0_string(a0)^.v + ' doesn''t qualify.', 4, 15);
    {@0E85-0E88}
    Exit;
  end;
  {@0E88-0E9F}
  v4b := a6F57_9794[PR173_shortint(a0)^.v].f;
  {@0E9F-0EAE}
  GetMem(v8p, 46);
  {@0EAE-0EBA}
  v12p := v8p;
  {@0EBA-0EC7}
  PR42_pointer(v12p)^.v := nil;
  {@0EC7-0ECF}
  PR41_byte(v12p)^.v := 1;
  {@0ECF-0EE2}
  PR0_string_40_(v12p)^.v := 'Pick New Class';
  {@0EE2-0EE7}
  v14w := 1;
  for sbB16D := 1 to v4b do
  begin
    {@0F00-0F1F}
    v3b := a6F57_527e[PR173_shortint(a0)^.v, sbB16D];
    if pO102_0C3B(v3b) <> 0 then
    begin
      {@0F2C-0F40}
      GetMem(PR42_pointer(v12p)^.v, 46);
      {@0F40-0F51}
      v12p := PR42_pointer(v12p)^.v;
      {@0F51-0F5E}
      PR42_pointer(v12p)^.v := nil;
      {@0F5E-0F66}
      PR41_byte(v12p)^.v := 0;
      {@0F66-0F85}
      PR0_string_40_(v12p)^.v := a0E57_b7cc[v3sb];
      {@0F85-0F88}
      Inc(v14w);
    end;
  end;
  {@0F93-0FCB}
  if v14w = 1 then
  begin
    {@0F99-0FBE}
    pR47F_0CC0(PR0_string(a0)^.v + ' doesn''t qualify.', 4, 15);
    {@0FBE-0FC8}
    pO108_2363(@v8b);
    {@0FC8-0FCB}
    Exit;
  end;
  {@0FCB-0FD7}
  v12p := v8p;
  {@0FD7-0FDC}
  v14w := 1;
  {@0FDC-0FE0}
  v15b := 1;
  {@0FE0-0FE4}
  v16b := 1;
  {@0FE4-104E}
  repeat
    {@0FE4-1032}
    v2b := pO108_1D45('', 'Select', 1, 2, 38, 22, v8p, v15b, 0, @v16b, @v14b, @v12b);
    if (bAAE6 <> 0) and (v2b = 0) or (v2b = 1) then
      Exit;
  until v2b = 0;
  {@104E-105D}
  PR370_longint(a0)^.v := 0;
  {@105D-1066}
  PR360_byte(a0)^.v := 2;
  {@1066-106A}
  v3b := 0;
  {@106A-1092}
  while (v3sb <= 6) and (a0E57_b7cc[v3sb] <> PR0_string(v12p)^.v) do
    Inc(v3b);
  {@1092-109C}
  pO108_2363(@v8b);
  {@109C-10BD}
  PRA344_byte(a0)^.a[pO102_0B4A(pointer(a0))] := pO102_0BA1(pointer(a0));
  {@10BD-10CD}
  PR313_byte(a0)^.v := PR312_byte(a0)^.v;
  {@10CD-10D6}
  PR312_byte(a0)^.v := 1;
  {@10D6-10EC}
  PRA337_byte(a0)^.a[pO102_0B4A(pointer(a0))] := 0;
  {@10EC-10FB}
  PRA337_byte(a0)^.a[v3sb] := 1;
  {@10FB-110D}
  XR670_046E(@PR351_byte(a0)^.v, 7);
  {@110D-111F}
  XR670_046E(@PR381_byte(a0)^.v, 27);
  {@111F-1131}
  XR670_046E(@PR30_byte(a0)^.v, 141);
  case v3b of
    0: PR381_byte(a0)^.v := 1;
    5: begin
      {@1147-1150}
      PR399_byte(a0)^.v := 1;
      {@1150-1159}
      PR189_byte(a0)^.v := 1;
      {@1159-1162}
      PR196_byte(a0)^.v := 1;
      {@1162-116B}
      PR190_byte(a0)^.v := 1;
      {@116B-1174}
      PR199_byte(a0)^.v := 1;
    end;
  end;
  {@1174-117F}
  PR174_byte(a0)^.v := v3b;
  {@117F-1185}
  pO102_0E0C := v3b;
  {@1185-11CA}
  pR47F_0CC0(PR0_string(a0)^.v + ' is now a 1st level ' + a0E57_b7cc[v3sb] + '.', 10, 0);
  {@11CA-11DC}
  XR670_046E(@PR30_byte(a0)^.v, 141);
  {@11DC-11E6}
  pO102_02F5(pointer(a0));
  {@11E6-11F0}
  pO102_0594(pointer(a0));
  {@11F0-11FA}
  pO102_06D7(pointer(a0));
  {@11FA-1204}
  pO102_0738(pointer(a0));
  {@1204-120E}
  pO102_0970(pointer(a0));
  {@120E-1221}
  v20p := PR423_pointer(a0)^.v;
  {@1221-126D}
  while v20p <> nil do
  begin
    {@1229-125A}
    if ((a94E3_3981[PR46_byte(v20p)^.v].f and PR379_byte(a0)^.v) = 0) and (PR54_byte(v20p)^.v = 0) then
      PR52_byte(v20p)^.v := 0;
    {@125A-126B}
    v20p := PR42_pointer(v20p)^.v;
  end;
end;

{ 1276 }
function pO102_1276(a0: pointer; a1: shortint): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@127C-128D}
  v2b := PRA337_byte(a0)^.a[a1];
  if pO102_0C12(pointer(a0)) <> 0 then
    v3b := PRA344_byte(a0)^.a[a1]
  else
    v3b := 0;
  {@12B2-12C2}
  if v2b > v3b then
  begin
    {@12BA-12C0}
    pO102_1276 := v2b;
    {@12C0-12C2}
    Exit;
  end;
  {@12C2-12C8}
  pO102_1276 := v3b;
end;

{ 12D1 }
function pO102_12D1(a0: longint; a1: byte; a2: shortint): longint;
type
  TRow = record _p: array[0..17] of byte; v: array[0..11] of longint; _q: array[1..235] of byte end;
var
  tab: array[0..0] of TRow absolute d719C;
  step: array[-26..0] of longint absolute d6E73;
begin
  pO102_12D1 := $7FFFFFFF;
  if a1 < 41 then
    if a1 < 12 then
      pO102_12D1 := tab[a2].v[a1]
    else
      pO102_12D1 := tab[a2].v[11] + (a1 - 11) * step[a2];
end;

{ 1362 }
begin
end.

