{ O065: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O065;

interface

uses GAMEDATA;

procedure pO065_1C1E;

implementation

uses LIT, O075, O0A1, O0E2, O0EC, O108, O111, O12A, O135, O13E, R1C3, R47F, R670;

type
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  E7_byte = record f: byte; _r: array[1..6] of byte end;
  E7_pointer = record f: pointer; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R195_byte = record _p: array[1..195] of byte; v: byte end;
  R196_byte = record _p: array[1..196] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R305_byte = record _p: array[1..305] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R483_longint = record _p: array[1..483] of byte; v: longint end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R7_byte = record _p: array[1..7] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
  PR0_byte = ^R0_byte;
  PR18_byte = ^R18_byte;
  PR195_byte = ^R195_byte;
  PR196_byte = ^R196_byte;
  PR21_byte = ^R21_byte;
  PR305_byte = ^R305_byte;
  PR31_byte = ^R31_byte;
  PR327_byte = ^R327_byte;
  PR33_byte = ^R33_byte;
  PR483_longint = ^R483_longint;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR50_byte = ^R50_byte;
  PR54_byte = ^R54_byte;
  PR7_byte = ^R7_byte;
  PR8_byte = ^R8_byte;
  PRB7_50_byte = ^RB7_50_byte;
var
  a090C_e5e5: array[0..8189, 0..3] of byte absolute d090C;
  a091C_e5e5: array[0..8189, 0..3] of byte absolute d091C;
  a092C_ec3f: array[0..32759] of byte absolute d092C;
  a0930_8441: array[0..8189, 0..3] of shortint absolute d0930;
  a0938_8441: array[0..8189, 0..3] of shortint absolute d0938;
  a097C_ec3f: array[0..32759] of byte absolute d097C;
  a3EAC_ec3f: array[0..32759] of byte absolute d3EAC;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ec3f: array[0..32759] of byte absolute d3EB5;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  a3EBD_2a50: array[0..8189] of E4_byte absolute d3EBD;
  a820E_ec3f: array[0..32759] of byte absolute d820E;
  a820E_ff2a: array[0..32759] of shortint absolute d820E;
  a8210_ec3f: array[0..32759] of byte absolute d8210;
  a8210_ff2a: array[0..32759] of shortint absolute d8210;
  a8214_ec3f: array[0..32759] of byte absolute d8214;
  a8214_ff2a: array[0..32759] of shortint absolute d8214;
  a9EF1_2a50: array[0..8189] of E4_byte absolute d9EF1;
  a9EF2_2a50: array[0..8189] of E4_byte absolute d9EF2;
  a9EF3_2a50: array[0..8189] of E4_byte absolute d9EF3;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aA6A0_b509: array[0..4679] of E7_pointer absolute dA6A0;
  aA6A4_30da: array[0..4679] of E7_byte absolute dA6A4;
  aA6A5_30da: array[0..4679] of E7_byte absolute dA6A5;
  aA6A6_30da: array[0..4679] of E7_byte absolute dA6A6;
  b820E: byte absolute d820E;
  b820F: byte absolute d820F;
  b8210: byte absolute d8210;
  b8211: byte absolute d8211;
  b8212: byte absolute d8212;
  b8213: byte absolute d8213;
  b8214: byte absolute d8214;
  b8215: byte absolute d8215;
  b8218: byte absolute d8218;
  b821A: byte absolute d821A;
  b821C: byte absolute d821C;
  b821E: byte absolute d821E;
  b880C: byte absolute d880C;
  b9EF4: byte absolute d9EF4;
  bA0A5: byte absolute dA0A5;
  bA6DF: byte absolute dA6DF;
  bA7CE: byte absolute dA7CE;
  bA7CF: byte absolute dA7CF;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bAEE8: byte absolute dAEE8;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  pA6E0: pointer absolute dA6E0;
  sb820E: shortint absolute d820E;
  sb8210: shortint absolute d8210;
  sb821C: shortint absolute d821C;
  sbA9F3: shortint absolute dA9F3;
  sbA9F4: shortint absolute dA9F4;

procedure pO065_0000(a0: byte; a1: byte; a2: byte); far; forward;
function pO065_010F(a0: byte; a1: byte; a2: byte): byte; far; forward;
procedure pO065_065F; far; forward;
function pO065_0723: byte; far; forward;
procedure pO065_0803; far; forward;
procedure pO065_09A1; far; forward;
procedure pO065_0CB6; far; forward;
procedure pO065_0E34; far; forward;
procedure pO065_0EAD; far; forward;
procedure pO065_0F66; far; forward;
function pO065_1090(a0: shortint; a1: shortint): byte; far; forward;
function pO065_10C1(a0: byte; a1: shortint; a2: shortint; a3: shortint; a4: shortint; a5: byte): byte; far; forward;
function pO065_1209(a0: byte): byte; far; forward;
procedure pO065_184C; far; forward;

{ 0000 }
procedure pO065_0000(a0: byte; a1: byte; a2: byte);
var loc: array[1..2] of byte;
begin
  asm
    db 138,70,10,48,228,139,200,160,23,130,152,139,240,209,224,209,224,1,240,139,208,160,22,130,152,209,224,139
    db 240,209,224,1,240,3,194,5,21,0,3,193,136,70,255,138,70,8,48,228,139,208,160,23,130,152,139,240
    db 209,224,209,224,1,240,5,10,0,3,194,136,70,254,128,126,255,0,124,53,128,126,255,49,127,47,128,126
    db 254,0,124,41,128,126,254,24,127,35,138,70,6,48,228,64,138,216,138,70,255,152,139,200,138,70,254,152
    db 186,50,0,247,226,196,62,224,166,3,248,3,249,38,136,93,7
  end;
end;

{ 010F }
function pO065_010F(a0: byte; a1: byte; a2: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  { 008D }
  function pO065_008D(b0: shortint; b1: shortint; b2: byte): byte;
  var
    _f1: array[1..1] of byte;
  begin
    {@0093-00E7}
    if (b0 >= 0) and (b0 <= 15) and (b1 >= 0) and (b1 <= 15) then
    begin
      {@00AB-00E5}
      if pO12A_048A(byte(b0), byte(b1), b2) = 0 then
        pO065_008D := 1
      else
      begin
        {@00C6-00E5}
        if pO12A_05B9(byte(b0), byte(b1), b2) = 0 then
          pO065_008D := 0
        else
          pO065_008D := 3;
      end;
      {@00E5-00E7}
      Exit;
    end;
    {@00E7-0102}
    if (byte(b1) = bA9F4) and ((b2 = 2) or (b2 = 6)) then
    begin
      {@00FC-0100}
      pO065_008D := 0;
      {@0100-0102}
      Exit;
    end;
    {@0102-0106}
    pO065_008D := 1;
  end;

begin
  {@0115-0127}
  v4b := Byte((a2 + 4) mod 8);
  {@0127-013B}
  v2b := pO065_008D(a0, a1, a2);
  {@013B-0171}
  v3b := pO065_008D(shortint(a0) + a3EAC_ff2a[a2], shortint(a1) + a3EB5_ff2a[a2], v4b);
  {@0171-017A}
  pO065_010F := v2b or v3b;
end;

{ 065F }
procedure pO065_065F;
var
  v1b: byte;
  v2sb: shortint;
  _f1: array[1..2] of byte;
  v2b: byte absolute v2sb;
  v1sb: shortint absolute v1b;
  { 0183 }
  procedure pO065_0183;
  var loc: array[1..2] of byte;
  begin
    asm
      db 198,70,254,2,235,3,254,70,254,198,70,255,0,235,3,254,70,255,138,70,255,80,138,70,254,80,176,22
      db 80
      push cs
      call near ptr pO065_0000
      db 128,126,255,5,117,232,128,126,254,4,117,217,128,62,25,130,1,117,68,198,70,254,2,235,3,254,70,254
      db 138,70,254,48,228,72,80,138,70,254,80,176,4,80
      push cs
      call near ptr pO065_0000
      db 138,70,254,80,138,70,254,80,176,3,80
      push cs
      call near ptr pO065_0000
      db 138,70,254,48,228,64,80,138,70,254,80,176,13,80
      push cs
      call near ptr pO065_0000
      db 128,126,254,4,117,196,235,33,128,62,25,130,3,117,26,176,1,80,176,2,80,176,8,80
      push cs
      call near ptr pO065_0000
      db 176,5,80,176,4,80,176,0,80
      push cs
      call near ptr pO065_0000
    end;
  end;

  { 0228 }
  procedure pO065_0228;
  var loc: array[1..2] of byte;
  begin
    asm
      db 128,62,24,130,1,117,54,176,3,80,176,0,80,176,5,80
      push cs
      call near ptr pO065_0000
      db 176,4,80,176,0,80,176,5,80
      push cs
      call near ptr pO065_0000
      db 176,3,80,176,1,80,176,10,80
      push cs
      call near ptr pO065_0000
      db 176,4,80,176,1,80,176,10,80
      push cs
      call near ptr pO065_0000
      db 235,52,176,3,80,176,0,80,176,22,80
      push cs
      call near ptr pO065_0000
      db 176,4,80,176,0,80,176,22,80
      push cs
      call near ptr pO065_0000
      db 176,3,80,176,1,80,176,22,80
      push cs
      call near ptr pO065_0000
      db 176,4,80,176,1,80,176,22,80
      push cs
      call near ptr pO065_0000
    end;
  end;

  { 02A5 }
  procedure pO065_02A5;
  var loc: array[1..6] of byte;
  begin
    asm
      db 139,126,6,54,138,69,255,80,139,126,6,54,138,69,254,152,72,80,176,6,80
      push cs
      call near ptr pO065_010F
      db 8,192,117,35,139,126,6,54,138,69,255,152,72,80,139,126,6,54,138,69,254,80,176,0,80
      push cs
      call near ptr pO065_010F
      db 8,192,117,6,198,70,250,1,235,4,198,70,250,0,198,70,254,0,198,70,255,1,235,3,254,70,255,138
      db 70,255,60,1,117,98,160,24,130,60,0,117,39,160,25,130,60,0,117,6,198,70,254,22,235,24,60,3
      db 116,4,60,1,117,16,128,126,250,0,116,6,198,70,254,0,235,4,198,70,254,13,235,49,60,3,116,4
      db 60,1,117,41,128,62,25,130,0,117,18,128,126,250,0,116,6,198,70,254,15,235,4,198,70,254,5,235
      db 16,128,126,250,0,116,6,198,70,254,18,235,4,198,70,254,2,233,207,0,60,2,117,34,160,24,130,60
      db 0,117,6,198,70,252,22,235,18,60,3,117,6,198,70,252,17,235,8,60,1,117,4,198,70,252,5,233
      db 169,0,60,3,117,82,160,25,130,60,0,117,31,128,62,24,130,0,117,6,198,70,253,22,235,16,128,126
      db 250,0,116,6,198,70,253,16,235,4,198,70,253,10,235,42,60,3,117,18,128,126,250,0,116,6,198,70
      db 253,20,235,4,198,70,253,7,235,20,60,1,117,16,128,126,250,0,116,6,198,70,253,1,235,4,198,70
      db 253,3,235,83,60,4,117,79,160,25,130,60,0,116,4,60,3,117,33,160,24,130,60,0,117,6,198,70
      db 251,22,235,18,60,3,117,6,198,70,251,23,235,8,60,1,117,4,198,70,251,10,235,35,60,1,117,31
      db 160,24,130,60,0,117,6,198,70,251,13,235,18,60,3,117,6,198,70,251,21,235,8,60,1,117,4,198
      db 70,251,6,128,126,255,4,116,3,233,188,254,176,1,80,176,0,80,138,70,254,80
      push cs
      call near ptr pO065_0000
      db 176,2,80,176,0,80,138,70,252,80
      push cs
      call near ptr pO065_0000
      db 176,1,80,176,1,80,138,70,253,80
      push cs
      call near ptr pO065_0000
      db 176,2,80,176,1,80,138,70,251,80
      push cs
      call near ptr pO065_0000
    end;
  end;

  { 047B }
  procedure pO065_047B;
  var
    w1b: byte;
    w2b: byte;
    w3b: byte;
    w4b: byte;
    w5b: byte;
    w6b: byte;
    w7b: byte;
    w8b: byte;
    _f1: array[1..2] of byte;
  begin
    {@0481-049D}
    w7b := pO065_010F(v1b, v2sb - 1, 2);
    {@049D-04B9}
    w8b := pO065_010F(v1sb + 1, v2b, 0);
    if (w7b = 0) and (w8b = 0) then
      w6b := 1
    else
      w6b := 0;
    {@04CF-0621}
    for w1b := 1 to 4 do
      case w1b of
        1: case b8218 of
            0: begin
              {@04E6-04F6}
              if w7b = 1 then
                w2b := 4
              else
                w2b := 22;
            end;
            3: w2b := 15;
            1: w2b := 5;
          end;
        2: begin
          {@0514-059E}
          if b8218 = 0 then
            case w7b of
              0: w4b := 22;
              3: begin
                {@052C-0550}
                if (b821A = 0) and (w8b <> 0) then
                  w4b := 24
                else
                begin
                  {@053F-0550}
                  if b821A = 0 then
                    w4b := 7
                  else
                    w4b := 1;
                end;
              end;
              1: begin
                {@0556-0573}
                if b821A = 0 then
                begin
                  {@055D-056D}
                  if w8b <> 0 then
                    w4b := 11
                  else
                    w4b := 7;
                end
                else
                  w4b := 3;
              end;
            end
          else
          begin
            {@0575-059E}
            if b821A <> 0 then
              w4b := 9
            else
            begin
              {@0582-059E}
              if w8b <> 0 then
                w4b := 5
              else
              begin
                {@058E-059E}
                if w6b <> 0 then
                  w4b := 17
                else
                  w4b := 19;
              end;
            end;
          end;
        end;
        3: case b8218 of
            0: w3b := 22;
            3: w3b := 16;
            1: w3b := 10;
          end;
        4: begin
          {@05C9-0618}
          if b8218 = 0 then
          begin
            {@05D0-05F9}
            if w7b = 0 then
              w5b := 22
            else
            begin
              {@05DC-05F9}
              if b821A <> 0 then
                w5b := 4
              else
              begin
                {@05E9-05F9}
                if w8b = 0 then
                  w5b := 8
                else
                  w5b := 12;
              end;
            end;
          end
          else
            asm
    db 128,62,26,130,0,116,6,198,70,251,14,235,16,128,126,248,0,117,6,198,70,251,23,235,4,198,70,251
    db 10
            end;
        end;
      end;
    asm
    db 176,5,80,176,0,80,138,70,254,80
    push cs
    call near ptr pO065_0000
    end;
    asm
    db 176,6,80,176,0,80,138,70,252,80
    push cs
    call near ptr pO065_0000
    end;
    asm
    db 176,5,80,176,1,80,138,70,253,80
    push cs
    call near ptr pO065_0000
    end;
    asm
    db 176,6,80,176,1,80,138,70,251,80
    push cs
    call near ptr pO065_0000
    end;
  end;

begin
  asm
    db 196,62,224,166,129,199,7,0,6,87,184,226,4,80,176,22,80,154,127,26,37,8,198,6,23,130,254,235
    db 4,254,6,23,130,198,6,22,130,250,235,4,254,6,22,130,160,22,130,152,139,208,160,243,169,152,3,194
    db 136,70,255,160,23,130,152,139,208,160,244,169,152,3,194,136,70,254,138,70,255,80,138,70,254,80,176,6
    db 80
    push cs
    call near ptr pO065_010F
    db 162,25,130,138,70,255,80,138,70,254,80,176,0,80
    push cs
    call near ptr pO065_010F
    db 162,24,130,138,70,255,80,138,70,254,80,176,2,80
    push cs
    call near ptr pO065_010F
    db 162,26,130,138,70,255,80,138,70,254,80,176,4,80
    push cs
    call near ptr pO065_010F
    db 162,27,130,85
    push cs
    call near ptr pO065_0183
    db 85
    push cs
    call near ptr pO065_0228
    db 85
    push cs
    call near ptr pO065_02A5
    db 85
    push cs
    call near ptr pO065_047B
    db 128,62,22,130,6,116,3,233,120,255,128,62,23,130,2,116,3,233,99,255
  end;
end;

{ 0723 }
function pO065_0723: byte;
var
  _f1: array[1..1] of byte;
begin
  {@0729-0737}
  pO065_0723 := a097C_ec3f[b821E];
end;

{ 0803 }
procedure pO065_0803;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
  { 073E }
  procedure pO065_073E(b0: shortint; b1: shortint);
  begin
    {@0741-075D}
    PRB7_50_byte(pA6E0)^.a[b1, b0] := 58;
    if b0 < 49 then
    begin
      {@0766-0794}
      PRB7_50_byte(pA6E0)^.a[b1, b0 + 1] := pO0E2_1374(1, 2) + 58;
      if (b0 + 1) < 49 then
        PRB7_50_byte(pA6E0)^.a[b1, b0 + 2] := pO0E2_1374(1, 2) + 58;
      {@07CD-07F7}
      if (b0 + 2) < 49 then
        PRB7_50_byte(pA6E0)^.a[b1, b0 + 3] := 61;
    end;
    {@07F7-07FF}
    v1b := 1;
  end;

begin
  {@0809-0817}
  if PR50_byte(p87F8)^.v = 0 then
    Exit;
  {@0817-082E}
  v3b := 34 - pO0E2_1374(5, 4);
  {@082E-0844}
  while ((v3sb + 2) mod 7) > 0 do
    Dec(v3b);
  {@0844-084A}
  v2b := v3b;
  {@084A-084E}
  v1b := 1;
  for v4b := 0 to 24 do
  begin
    {@0857-0994}
    if v3sb <= 49 then
    begin
      {@0860-087C}
      PRB7_50_byte(pA6E0)^.a[v4sb, v3sb] := 52;
      if v3sb < 49 then
      begin
        {@0885-0966}
        if Byte(pO0E2_1374(1, 20)) <= v1b then
          pO065_073E(v3sb + 1, v4b)
        else
        begin
          {@08A7-08AA}
          Inc(v1b);
          {@08AA-08D8}
          PRB7_50_byte(pA6E0)^.a[v4sb, v3sb + 1] := pO0E2_1374(1, 2) + 52;
          if (v3sb + 1) < 49 then
            PRB7_50_byte(pA6E0)^.a[v4sb, v3sb + 2] := 55;
          {@0900-092A}
          if (v3sb + 2) < 49 then
            PRB7_50_byte(pA6E0)^.a[v4sb, v3sb + 3] := 55;
          {@092A-0966}
          if (v3sb + 3) < 49 then
            PRB7_50_byte(pA6E0)^.a[v4sb, v3sb + 4] := pO0E2_1374(1, 2) + 55;
        end;
      end;
      {@0966-0991}
      if (v3sb + 4) < 49 then
        PRB7_50_byte(pA6E0)^.a[v4sb, v3sb + 5] := 52;
      {@0991-0994}
      Inc(v3b);
    end;
  end;
end;

{ 09A1 }
procedure pO065_09A1;
var
  _f1: array[1..1] of byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
begin
  {@09A7-09B4}
  if (pO065_0723 and 128) <> 0 then
    Exit;
  {@09B4-09B8}
  v4b := 5;
  if (pO065_0723 and 2) <> 0 then
    Dec(v4b, 3);
  {@09C6-09D4}
  if (pO065_0723 and 4) <> 0 then
    Dec(v4b, 3);
  {@09D4-09E2}
  if (pO065_0723 and 64) <> 0 then
    Inc(v4b, 2);
  {@09E2-09F0}
  if (pO065_0723 and 8) <> 0 then
    Inc(v4b, 5);
  {@09F0-09FA}
  if v4sb < 0 then
    v4b := 1;
  {@09FA-0B34}
  for v2b := 0 to 49 do
    for v3b := 1 to 24 do
    begin
      {@0A0C-0B22}
if (a3EBD_2a50[PRB7_50_byte(pA6E0)^.a[v3sb, v2sb]].f = 37)
          and (a3EBD_2a50[PRB7_50_byte(pA6E0)^.a[v3sb - 1, v2sb]].f = 37) and (v4sb >= pO0E2_1374(1,
          100)) then
      begin
        {@0A81-0B22}
        if v4sb >= pO0E2_1374(1, 100) then
          PRB7_50_byte(pA6E0)^.a[v3sb, v2sb] := pO0E2_1374(1, 2) + 41
        else
        begin
          {@0AC7-0AF5}
          PRB7_50_byte(pA6E0)^.a[v3sb - 1, v2sb] := pO0E2_1374(1, 5) + 31;
          {@0AF5-0B22}
          PRB7_50_byte(pA6E0)^.a[v3sb, v2sb] := pO0E2_1374(1, 5) + 36;
        end;
      end;
    end;
end;

{ 0CB6 }
procedure pO065_0CB6;
var
  v1b: byte;
  v2b: byte;
  v4w: word;
  v4i: integer absolute v4w;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
  { 0B38 }
  procedure pO065_0B38(b0: shortint; b1: shortint; b2: byte; b3: byte; b4: byte; b5: byte; b6: byte);
  var
    w1b: byte;
    _f1: array[1..1] of byte;
  begin
    {@0B3E-0B4C}
    w1b := pO0E2_1374(1, 100);
    if w1b <= b2 then
    begin
      {@0B54-0B81}
      PRB7_50_byte(pA6E0)^.a[b1, b0] := pO0E2_1374(1, 2) + 49;
      {@0B81-0B84}
      Exit;
    end;
    {@0B84-0BBC}
    if w1b <= (b2 + b3) then
    begin
      {@0B9D-0BB9}
      PRB7_50_byte(pA6E0)^.a[b1, b0] := 44;
      {@0BB9-0BBC}
      Exit;
    end;
    {@0BBC-0C06}
    if w1b <= (b2 + b3 + 1) then
    begin
      {@0BD6-0C03}
      PRB7_50_byte(pA6E0)^.a[b1, b0] := pO0E2_1374(1, 5) + 44;
      {@0C03-0C06}
      Exit;
    end;
    {@0C06-0C4F}
    if w1b <= (b2 + b3 + b4 + b5) then
    begin
      {@0C31-0C4D}
      PRB7_50_byte(pA6E0)^.a[b1, b0] := 68;
      {@0C4D-0C4F}
      Exit;
    end;
    {@0C4F-0CB0}
    if w1b <= (b6 + (b2 + b3 + b4 + b5)) then
      PRB7_50_byte(pA6E0)^.a[b1, b0] := pO0E2_1374(1, 6) + 61;
  end;

begin
  {@0CBC-0CC1}
  v4w := 50;
  if (pO065_0723 and 16) <> 0 then
    Inc(v4w, 10);
  {@0CCF-0CDD}
  if (pO065_0723 and 32) <> 0 then
    Inc(v4w, 30);
  {@0CDD-0CEB}
  if (pO065_0723 and 64) <> 0 then
    Inc(v4w, 20);
  {@0CEB-0CF9}
  if (pO065_0723 and 4) <> 0 then
    Dec(v4w, 10);
  {@0CF9-0D07}
  if (pO065_0723 and 2) <> 0 then
    Dec(v4w, 20);
  {@0D07-0D15}
  if (pO065_0723 and 128) <> 0 then
    Dec(v4w, 50);
  {@0D15-0E30}
  for v1b := 0 to 49 do
    for v2b := 0 to 24 do
    begin
      {@0D27-0E1E}
      if a3EBD_2a50[PRB7_50_byte(pA6E0)^.a[v2sb, v1sb]].f = 37 then
        case v4i of
          -30..9: pO065_0B38(v1b, v2b, 0, 0, 0, 30, 15);
          10..29: pO065_0B38(v1b, v2b, 0, 1, 5, 20, 10);
          30..69: pO065_0B38(v1b, v2b, 0, 2, 5, 10, 5);
          70..89: pO065_0B38(v1b, v2b, 10, 2, 10, 10, 1);
          90..110: pO065_0B38(v1b, v2b, 15, 5, 15, 10, 1);
        end;
    end;
end;

{ 0E34 }
procedure pO065_0E34;
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..2] of byte;
begin
  {@0E3A-0E50}
  FillChar(PR7_byte(pA6E0)^.v, 1250, 69);
  {@0E50-0E5C}
  v1b := PR195_byte(p87F8)^.v;
  {@0E5C-0E68}
  v2b := PR196_byte(p87F8)^.v;
  {@0E68-0E6D}
  b821E := 15;
  {@0E6D-0E71}
  pO065_0803;
  {@0E71-0E75}
  pO065_09A1;
  {@0E75-0E79}
  pO065_0CB6;
end;

{ 0EAD }
procedure pO065_0EAD;
var
  _f1: array[1..10] of byte;
begin
  if false then begin
    if LV = 'DungCom' then;
    if LSV = [1..2] then;
    if LV = 'WildCom' then;
  end;
  asm
  db 196,62,248,135,38,128,125,33,0,116,32,141,126,247,22,87,191,125,14,14,87,154,111,10,37,8,160,248
  db 169,80,176,0,80,176,25,80
  call pO13E_0022
  db 235,68,196,62,248,135,38,138,69,57,80,191,133,14,14,87,154,36,13,37,8,116,13,196,62,248,135,38
  db 138,69,57,136,70,255,235,4,198,70,255,0,141,126,247,22,87,191,165,14,14,87,154,111,10,37,8,138
  db 70,255,80,176,0,80,176,39,80
  call pO13E_0022
  end;
  asm
  db 184,233,4,80,154,63,2,37,8,163,224,166,137,22,226,166
  end;
  asm
  db 196,62,224,166,38,198,69,4,0
  end;
  asm
  db 196,62,224,166,38,198,69,5,1
  end;
  asm
  db 196,62,224,166,38,198,69,6,0
  end;
  if PR33_byte(p87F8)^.v <> 0 then
  begin
    asm
  push cs
  call near ptr pO065_065F
    end;
    asm
  db 235,4
    end;
  end;
  asm
  push cs
  call near ptr pO065_0E34
  end;
end;

{ 0F66 }
procedure pO065_0F66;
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
begin
  {@0F6C-0F79}
  v4p := p9CF2;
  {@0F79-0F7D}
  v5b := 0;
  {@0F7D-108C}
  while v4p <> nil do
  begin
    {@0F88-0F93}
    pO0EC_0EBF(v4p);
    {@0F93-0F96}
    Inc(v5b);
    {@0F96-0FAC}
    GetMem(PR487_pointer(v4p)^.v, 22);
    {@0FAC-0FBF}
    XR670_046E(@PR0_byte(PR487_pointer(v4p)^.v)^.v, 22);
    if v5b > PR31_byte(p87F8)^.v then
      PR18_byte(PR487_pointer(v4p)^.v)^.v := 1;
    {@0FD9-0FF2}
    PR8_byte(PR487_pointer(v4p)^.v)^.v := a092C_ec3f[bA9F5 shr 1];
    if PR495_byte(v4p)^.v = 1 then
      PR8_byte(PR487_pointer(v4p)^.v)^.v := Byte((PR8_byte(PR487_pointer(v4p)^.v)^.v + 4) mod 8);
    {@1021-102E}
    v6b := PR327_byte(v4p)^.v and 127;
if (PR495_byte(v4p)^.v = 0) and (PR18_byte(PR487_pointer(v4p)^.v)^.v = 1) and ((v6b = 0)
        or (v6b > 102)) then
      PR327_byte(v4p)^.v := PR31_byte(p87F8)^.v + 128;
    {@1069-1076}
    PR21_byte(PR487_pointer(v4p)^.v)^.v := 1;
    {@1076-1089}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 1090 }
