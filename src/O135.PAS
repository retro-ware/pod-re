{ O135: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O135;

interface

uses GAMEDATA;

function pO135_17F9(a0: word; a1: word; a2: word; a3: word): byte;
function pO135_1602(a0: integer; a1: integer; a2: longint): byte;
function pO135_14A9(a0: shortint; a1: shortint): byte;
function pO135_0000(a0: byte; a1: byte; a2: pointer; a3: pointer): byte;
procedure pO135_00E5;
procedure pO135_0429(a0: byte; a1: byte);
procedure pO135_04F4;
procedure pO135_060F(a0: shortint; a1: shortint; a2: pointer; a3: pointer);
procedure pO135_067C(a0: shortint; a1: shortint; a2: byte);
function pO135_07D4(a0: shortint; a1: shortint): byte;
function pO135_0805(a0: longint; a1: byte): byte;
procedure pO135_0A4D(a0: shortint; a1: shortint; a2: byte; a3: byte);
procedure pO135_0BAF(a0: pointer; a1: byte; a2: byte; a3: byte);
function pO135_0CA2(a0: longint): shortint;
function pO135_0CCA(a0: word; a1: word): byte;
function pO135_0CF2(a0: word; a1: word): byte;
function pO135_0D1A(a0: longint): byte;
procedure pO135_0D94(a0: longint; a1: byte; a2: pointer; a3: pointer; a4: pointer);
procedure pO135_0F14(a0: pointer);
function pO135_122B(a0: pointer; a1: byte; a2: byte; a3: byte): byte;
procedure pO135_141F(a0: longint; a1: byte; a2: byte);

implementation

uses LIT, Crt, O13E, R1C3, R47F, R5A0, R670;

type
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  E4_shortint = record f: shortint; _r: array[1..3] of byte end;
  E7_byte = record f: byte; _r: array[1..6] of byte end;
  E7_pointer = record f: pointer; _r: array[1..3] of byte end;
  E7_shortint = record f: shortint; _r: array[1..6] of byte end;
  E8_pointer = record f: pointer; _r: array[1..4] of byte end;
  PV4_0_integer = record v: integer; _r: array[1..2] of byte end;
  PV4_2_integer = record _p: array[1..2] of byte; v: integer end;
  R0_byte = record v: byte end;
  R0_shortint = record v: shortint end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R26_shortint = record _p: array[1..26] of byte; v: shortint end;
  R27_shortint = record _p: array[1..27] of byte; v: shortint end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R2_shortint = record _p: array[1..2] of byte; v: shortint end;
  R305_byte = record _p: array[1..305] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R412_byte = record _p: array[1..412] of byte; v: byte end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R4_byte = record _p: array[1..4] of byte; v: byte end;
  R4_pointer = record _p: array[1..4] of byte; v: pointer end;
  R5_byte = record _p: array[1..5] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  RA16_byte = record _p: array[1..16] of byte; a: array[0..32000] of byte end;
  RA7_byte = record _p: array[1..7] of byte; a: array[0..32000] of byte end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
  PR0_byte = ^R0_byte;
  PR0_shortint = ^R0_shortint;
  PR18_byte = ^R18_byte;
  PR26_shortint = ^R26_shortint;
  PR27_shortint = ^R27_shortint;
  PR2_byte = ^R2_byte;
  PR2_shortint = ^R2_shortint;
  PR305_byte = ^R305_byte;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR412_byte = ^R412_byte;
  PR487_pointer = ^R487_pointer;
  PR494_byte = ^R494_byte;
  PR4_byte = ^R4_byte;
  PR4_pointer = ^R4_pointer;
  PR5_byte = ^R5_byte;
  PR8_byte = ^R8_byte;
  PRA16_byte = ^RA16_byte;
  PRA7_byte = ^RA7_byte;
  PRB7_50_byte = ^RB7_50_byte;
var
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  a3EBD_2a50: array[0..8189] of E4_byte absolute d3EBD;
  a3FC6_3940: array[0..2729, 0..11] of byte absolute d3FC6;
  a3FC7_3940: array[0..2729, 0..11] of byte absolute d3FC7;
  a53E5_ec3f: array[0..32759] of byte absolute d53E5;
  a9DC4_7c92: array[0..4094] of E8_pointer absolute d9DC4;
  a9EF1_2a50: array[0..8189] of E4_byte absolute d9EF1;
  a9EF1_2fb8: array[0..8189] of E4_shortint absolute d9EF1;
  a9EF2_2a50: array[0..8189] of E4_byte absolute d9EF2;
  a9EF2_2fb8: array[0..8189] of E4_shortint absolute d9EF2;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA014_ec3f: array[0..32759] of byte absolute dA014;
  aA014_ff2a: array[0..32759] of shortint absolute dA014;
  aA05C_ec3f: array[0..32759] of byte absolute dA05C;
  aA05C_ff2a: array[0..32759] of shortint absolute dA05C;
  aA0A5_9cc8: array[0..654, 0..49] of byte absolute dA0A5;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aA583_b676: array[0..8189] of longint absolute dA583;
  aA6A0_b509: array[0..4679] of E7_pointer absolute dA6A0;
  aA6A4_30da: array[0..4679] of E7_byte absolute dA6A4;
  aA6A4_8673: array[0..4679] of E7_shortint absolute dA6A4;
  aA6A5_30da: array[0..4679] of E7_byte absolute dA6A5;
  aA6A5_8673: array[0..4679] of E7_shortint absolute dA6A5;
  aA6A6_30da: array[0..4679] of E7_byte absolute dA6A6;
  b880C: byte absolute d880C;
  b9EF4: byte absolute d9EF4;
  bA6DF: byte absolute dA6DF;
  bAEF0: byte absolute dAEF0;
  l8836: longint absolute d8836;
  p9DC0: pointer absolute d9DC0;
  pA6E0: pointer absolute dA6E0;
  pAE5D: pointer absolute dAE5D;

procedure pO135_006A; far; forward;
procedure pO135_010A(a0: byte; a1: byte; a2: shortint; a3: shortint); far; forward;
procedure pO135_02AC(a0: shortint; a1: byte); far; forward;
function pO135_08BF(a0: shortint; a1: shortint; a2: byte): byte; far; forward;

{ 0000 }
function pO135_0000(a0: byte; a1: byte; a2: pointer; a3: pointer): byte;
var
  _f1: array[1..1] of byte;
begin
  {@0006-000A}
  pO135_0000 := 0;
  if a0 = 0 then
    Exit;
  {@0012-0033}
  PR0_byte(a2)^.v := a3FC6_3940[a0, a1 * 2];
  {@0033-0054}
  PR0_byte(a3)^.v := a3FC7_3940[a0, a1 * 2];
  if PR0_shortint(a2)^.v >= 0 then
    pO135_0000 := 1;
end;

{ 006A }
procedure pO135_006A;
var
  v1b: byte;
begin
  {@0070-00E1}
  for v1b := 1 to b9EF4 do
  begin
    {@0085-00AF}
    aA014_ec3f[v1b] := a9EF1_2fb8[v1b].f - PR2_shortint(pA6E0)^.v;
    {@00AF-00D9}
    aA05C_ec3f[v1b] := a9EF2_2fb8[v1b].f - PR3_shortint(pA6E0)^.v;
  end;
end;

{ 00E5 }
procedure pO135_00E5;
begin
end;

{ 010A }
procedure pO135_010A(a0: byte; a1: byte; a2: shortint; a3: shortint);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..4] of byte;
begin
  if false then begin
    if LSV = [27..31] then;
  end;
  {@0110-011D}
  a0 := shortint(a0) * 3;
  {@011D-012A}
  a1 := shortint(a1) * 3;
  {@012A-0148}
  v1b := PRB7_50_byte(pA6E0)^.a[a3, a2];
  if (v1b > 69) or (v1b = 0) then
    v1b := 21;
  {@0158-016A}
  v2b := a3EBD_2a50[v1b].f;
  if v1b in [27..31] then
  begin
    {@017D-018C}
    v1b := pO135_14A9(byte(a2), byte(a3));
    {@018C-019E}
    v3b := a3EBD_2a50[v1b].f;
    case v1b of
      31, 30: for v4b := 1 to bA6DF do
        begin
          {@01BE-01FB}
          if (aA6A4_30da[v4b].f = byte(a2)) and (aA6A5_30da[v4b].f = byte(a3)) then
            v1b := aA6A6_30da[v4b].f;
        end;
    end;
    {@0203-0213}
    if (v1b > 69) or (v1b = 0) then
      v1b := 21;
    {@0213-0225}
    v3b := a3EBD_2a50[v1b].f;
    {@0225-024B}
    pR1C3_07C4(shortint(a0), shortint(a1), v3b, 0, p9DC0, l8836);
    {@024B-027E}
    pR1C3_07C4(shortint(a0), shortint(a1), 0, 1, pointer(a9DC4_7c92[v2b + 13].f), l8836);
    {@027E-0280}
    Exit;
  end;
  {@0280-02A6}
  pR1C3_07C4(shortint(a0), shortint(a1), v2b, 0, p9DC0, l8836);
