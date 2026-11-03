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
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  R172_byte = record _p: array[1..172] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R312_byte = record _p: array[1..312] of byte; v: byte end;
  R313_byte = record _p: array[1..313] of byte; v: byte end;
  R343_byte = record _p: array[1..343] of byte; v: byte end;
  R359_byte = record _p: array[1..359] of byte; v: byte end;
  R360_byte = record _p: array[1..360] of byte; v: byte end;
  R379_byte = record _p: array[1..379] of byte; v: byte end;
  R403_byte = record _p: array[1..403] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
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
  PR172_byte = ^R172_byte;
  PR173_byte = ^R173_byte;
  PR173_shortint = ^R173_shortint;
  PR25_byte = ^R25_byte;
  PR312_byte = ^R312_byte;
  PR313_byte = ^R313_byte;
  PR343_byte = ^R343_byte;
  PR359_byte = ^R359_byte;
  PR360_byte = ^R360_byte;
  PR379_byte = ^R379_byte;
  PR403_byte = ^R403_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
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
var
  a6D18_9aee: array[0..1488, 0..21] of byte absolute d6D18;
  a6DB2_ec3f: array[0..32759] of byte absolute d6DB2;
  a6DDB_6a03: array[0..4094, 0..7] of byte absolute d6DDB;
  a6E73_081c: array[0..4094, 0..7] of shortint absolute d6E73;
  a6E76_d43c: array[0..6551, 0..4] of shortint absolute d6E76;
  a6F57_527e: array[0..2339, 0..13] of byte absolute d6F57;
  a708F_c768: array[0..5459, 0..5] of byte absolute d708F;
  a70F5_7b1e: array[0..3275] of E10_byte absolute d70F5;
  a70F5_d37f: array[0..3275, 0..9] of byte absolute d70F5;
  a71D4_9b40: array[0..3639, 0..8] of byte absolute d71D4;
  a94E3_3981: array[0..2046] of E16_byte absolute d94E3;
  sbB16D: shortint absolute dB16D;

procedure pO102_06D7(a0: pointer); far; forward;
function pO102_0AF3(a0: pointer): byte; far; forward;
function pO102_0B4A(a0: pointer): shortint; far; forward;
function pO102_0BF2(a0: pointer): byte; far; forward;