function pO065_1090(a0: shortint; a1: shortint): byte;
var
  _f1: array[1..1] of byte;
begin
  {@1096-10B4}
  if (a0 >= 0) and (a0 < 11) or (a1 >= 0) and (a1 < 6) then
  begin
    {@10AE-10B2}
    pO065_1090 := 0;
    {@10B2-10B4}
    Exit;
  end;
  {@10B4-10B8}
  pO065_1090 := 1;
end;

{ 10C1 }
function pO065_10C1(a0: byte; a1: shortint; a2: shortint; a3: shortint; a4: shortint; a5: byte): byte;
var
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
begin
  asm
  db 128,126,14,0,124,71,128,126,12,0,124,65,128,126,14,10,127,59,128,126,12,5,127,53,138,70,14,152
  db 80,138,70,12,152,186,11,0,247,226,139,216,138,70,6,48,228,186,66,0,247,226,139,200,160,28,130,152
  db 186,8,1,247,226,139,248,3,249,3,251,88,3,248,128,189,254,127,0,117,7,198,70,255,0,233,229,0
  end;
  {@111B-1153}
  a9EF1_2a50[a0].f := a1 + a3 * 6 + a4 * 5 + 22;
  {@1153-117B}
  a9EF2_2a50[a0].f := a2 + a4 * 5 + 10;
  asm
  db 138,70,16,48,228,139,248,209,231,209,231,255,181,133,165,255,181,131,165,176,8,80,141,126,253,22,87,141
  db 126,252,22,87,141,126,254,22,87
  call pO135_0D94
  end;
  if (v3b = 0) and (v4b > 0) and (a3EBA_2a50[v4b].f < 255) then
  begin
    {@11C3-11C7}
    pO065_10C1 := 1;
    asm
  db 138,70,14,152,80,138,70,12,152,186,11,0,247,226,139,216,138,70,6,48,228,186,66,0,247,226,139,200
  db 160,28,130,152,186,8,1,247,226,139,248,3,249,3,251,88,3,248,198,133,254,127,0
    end;
    {@11FA-11FC}
    Exit;
  end;
  {@11FC-1200}
  pO065_10C1 := 0;