end;

{ 02AC }
procedure pO135_02AC(a0: shortint; a1: byte);
var
  v1b: byte;
  _f1: array[1..3] of byte;
  v5b: byte;
  v6b: byte;
  _f2: array[1..2] of byte;
begin
  {@02B2-02C6}
  v1b := a0 - PR2_shortint(pA6E0)^.v;
  asm
  db 196,62,224,166,38,138,69,3,152,139,208,138,70,6,152,43,194,136,70,254
  end;
  for v5b := 0 to 5 do
    asm
  db 196,62,224,166,38,138,69,5,80,138,70,251,80,141,126,253,22,87,141,126,252,22,87
  push cs
  call near ptr pO135_0000
  db 8,192,117,3,233,141,0,138,70,253,152,139,208,138,70,255,152,3,194,80,138,70,252,152,139,208,138,70
  db 254,152,3,194,80
  push cs
  call near ptr pO135_07D4
  db 8,192,116,107,138,70,253,152,139,208,138,70,255,152,3,194,80,138,70,252,152,139,208,138,70,254,152,3
  db 194,80,138,70,253,152,139,208,138,70,8,152,3,194,80,138,70,252,152,139,208,138,70,6,152,3,194,80
  push cs
  call near ptr pO135_010A
  db 196,62,224,166,38,128,125,4,0,116,40,138,70,253,152,139,208,138,70,255,152,3,194,80,138,70,252,152
  db 139,208,138,70,254,152,3,194,80,176,0,80,176,0,80,176,28,80
  call pO13E_04B3
    end;
  asm
  db 138,70,8,80,138,70,6,80,141,126,250,22,87,141,126,249,22,87
  push cs
  call near ptr pO135_060F
  end;
  if (v6b > 0) and (pO135_0805(longint(aA583_9f8b[v6b]), 0) <> 0) then
