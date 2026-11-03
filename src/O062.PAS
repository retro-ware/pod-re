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
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  PV4_0_byte = record v: byte; _r: array[1..3] of byte end;
  R0_byte = record v: byte end;
  R15_byte = record _p: array[1..15] of byte; v: byte end;
  R16_byte = record _p: array[1..16] of byte; v: byte end;
  R174_byte = record _p: array[1..174] of byte; v: byte end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R20_byte = record _p: array[1..20] of byte; v: byte end;
  R26_byte = record _p: array[1..26] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R359_byte = record _p: array[1..359] of byte; v: byte end;
  R362_byte = record _p: array[1..362] of byte; v: byte end;
  R364_byte = record _p: array[1..364] of byte; v: byte end;
  R366_shortint = record _p: array[1..366] of byte; v: shortint end;
  R379_byte = record _p: array[1..379] of byte; v: byte end;
  R3_byte = record _p: array[1..3] of byte; v: byte end;
  R3_shortint = record _p: array[1..3] of byte; v: shortint end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R427_pointer = record _p: array[1..427] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R431_pointer = record _p: array[1..431] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R471_pointer = record _p: array[1..471] of byte; v: pointer end;
  R475_pointer = record _p: array[1..475] of byte; v: pointer end;
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
  R8_byte = record _p: array[1..8] of byte; v: byte end;
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
  PR1_byte = ^R1_byte;
  PR20_byte = ^R20_byte;
  PR26_byte = ^R26_byte;
  PR327_byte = ^R327_byte;
  PR359_byte = ^R359_byte;
  PR362_byte = ^R362_byte;
  PR364_byte = ^R364_byte;
  PR366_shortint = ^R366_shortint;
  PR379_byte = ^R379_byte;
  PR3_byte = ^R3_byte;
  PR3_shortint = ^R3_shortint;
  PR421_byte = ^R421_byte;
  PR423_pointer = ^R423_pointer;
  PR427_pointer = ^R427_pointer;
  PR42_pointer = ^R42_pointer;
  PR431_pointer = ^R431_pointer;
  PR46_byte = ^R46_byte;
  PR471_pointer = ^R471_pointer;
  PR475_pointer = ^R475_pointer;
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
  PR8_byte = ^R8_byte;
  PR9_longint = ^R9_longint;
  PR9_pointer = ^R9_pointer;
  PRA30_byte = ^RA30_byte;
var
  a08E8_0351: array[0..6551, 0..4] of byte absolute d08E8;
  a3EBA_2a50: array[0..8189] of E4_byte absolute d3EBA;
  a6525_3981: array[0..2046] of E16_byte absolute d6525;
  a6527_3981: array[0..2046] of E16_byte absolute d6527;
  a94D6_3981: array[0..2046] of E16_byte absolute d94D6;
  a94D6_622c: array[0..2046] of X16 absolute d94D6;
  a94D7_3981: array[0..2046] of E16_byte absolute d94D7;
  a94E2_3981: array[0..2046] of E16_byte absolute d94E2;
  a94E3_3981: array[0..2046] of E16_byte absolute d94E3;
  a94E4_3981: array[0..2046] of E16_byte absolute d94E4;
  aA583_9f8b: array[0..8189] of pointer absolute dA583;
  aAE8E_ec3f: array[0..32759] of byte absolute dAE8E;
  b7FFA: byte absolute d7FFA;
  b7FFB: byte absolute d7FFB;
  b7FFC: byte absolute d7FFC;
  bA7E1: byte absolute dA7E1;
  bAED9: byte absolute dAED9;
  bAEDA: byte absolute dAEDA;
  bAEEE: byte absolute dAEEE;
  bAEF0: byte absolute dAEF0;
  bC592: byte absolute dC592;
  p87F8: pointer absolute d87F8;
  p9CF2: pointer absolute d9CF2;