end;

{ 1209 }
function pO065_1209(a0: byte): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..1] of byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  _f2: array[1..1] of byte;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  v20b: byte;
  v21b: byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  v24sb: shortint absolute v24b;
  v23sb: shortint absolute v23b;
  v22sb: shortint absolute v22b;
  v21sb: shortint absolute v21b;
  v12sb: shortint absolute v12b;
  v11sb: shortint absolute v11b;
begin
  {@120F-1213}
  v3b := 1;
  {@1213-1217}
  v4b := 0;
  {@1217-121B}
  v7b := 1;
  {@121B-121F}
  v15b := 0;
  {@121F-1223}
  v20b := 0;
  {@1223-1230}
  v17b := a820E_ec3f[sb821C];
  {@1230-123D}
  v18b := a8210_ec3f[sb821C];
  {@123D-166E}
  repeat
    {@123D-1262}
    v9b := a091C_e5e5[a8214_ff2a[sb821C], v20b] shr 1;
    case v7b of
      1: begin
        {@126C-128B}
        v11b := a3EAC_ec3f[a092C_ec3f[(v9b + 2) mod 4]];
        {@128B-12AA}
        v12b := a3EB5_ec3f[a092C_ec3f[(v9b + 2) mod 4]];
        {@12AA-12DC}
        v21b := a0930_8441[Ord(v20b > 0), v9b] + v11sb * v15b;
        {@12DC-130E}
        v22b := a0938_8441[Ord(v20b > 0), v9b] + v12sb * v15b;
        {@130E-1314}
        v23b := v21b;
        {@1314-131A}
        v24b := v22b;
        {@131A-131E}
        v16b := 1;
        {@131E-1322}
        v7b := 2;
        {@1322-1326}
        v19b := 1;
      end;
      2: begin
        {@132D-134B}
        v11b := a3EAC_ec3f[a092C_ec3f[(v9b + 1) mod 4]];
        {@134B-1369}
        v12b := a3EB5_ec3f[a092C_ec3f[(v9b + 1) mod 4]];
        {@1369-1381}
        v23b := v21sb + v11sb * v16b;
        {@1381-1399}
        v24b := v22sb + v12sb * v16b;
        {@1399-139D}
        v7b := 3;
        {@139D-13A0}
        Inc(v19b);
      end;
      3: begin
        {@13A6-13C6}
        v11b := a3EAC_ec3f[a092C_ec3f[(v9b + 3) mod 4]];
        {@13C6-13E6}
        v12b := a3EB5_ec3f[a092C_ec3f[(v9b + 3) mod 4]];
        {@13E6-13FE}
        v23b := v21sb + v11sb * v16b;
        {@13FE-1416}
        v24b := v22sb + v12sb * v16b;
        {@1416-141A}
        v7b := 2;
        {@141A-141D}
        Inc(v16b);
        {@141D-1420}
        Inc(v19b);
      end;
    end;
    {@1420-1442}
    if (v23sb < 0) or (v24sb < 0) or (v23sb > 10) or (v24sb > 5) then
      v5b := 1
    else
      v5b := 0;
    asm
  db 128,126,249,1,119,3,233,253,0,128,126,251,0,116,16,138,70,233,80,138,70,232,80
  push cs
  call near ptr pO065_1090
  db 8,192,116,46,128,126,253,0,116,22,160,28,130,152,139,248,138,133,18,130,152,139,208,138,70,237,48,228
  db 59,194,125,18,128,126,253,0,116,3,233,194,0,128,126,237,11,119,3,233,185,0,254,70,241,128,62,28
  db 130,0,116,3,233,164,0,160,20,130,208,232,114,3,233,154,0,128,126,236,0,116,3,233,145,0,128,126
  db 241,1,116,3,233,136,0,160,243,169,152,139,208,160,28,130,152,139,248,138,133,14,130,152,3,194,136,70
  db 243,160,244,169,152,139,208,160,28,130,152,139,248,138,133,16,130,152,3,194,136,70,242,198,70,250,0,198
  db 70,246,1,235,3,254,70,246,138,70,246,48,228,139,208,160,28,130,152,139,248,138,133,20,130,152,139,248
  db 209,231,209,231,3,250,138,133,12,9,136,70,248,128,62,12,136,3,116,20,138,70,243,80,138,70,242,80
  db 138,70,248,80
  push cs
  call near ptr pO065_010F
  db 60,1,116,4,198,70,250,1,128,126,246,3,117,183,128,126,250,0,116,3,254,70,241,198,70,249,1,198
  db 70,253,0
    end;
    {@1548-163A}
    if (v5b <> 0) and (pO065_1090(v23b, v24b) <> 0) then
    begin
      {@1564-1568}
      v2b := 0;
      {@1568-156C}
      v7b := 0;
      {@156C-1630}
      while (v20b < 3) and (v7b <> 1) do
      begin
        {@157E-1581}
        Inc(v20b);
        {@1581-1597}
        v13b := a820E_ff2a[sb821C] + sbA9F3;
        {@1597-15AD}
        v14b := a8210_ff2a[sb821C] + sbA9F4;
        {@15AD-15CE}
        v8b := a090C_e5e5[a8214_ff2a[sb821C], v20b];
        if (b880C = 3) or (pO065_010F(v13b, v14b, v8b) <> 1) then
        begin
          {@15E9-1607}
          v17b := a820E_ff2a[sb821C] + a3EAC_ff2a[v8b];
          {@1607-1625}
          v18b := a8210_ff2a[sb821C] + a3EB5_ff2a[v8b];
          {@1625-1629}
          v15b := 0;
          {@1629-162D}
          v7b := 1;
        end;
      end;
      {@1630-163A}
      if v7b <> 1 then
        v4b := 1;
    end;
    {@163A-165F}
    if v5b = 0 then
      v2b := pO065_10C1(a0, v23b, v24b, v17b, v18b, v20b);
  until (v2b <> 0) or (v4b <> 0);
  {@166E-167A}
  if v4b <> 0 then
  begin
    {@1674-1678}
    pO065_1209 := 0;
    {@1678-167A}
    Exit;
  end;
  {@167A-167E}
  pO065_1209 := 1;