pO13E_04B3(aA014_ec3f[v6b], aA05C_ec3f[v6b], PR8_byte(PR487_pointer(aA583_9f8b[v6b])^.v)^.v, 0,
        PR412_byte(aA583_9f8b[v6b])^.v);
end;

{ 0429 }
procedure pO135_0429(a0: byte; a1: byte);
var
  _f1: array[1..2] of byte;
  v3b: byte;
  _f2: array[1..1] of byte;
begin
  asm
  db 196,62,224,166,38,138,69,2,152,139,208,138,70,8,152,43,194,136,70,255
  end;
  asm
  db 196,62,224,166,38,138,69,3,152,139,208,138,70,6,152,43,194,136,70,254
  end;
  asm
  db 138,70,255,80,138,70,254,80,176,0,80
  push cs
  call near ptr pO135_067C
  end;
  asm
  db 138,70,8,80,138,70,6,80,141,126,253,22,87,141,126,252,22,87
  push cs
  call near ptr pO135_060F
  end;
  if (v3b > 0) and (pO135_0805(longint(aA583_9f8b[v3b]), 0) <> 0) then
pO13E_04B3(aA014_ec3f[v3b], aA05C_ec3f[v3b], PR8_byte(PR487_pointer(aA583_9f8b[v3b])^.v)^.v, 0,
        PR412_byte(aA583_9f8b[v3b])^.v);
end;

{ 04F4 }
procedure pO135_04F4;
var
  _f1: array[1..6] of byte;
begin
  asm
  db 191,165,160,30,87,184,226,4,80
  call XR670_046E
  db 160,244,158,136,70,251,176,1,58,70,251,118,3,233,243,0
  end;
  asm
  db 136,70,255,235,3,254,70,255,138,70,255,48,228,139,248,209,231,209,231,128,189,244,158,0,119,3,233,203
  db 0,198,70,254,0,235,3,254,70,254,138,70,255,48,228,139,248,209,231,209,231,138,133,244,158,80,138,70
  db 254,80,141,126,253,22,87,141,126,252,22,87
  push cs
  call near ptr pO135_0000
  db 8,192,116,66,138,94,255,138,70,253,152,139,208,138,70,255,48,228,139,248,209,231,209,231,138,133,241,158
  db 152,3,194,139,200,138,70,252,152,139,208,138,70,255,48,228,139,248,209,231,209,231,138,133,242,158,152,3
  db 194,186,50,0,247,226,139,248,3,249,136,157,165,160,128,126,254,5,117,143,196,62,224,166,38,138,69,2
db 152,139,208,138,70,255,48,228,139,248,209,231,209,231,138,133,241,158,152,43,194,138,208,138,70,255,48,228
  db 139,248,136,149,20,160,196,62,224,166,38,138,69,3,152,139,208,138,70,255,48,228,139,248,209,231,209,231
  db 138,133,242,158,152,43,194,138,208,138,70,255,48,228,139,248,136,149,92,160,138,70,255,58,70,251,116,3
  db 233,18,255
  end;
end;

{ 060F }
procedure pO135_060F(a0: shortint; a1: shortint; a2: pointer; a3: pointer);
begin
  {@0612-066A}
  if (a0 >= 0) and (a0 <= 49) and (a1 >= 0) and (a1 <= 24) then
  begin
    {@062A-064B}
    PR0_byte(a3)^.v := PRB7_50_byte(pA6E0)^.a[a1, a0];
    {@064B-0668}
    PR0_byte(a2)^.v := aA0A5_9cc8[a1, a0];
    {@0668-066A}
    Exit;
  end;
  {@066A-0671}
  PR0_byte(a2)^.v := 0;
  {@0671-0678}
  PR0_byte(a3)^.v := 0;
end;

{ 067C }
procedure pO135_067C(a0: shortint; a1: shortint; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..1] of byte;
  v7b: byte;
  _f2: array[1..1] of byte;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
