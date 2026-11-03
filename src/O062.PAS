{ O062: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O062;

interface

uses GAMEDATA;

procedure pO062_000F(a0: pointer);

implementation

uses LIT, O0A1, O0AA, O0BB, O0E2, O0EC, O102, O108, O130, O135, R47F, R670;

type
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R15_byte = record _p: array[1..15] of byte; v: byte end;
  R16_byte = record _p: array[1..16] of byte; v: byte end;
  R174_byte = record _p: array[1..174] of byte; v: byte end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R20_byte = record _p: array[1..20] of byte; v: byte end;
  R26_byte = record _p: array[1..26] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R359_byte = record _p: array[1..359] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R427_pointer = record _p: array[1..427] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R479_byte = record _p: array[1..479] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R496_byte = record _p: array[1..496] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R50_shortint = record _p: array[1..50] of byte; v: shortint end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R5_byte = record _p: array[1..5] of byte; v: byte end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R62_byte = record _p: array[1..62] of byte; v: byte end;
  R9_longint = record _p: array[1..9] of byte; v: longint end;
  R9_pointer = record _p: array[1..9] of byte; v: pointer end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  X16 = array[0..15] of byte;
  PR0_byte = ^R0_byte;
  PR15_byte = ^R15_byte;
  PR16_byte = ^R16_byte;
  PR174_byte = ^R174_byte;
  PR178_byte = ^R178_byte;
  PR19_byte = ^R19_byte;
  PR20_byte = ^R20_byte;
  PR26_byte = ^R26_byte;
  PR327_byte = ^R327_byte;
  PR359_byte = ^R359_byte;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR427_pointer = ^R427_pointer;
  PR46_byte = ^R46_byte;
  PR479_byte = ^R479_byte;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR496_byte = ^R496_byte;
  PR508_byte = ^R508_byte;
  PR50_shortint = ^R50_shortint;
  PR54_byte = ^R54_byte;
  PR5_byte = ^R5_byte;
  PR61_byte = ^R61_byte;
  PR62_byte = ^R62_byte;
  PR9_longint = ^R9_longint;
  PR9_pointer = ^R9_pointer;
  PRA30_byte = ^RA30_byte;
var
  a08E8_0351: array[0..6551, 0..4] of byte absolute d08E8;
  a6525_3981: array[0..2046] of E16_byte absolute d6525;
  a6527_3981: array[0..2046] of E16_byte absolute d6527;
  a94D6_622c: array[0..2046] of X16 absolute d94D6;
  a94E2_3981: array[0..2046] of E16_byte absolute d94E2;
  b7FFA: byte absolute d7FFA;
  b7FFB: byte absolute d7FFB;
  b7FFC: byte absolute d7FFC;
  bA7E1: byte absolute dA7E1;
  bAED9: byte absolute dAED9;
  bAEDA: byte absolute dAEDA;
  bAEEE: byte absolute dAEEE;
  bC592: byte absolute dC592;
  p87F8: pointer absolute d87F8;
  p9CF2: pointer absolute d9CF2;

function pO062_024F(a0: pointer): byte; far; forward;
function pO062_02D5(a0: word; a1: word): byte; far; forward;
function pO062_0471(a0: word; a1: word; a2: word; a3: word): byte; far; forward;
function pO062_04E4(a0: pointer): byte; far; forward;
function pO062_05E2(a0: pointer; a1: byte; a2: byte; a3: pointer): byte; far; forward;
procedure pO062_07E7(a0: pointer); far; forward;
function pO062_0C1A(a0: pointer): byte; far; forward;
function pO062_105F(a0: pointer): byte; far; forward;
function pO062_10D1(a0: pointer): byte; far; forward;
function pO062_11E7(a0: pointer): byte; far; forward;
procedure pO062_14E5(a0: pointer; a1: word; a2: word); far; forward;

{ 000F }
procedure pO062_000F(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  _f1: array[1..15] of byte;
begin
  if false then begin
    if LV = 'flees in panic' then;
  end;
  {@0015-0041}
  if PR9_longint(PR487_pointer(a0)^.v)^.v = 0 then
    v3b := pO0A1_3B4F(pointer(a0), 255, 1, 0, 0);
  {@0041-004E}
  v2b := pO062_10D1(pointer(a0));
  {@004E-0053}
  pO108_167D;
  {@0053-0058}
  pO0EC_1BEF;
  if PR494_byte(a0)^.v = 0 then
    v2b := pO0EC_2CF6(pointer(a0));
  {@0071-0080}
  v1b := PR20_byte(PR487_pointer(a0)^.v)^.v;
  if (v1b = 0) or (v1b > 4) or (pO0E2_1374(1, 4) = 1) then
  begin
    {@009B-00A9}
    v1b := pO0E2_1374(1, 8);
    if v1b = 8 then
      v1b := pO0E2_1374(1, 2) + 4
    else
      v1b := pO0E2_1374(1, 4);
  end;
  {@00D2-00E1}
  PR20_byte(PR487_pointer(a0)^.v)^.v := v1b;
  if v2b = 0 then
    v2b := pO062_11E7(pointer(a0));
  {@00F4-0132}
  if (PR19_byte(PR487_pointer(a0)^.v)^.v <> 0) and (PR15_byte(PR487_pointer(a0)^.v)^.v = 0) then
    asm
  db 255,118,8,255,118,6,141,126,238,22,87,191,0,0,14,87,154,111,10,37,8,176,10,80,176,1,80
  call pO0EC_1B08
    end;
  {@0132-013B}
  if v2b <> 0 then
    Exit;
  asm
  db 255,118,8,255,118,6
  push cs
  call near ptr pO062_02D5
  db 8,192,116,17,255,118,8,255,118,6
  call pO0EC_2CF6
  db 136,70,254,233,239,0
  end;
  {@015A-0195}
  if PR0_byte(PR487_pointer(a0)^.v)^.v > 0 then
  begin
    {@0168-0184}
    pO0BB_121C(PR0_byte(PR487_pointer(a0)^.v)^.v, 1, 1, @v2b);
    {@0184-0192}
    v2b := pO0EC_2CF6(pointer(a0));
    {@0192-0195}
    Exit;
  end;
  {@0195-01B4}
  if pO062_024F(pointer(a0)) <> 0 then
  begin
    {@01A3-01B1}
    v2b := pO0EC_2CF6(pointer(a0));
    {@01B1-01B4}
    Exit;
  end;
  {@01B4-01C9}
  if pO062_04E4(pointer(a0)) <> 0 then
  begin
    {@01C2-01C6}
    v2b := 1;
    {@01C6-01C9}
    Exit;
  end;
  asm
  db 255,118,8,255,118,6,196,126,6,38,196,189,231,1,38,255,117,11,38,255,117,9
  push cs
  call near ptr pO062_14E5
  db 255,118,8,255,118,6
  push cs
  call near ptr pO062_10D1
  db 136,70,254
  end;
  {@01F0-0249}
  while v2b = 0 do
  begin
    {@01F6-0247}
if (PR3_shortint(PR487_pointer(a0)^.v)^.v > 0) and (PR494_byte(a0)^.v <> 0) and (pO0A1_3B4F(pointer(a0),
        255, 1, 0, 0) <> 0) then
      v2b := pO062_0C1A(pointer(a0))
    else
      v2b := pO062_105F(pointer(a0));
  end;
end;

{ 024F }
function pO062_024F(a0: pointer): byte;
var
  _f1: array[1..4] of byte;
  v6b: byte;
begin
  {@0255-0259}
  pO062_024F := 0;
  if PR19_byte(PR487_pointer(a0)^.v)^.v <> 0 then
    Exit;
  {@026A-026E}
  v6b := 13;
if (PR16_byte(PR487_pointer(a0)^.v)^.v < bC592) and ((pO102_1276(pointer(a0), 0) > 0)
      or (pO102_1276(pointer(a0), 3) > 2)) then
  begin
    asm
  db 255,118,8,255,118,6,141,126,251,22,87,141,126,250,22,87
  call pO0A1_1329
  db 8,192,116,15
    end;
    {@02BD-02C1}
    pO062_024F := 1;
    {@02C1-02CC}
    pO0A1_10D8(pointer(a0));
  end;
end;

{ 02D5 }
function pO062_02D5(a0: word; a1: word): byte;
var
  _f1: array[1..21] of byte;
begin
  {@02DB-02DF}
  pO062_02D5 := 0;
end;

{ 0471 }
function pO062_0471(a0: word; a1: word; a2: word; a3: word): byte;
var
  v142a: array[0..140] of byte;
  v143b: byte;
  v144b: byte;
  v145b: byte;
  _f1: array[1..1] of byte;
  { 02E8 }
  procedure pO062_02E8;
  var
    w1b: byte;
    w2b: byte;
    w3b: byte;
    w4b: byte;
    w5b: byte;
    _f1: array[1..1] of byte;
  begin
    {@02EE-03E7}
    for w3b := 1 to 140 do
    begin
      asm
    db 138,70,253,48,228,139,126,6,54,196,125,10,3,248,38,138,69,30,136,70,255
      end;
      if (w1b > 0) and (w1b < 128) and (a6525_3981[w1b].f <> 0) then
      begin
        {@0333-0337}
        w5b := 0;
        {@0337-033B}
        w4b := 0;
        {@033B-03DE}
        repeat
          {@033B-03D5}
          if v142a[w4b] = 0 then
          begin
            {@034D-035F}
            v142a[w4b] := w1b;
            {@035F-0363}
            w5b := 1;
          end
          else
          begin
            {@0365-03D5}
            if a6527_3981[v142a[w4b]].f > a6527_3981[w1b].f then
              Inc(w4b)
            else
            begin
              {@0398-03D1}
              repeat
                {@0398-03AA}
                w2b := v142a[w4b];
                {@03AA-03BC}
                v142a[w4b] := w1b;
                {@03BC-03C2}
                w1b := w2b;
                {@03C2-03C5}
                Inc(w4b);
              until (w1b = 0) or (w4b > 140);
              {@03D1-03D5}
              w5b := 1;
            end;
          end;
        until w5b <> 0;
      end;
    end;
  end;

  { 03ED }
  procedure pO062_03ED;
  var
    w1b: byte;
    _f1: array[1..1] of byte;
  begin
    {@03F3-03F7}
    w1b := 0;
    {@03F7-046B}
    repeat
      {@03F7-0465}
      if v142a[v143b] = 0 then
      begin
        {@040E-0412}
        w1b := 1;
        {@0412-041B}
        v144b := 0;
      end
      else
      begin
        {@041D-0465}
        if v142a[v143b] <> v144b then
        begin
          {@043B-0457}
          v144b := v142a[v143b];
          {@0457-045B}
          w1b := 1;
        end
        else
          Inc(v143b);
      end;
    until w1b <> 0;
  end;

begin
  {@0478-047C}
  pO062_0471 := 0;
  asm
  db 141,190,114,255,22,87,184,141,0,80
  call XR670_046E
  db 85
  push cs
  call near ptr pO062_02E8
  db 198,134,111,255,0,198,134,112,255,0,198,134,113,255,0
  end;
  {@049F-04D4}
  repeat
    {@049F-04A4}
    pO062_03ED;
    if v144b <> 0 then
      asm
  db 255,118,12,255,118,10,138,134,112,255,80
  call pO0A1_41EF
  db 8,192,176,0,126,1,64,136,134,111,255
      end;
  until (v145b <> 0) or (v144b = 0);
  {@04D4-04DB}
  pO062_0471 := v144b;
end;

{ 04E4 }
function pO062_04E4(a0: pointer): byte;
var loc: array[1..7] of byte;
begin
  asm
    db 198,70,255,0,196,126,6,38,196,189,231,1,38,128,125,19,0,116,3,233,217,0,196,62,248,135,38,128
    db 125,1,0,117,33,196,126,6,38,196,189,231,1,38,128,125,1,0,116,18,196,126,6,38,128,189,71,1
    db 127,115,10,128,62,218,174,0,117,3,233,170,0,198,70,250,0,255,118,8,255,118,6,141,126,251,22,87
    push cs
    call near ptr pO062_0471
    db 136,70,249,255,118,8,255,118,6,176,4,80
    call pO102_1276
    db 48,228,80,255,118,8,255,118,6,176,3,80
    call pO102_1276
    db 48,228,80,255,118,8,255,118,6,176,2,80
    call pO102_1276
    db 48,228,90,3,194,90,3,194,136,70,248,138,70,248,48,228,209,224,209,224,136,70,248,128,126,249,0,116
    db 65,176,1,80,176,100,80
    call pO0E2_1374
    db 58,70,248,118,49,176,1,80,176,5,80
    call pO0E2_1374
    db 138,208,138,70,249,48,228,139,248,177,4,211,231,138,133,39,101,58,194,114,17,138,70,249,80,176,1,80
    db 141,126,250,22,87
    call pO0A1_24CD
    db 138,70,250,136,70,255
  end;
end;

{ 05E2 }
function pO062_05E2(a0: pointer; a1: byte; a2: byte; a3: pointer): byte;
var loc: array[1..11] of byte;
begin
  asm
    db 196,126,6,38,198,5,0,198,70,244,0,138,70,12,48,228,139,208,196,126,14,38,196,189,231,1,38,138
    db 69,20,48,228,139,248,139,247,209,231,209,231,1,247,3,250,138,133,232,8,136,70,250,138,70,250,48,228
    db 139,208,138,70,10,48,228,3,194,153,185,8,0,247,241,146,136,70,249,255,118,16,255,118,14,138,70,249
    db 80,141,126,248,22,87,141,126,247,22,87,141,126,245,22,87
    call pO135_0D94
    db 128,126,247,0,117,10,196,126,6,38,198,5,1,233,91,1,138,70,247,48,228,139,248,209,231,209,231,128
    db 189,186,62,255,117,7,198,70,255,0,233,72,1,138,70,249,208,232,115,28,138,70,247,48,228,139,248,209
    db 231,209,231,138,133,186,62,48,228,139,240,209,224,1,240,136,70,246,235,22,138,70,247,48,228,139,248,209
    db 231,209,231,138,133,186,62,48,228,209,224,136,70,246,128,126,248,0,116,3,233,0,1,138,70,246,196,126
    db 14,38,196,189,231,1,38,58,69,5,114,3,233,236,0,138,70,245,60,29,117,95,255,118,16,255,118,14
    db 176,30,80,141,126,251,22,87
    call pO0EC_27C1
    db 8,192,117,70,255,118,16,255,118,14,176,63,80,141,126,251,22,87
    call pO0EC_27C1
    db 8,192,117,47,196,126,14,38,196,189,231,1,38,128,125,15,0,117,32,196,126,14,38,138,133,165,1,36
    db 24,8,192,117,18,196,126,14,38,196,189,231,1,38,138,69,5,48,228,64,136,70,246,235,113,60,28,117
    db 72,255,118,16,255,118,14,176,57,80,141,126,251,22,87
    call pO0EC_27C1
    db 8,192,117,47,196,126,14,38,138,133,165,1,36,16,8,192,117,33,196,126,14,38,196,189,231,1,38,128
    db 125,15,0,117,18,196,126,14,38,196,189,231,1,38,138,69,5,48,228,64,136,70,246,235,37,60,27,117
    db 33,196,126,14,38,196,189,231,1,38,128,125,15,0,117,18,196,126,14,38,196,189,231,1,38,138,69,5
    db 48,228,64,136,70,246,196,126,14,38,196,189,231,1,38,138,69,5,58,70,246,114,4,198,70,244,1,138
    db 70,244,136,70,255
  end;
end;

{ 07E7 }
procedure pO062_07E7(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..4] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'Move/Attack, Move Left = ' then;
    if LV = ' ' then;
    for _fb := _fb to _fb do LM1_8(FS, [LB], [LB], [LB], [LB], [LB], [LB], [LB], [LB]);
  end;
  {@07EE-083A}
pR47F_0354(0, 24, 10, 0, 'Move/Attack, Move Left = ' + pO0EC_142F(PR5_byte(PR487_pointer(a0)^.v)^.v shr 1)
      + ' ');
  {@083A-084B}
  if pO062_10D1(pointer(a0)) <> 0 then
    Exit;
  {@084B-0BD1}
if ((PR5_byte(PR487_pointer(a0)^.v)^.v shr 1) > 0) and (PR3_shortint(PR487_pointer(a0)^.v)^.v > 0)
      and ((PR327_byte(a0)^.v < 128) or (PR327_byte(a0)^.v > 127) and (bAED9 <= (bA7E1 + pO0E2_1374(1, 100)))
      or (PR495_byte(a0)^.v = 1)) and ((PR19_byte(PR487_pointer(a0)^.v)^.v <> 0)
      or (PR174_byte(a0)^.v <> 5)) then
  begin
    asm
  db 196,126,6,38,196,189,231,1,38,128,125,19,0,117,32,255,118,8,255,118,6,196,126,6,38,196,189,231
  db 1,38,255,117,11,38,255,117,9
  call pO0EC_36C5
  db 136,70,255,235,89,176,1,80,176,2,80
  call pO0E2_1374
  db 196,126,6,38,196,189,231,1,38,136,69,20,160,245,169,48,228,64,64,153,185,4,0,247,241,146,209,232
  db 139,208,160,245,169,48,228,43,194,64,136,70,255,196,126,6,38,128,189,239,1,0,117,11,138,70,255,48
  db 228,5,4,0,136,70,255,138,70,255,48,228,153,185,8,0,247,241,146,136,70,255
    end;
    {@095E-0962}
    v4b := 0;
    {@0962-0966}
    v5b := 0;
    {@0966-096A}
    v3b := 1;
    {@096A-09BB}
    while (v3b < 6) and (v5b = 0) and (pO062_05E2(pointer(a0), v3b, v1b, @v4b) = 0) do
      asm
  db 196,126,6,38,196,189,231,1,38,128,125,19,0,116,22,128,126,252,0,116,16,255,118,8,255,118,6
  call pO0A1_0DAA
  db 136,70,251,235,3,254,70,253
      end;
    {@09BB-0AF1}
    if v5b <> 0 then
    begin
      {@09C1-09CE}
      PR5_byte(PR487_pointer(a0)^.v)^.v := 0;
      {@09CE-09DB}
      PR19_byte(PR487_pointer(a0)^.v)^.v := 0;
      {@09DB-09E9}
      v5b := pO0EC_2CF6(pointer(a0));
    end
    else
    begin
      {@09EC-0A3B}
      if (v3b < 6) and (PR20_byte(PR487_pointer(a0)^.v)^.v < 7) then
        v2b := Byte((v1b + a08E8_0351[PR20_byte(PR487_pointer(a0)^.v)^.v, v3b]) mod 8);
      {@0A3B-0ADF}
      if (v3b = 6) or (b7FFA = ((v2b + 4) mod 8)) then
      begin
        {@0A5E-0A62}
        Inc(b7FFB);
        {@0A62-0A84}
        PR20_byte(PR487_pointer(a0)^.v)^.v := PR20_byte(PR487_pointer(a0)^.v)^.v mod 6 + 1;
        if b7FFB > 1 then
        begin
          {@0A8B-0A9D}
          PR9_longint(PR487_pointer(a0)^.v)^.v := 0;
          if b7FFB > 2 then
          begin
            {@0AA4-0AB1}
            PR5_byte(PR487_pointer(a0)^.v)^.v := 0;
            {@0AB1-0AB5}
            v5b := 1;
          end
          else
          begin
            {@0AB7-0ADF}
            if pO0A1_3B4F(pointer(a0), 255, 1, 0, 0) = 0 then
              v5b := pO062_105F(pointer(a0));
          end;
        end;
      end;
      {@0ADF-0AF1}
      if v3b < 6 then
        b7FFA := v2b
      else
        v5b := 1;
    end;
    {@0AF1-0BCF}
    if v5b = 0 then
    begin
      asm
  db 128,62,238,174,0,117,33,255,118,8,255,118,6,176,0,80
  call pO135_0805
  db 8,192,117,15,196,126,6,38,128,189,239,1,0,116,4,176,0,235,2,176,1
      end;
      asm
  db 162,240,174,255,118,8,255,118,6,138,70,254,80,176,0,80,176,0,80
  call pO135_0BAF
  db 255,118,8,255,118,6,196,126,6,38,196,189,231,1,38,138,69,8,80
  call pO0A1_0979
  db 196,126,6,38,128,189,238,1,0,117,16,255,118,8,255,118,6
  call pO0EC_2CF6
  db 136,70,251,235,96,196,126,6,38,196,189,231,1,38,128,125,5,0,118,24,255,118,8,255,118,6,196,126
  db 6,38,196,189,231,1,38,138,69,8,80
  call pO0A1_076D
  db 196,126,6,38,128,189,238,1,0,116,15,255,118,8,255,118,6
  call pO0EC_0E7A
  db 8,192,116,14,255,118,8,255,118,6
  call pO0EC_2CF6
  db 136,70,251,255,118,8,255,118,6,176,0,80,176,0,80
  call pO0E2_0CAF
      end;
    end;
    {@0BCF-0BD1}
    Exit;
  end;
  {@0BD1-0C01}
  if ((PR5_byte(PR487_pointer(a0)^.v)^.v shr 1) = 0) and (PR19_byte(PR487_pointer(a0)^.v)^.v = 0) then
    v5b := pO062_04E4(pointer(a0));
  {@0C01-0C14}
  if v5b = 0 then
    v5b := pO062_105F(pointer(a0));
end;

{ 0C1A }
function pO062_0C1A(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..2] of byte;
  v7b: byte;
  _f2: array[1..1] of byte;
  v12p: pointer;
  v16p: pointer;
  _f3: array[1..2] of byte;
  v19b: byte;
  _f4: array[1..1] of byte;
begin
  {@0C20-0C25}
  b7FFA := 8;
  {@0C25-0C2A}
  b7FFB := 0;
  {@0C2A-0C2F}
  b7FFC := 0;
  {@0C2F-0C33}
  v19b := 0;
  {@0C33-0C37}
  v3b := 1;
  {@0C37-0C3B}
  v2b := 0;
  {@0C3B-0C48}
  pO0E2_04DD(14, @PV4_0_byte(a0).v);
  if (PR495_byte(pointer(a0))^.v = 0) and (pO0EC_33E6(1) <> 0) then
    PR3_byte(PR487_pointer(pointer(a0))^.v)^.v := 0;
  {@0C6C-0C7F}
  if PR3_byte(PR487_pointer(pointer(a0))^.v)^.v = 0 then
    v3b := 0;
  {@0C7F-104A}
  while (v2b = 0) and (v3b <> 0) do
  begin
    {@0C91-0CD9}
    if PR19_byte(PR487_pointer(pointer(a0))^.v)^.v <> 0 then
while (PR5_byte(PR487_pointer(pointer(a0))^.v)^.v > 0)
          and (PR3_shortint(PR487_pointer(pointer(a0))^.v)^.v > 0)
          and (PR3_shortint(PR487_pointer(pointer(a0))^.v)^.v < 20) do
        pO062_07E7(pointer(pointer(a0)));
    {@0CD9-0D01}
if (PR3_byte(PR487_pointer(pointer(a0))^.v)^.v = 0)
        or (PR3_byte(PR487_pointer(pointer(a0))^.v)^.v = 20) then
      v3b := 0
    else
      v2b := 0;
    {@0D01-1047}
    if (v2b = 0) and (v3b <> 0) then
    begin
      {@0D13-0D16}
      Inc(v19b);
      if v19b > 20 then
      begin
        {@0D1C-0D20}
        v2b := 1;
        {@0D20-0D34}
        v3b := Ord(pO062_105F(pointer(pointer(a0))) = 0);
      end;
      {@0D34-0D39}
      bAEEE := 0;
      {@0D39-0D3D}
      v4b := 1;
      if PR427_pointer(pointer(a0))^.v <> nil then
        v4b := a94E2_3981[PR46_byte(PR427_pointer(pointer(a0))^.v)^.v].f;
      {@0D67-0D77}
      if (v4b = 0) or (v4b = 255) then
        v4b := 1;
      {@0D77-0D8D}
      v16p := PR9_pointer(PR487_pointer(pointer(a0))^.v)^.v;
      if (PR494_byte(v16p)^.v = 0) or (PR495_byte(v16p)^.v = 0) then
        v16p := nil;
      {@0DAB-0E40}
      if (v16p <> nil) and (pO0A1_0FAE(pointer(pointer(a0)), v16p, 0) <> 0) then
        asm
  db 255,118,242,255,118,240
  call pO135_0CA2
  db 136,70,239,255,118,242,255,118,240
  call pO135_0CCA
  db 136,70,238,138,70,252,48,228,137,70,250,196,62,224,166,38,198,69,6,0,255,118,8,255,118,6
  call pO135_0CA2
  db 80,255,118,8,255,118,6
  call pO135_0CCA
  db 80,141,126,239,22,87,141,126,238,22,87,141,126,250,22,87
  call pO130_03EC
  db 8,192,116,21,138,70,252,48,228,139,208,139,70,250,209,232,59,194,119,5,198,6,238,174,1
        end;
      {@0E40-0F63}
      if bAEEE = 0 then
      begin
        {@0E4A-0E5F}
        v7b := pO0EC_2A6F(pointer(pointer(a0)), v4b, 0);
        if v7b = 0 then
        begin
          {@0E65-0EAB}
          if pO0A1_3B4F(pointer(pointer(a0)), 255, 0, 0, 0) <> 0 then
          begin
            {@0E80-0E8A}
            pO062_07E7(pointer(pointer(a0)));
            if PR0_byte(PR487_pointer(pointer(a0))^.v)^.v > 0 then
              v3b := 0;
          end
          else
            v2b := pO062_105F(pointer(pointer(a0)));
        end
        else
          asm
  db 176,1,80,138,70,249,80
  call pO0E2_1374
db 136,70,248,138,70,248,48,228,139,248,138,133,142,174,48,228,139,248,209,231,209,231,139,133,131,165,139,149
  db 133,165,137,70,240,137,86,242,255,118,8,255,118,6
  call pO0EC_3280
  db 8,192,116,68,255,118,8,255,118,6
  call pO0EC_32C3
  db 8,192,117,53,255,118,8,255,118,6,176,1,80,176,0,80
  call pO0EC_2A6F
  db 8,192,118,32,255,118,8,255,118,6,196,126,6,38,196,189,231,1,38,255,117,11,38,255,117,9
  push cs
  call near ptr pO062_14E5
  db 198,70,254,1,235,50,255,118,8,255,118,6,255,118,242,255,118,240
  call pO0EC_2C22
  db 60,1,116,24,255,118,8,255,118,6,255,118,242,255,118,240,176,0,80
  call pO0A1_0FAE
  db 8,192,116,5,198,6,238,174,1
          end;
      end;
      {@0F63-0F9C}
      if bAEEE <> 0 then
        asm
  db 255,118,8,255,118,6
  call pO135_0CA2
  db 80,255,118,8,255,118,6
  call pO135_0CCA
  db 80,176,2,80,255,118,8,255,118,6,255,118,242,255,118,240
  call pO0EC_36C5
  db 80
  call pO135_0A4D
        end;
      {@0F9C-1047}
      if bAEEE <> 0 then
      begin
        asm
  db 255,118,8,255,118,6,255,118,242,255,118,240
  call pO0A1_182A
  db 49,192,137,70,244,137,70,246,255,118,8,255,118,6
  call pO0EC_3280
  db 8,192,116,63,255,118,8,255,118,6,141,126,244,22,87
  call pO0EC_330E
  db 162,238,174,255,118,8,255,118,6
  call pO0EC_32C3
  db 8,192,116,29,255,118,8,255,118,6,255,118,242,255,118,240
  call pO0EC_2C22
  db 60,1,117,8,49,192,137,70,244,137,70,246
        end;
        {@100D-102C}
        pO0A1_18B9(pointer(pointer(a0)), v16p, 0, v12p, @v2b);
        if v2b <> 0 then
          v3b := 0
        else
        begin
          {@1038-1047}
          if PR494_byte(v16p)^.v = 0 then
            v2b := 1;
        end;
      end;
    end;
  end;
  {@104A-1056}
  pO062_0C1A := Ord(v3b = 0);
end;

{ 105F }
function pO062_105F(a0: pointer): byte;
var loc: array[1..1] of byte;
begin
  asm
    call pO0EC_1BEF
    db 255,118,8,255,118,6
    call pO0EC_0E7A
    db 8,192,117,30,255,118,8,255,118,6
    call pO0EC_3280
    db 8,192,117,15,196,126,6,38,196,189,231,1,38,128,125,3,0,117,16,255,118,8,255,118,6
    call pO0EC_2CF6
    db 136,70,255,235,14,255,118,8,255,118,6
    call pO0EC_2D45
    db 136,70,255
  end;
end;

{ 10D1 }
function pO062_10D1(a0: pointer): byte;
var
  v5p: pointer;
  v6b: byte;
begin
  if false then begin
    if LV = 'Magic On' then;
    if LV = 'Magic Off' then;
    LP1('Magic On');
  end;
  {@10D7-10DB}
  pO062_10D1 := 0;
  if pR670_0277 <> 0 then
  begin
    {@10E7-10EF}
    v6b := pR670_0187;
    if v6b = 0 then
      v6b := pR670_0187;
    {@10FD-11BC}
    case v6b of
      50: begin
        {@1104-1111}
        bAEDA := Ord(bAEDA = 0);
        if bAEDA <> 0 then
          pO0EC_1AAC('Magic On')
        else
          pO0EC_1AAC('Magic Off');
      end;
      32: begin
        {@1148-1155}
        v5p := p9CF2;
        {@1155-1191}
        while v5p <> nil do
        begin
          {@115D-117C}
          if (PR327_byte(v5p)^.v < 128) and (PR493_byte(v5p)^.v <> 1) then
            PR496_byte(v5p)^.v := 0;
          {@117C-118F}
          v5p := PR483_pointer(v5p)^.v;
        end;
        {@1191-11AD}
        if PR496_byte(a0)^.v = 0 then
        begin
          {@119C-11A9}
          PR3_byte(PR487_pointer(a0)^.v)^.v := 20;
          {@11A9-11AD}
          pO062_10D1 := 1;
        end;
      end;
      45: asm
  call pO0A1_3D7E
  db 8,192,116,0
        end;
    end;
  end;
  {@11BC-11C1}
  pR670_0311;
end;

{ 11E7 }
function pO062_11E7(a0: pointer): byte;
var
  _f1: array[1..1] of byte;
  v3b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'is forced to flee' then;
    if LV = 'Surrenders' then;
    with LPR^ do with LPR^ do LM1_0('Surrenders');
  end;
  {@11ED-11F1}
  pO062_11E7 := 0;
  {@11F1-11FE}
  PR19_byte(PR487_pointer(a0)^.v)^.v := 0;
  if PR15_byte(PR487_pointer(a0)^.v)^.v <> 0 then
  begin
    {@120D-121A}
    PR19_byte(PR487_pointer(a0)^.v)^.v := 1;
    asm
  db 255,118,8,255,118,6,141,126,235,22,87,191,202,17,14,87,154,111,10,37,8,176,10,80,176,1,80
  call pO0EC_1B08
  db 233,25,1
    end;
  end;
  {@123D-124B}
  if PR327_byte(a0)^.v <= 127 then
    Exit;
  {@124B-125C}
  bA7E1 := PR327_byte(a0)^.v and 127 * 2;
  {@125C-1269}
  pO0E2_04DD(17, @PV4_0_byte(a0).v);
  if (bA7E1 >= (100 - PR508_byte(a0)^.v * 100 div PR178_byte(a0)^.v)) and (bA7E1 <> 0) then
    Exit;
  {@12A3-12A9}
  v3b := bA7E1;
  {@12A9-12AF}
  bA7E1 := bAED9;
  {@12AF-12BC}
  pO0E2_04DD(17, @PV4_0_byte(a0).v);
  if (bA7E1 < (100 - PR26_byte(p87F8)^.v)) or (bA7E1 = 0) or (PR495_byte(a0)^.v = 0) then
  begin
    asm
  db 255,118,8,255,118,6
  call pO0A1_29D4
  db 136,70,254,255,118,8,255,118,6
  call pO0EC_12E6
  db 48,228,209,232,139,208,138,70,254,48,228,59,194,127,15,196,126,6,38,196,189,231,1,38,198,69,19,1
  db 235,53
    end;
    {@1321-1356}
    if PR19_byte(a0)^.v > 5 then
    begin
      {@132B-1348}
      pO0E2_149C(pointer(a0), 4, 'Surrenders');
      {@1348-1356}
      pO062_11E7 := pO0EC_2CF6(pointer(a0));
    end;
  end;
end;

{ 14E5 }
procedure pO062_14E5(a0: pointer; a1: word; a2: word);
var
  _f1: array[1..27] of byte;
  v28b: byte;
  v29b: byte;
  _f2: array[1..7] of byte;
  v37b: byte;
  v38b: byte;
  _f3: array[1..2] of byte;
  { 135F }
  function pO062_135F(b0: pointer): byte;
  var
    w2b: byte;
    _f1: array[1..1] of byte;
    w4b: byte;
    _f2: array[1..2] of byte;
    w7sb: shortint;
    w8b: byte;
    w9b: byte;
    _f3: array[1..1] of byte;
    w11b: byte;
    _f4: array[1..1] of byte;
    w13b: byte;
    _f5: array[1..3] of byte;
    w17b: byte;
    _v18: byte;
    w18a: X16 absolute _v18;
  begin
    {@1365-1388}
    w18a := a94D6_622c[PR46_byte(b0)^.v];
    {@1388-1399}
    w2b := w8b * w9b;
    if PR50_shortint(b0)^.v > 0 then
      w2b := w2b + PR50_shortint(b0)^.v * 8;
    {@13BB-13D3}
    if w7sb > 0 then
      w2b := w2b + w7sb * 2;
    {@13D3-13F0}
    if (w4b and 8) > 0 then
      w2b := w2b + (w13b - 1) * 2;
    {@13F0-1401}
    if w17b <= 1 then
      w2b := w2b + 3;
    {@1401-1421}
    if (w17b + PR479_byte(a0)^.v) > 3 then
      w2b := 0;
    {@1421-1446}
    if (PR62_byte(b0)^.v = 132) and ((PR61_byte(b0)^.v and 15) <> PR359_byte(a0)^.v) then
      w2b := 0;
    {@1446-1454}
    if PR61_byte(b0)^.v = 83 then
      w2b := 0;
    {@1454-1462}
    if PR54_byte(b0)^.v <> 0 then
      w2b := 0;
    {@1462-148C}
    if (w11b <= 1) and (v38b <> 0) or (w11b > 127) and (v37b <> 0) then
      w2b := w2b shr 1;
    {@148C-14D6}
    if ((w4b and 8) <> 0) or ((w4b and 16) <> 0) then
    begin
      {@149E-14B9}
      if PR50_shortint(b0)^.v < v29b then
        w2b := 0;
    end
    else
    begin
      {@14BB-14D6}
      if PR50_shortint(b0)^.v < v28b then
        w2b := 0;
    end;
    {@14D6-14DC}
    pO062_135F := w2b;
  end;

begin
  asm
    db 198,70,228,0,139,70,6,11,70,8,117,3,233,212,0,255,118,8,255,118,6,176,125,80,141,126,252,22
    db 87
    call pO0EC_27C1
    db 8,192,116,4,198,70,228,2,255,118,8,255,118,6,176,60,80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,116,4,198,70,228,3,255,118,8,255,118,6,176,80,80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,117,46,255,118,8,255,118,6,176,81,80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,117,23,255,118,8,255,118,6,176,103,80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,116,4,198,70,228,1,138,70,228,136,70,227,128,126,227,0,117,27,255,118,8,255,118,6,176,41
    db 80,141,126,252,22,87
    call pO0EC_27C1
    db 8,192,116,4,198,70,227,1,255,118,8,255,118,6,176,66,80,141,126,252,22,87
    call pO0EC_27C1
    db 136,70,218,255,118,8,255,118,6,176,67,80,141,126,252,22,87
    call pO0EC_27C1
    db 136,70,219,235,12,198,70,227,0,198,70,219,0,198,70,218,0,196,126,10,38,139,133,171,1,38,11,133
    db 173,1,116,48,196,126,10,38,196,189,171,1,38,138,69,46,48,228,139,248,177,4,211,231,138,133,215,148
    db 48,228,139,208,196,126,10,38,138,133,223,1,48,228,43,194,196,126,10,38,136,133,223,1,196,126,10,38
    db 139,133,175,1,38,11,133,177,1,116,48,196,126,10,38,196,189,175,1,38,138,69,46,48,228,139,248,177
    db 4,211,231,138,133,215,148,48,228,139,208,196,126,10,38,138,133,223,1,48,228,43,194,196,126,10,38,136
    db 133,223,1,49,192,137,70,248,137,70,250,49,192,137,70,244,137,70,246,49,192,137,70,240,137,70,242,198
    db 70,231,1,196,126,10,38,138,133,106,1,48,228,139,208,196,126,10,38,138,133,108,1,48,228,247,226,136
    db 70,230,196,126,10,38,128,189,110,1,0,126,23,196,126,10,38,138,133,110,1,152,209,224,139,208,138,70
    db 230,48,228,3,194,136,70,230,198,70,229,0,196,126,10,38,139,133,167,1,38,139,149,169,1,137,70,236
    db 137,86,238,139,70,236,11,70,238,117,3,233,53,1,196,126,236,38,138,69,46,136,70,225,138,70,225,48
    db 228,139,248,177,4,211,231,128,189,214,148,0,116,3,233,159,0,138,70,225,48,228,139,248,177,4,211,231
    db 138,133,227,148,196,126,10,38,34,133,123,1,8,192,117,3,233,129,0,255,118,238,255,118,236,85
    push cs
    call near ptr pO062_135F
    db 136,70,226,138,70,225,48,228,139,248,177,4,211,231,138,133,228,148,36,8,8,192,117,21,138,70,225,48
    db 228,139,248,177,4,211,231,138,133,228,148,36,16,8,192,116,26,138,70,226,58,70,231,118,18,139,70,236
    db 139,86,238,137,70,248,137,86,250,138,70,226,136,70,231,138,70,225,48,228,139,248,177,4,211,231,138,133
    db 228,148,36,8,8,192,117,26,138,70,226,58,70,230,118,18,139,70,236,139,86,238,137,70,244,137,86,246
    db 138,70,226,136,70,230,138,70,225,48,228,139,248,177,4,211,231,128,189,214,148,1,117,81,138,70,225,48
    db 228,139,248,177,4,211,231,138,133,227,148,196,126,10,38,34,133,123,1,8,192,118,54,196,126,236,38,128
    db 125,50,0,124,14,196,126,236,38,138,69,50,152,64,136,70,226,235,4,198,70,226,0,138,70,226,58,70
    db 229,118,18,139,70,236,139,86,238,137,70,240,137,86,242,138,70,226,136,70,229,196,126,236,38,139,69,42
    db 38,139,85,44,137,70,236,137,86,238,233,192,254,139,70,248,11,70,250,116,53,196,126,248,38,138,69,46
    db 48,228,139,248,177,4,211,231,128,189,226,148,1,118,31,196,126,248,38,138,69,46,48,228,139,248,177,4
    db 211,231,138,133,228,148,36,20,60,20,117,6,198,70,220,1,235,4,198,70,220,0,198,70,217,0,49,192
    db 137,70,232,137,70,234,198,70,224,0,139,70,248,11,70,250,116,108,196,126,248,38,138,69,46,48,228,139
    db 248,177,4,211,231,138,133,228,148,136,70,224,138,70,224,36,16,8,192,116,12,139,70,248,139,86,250,137
    db 70,232,137,86,234,138,70,224,36,8,8,192,116,56,138,70,224,36,1,8,192,116,19,196,126,10,38,139
    db 133,215,1,38,139,149,217,1,137,70,232,137,86,234,138,70,224,36,128,8,192,116,19,196,126,10,38,139
    db 133,219,1,38,139,149,221,1,137,70,232,137,86,234,139,70,232,11,70,234,117,6,128,126,224,10,117,4
    db 198,70,217,1,139,70,248,11,70,250,116,65,138,70,230,48,228,209,232,139,208,138,70,231,48,228,59,194
    db 126,47,128,126,217,0,116,41,128,126,220,0,117,21,255,118,12,255,118,10,176,1,80,176,0,80
    call pO0EC_2A6F
    db 8,192,117,14,139,70,248,139,86,250,137,70,236,137,86,238,235,12,139,70,244,139,86,246,137,70,236,137
    db 86,238,198,70,221,0,198,70,222,1,196,126,10,38,139,133,171,1,38,11,133,173,1,116,42,196,126,10
    db 38,139,133,171,1,38,139,149,173,1,59,86,238,117,5,59,70,236,116,15,196,126,10,38,196,189,171,1
    db 38,128,125,54,0,116,4,198,70,222,0,128,126,222,0,117,3,233,145,0,196,126,10,38,139,133,171,1
    db 38,11,133,173,1,116,18,196,126,10,38,255,181,173,1,38,255,181,171,1
    call pO0AA_1845
    db 255,118,12,255,118,10
    call pO0EC_0EBF
    db 196,126,10,38,139,133,175,1,38,11,133,177,1,116,63,196,126,10,38,196,189,175,1,38,128,125,54,0
    db 117,48,196,126,10,38,196,189,175,1,38,138,69,46,48,228,139,248,177,4,211,231,138,133,215,148,48,228
    db 139,208,196,126,10,38,138,133,223,1,48,228,43,194,196,126,10,38,136,133,223,1,139,70,236,11,70,238
    db 116,11,255,118,238,255,118,236
    call pO0AA_1845
    db 198,70,221,1,255,118,12,255,118,10
    call pO0EC_0EBF
    db 255,118,12,255,118,10
    call pO0A1_0E67
    db 198,70,222,1,196,126,10,38,139,133,175,1,38,11,133,177,1,116,42,196,126,10,38,139,133,175,1,38
    db 139,149,177,1,59,86,242,117,5,59,70,240,116,15,196,126,10,38,196,189,175,1,38,128,125,54,0,116
    db 4,198,70,222,0,196,126,10,38,128,189,223,1,2,118,71,196,126,10,38,139,133,175,1,38,11,133,177
    db 1,116,15,196,126,10,38,196,189,175,1,38,128,125,54,0,116,17,255,118,238,255,118,236
    call pO0AA_1845
    db 198,70,221,1,235,22,196,126,10,38,255,181,177,1,38,255,181,175,1
    call pO0AA_1845
    db 198,70,221,1,235,84,196,126,10,38,128,189,223,1,2,115,73,128,126,222,0,116,67,196,126,10,38,139
    db 133,175,1,38,11,133,177,1,116,18,196,126,10,38,255,181,177,1,38,255,181,175,1
    call pO0AA_1845
    db 255,118,12,255,118,10
    call pO0EC_0EBF
    db 139,70,240,11,70,242,116,11,255,118,242,255,118,240
    call pO0AA_1845
    db 198,70,221,1,255,118,12,255,118,10
    call pO0EC_0EBF
    db 128,126,221,0,116,11,255,118,12,255,118,10
    call pO0EC_0C95
  end;
end;

{ 1B2A }
begin
end.