end;

{ 184C }
procedure pO065_184C;
var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v15b: byte;
  v16b: byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  v20b: byte;
  v17sb: shortint absolute v17b;
  v16sb: shortint absolute v16b;
  { 1687 }
  procedure pO065_1687;
  var
    w1b: byte;
    w2b: byte;
    w3b: byte;
    w4b: byte;
    _f1: array[1..2] of byte;
  begin
    {@168D-16B5}
    if (PR54_byte(p87F8)^.v = 0) and (bA9F5 <> v13b) then
      w4b := 1
    else
      w4b := PR54_byte(p87F8)^.v;
    {@16B5-16C4}
    if bA9F5 = v14b then
      Exit;
    {@16C4-16CE}
    v14b := bA9F5;
    {@16CE-16D8}
    b8214 := bA9F5 shr 1;
    {@16D8-16F8}
    b820F := a3EAC_ff2a[bA9F5] * w4b + sb820E;
    {@16F8-1718}
    b8211 := a3EB5_ff2a[bA9F5] * w4b + sb8210;
    {@1718-172C}
    b8215 := (bA9F5 + 4) mod 8 shr 1;
    for b821C := 0 to 1 do
      for w1b := 0 to 3 do
      begin
        {@1740-1761}
        if w1b = 1 then
          v10b := 4
        else
          v10b := a8214_ec3f[sb821C];
        {@1761-1833}
        for w3b := 0 to 5 do
          for w2b := 0 to 10 do
            asm
    db 138,70,253,152,209,224,139,200,139,126,6,54,138,69,246,48,228,186,12,0,247,226,139,248,3,249,138,133
    db 64,9,58,70,254,127,35,138,70,253,152,209,224,139,200,139,126,6,54,138,69,246,48,228,186,12,0,247
    db 226,139,248,3,249,138,133,65,9,58,70,254,125,53,138,70,254,152,80,138,70,253,152,186,11,0,247,226
    db 139,216,138,70,255,48,228,186,66,0,247,226,139,200,160,28,130,152,186,8,1,247,226,139,248,3,249,3
    db 251,88,3,248,198,133,254,127,0,235,51,138,70,254,152,80,138,70,253,152,186,11,0,247,226,139,216,138
    db 70,255,48,228,186,66,0,247,226,139,200,160,28,130,152,186,8,1,247,226,139,248,3,249,3,251,88,3
    db 248,198,133,254,127,1
            end;
      end;
  end;