begin
  {@0682-06C6}
  if a2 = 0 then
  begin
    {@0688-069C}
    v1b := a0 + PR2_shortint(pA6E0)^.v;
    {@069C-06B0}
    v2b := a1 + PR3_shortint(pA6E0)^.v;
    asm
  db 138,70,255,80,138,70,254,80,141,126,6,22,87,141,126,250,22,87
  push cs
  call near ptr pO135_060F
    end;
  end;
  {@06C6-07AA}
  if a2 > 0 then
  begin
    {@06CF-06DD}
    byte(a0) := aA014_ec3f[a2];
    {@06DD-06EB}
    byte(a1) := aA05C_ec3f[a2];
    {@06EB-06FF}
    v1b := a0 + PR2_shortint(pA6E0)^.v;
    {@06FF-0713}
    v2b := a1 + PR3_shortint(pA6E0)^.v;
    {@0713-0725}
    v7b := a9EF4_2a50[a2].f;
    for v5b := 0 to 5 do
    begin
      {@072E-07A2}
      if (pO135_0000(v7b, v5b, @v3b, @v4b) <> 0) and (pO135_07D4(a0 + v3sb, a1 + v4sb) <> 0) then
        pO135_010A(a0 + v3sb, a1 + v4sb, v1sb + v3sb, v2sb + v4sb);
    end;
    {@07A8-07AA}
    Exit;
  end;
  {@07AA-07CE}
  if pO135_07D4(byte(a0), byte(a1)) <> 0 then
    pO135_010A(byte(a0), byte(a1), v1b, v2b);
end;

{ 07D4 }
function pO135_07D4(a0: shortint; a1: shortint): byte;
var
  _f1: array[1..1] of byte;
begin
  {@07DA-07F8}
  if (a0 < 0) or (a0 > 6) or (a1 < 0) or (a1 > 6) then
  begin
    {@07F2-07F6}
    pO135_07D4 := 0;
    {@07F6-07F8}
    Exit;
  end;
  {@07F8-07FC}
  pO135_07D4 := 1;
end;

{ 0805 }
function pO135_0805(a0: longint; a1: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..3] of byte;
  v5sb: shortint absolute v5b;
  v4sb: shortint absolute v4b;
begin
  {@080B-080F}
  pO135_0805 := 1;
  {@080F-081C}
  v3b := pO135_0D1A(longint(a0));
  if a9EF4_2a50[v3b].f = 0 then
  begin
    {@082E-0832}
    pO135_0805 := 0;
    {@0832-0835}
    Exit;
  end;
  {@0835-08B6}
  for v2b := 0 to 5 do
  begin
    {@083E-08B0}
    if pO135_0000(a9EF4_2a50[v3b].f, v2b, @v4b, @v5b) <> 0 then
    begin
      {@0864-08B0}
      if pO135_07D4(aA014_ff2a[v3b] + v4sb, aA05C_ff2a[v3b] + v5sb) = 0 then
      begin
        {@0896-089A}
        pO135_0805 := 0;
        if a1 <> 0 then
          Exit;
      end
      else
      begin
        {@08A4-08A8}
        pO135_0805 := 1;
        if a1 = 0 then
          Exit;
      end;
    end;
  end;
end;

{ 08BF }
function pO135_08BF(a0: shortint; a1: shortint; a2: byte): byte;
var
  v2b: byte;
  _f1: array[1..2] of byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  _f2: array[1..2] of byte;
  v12sb: shortint absolute v12b;
  v11sb: shortint absolute v11b;
  v10sb: shortint absolute v10b;
  v9sb: shortint absolute v9b;
  v8sb: shortint absolute v8b;
  v7sb: shortint absolute v7b;
begin
  {@08C5-08C9}
  pO135_08BF := 0;
  {@08C9-08D8}
  v7b := PR2_shortint(pA6E0)^.v + 3;
  {@08D8-08E7}
  v8b := PR3_shortint(pA6E0)^.v + 3;
  {@08E7-08ED}
  v2b := a2;
  if a2 = 255 then
    v2b := 0;
  {@08F7-0907}
  v9b := v7sb - v2b;
  {@0907-0917}
  v10b := v7sb + v2b;
  {@0917-0927}
  v11b := v8sb - v2b;
  {@0927-0937}
  v12b := v8sb + v2b;
  if (a2 <> 255) and (a0 >= v9sb) and (a0 <= v10sb) and (a1 >= v11sb) and (a1 <= v12sb) then
    Exit;
  {@0960-0998}
  if a0 < v9sb then
    while (a0 < v7sb) and (v7sb > 3) do
      Dec(v7b)
  else
  begin
    {@097D-0998}
    if a0 > v10sb then
      while (a0 > v7sb) and (v7sb < 46) do
        Inc(v7b);
  end;
  {@0998-09D0}
  if a1 < v11sb then
    while (a1 < v8sb) and (v8sb > 3) do
      Dec(v8b)
  else
  begin
    {@09B5-09D0}
    if a1 > v12sb then
      while (a1 > v8sb) and (v8sb < 21) do
        Inc(v8b);
  end;
  {@09D0-09DF}
  PR2_byte(pA6E0)^.v := v7sb - 3;
  {@09DF-09EE}
  PR3_byte(pA6E0)^.v := v8sb - 3;
  {@09EE-09F9}
  v8b := PR3_byte(pA6E0)^.v;
  for v6b := 0 to 6 do
  begin
    {@0A02-0A0D}
    v7b := PR2_byte(pA6E0)^.v;
    for v5b := 0 to 6 do
    begin
      {@0A16-0A2A}
      pO135_010A(v5b, v6b, v7b, v8b);
      {@0A2A-0A2D}
      Inc(v7b);
    end;
    {@0A33-0A36}
    Inc(v8b);
  end;
  {@0A3C-0A40}
  pO135_006A;
  {@0A40-0A44}
  pO135_08BF := 1;