{ 0000 }
procedure pO102_0000(a0: pointer);
var
  _f1: array[1..5] of byte;
  v9p: pointer;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  asm
  db 196,126,6,137,126,243,140,70,245,196,126,243,129,199,125,1,6,87,184,27,0,80
  call XR670_046E
  db 198,70,255,0,235,3,254,70,255,255,118,8,255,118,6,138,70,255,80
  push cs
  call near ptr pO102_1276
  db 136,70,254,128,126,254,29,118,4,198,70,254,29,128,126,254,0,119,3,233,70,2,138,70,255,60,0,117
  db 96,255,118,8,255,118,6
  push cs
  call near ptr pO102_0594
  db 198,70,251,1,235,3,254,70,251,138,70,251,48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140
  db 94,241,196,126,239,38,128,61,0,117,38,196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189
  db 124,1,0,118,16,138,70,251,48,228,196,126,243,3,248,38,198,133,178,0,1,128,126,251,126,117,179,233
  db 223,1,60,3,116,3,233,150,0,128,126,254,8,119,3,233,138,0,198,70,252,1,235,3,254,70,252,138
  db 70,252,48,228,139,200,138,70,254,48,228,186,9,0,247,226,139,248,3,249,138,149,91,117,138,70,252,48
  db 228,196,126,243,3,248,38,0,149,124,1,128,126,252,4,117,207,198,70,251,1,235,3,254,70,251,138,70
  db 251,48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140,94,241,196,126,239,38,128,61,0,117,38
  db 196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189,124,1,0,118,16,138,70,251,48,228,196
  db 126,243,3,248,38,198,133,178,0,1,128,126,251,126,117,179,233,66,1,60,4,116,3,233,246,0,128,126
  db 254,7,119,3,233,235,0,198,70,252,1,235,3,254,70,252,138,70,252,48,228,139,200,138,70,254,48,228
  db 186,9,0,247,226,139,248,3,249,138,149,136,118,138,70,252,48,228,196,126,243,3,248,38,0,149,133,1
  db 128,126,252,3,117,207,198,70,252,5,235,3,254,70,252,138,70,252,48,228,45,4,0,136,70,253,138,70
  db 252,48,228,139,200,138,70,254,48,228,186,9,0,247,226,139,248,3,249,138,149,136,118,138,70,253,48,228
  db 196,126,243,3,248,38,0,149,142,1,128,126,252,6,117,196,198,70,251,1,235,3,254,70,251,138,70,251
  db 48,228,139,248,177,4,211,231,129,199,26,101,137,126,239,140,94,241,196,126,239,38,128,61,1,117,22,196
  db 126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189,133,1,0,119,31,196,126,239,38,128,61,2
  db 117,38,196,126,239,38,138,69,1,48,228,196,126,243,3,248,38,128,189,142,1,0,118,16,138,70,251,48
  db 228,196,126,243,3,248,38,198,133,178,0,1,128,126,251,126,117,148,235,69,60,5,117,65,198,70,252,1
  db 235,3,254,70,252,138,70,252,48,228,139,200,138,70,254,48,228,186,9,0,247,226,139,248,3,249,138,149
  db 181,119,138,70,252,48,228,196,126,243,3,248,38,0,149,142,1,128,126,252,9,117,207,255,118,8,255,118
  db 6
  push cs
  call near ptr pO102_06D7
  db 128,126,255,6,116,3,233,138,253
  end;
  asm
  db 196,126,243,38,139,133,167,1,38,139,149,169,1,137,70,247,137,86,249
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
var loc: array[1..275] of byte;
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
  asm
    db 198,70,255,17,196,62,238,156,38,128,189,237,1,0,116,29,141,126,203,22,87,191,171,13,14,87,154,111
    db 10,37,8,176,14,80,176,0,80
    call pR47F_0CC0
    db 233,45,4,255,54,240,156,255,54,238,156
    push cs
    call near ptr pO102_0BF2
    db 8,192,116,16,255,54,240,156,255,54,238,156
    push cs
    call near ptr pO102_0AF3
    db 60,17,116,40,141,190,236,254,22,87,196,126,6,6,87,154,111,10,37,8,191,204,13,14,87,154,252,10
    db 37,8,176,4,80,176,15,80
    call pR47F_0CC0
    db 233,229,3,196,126,6,38,138,133,173,0,152,186,14,0,247,226,139,248,138,133,87,111,136,70,252,184,46
    db 0,80,154,63,2,37,8,137,70,248,137,86,250,139,70,248,139,86,250,137,70,244,137,86,246,196,126,244
    db 49,192,38,137,69,42,38,137,69,44,196,126,244,38,198,69,41,1,191,222,13,14,87,196,126,244,6,87
    db 184,40,0,80,154,137,10,37,8,199,70,242,1,0,138,70,252,136,70,235,176,1,58,70,235,126,3,233
    db 156,0,162,109,177,235,4,254,6,109,177,160,109,177,152,139,200,196,126,6,38,138,133,173,0,152,186,14
    db 0,247,226,139,248,3,249,138,133,87,111,136,70,253,138,70,253,80,85
    push cs
    call near ptr pO102_0C3B
    db 8,192,116,92,184,46,0,80,154,63,2,37,8,196,126,244,38,137,69,42,38,137,85,44,196,126,244,38
    db 139,69,42,38,139,85,44,137,70,244,137,86,246,196,126,244,49,192,38,137,69,42,38,137,69,44,196,126
    db 244,38,198,69,41,0,138,70,253,152,186,27,0,247,226,139,248,129,199,87,14,30,87,196,126,244,6,87
    db 184,40,0,80,154,137,10,37,8,255,70,242,160,109,177,58,70,235,116,3,233,105,255,131,126,242,1,117
    db 50,141,190,236,254,22,87,196,126,6,6,87,154,111,10,37,8,191,204,13,14,87,154,252,10,37,8,176
    db 4,80,176,15,80
    call pR47F_0CC0
    db 141,126,248,22,87
    call pO108_2363
    db 233,162,2,139,70,248,139,86,250,137,70,244,137,86,246,199,70,242,1,0,198,70,241,1,198,70,240,1
    db 141,126,235,22,87,191,237,13,14,87,154,111,10,37,8,141,126,228,22,87,191,238,13,14,87,154,111,10
    db 37,8,176,1,80,176,2,80,176,38,80,176,22,80,255,118,250,255,118,248,138,70,241,80,176,0,80,141
    db 126,240,22,87,141,126,242,22,87,141,126,244,22,87
    call pO108_1D45
    db 136,70,254,128,62,230,170,0,116,6,128,126,254,0,116,6,128,126,254,1,117,3,233,37,2,128,126,254
    db 0,117,150,196,126,6,49,192,38,137,133,114,1,38,137,133,116,1,196,126,6,38,198,133,104,1,2,198
    db 70,253,0,128,126,253,6,127,34,138,70,253,152,186,27,0,247,226,139,248,129,199,87,14,30,87,196,126
    db 244,6,87,154,116,11,37,8,116,5,254,70,253,235,216,141,126,248,22,87
    call pO108_2363
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_0BA1
    db 80,255,118,8,255,118,6
    push cs
    call near ptr pO102_0B4A
    db 152,196,126,6,3,248,88,38,136,133,88,1,196,126,6,38,138,133,56,1,196,126,6,38,136,133,57,1
    db 196,126,6,38,198,133,56,1,1,255,118,8,255,118,6
    push cs
    call near ptr pO102_0B4A
    db 152,196,126,6,3,248,38,198,133,81,1,0,138,70,253,152,196,126,6,3,248,38,198,133,81,1,1,196
    db 126,6,129,199,95,1,6,87,184,7,0,80
    call XR670_046E
    db 196,126,6,129,199,125,1,6,87,184,27,0,80
    call XR670_046E
    db 196,126,6,129,199,30,0,6,87,184,141,0,80
    call XR670_046E
    db 138,70,253,60,0,117,11,196,126,6,38,198,133,125,1,1,235,49,60,5,117,45,196,126,6,38,198,133
    db 143,1,1,196,126,6,38,198,133,189,0,1,196,126,6,38,198,133,196,0,1,196,126,6,38,198,133,190
    db 0,1,196,126,6,38,198,133,199,0,1,138,70,253,196,126,6,38,136,133,174,0,138,70,253,136,70,255
    db 141,190,236,254,22,87,196,126,6,6,87,154,111,10,37,8,191,245,13,14,87,154,252,10,37,8,138,70
    db 253,152,186,27,0,247,226,139,248,129,199,87,14,30,87,154,252,10,37,8,191,10,14,14,87,154,252,10
    db 37,8,176,10,80,176,0,80
    call pR47F_0CC0
    db 196,126,6,129,199,30,0,6,87,184,141,0,80
    call XR670_046E
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_02F5
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_0594
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_06D7
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_0738
    db 255,118,8,255,118,6
    push cs
    call near ptr pO102_0970
    db 196,126,6,38,139,133,167,1,38,139,149,169,1,137,70,236,137,86,238,139,70,236,11,70,238,116,68,196
    db 126,236,38,138,69,46,48,228,139,248,177,4,211,231,138,133,227,148,196,126,6,38,34,133,123,1,8,192
    db 117,18,196,126,236,38,128,125,54,0,117,8,196,126,236,38,198,69,52,0,196,126,236,38,139,69,42,38
    db 139,85,44,137,70,236,137,86,238,235,180
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
begin
  asm
    db 199,70,252,255,255,199,70,254,255,127,128,126,8,41,115,111,128,126,8,12,115,40,138,70,8,48,228,209
    db 224,209,224,139,200,138,70,6,152,186,45,1,247,226,139,248,3,249,139,133,174,113,139,149,176,113,137,70
    db 252,137,86,254,235,65,138,70,6,152,139,248,209,231,209,231,139,141,219,110,139,157,221,110,138,70,8,48
    db 228,45,11,0,153,154,191,9,37,8,139,200,139,218,138,70,6,152,186,45,1,247,226,139,248,139,133,218
    db 113,139,149,220,113,3,193,19,211,137,70,252,137,86,254
  end;
end;

{ 1362 }
begin
end.