function pO062_024F(a0: pointer): byte; far; forward;
function pO062_02D5(a0: longint): byte; far; forward;
function pO062_0471(a0: pointer; a1: pointer): byte; far; forward;
function pO062_04E4(a0: pointer): byte; far; forward;
function pO062_05E2(a0: pointer; a1: byte; a2: byte; a3: pointer): byte; far; forward;
procedure pO062_07E7(a0: pointer); far; forward;
function pO062_0C1A(a0: pointer): byte; far; forward;
function pO062_105F(a0: pointer): byte; far; forward;
function pO062_10D1(a0: pointer): byte; far; forward;
function pO062_11E7(a0: pointer): byte; far; forward;
procedure pO062_14E5(a0: pointer; a1: pointer); far; forward;

{ 000F }
procedure pO062_000F(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
begin
  if false then begin
    if LV = 'flees in panic' then;
  end;
  {@0015-0041}
  if PR9_pointer(PR487_pointer(a0)^.v)^.v = nil then
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
    pO0EC_1B08(pointer(a0), 'flees in panic', 10, 1);
  {@0132-013B}
  if v2b <> 0 then
    Exit;
  {@013B-015A}
  if pO062_02D5(longint(a0)) <> 0 then
  begin
    {@0149-0157}
    v2b := pO0EC_2CF6(pointer(a0));
    {@0157-015A}
    Exit;
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
  {@01C9-01E3}
  pO062_14E5(pointer(a0), pointer(PR9_pointer(PR487_pointer(a0)^.v)^.v));
  {@01E3-01F0}
  v2b := pO062_10D1(pointer(a0));
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
  _f1: array[1..3] of byte;
  v5b: byte;
  v6b: byte;
begin
  {@0255-0259}
  pO062_024F := 0;
  if PR19_byte(PR487_pointer(a0)^.v)^.v <> 0 then
    Exit;
  {@026A-026E}
  v6b := 13;
if (PR16_byte(PR487_pointer(a0)^.v)^.v < bC592) and ((pO102_1276(pointer(a0), 0) > 0)
      or (pO102_1276(pointer(a0), 3) > 2)) and (pO0A1_1329(pointer(a0), @v5b, @v6b) <> 0) then
  begin
    {@02BD-02C1}
    pO062_024F := 1;
    {@02C1-02CC}
    pO0A1_10D8(pointer(a0));
  end;
end;

{ 02D5 }
function pO062_02D5(a0: longint): byte;
var
  _f1: array[1..21] of byte;
begin
  {@02DB-02DF}
  pO062_02D5 := 0;
end;

{ 0471 }
function pO062_0471(a0: pointer; a1: pointer): byte;
var
  v142a: array[0..140] of byte;
  v143b: byte;
  v144b: byte;
  _f1: array[1..2] of byte;
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
      {@02F7-030C}
      w1b := PRA30_byte(a0)^.a[w3b];
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
  asm
  db 85
  push cs
  call near ptr pO062_03ED
  db 128,190,112,255,0,116,27,255,118,12,255,118,10,138,134,112,255,80
  call pO0A1_41EF
  db 8,192,176,0,126,1,64,136,134,111,255,128,190,111,255,0,117,7,128,190,112,255,0,117,203
  end;
  {@04D4-04DB}
  pO062_0471 := v144b;
end;

{ 04E4 }
function pO062_04E4(a0: pointer): byte;
var
  _f1: array[1..3] of byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
begin
  {@04EA-04EE}
  pO062_04E4 := 0;
  {@04EE-0500}
  if PR19_byte(PR487_pointer(a0)^.v)^.v <> 0 then
    Exit;
  {@0500-052F}
if (PR1_byte(p87F8)^.v <> 0) or (PR1_byte(PR487_pointer(a0)^.v)^.v = 0) or (PR327_byte(a0)^.v < 127)
      and (bAEDA = 0) then
    Exit;
  {@052F-0533}
  v6b := 0;
  {@0533-0545}
  v7b := pO062_0471(pointer(a0), @v5b);
  {@0545-0580}
  v8b := pO102_1276(pointer(a0), 2) + pO102_1276(pointer(a0), 3) + pO102_1276(pointer(a0), 4);
  {@0580-058C}
  v8b := v8b * 4;
  if (v7b <> 0) and (Byte(pO0E2_1374(1, 100)) > v8b) and (a6527_3981[v7b].f >= Byte(pO0E2_1374(1, 5))) then
    pO0A1_24CD(v7b, 1, @v6b);
  {@05D3-05D9}
  pO062_04E4 := v6b;
end;

{ 05E2 }
function pO062_05E2(a0: pointer; a1: byte; a2: byte; a3: pointer): byte;
var
  _f1: array[1..3] of byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
begin
  {@05E8-05EF}
  PR0_byte(a3)^.v := 0;
  {@05EF-05F3}
  v12b := 0;
  {@05F3-061B}
  v6b := a08E8_0351[PR20_byte(PR487_pointer(a0)^.v)^.v, a1];
  {@061B-0633}
  v7b := Byte((a2 + v6b) mod 8);
  {@0633-0651}
  pO135_0D94(longint(a0), v7b, @v8b, @v9b, @v11b);
  if v9b = 0 then
    PR0_byte(a3)^.v := 1
  else
  begin
    {@0661-067A}
    if a3EBA_2a50[v9b].f = 255 then
    begin
      {@0673-0677}
      pO062_05E2 := 0;
      {@0677-067A}
      Exit;
    end;
    {@067A-06B3}
    if Odd(v7b) then
      v10b := a3EBA_2a50[v9b].f * 3
    else
      v10b := a3EBA_2a50[v9b].f * 2;
    {@06B3-07BC}
    if (v8b = 0) and (v10b < PR5_byte(PR487_pointer(a0)^.v)^.v) then
    begin
      {@06D0-07A7}
      case v11b of
        29: begin
          {@06D7-0734}
if (pO0EC_27C1(pointer(a0), 30, @v5b) = 0) and (pO0EC_27C1(pointer(a0), 63, @v5b) = 0)
              and (PR15_byte(PR487_pointer(a0)^.v)^.v = 0) and ((PR421_byte(a0)^.v and 24) = 0) then
            v10b := PR5_byte(PR487_pointer(a0)^.v)^.v + 1;
        end;
        28: begin
          {@073A-0780}
if (pO0EC_27C1(pointer(a0), 57, @v5b) = 0) and ((PR421_byte(a0)^.v and 16) = 0)
              and (PR15_byte(PR487_pointer(a0)^.v)^.v = 0) then
            v10b := PR5_byte(PR487_pointer(a0)^.v)^.v + 1;
        end;
        27: begin
          {@0786-07A7}
          if PR15_byte(PR487_pointer(a0)^.v)^.v = 0 then
            v10b := PR5_byte(PR487_pointer(a0)^.v)^.v + 1;
        end;
      end;
      {@07A7-07BC}
      if PR5_byte(PR487_pointer(a0)^.v)^.v >= v10b then
        v12b := 1;
    end;
  end;
  {@07BC-07C2}
  pO062_05E2 := v12b;
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
    begin
      {@0991-09B9}
      if (PR19_byte(PR487_pointer(a0)^.v)^.v <> 0) and (v4b <> 0) then
        v5b := pO0A1_0DAA(pointer(a0))
      else
        Inc(v3b);
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
      {@0AFA-0B27}
      bAEF0 := Ord((bAEEE <> 0) or (pO135_0805(longint(a0), 0) <> 0) or (PR495_byte(a0)^.v = 0));
      {@0B27-0B3C}
      pO135_0BAF(pointer(a0), v2b, 0, 0);
      {@0B3C-0B54}
      pO0A1_0979(pointer(a0), PR8_byte(PR487_pointer(a0)^.v)^.v);
      if PR494_byte(a0)^.v = 0 then
        v5b := pO0EC_2CF6(pointer(a0))
      else
      begin
        {@0B6F-0B96}
        if PR5_byte(PR487_pointer(a0)^.v)^.v > 0 then
          pO0A1_076D(pointer(a0), PR8_byte(PR487_pointer(a0)^.v)^.v);
        {@0B96-0BBE}
        if (PR494_byte(a0)^.v = 0) or (pO0EC_0E7A(pointer(a0)) <> 0) then
          v5b := pO0EC_2CF6(pointer(a0));
        {@0BBE-0BCF}
        pO0E2_0CAF(pointer(a0), 0, 0);
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
  v8b: byte;
  v12p: pointer;
  v16p: pointer;
  _f2: array[1..2] of byte;
  v19b: byte;
  _f3: array[1..1] of byte;
  v12b: byte absolute v12p;
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
      asm
  db 139,70,240,11,70,242,117,3,233,138,0,255,118,8,255,118,6,255,118,242,255,118,240,176,0,80
  call pO0A1_0FAE
  db 8,192,116,114,255,118,242,255,118,240
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
        begin
          {@0EAE-0EBD}
          v8b := pO0E2_1374(1, v7b);
          {@0EBD-0EDE}
          v16p := aA583_9f8b[aAE8E_ec3f[v8b]];
if (pO0EC_3280(pointer(pointer(a0))) <> 0) and (pO0EC_32C3(pointer(pointer(a0))) = 0)
              and (pO0EC_2A6F(pointer(pointer(a0)), 1, 0) > 0) then
          begin
            {@0F11-0F2B}
            pO062_14E5(pointer(pointer(a0)), pointer(PR9_pointer(PR487_pointer(pointer(a0))^.v)^.v));
            {@0F2B-0F2F}
            v2b := 1;
          end
          else
            asm
  db 255,118,8,255,118,6,255,118,242,255,118,240
  call pO0EC_2C22
  db 60,1,116,24,255,118,8,255,118,6,255,118,242,255,118,240,176,0,80
  call pO0A1_0FAE
  db 8,192,116,5,198,6,238,174,1
            end;
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
        {@0FA6-0FB7}
        pO0A1_182A(longint(pointer(a0)), v16p);
        {@0FB7-0FBF}
        v12p := nil;
        if pO0EC_3280(pointer(pointer(a0))) <> 0 then
        begin
          {@0FCE-0FE1}
          bAEEE := pO0EC_330E(pointer(pointer(a0)), @v12b);
          if pO0EC_32C3(pointer(pointer(a0))) <> 0 then
            asm
  db 255,118,8,255,118,6,255,118,242,255,118,240
  call pO0EC_2C22
  db 60,1,117,8,49,192,137,70,244,137,70,246
            end;
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
var
  _f1: array[1..1] of byte;
begin
  {@1065-106A}
  pO0EC_1BEF;
if (pO0EC_0E7A(pointer(a0)) <> 0) or (pO0EC_3280(pointer(a0)) <> 0)
      or (PR3_byte(PR487_pointer(a0)^.v)^.v = 0) then
  begin
    {@1097-10A5}
    pO062_105F := pO0EC_2CF6(pointer(a0));
    {@10A5-10A7}
    Exit;
  end;
  {@10A7-10B5}
  pO062_105F := pO0EC_2D45(pointer(a0));
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
  v2b: byte;
  v3b: byte;
begin
  if false then begin
    if LV = 'is forced to flee' then;
    if LV = 'Surrenders' then;
  end;
  {@11ED-11F1}
  pO062_11E7 := 0;
  {@11F1-11FE}
  PR19_byte(PR487_pointer(a0)^.v)^.v := 0;
  if PR15_byte(PR487_pointer(a0)^.v)^.v <> 0 then
  begin
    {@120D-121A}
    PR19_byte(PR487_pointer(a0)^.v)^.v := 1;
    {@121A-123A}
    pO0EC_1B08(pointer(a0), 'is forced to flee', 10, 1);
    {@123A-123D}
    Exit;
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
    {@12EA-12F8}
    v2b := pO0A1_29D4(pointer(a0));
    if v2b <= (pO0EC_12E6(pointer(a0)) shr 1) then
    begin
      {@1312-131F}
      PR19_byte(PR487_pointer(a0)^.v)^.v := 1;
      {@131F-1321}
      Exit;
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
procedure pO062_14E5(a0: pointer; a1: pointer);
var
  _f1: array[1..3] of byte;
  v4b: byte;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v20p: pointer;
  v24p: pointer;
  v25b: byte;
  v26b: byte;
  v27b: byte;
  v28b: byte;
  v29b: byte;
  v30b: byte;
  v31b: byte;
  v32b: byte;
  _f2: array[1..1] of byte;
  v34b: byte;
  v35b: byte;
  v36b: byte;
  v37b: byte;
  v38b: byte;
  v39b: byte;
  _f3: array[1..1] of byte;
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
  {@14EB-14EF}
  v28b := 0;
  if a1 <> nil then
  begin
    {@14FA-1515}
    if pO0EC_27C1(pointer(a1), 125, @v4b) <> 0 then
      v28b := 2;
    {@1515-1530}
    if pO0EC_27C1(pointer(a1), 60, @v4b) <> 0 then
      v28b := 3;
    {@1530-1579}
if (pO0EC_27C1(pointer(a1), 80, @v4b) <> 0) or (pO0EC_27C1(pointer(a1), 81, @v4b) <> 0)
        or (pO0EC_27C1(pointer(a1), 103, @v4b) <> 0) then
      v28b := 1;
    {@1579-157F}
    v29b := v28b;
    if (v29b = 0) and (pO0EC_27C1(pointer(a1), 41, @v4b) <> 0) then
      v29b := 1;
    {@15A0-15B6}
    v38b := pO0EC_27C1(pointer(a1), 66, @v4b);
    {@15B6-15CC}
    v37b := pO0EC_27C1(pointer(a1), 67, @v4b);
  end
  else
  begin
    {@15CE-15D2}
    v29b := 0;
    {@15D2-15D6}
    v37b := 0;
    {@15D6-15DA}
    v38b := 0;
  end;
  {@15DA-1619}
  if PR427_pointer(a0)^.v <> nil then
    PR479_byte(a0)^.v := PR479_byte(a0)^.v - a94D7_3981[PR46_byte(PR427_pointer(a0)^.v)^.v].f;
  {@1619-1658}
  if PR431_pointer(a0)^.v <> nil then
    PR479_byte(a0)^.v := PR479_byte(a0)^.v - a94D7_3981[PR46_byte(PR431_pointer(a0)^.v)^.v].f;
  {@1658-1660}
  v8p := nil;
  {@1660-1668}
  v12p := nil;
  {@1668-1670}
  v16p := nil;
  {@1670-1674}
  v25b := 1;
  {@1674-168F}
  v26b := PR364_byte(a0)^.v * PR362_byte(a0)^.v;
  if PR366_shortint(a0)^.v > 0 then
    v26b := v26b + PR366_shortint(a0)^.v * 2;
  {@16B1-16B5}
  v27b := 0;
  {@16B5-16C8}
  v20p := PR423_pointer(a0)^.v;
  {@16C8-1808}
  while v20p <> nil do
  begin
    {@16D3-16DD}
    v31b := PR46_byte(v20p)^.v;
    if (a94D6_3981[v31b].f = 0) and ((a94E3_3981[v31b].f and PR379_byte(a0)^.v) <> 0) then
    begin
      {@1710-171E}
      v30b := pO062_135F(v20p);
      if (((a94E4_3981[v31b].f and 8) <> 0) or ((a94E4_3981[v31b].f and 16) <> 0)) and (v30b > v25b) then
      begin
        {@1750-175C}
        v8p := v20p;
        {@175C-1762}
        v25b := v30b;
      end;
      {@1762-1791}
      if ((a94E4_3981[v31b].f and 8) = 0) and (v30b > v26b) then
      begin
        {@177F-178B}
        v12p := v20p;
        {@178B-1791}
        v26b := v30b;
      end;
    end;
    {@1791-17F4}
    if (a94D6_3981[v31b].f = 1) and ((a94E3_3981[v31b].f and PR379_byte(a0)^.v) > 0) then
    begin
      {@17BE-17DA}
      if PR50_shortint(v20p)^.v >= 0 then
        v30b := PR50_shortint(v20p)^.v + 1
      else
        v30b := 0;
      {@17DA-17F4}
      if v30b > v27b then
      begin
        {@17E2-17EE}
        v16p := v20p;
        {@17EE-17F4}
        v27b := v30b;
      end;
    end;
    {@17F4-1805}
    v20p := PR42_pointer(v20p)^.v;
  end;
  {@1808-1849}
if (v8p <> nil) and (a94E2_3981[PR46_byte(v8p)^.v].f > 1) and ((a94E4_3981[PR46_byte(v8p)^.v].f
      and 20) = 20) then
    v36b := 1
  else
    v36b := 0;
  {@1849-184D}
  v39b := 0;
  {@184D-1855}
  v24p := nil;
  {@1855-1859}
  v32b := 0;
  if v8p <> nil then
  begin
    {@1861-1877}
    v32b := a94E4_3981[PR46_byte(v8p)^.v].f;
    if (v32b and 16) <> 0 then
      v24p := v8p;
    {@188C-18CD}
    if (v32b and 8) <> 0 then
    begin
      {@1895-18B1}
      if (v32b and 1) <> 0 then
        v24p := PR471_pointer(a0)^.v;
      {@18B1-18CD}
      if (v32b and 128) <> 0 then
        v24p := PR475_pointer(a0)^.v;
    end;
  end;
  {@18CD-18DF}
  if (v24p <> nil) or (v32b = 10) then
    v39b := 1;
  {@18DF-1934}
if (v8p <> nil) and (v25b > (v26b shr 1)) and (v39b <> 0) and ((v36b <> 0) or (pO0EC_2A6F(pointer(a0), 1,
      0) = 0)) then
    v20p := v8p
  else
    v20p := v12p;
  {@1934-1938}
  v35b := 0;
  {@1938-193C}
  v34b := 1;
if (PR427_pointer(a0)^.v <> nil) and ((PR427_pointer(a0)^.v = v20p)
      or (PR54_byte(PR427_pointer(a0)^.v)^.v <> 0)) then
    v34b := 0;
  {@1975-1A0F}
  if v34b <> 0 then
  begin
    {@197E-199F}
    if PR427_pointer(a0)^.v <> nil then
      pO0AA_1845(pointer(PR427_pointer(a0)^.v));
    {@199F-19AA}
    pO0EC_0EBF(pointer(a0));
    if (PR431_pointer(a0)^.v <> nil) and (PR54_byte(PR431_pointer(a0)^.v)^.v = 0) then
      PR479_byte(a0)^.v := PR479_byte(a0)^.v - a94D7_3981[PR46_byte(PR431_pointer(a0)^.v)^.v].f;
    {@19F8-1A0B}
    if v20p <> nil then
      pO0AA_1845(v20p);
    {@1A0B-1A0F}
    v35b := 1;
  end;
  {@1A0F-1A1A}
  pO0EC_0EBF(pointer(a0));
  {@1A1A-1A25}
  pO0A1_0E67(pointer(a0));
  {@1A25-1A29}
  v34b := 1;
if (PR431_pointer(a0)^.v <> nil) and ((PR431_pointer(a0)^.v = v16p)
      or (PR54_byte(PR431_pointer(a0)^.v)^.v <> 0)) then
    v34b := 0;
  {@1A62-1B08}
  if PR479_byte(a0)^.v > 2 then
  begin
    {@1A6D-1AB2}
    if (PR431_pointer(a0)^.v = nil) or (PR54_byte(PR431_pointer(a0)^.v)^.v <> 0) then
    begin
      {@1A8B-1A96}
      pO0AA_1845(v20p);
      {@1A96-1A9A}
      v35b := 1;
    end
    else
    begin
      {@1A9C-1AAE}
      pO0AA_1845(pointer(PR431_pointer(a0)^.v));
      {@1AAE-1AB2}
      v35b := 1;
    end;
  end
  else
  begin
    {@1AB4-1B08}
    if (PR479_byte(a0)^.v < 2) and (v34b <> 0) then
    begin
      {@1AC5-1AE6}
      if PR431_pointer(a0)^.v <> nil then
        pO0AA_1845(pointer(PR431_pointer(a0)^.v));
      {@1AE6-1AF1}
      pO0EC_0EBF(pointer(a0));
      if v16p <> nil then
        pO0AA_1845(v16p);
      {@1B04-1B08}
      v35b := 1;
    end;
  end;
  {@1B08-1B13}
  pO0EC_0EBF(pointer(a0));
  if v35b <> 0 then
    pO0EC_0C95(pointer(a0));
end;

{ 1B2A }
begin
end.