end;

{ 0A4D }
procedure pO135_0A4D(a0: shortint; a1: shortint; a2: byte; a3: byte);
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v7sb: shortint absolute v7b;
  v6sb: shortint absolute v6b;
  v4l: longint absolute v4p;
begin
  {@0A53-0A6A}
  v6b := a0 + a3EAC_ff2a[a3];
  {@0A6A-0A81}
  v7b := a1 + a3EB5_ff2a[a3];
  if pO135_08BF(v6b, v7b, a2) <> 0 then
    for v5b := 1 to b9EF4 do
    begin
      {@0AB0-0AC9}
      v4p := aA583_9f8b[v5b];
      if (PR494_byte(v4p)^.v <> 0) and (a9EF4_2a50[v5b].f > 0) and (pO135_0805(v4l, 0) <> 0) then
pO13E_04B3(aA014_ec3f[v5b], aA05C_ec3f[v5b], PR8_byte(PR487_pointer(v4p)^.v)^.v, 0,
            PR412_byte(v4p)^.v);
    end;
  {@0B38-0B44}
  pO135_0429(byte(a0), byte(a1));
  if pO135_07D4(v6sb - PR2_shortint(pA6E0)^.v, v7sb - PR3_shortint(pA6E0)^.v) = 0 then
  begin
    {@0B70-0B7A}
    if v6sb > 49 then
      v6b := 49;
    {@0B7A-0B84}
    if v6sb < 0 then
      v6b := 0;
    {@0B84-0B8E}
    if v7sb > 24 then
      v7b := 24;
    {@0B8E-0B98}
    if v7sb < 0 then
      v7b := 0;
  end;
  {@0B98-0BA4}
  pO135_02AC(v6b, v7b);
  {@0BA4-0BA9}
  pR1C3_10FD;
end;

{ 0BAF }
procedure pO135_0BAF(a0: pointer; a1: byte; a2: byte; a3: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0BB5-0BC2}
  v1b := pO135_0D1A(longint(a0));
  if (pO135_0805(longint(a0), 1) = 0) and (bAEF0 <> 0) then
    asm
  db 255,118,14,255,118,12
  push cs
  call near ptr pO135_0CA2
  db 80,255,118,14,255,118,12
  push cs
  call near ptr pO135_0CCA
  db 80,176,3,80,176,8,80
  push cs
  call near ptr pO135_0A4D
    end;
  {@0BFA-0C3C}
if (((PR8_byte(PR487_pointer(a0)^.v)^.v shr 1 shr 1) <> (a1 shr 1 shr 1)) or ((a2 <> 0) or (a3 <> 0)))
      and (bAEF0 <> 0) then
    pO135_067C(0, 0, v1b);
  {@0C3C-0C4B}
  PR8_byte(PR487_pointer(a0)^.v)^.v := a1;
  if (a3 = 0) and (pO135_0805(longint(a0), 0) <> 0) and (bAEF0 <> 0) then
  begin
    {@0C69-0C97}
    pO13E_04B3(aA014_ec3f[v1b], aA05C_ec3f[v1b], a1, a2, PR412_byte(a0)^.v);
    {@0C97-0C9C}
    pR1C3_10FD;
  end;
end;

{ 0CA2 }
function pO135_0CA2(a0: longint): shortint;
var
  _f1: array[1..1] of byte;
begin
  {@0CA8-0CC1}
  pO135_0CA2 := a9EF1_2fb8[pO135_0D1A(longint(a0))].f;
end;

{ 0CCA }
function pO135_0CCA(a0: word; a1: word): byte;
var
  _f1: array[1..1] of byte;
begin
  asm
  db 255,118,8,255,118,6
  push cs
  call near ptr pO135_0D1A
  db 48,228,139,248,209,231,209,231,138,133,242,158,136,70,255
  end;
end;

{ 0CF2 }
function pO135_0CF2(a0: word; a1: word): byte;
var
  _f1: array[1..1] of byte;
begin
  asm
  db 255,118,8,255,118,6
  push cs
  call near ptr pO135_0D1A
  db 48,228,139,248,209,231,209,231,138,133,244,158,136,70,255
  end;
end;