begin
  {@1852-1858}
  v13b := bA9F5;
  {@1858-185C}
  v14b := 255;
  {@185C-1860}
  v15b := 0;
  {@1860-1865}
  pO0EC_2A17;
  {@1865-1869}
  v12b := 0;
  {@1869-186D}
  v11b := 0;
  for v9b := 1 to 72 do
    a9EF4_2a50[v9b].f := 0;
  {@188C-189D}
  FillChar(bA0A5, 1250, 0);
  {@189D-18A2}
  b820E := 0;
  {@18A2-18A7}
  b8210 := 0;
  {@18A7-18B2}
  b8212 := (bA7CE + 1) shr 1;
  {@18B2-18B6}
  v19b := 0;
  if (bAEE8 and 15) = 0 then
    Inc(v19b)
  else
  begin
    {@18C4-18D0}
    if (bAEE8 and 1) <> 0 then
      Inc(v19b);
    {@18D0-18DC}
    if (bAEE8 and 2) <> 0 then
      Inc(v19b);
    {@18DC-18E8}
    if (bAEE8 and 4) <> 0 then
      Inc(v19b);
    {@18E8-18F4}
    if (bAEE8 and 8) <> 0 then
      Inc(v19b);
  end;
  {@18F4-18FE}
  v19b := v19b * 2;
  {@18FE-191A}
  b8213 := Byte((bA7CF + v19b - 1) div v19b);
  {@191A-191F}
  pO065_1687;
  {@191F-1923}
  v9b := 1;
  {@1923-1928}
  b9EF4 := 1;
  {@1928-1935}
  v4p := p9CF2;
  {@1935-1942}
  v8p := p9CF2;
  {@1942-1BEB}
  while v8p <> nil do
  begin
    {@194D-1952}
    pR670_032E;
    {@1952-196B}
    aA583_9f8b[v9b] := v8p;
    {@196B-1976}
    b821C := PR495_byte(v8p)^.v;
    {@1976-1988}
    a9EF3_2a50[v9b].f := v9b;
    {@1988-19A3}
    a9EF4_2a50[v9b].f := PR305_byte(v8p)^.v and 7;
    if bAEE8 <> 0 then
    begin
      {@19AA-19EE}
      if PR495_byte(v8p)^.v = 0 then
        bA9F5 := v13b
      else
      begin
        asm
  db 138,70,241,48,228,64,37,3,0,136,70,241,160,232,174,48,228,139,216,138,70,241,48,228,139,208,184,1
  db 0,139,202,211,224,35,195,8,192,116,217
        end;
        {@19E4-19EE}
        bA9F5 := v15b * 2;
      end;
      {@19EE-19F3}
      pO065_1687;
    end;
    {@19F3-19F9}
    v18b := bA9F5;
    if PR495_byte(v8p)^.v = 1 then
      v18b := Byte((v18b + 4) mod 8);
    {@1A16-1A2F}
    PR8_byte(PR487_pointer(v8p)^.v)^.v := a092C_ec3f[v18b shr 1];
    {@1A2F-1A3A}
    v20b := pO065_1209(v9b);
    if v20b <> 0 then
    begin
      {@1A43-1A4F}
      v4p := v8p;
      if PR494_byte(v8p)^.v = 0 then
      begin
        {@1A5D-1A6D}
        a9EF4_2a50[v9b].f := 0;
        if (PR18_byte(PR487_pointer(v8p)^.v)^.v = 0) and (PR493_byte(v8p)^.v <> 8) then
        begin
          {@1A8D-1A9F}
          v16b := a9EF1_2a50[v9b].f;
          {@1A9F-1AB1}
          v17b := a9EF2_2a50[v9b].f;
          {@1AB1-1AB5}
          Inc(bA6DF);
          {@1AB5-1AD4}
          aA6A6_30da[bA6DF].f := pO135_14A9(v16b, v17b);
          {@1AD4-1AF0}
          PRB7_50_byte(pA6E0)^.a[v17sb, v16sb] := 31;
          {@1AF0-1B0A}
          aA6A0_b509[bA6DF].f := v8p;
          {@1B0A-1B1D}
          aA6A4_30da[bA6DF].f := v16b;
          {@1B1D-1B30}
          aA6A5_30da[bA6DF].f := v17b;
        end;
      end;
      {@1B30-1B54}
      if PR493_byte(v8p)^.v = 9 then
      begin
        {@1B3B-1B44}
        PR494_byte(v8p)^.v := 0;
        {@1B44-1B54}
        a9EF4_2a50[v9b].f := 0;
      end;
      {@1B54-1B59}
      pO135_04F4;
      {@1B59-1B5C}
      Inc(v9b);
      {@1B5C-1B60}
      Inc(b9EF4);
      {@1B60-1B63}
      Inc(v11b);
    end
    else
    begin
      {@1B65-1B75}
      a9EF4_2a50[v9b].f := 0;
      if PR18_byte(PR487_pointer(v8p)^.v)^.v = 1 then
      begin
        {@1B84-1B87}
        Inc(v12b);
        {@1B87-1B9C}
        aA583_9f8b[v9b] := nil;
        {@1B9C-1BA9}
        p9CEE := v8p;
        {@1BA9-1BB4}
        pO075_3770(1, 0);
        {@1BB4-1BC0}
        v8p := v4p;
      end
      else
      begin
        {@1BC2-1BCE}
        v4p := v8p;
        {@1BCE-1BD1}
        Inc(v9b);
        {@1BD1-1BD5}
        Inc(b9EF4);
      end;
    end;
    {@1BD5-1BE8}
    v8p := PR483_pointer(v8p)^.v;
  end;
  {@1BEB-1BFA}
  PR483_longint(v4p)^.v := 0;
  {@1BFA-1C00}
  bA9F5 := v13b;