{ 0D1A }
function pO135_0D1A(a0: longint): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
begin
  {@0D20-0D24}
  v2b := 0;
  {@0D24-0D28}
  pO135_0D1A := 0;
  {@0D28-0D2C}
  v3b := 0;
  {@0D2C-0D5F}
  repeat
    {@0D2C-0D2F}
    Inc(v3b);
    if aA583_b676[v3b] = a0 then
      v2b := 1;
  until (v2b <> 0) or (v3b = b9EF4);
  {@0D5F-0D6B}
  if v2b <> 0 then
    pO135_0D1A := v3b;
end;

{ 0D94 }
procedure pO135_0D94(a0: longint; a1: byte; a2: pointer; a3: pointer; a4: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..5] of byte;
  v10b: byte;
  v11b: byte;
  _f2: array[1..1] of byte;
begin
  if false then begin
    if LSV = [27..29] then;
  end;
  asm
  db 196,126,14,38,198,5,0
  end;
  asm
  db 196,126,10,38,198,5,23
  end;
  asm
  db 198,70,251,1
  end;
  asm
  db 196,126,6,38,198,5,0
  end;
  asm
  db 255,118,22,255,118,20
  push cs
  call near ptr pO135_0D1A
  db 136,70,254
  end;
  asm
  db 138,70,254,48,228,139,248,209,231,209,231,138,133,241,158,136,70,248
  end;
  asm
  db 138,70,254,48,228,139,248,209,231,209,231,138,133,242,158,136,70,247
  end;
  for v1b := 0 to 5 do
  begin
    {@0DED-0EE5}
    if pO135_0000(a9EF4_2a50[v2b].f, v1b, @v10b, @v11b) <> 0 then
    begin
      asm
  db 138,70,18,48,228,139,248,138,133,172,62,152,139,200,138,70,246,152,139,208,138,70,248,152,3,194,3,193
  db 136,70,250
      end;
      asm
  db 138,70,18,48,228,139,248,138,133,181,62,152,139,200,138,70,245,152,139,208,138,70,247,152,3,194,3,193
  db 136,70,249
      end;
      asm
  db 138,70,250,80,138,70,249,80,141,126,253,22,87,141,126,252,22,87
  push cs
  call near ptr pO135_060F
      end;
      if v3b = v2b then
        asm
  db 198,70,253,0
        end;
      asm
  db 128,126,253,0,118,9,138,70,253,196,126,14,38,136,5
      end;
      {@0E85-0E9E}
      if v4b in [27..29] then
        asm
  db 138,70,252,196,126,6,38,136,5
        end;
      asm
  db 128,126,252,0,116,9,196,126,10,38,128,61,0,117,9,196,126,10,38,198,5,0,235,47,138,70,252,48
  db 228,139,248,209,231,209,231,138,133,186,62,58,70,251,114,27,138,70,252,48,228,139,248,209,231,209,231,138
  db 133,186,62,136,70,251,138,70,252,196,126,10,38,136,5
      end;
    end;
  end;
end;

{ 0F14 }
procedure pO135_0F14(a0: pointer);
var loc: array[1..10] of byte;
begin
  if false then begin
    if LSV = [28..29] then;
  end;
  asm
    db 128,62,12,136,5,116,17,255,54,244,61
    call pR5A0_0000
    call pR47F_0D1A
    db 233,243,2,198,70,254,1,128,126,254,9,115,35,138,70,254,48,228,186,7,0,247,226,139,248,139,133,160
    db 166,139,149,162,166,59,86,8,117,5,59,70,6,116,5,254,70,254,235,215,128,126,254,9,115,3,233,189
    db 2,255,118,8,255,118,6
    push cs
    call near ptr pO135_0D1A
    db 136,70,255,255,118,8,255,118,6
    push cs
    call near ptr pO135_0CA2
    db 136,70,250,255,118,8,255,118,6
    push cs
    call near ptr pO135_0CCA
    db 136,70,249,255,118,8,255,118,6,176,1,80
    push cs
    call near ptr pO135_0805
    db 8,192,117,18,138,70,250,80,138,70,249,80,176,3,80,176,8,80
    push cs
    call near ptr pO135_0A4D
    db 176,0,80,176,0,80,138,70,255,80
    push cs
    call near ptr pO135_067C
    db 255,54,244,61
    call pR5A0_0000
    db 198,70,253,0,235,3,254,70,253,198,70,254,0,235,3,254,70,254,138,70,255,48,228,139,248,209,231,209
    db 231,138,133,244,158,80,138,70,254,80,141,126,252,22,87,141,126,251,22,87
    push cs
    call near ptr pO135_0000
    db 8,192,117,3,233,149,0,138,70,252,152,139,208,138,70,255,48,228,139,248,138,133,20,160,152,3,194,80
    db 138,70,251,152,139,208,138,70,255,48,228,139,248,138,133,92,160,152,3,194,80
    push cs
    call near ptr pO135_07D4
    db 8,192,116,99,138,70,252,152,139,208,138,70,255,48,228,139,248,138,133,20,160,152,3,194,139,240,209,224
    db 1,240,80,138,70,251,152,139,208,138,70,255,48,228,139,248,138,133,92,160,152,3,194,139,240,209,224,1
    db 240,80,176,0,80,176,5,80,138,70,253,48,228,153,185,2,0,247,241,146,139,248,209,231,209,231,255,181
    db 118,158,255,181,116,158,255,54,56,136,255,54,54,136
    call pR1C3_08C0
    db 128,126,254,5,116,3,233,54,255
    call pR1C3_10FD
    db 184,10,0,80
    call Delay
    db 128,126,253,8,116,3,233,22,255,196,126,6,38,196,189,231,1,38,128,125,18,0,116,3,233,225,0,196
    db 126,6,38,128,189,237,1,8,117,3,233,211,0,138,70,250,80,138,70,249,80
    push cs
    call near ptr pO135_14A9
    db 136,70,253,254,6,223,166,138,78,253,160,223,166,48,228,186,7,0,247,226,139,248,136,141,166,166,138,70
    db 250,152,139,200,138,70,249,152,186,50,0,247,226,196,62,224,166,3,248,3,249,38,138,69,7,80,191,244
    db 14,14,87,154,36,13,37,8,117,69,196,126,6,38,128,189,237,1,7,117,30,138,70,250,152,139,200,138
    db 70,249,152,186,50,0,247,226,196,62,224,166,3,248,3,249,38,198,69,7,30,235,28,138,70,250,152,139
    db 200,138,70,249,152,186,50,0,247,226,196,62,224,166,3,248,3,249,38,198,69,7,31,139,78,6,139,94
    db 8,160,223,166,48,228,186,7,0,247,226,139,248,137,141,160,166,137,157,162,166,138,78,250,160,223,166,48
    db 228,186,7,0,247,226,139,248,136,141,164,166,138,78,249,160,223,166,48,228,186,7,0,247,226,139,248,136
    db 141,165,166
    call pR47F_0D1A
    db 176,0,80,176,0,80,138,70,255,80
    push cs
    call near ptr pO135_067C
    db 255,118,8,255,118,6
    push cs
    call near ptr pO135_0D1A
    db 48,228,139,248,209,231,209,231,198,133,244,158,0
    push cs
    call near ptr pO135_04F4
    db 196,62,224,166,38,138,69,2,152,5,3,0,80,196,62,224,166,38,138,69,3,152,5,3,0,80,176,3
    db 80,176,8,80
    push cs
    call near ptr pO135_0A4D
    db 196,126,6,38,196,189,231,1,38,198,69,3,0,196,126,6,38,196,189,231,1,38,198,69,5,0,196,126
    db 6,38,196,189,231,1,38,198,69,6,0
  end;
end;