end;

{ 1C1E }
procedure pO065_1C1E;
var
  v1b: byte;
  _f1: array[1..13] of byte;
begin
  if false then begin
    if LV = 'COMSPR' then;
    if LV = 'A battle begins...' then;
    LP1('A battle begins...');
  end;
  asm
  db 198,6,21,136,0
  end;
  asm
  call pO111_096E
  end;
  asm
  db 198,6,8,170,0
  end;
  asm
  db 191,215,170,30,87
  call pR1C3_1A83
  end;
  asm
  db 191,22,198,30,87
  call pR1C3_1A83
  end;
  asm
  db 191,26,198,30,87
  call pR1C3_1A83
  end;
  asm
  db 198,6,21,198,0
  end;
  asm
  db 191,22,198,30,87,184,8,0,80
  call XR670_046E
  end;
  for v1b := 0 to 21 do
    pO13E_0182('COMSPR', v1b, v1b + 13);
  asm
  db 176,64,80,184,32,0,80,191,30,207,30,87
  call pR1C3_1E9D
  end;
  asm
  db 184,24,0,80,184,3,0,80,184,39,0,80,176,0,80,191,192,157,30,87
  call pR1C3_19A4
  end;
  asm
  db 198,6,219,170,255
  end;
  asm
  call pO108_167D
  end;
  {@1CC8-1CE8}
  pR47F_0354(0, 24, 10, 0, 'A battle begins...');
  asm
  db 198,6,218,174,0
  end;
  asm
  db 198,6,141,174,0
  end;
  asm
  db 198,6,142,174,15
  end;
  asm
  db 198,6,222,167,0
  end;
  asm
  db 198,6,223,166,0
  end;
  asm
  db 49,192,163,93,174,163,95,174
  end;
  asm
  db 49,192,163,250,156,163,252,156
  end;
  asm
  db 191,167,166,30,87,184,56,0,80
  call XR670_046E
  end;
  asm
  db 196,62,248,135,38,198,69,53,0
  end;
  asm
  push cs
  call near ptr pO065_0EAD
  end;
  asm
  call pR670_032E
  end;
  asm
  push cs
  call near ptr pO065_0F66
  end;
  asm
  call pR670_032E
  end;
  asm
  push cs
  call near ptr pO065_184C
  end;
  asm
  call pR670_032E
  end;
  asm
  db 184,24,0,80,184,3,0,80,184,4,0,80,176,1,80,191,224,174,30,87
  call pR1C3_19A4
  end;
  asm
  db 255,54,244,156,255,54,242,156
  call pO135_0CA2
  db 152,45,3,0,196,62,224,166,38,136,69,2
  end;
  asm
  db 255,54,244,156,255,54,242,156
  call pO135_0CCA
  db 152,45,3,0,196,62,224,166,38,136,69,3
  end;
  asm
  call pO0EC_324C
  end;
  asm
  db 161,242,156,139,22,244,156,137,70,242,137,86,244
  end;
  asm
  db 184,32,0,80,184,224,0,80,191,30,207,30,87
  call pR1C3_1F24
  end;
  asm
  db 139,70,242,11,70,244,116,47,196,126,242,38,196,189,231,1,38,198,69,16,0,176,8,80,141,126,242,22
  db 87
  call pO0E2_04DD
  db 196,126,242,38,139,133,227,1,38,139,149,229,1,137,70,242,137,86,244,235,201
  end;
  asm
  call pO0A1_2939
  end;
  asm
  db 198,6,233,174,0
  end;
  asm
  db 198,6,231,174,0
  end;
  asm
  db 198,6,12,136,5
  end;
  asm
  db 198,6,145,197,0
  end;
  asm
  db 161,242,156,139,22,244,156,137,70,242,137,86,244
  end;
  asm
  db 198,6,213,167,0
  end;
end;

{ 1E18 }
begin
end.