{ 122B }
function pO135_122B(a0: pointer; a1: byte; a2: byte; a3: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for a1 := a1 to a1 do ;
  end;
  {@1231-1412}
  if b880C = 5 then
  begin
    {@123B-123F}
    pO135_122B := 0;
    {@123F-124C}
    v2b := pO135_0D1A(longint(a0));
    {@124C-1267}
    a9EF4_2a50[v2b].f := PR305_byte(a0)^.v and 127;
    {@1267-1279}
    a9EF1_2a50[v2b].f := a1;
    {@1279-128B}
    a9EF2_2a50[v2b].f := a2;
    {@128B-12A7}
    pO135_0D94(longint(a0), 8, @v4b, @v5b, @v7b);
    if (v4b <> 0) or (v5b = 0) or (a3EBA_2a50[v5b].f = 255) then
      a9EF4_2a50[v2b].f := 0
    else
    begin
      {@12D8-12DC}
      pO135_122B := 1;
      if (a3 <> 0) and (PR18_byte(PR487_pointer(a0)^.v)^.v = 0) then
      begin
        {@12F7-1373}
        for v3b := 1 to bA6DF do
        begin
          {@130C-136B}
          if aA6A0_b509[v3b].f = a0 then
          begin
            {@132A-1350}
            if aA6A6_30da[v3b].f <> 31 then
              v5b := aA6A6_30da[v3b].f;
            asm
  db 138,70,253,48,228,186,7,0,247,226,139,248,129,199,160,166,30,87,184,7,0,80
  call XR670_046E
            end;
          end;
        end;
        {@1373-1377}
        v6b := 0;
        for v3b := 1 to bA6DF do
        begin
          {@138C-13DE}
          if (aA6A0_b509[v3b].f <> nil) and (aA6A4_8673[v3b].f = a1) and (aA6A5_8673[v3b].f = a2) then
            v6b := 1;
        end;
        {@13E6-140C}
        if v6b = 0 then
          PRB7_50_byte(pA6E0)^.a[a2, a1] := v5b;
      end;
      {@140C-1410}
      pO135_04F4;
    end;
    {@1410-1412}
    Exit;
  end;
  {@1412-1416}
  pO135_122B := 1;
end;

{ 141F }
procedure pO135_141F(a0: longint; a1: byte; a2: byte);
begin
  {@1422-142D}
  PR4_byte(pA6E0)^.v := a2;
  {@142D-144B}
  PR5_byte(pA6E0)^.v := a9EF4_2a50[pO135_0D1A(longint(a0))].f;
  if bAEF0 <> 0 then
    asm
  db 255,118,12,255,118,10
  push cs
  call near ptr pO135_0CA2
  db 80,255,118,12,255,118,10
  push cs
  call near ptr pO135_0CCA
  db 80,138,70,8,80,176,8,80
  push cs
  call near ptr pO135_0A4D
    end;
  {@1473-147C}
  PR4_byte(pA6E0)^.v := 0;
  {@147C-1485}
  PR5_byte(pA6E0)^.v := 1;
end;

{ 14A9 }
function pO135_14A9(a0: shortint; a1: shortint): byte;
var
  v2b: byte;
  v3b: byte;
  v7p: pointer;
begin
  if false then begin
    if LSV = [27..29] then;
  end;
  {@14AF-14CD}
  v2b := PRB7_50_byte(pA6E0)^.a[a1, a0];
  if v2b in [27..29] then
  begin
    {@14E0-14ED}
    v7p := pAE5D;
    {@14ED-1591}
    while v7p <> nil do
    begin
      {@14F8-157D}
      for v3b := 1 to 9 do
      begin
        {@1501-1577}
if (PRA16_byte(v7p)^.a[v3b] <> 0) and ((PR26_shortint(v7p)^.v + a3EAC_ff2a[a53E5_ec3f[v3b]]) = a0)
            and ((PR27_shortint(v7p)^.v + a3EB5_ff2a[a53E5_ec3f[v3b]]) = a1) then
          v2b := PRA7_byte(v7p)^.a[v3b];
      end;
      {@157D-158E}
      v7p := PR4_pointer(v7p)^.v;
    end;
  end
  else
  begin
    {@1593-15F3}
    if v2b = 31 then
      for v3b := 1 to bA6DF do
      begin
        {@15AE-15EB}
        if (aA6A4_30da[v3b].f = byte(a0)) and (aA6A5_30da[v3b].f = byte(a1)) then
          v2b := aA6A6_30da[v3b].f;
      end;
  end;
  {@15F3-15F9}
  pO135_14A9 := v2b;
end;

{ 1602 }
function pO135_1602(a0: integer; a1: integer; a2: longint): byte;
var
  v2b: byte;
  v3b: byte;
  v5i: integer;
  v7i: integer;
  _f1: array[1..1] of byte;
begin
  asm
  db 139,70,8,43,70,12,153,49,208,41,208,137,70,251
  end;
  asm
  db 139,70,6,43,70,10,153,49,208,41,208,137,70,249
  end;
  {@1624-1628}
  v2b := 0;
  {@1628-162C}
  v3b := 0;
  {@162C-17EA}
  while v3b = 0 do
  begin
    {@1635-17DE}
    case v2b of
1: v3b := Ord((PV4_0_integer(a2).v < a1) and (PV4_2_integer(a2).v > a0)
          and ((618 * v5i div 256) >= v7i) and ((106 * v5i div 256) <= v7i));
3: v3b := Ord((PV4_0_integer(a2).v > a1) and (PV4_2_integer(a2).v > a0)
          and ((618 * v5i div 256) >= v7i) and ((106 * v5i div 256) <= v7i));
5: v3b := Ord((PV4_0_integer(a2).v > a1) and (PV4_2_integer(a2).v < a0)
          and ((618 * v5i div 256) >= v7i) and ((106 * v5i div 256) <= v7i));
7: v3b := Ord((PV4_0_integer(a2).v < a1) and (PV4_2_integer(a2).v < a0)
          and ((618 * v5i div 256) >= v7i) and ((106 * v5i div 256) <= v7i));
      0: v3b := Ord((PV4_0_integer(a2).v <= a1) and ((618 * v5i div 256) <= v7i));
      2: v3b := Ord((PV4_2_integer(a2).v >= a0) and ((106 * v5i div 256) >= v7i));
      4: v3b := Ord((PV4_0_integer(a2).v >= a1) and ((618 * v5i div 256) <= v7i));
      6: v3b := Ord((PV4_2_integer(a2).v <= a0) and ((106 * v5i div 256) >= v7i));
    end;
    {@17DE-17E7}
    if v3b = 0 then
      Inc(v2b);
  end;
  {@17EA-17F0}
  pO135_1602 := v2b;
end;

{ 17F9 }
function pO135_17F9(a0: word; a1: word; a2: word; a3: word): byte;
var
  _f1: array[1..1] of byte;
begin
  asm
  db 255,118,12,255,118,10
  push cs
  call near ptr pO135_0CA2
  db 152,80,255,118,12,255,118,10
  push cs
  call near ptr pO135_0CCA
  db 152,80,255,118,8,255,118,6
  push cs
  call near ptr pO135_0CA2
  db 152,80,255,118,8,255,118,6
  push cs
  call near ptr pO135_0CCA
  db 152,80
  push cs
  call near ptr pO135_1602
  db 136,70,255
  end;
end;

{ 183F }
begin
end.

