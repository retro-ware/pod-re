{ O12A: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O12A;

interface

uses GAMEDATA;

procedure pO12A_0156(a0: byte; a1: byte; a2: byte; a3: byte);
function pO12A_05B9(a0: byte; a1: byte; a2: byte): byte;
function pO12A_048A(a0: byte; a1: byte; a2: byte): byte;
function pO12A_06BC(a0: byte; a1: byte): byte;
procedure pO12A_0737(a0: byte; a1: byte; a2: byte);
procedure pO12A_0FDC(a0: byte; a1: byte);
procedure pO12A_1150(a0: byte);

implementation

uses LIT, O17E, R1C3, R5C0, R5C3, R670;

type
  AL780_byte = array[780..32780] of byte;
  R0_byte = record v: byte end;
  R197_byte = record _p: array[1..197] of byte; v: byte end;
  R256_byte = record _p: array[1..256] of byte; v: byte end;
  R512_byte = record _p: array[1..512] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R58_byte = record _p: array[1..58] of byte; v: byte end;
  R768_byte = record _p: array[1..768] of byte; v: byte end;
  R7_byte = record _p: array[1..7] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  RB0_16_byte = record a: array[0..3749, 0..15] of byte end;
  RB256_16_byte = record _p: array[1..256] of byte; a: array[0..3733, 0..15] of byte end;
  RB512_16_byte = record _p: array[1..512] of byte; a: array[0..3717, 0..15] of byte end;
  RB768_16_byte = record _p: array[1..768] of byte; a: array[0..3701, 0..15] of byte end;
  PAL780_byte = ^AL780_byte;
  PR0_byte = ^R0_byte;
  PR197_byte = ^R197_byte;
  PR256_byte = ^R256_byte;
  PR512_byte = ^R512_byte;
  PR57_byte = ^R57_byte;
  PR58_byte = ^R58_byte;
  PR768_byte = ^R768_byte;
  PR7_byte = ^R7_byte;
  PRA0_byte = ^RA0_byte;
  PRB0_16_byte = ^RB0_16_byte;
  PRB256_16_byte = ^RB256_16_byte;
  PRB512_16_byte = ^RB512_16_byte;
  PRB768_16_byte = ^RB768_16_byte;
var
  a0D64_ec3f: array[0..32759] of byte absolute d0D64;
  a0D6E_ec3f: array[0..32759] of byte absolute d0D6E;
  a0D78_ec3f: array[0..32759] of byte absolute d0D78;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  b0D96: byte absolute d0D96;
  b0D98: byte absolute d0D98;
  b0D9A: byte absolute d0D9A;
  b0D9C: byte absolute d0D9C;
  b0D9E: byte absolute d0D9E;
  b0DA0: byte absolute d0DA0;
  b0DA2: byte absolute d0DA2;
  b0DA4: byte absolute d0DA4;
  b0DA6: byte absolute d0DA6;
  b0DA8: byte absolute d0DA8;
  bA9EE: byte absolute dA9EE;
  bA9EF: byte absolute dA9EF;
  bA9F0: byte absolute dA9F0;
  bA9F1: byte absolute dA9F1;
  bA9F2: byte absolute dA9F2;
  bA9F7: byte absolute dA9F7;
  bA9F8: byte absolute dA9F8;
  bAA08: byte absolute dAA08;
  bC580: byte absolute dC580;
  bC612: byte absolute dC612;
  bC613: byte absolute dC613;
  bC614: byte absolute dC614;
  bC615: byte absolute dC615;
  bC616: byte absolute dC616;
  bC61A: byte absolute dC61A;
  bC61E: byte absolute dC61E;
  bC91E: byte absolute dC91E;
  bD21E: byte absolute dD21E;
  bD91E: byte absolute dD91E;
  g3DC0_87e6: B8 absolute d3DC0;
  gC61E_9554: B768 absolute dC61E;
  gC91E_9554: B768 absolute dC91E;
  lC616: longint absolute dC616;
  p87F8: pointer absolute d87F8;
  p8836: pointer absolute d8836;
  pA9E6: pointer absolute dA9E6;
  pA9EA: pointer absolute dA9EA;
  w0D82: word absolute d0D82;
  w0D84: word absolute d0D84;
  w0D86: word absolute d0D86;
  w0D88: word absolute d0D88;
  w0D8A: word absolute d0D8A;
  w0D8C: word absolute d0D8C;
  w0D8E: word absolute d0D8E;
  w0D90: word absolute d0D90;
  w0D92: word absolute d0D92;
  w0D94: word absolute d0D94;
  wA9F8: word absolute dA9F8;
  wA9FA: word absolute dA9FA;

procedure pO12A_0000(a0: shortint; a1: shortint; a2: byte); far; forward;
procedure pO12A_019D; far; forward;
procedure pO12A_034B(a0: shortint; a1: shortint; a2: byte; a3: byte); far; forward;
function pO12A_0459(a0: shortint; a1: shortint): byte; far; forward;
procedure pO12A_0F5F(a0: byte); far; forward;

{ 0000 }
procedure pO12A_0000(a0: shortint; a1: shortint; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v10w: word;
  _f1: array[1..256] of byte;
  v6sb: shortint absolute v6b;
  v5sb: shortint absolute v5b;
  v4sb: shortint absolute v4b;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
  v1sb: shortint absolute v1b;
begin
  {@0007-0011}
  v5b := a0 - 5;
  if v5sb < 0 then
    v5b := 0;
  {@001B-0025}
  if v5sb > 5 then
    v5b := 5;
  {@0025-0034}
  v1b := a0 - v5sb;
  {@0034-003E}
  v6b := a1 - 5;
  if v6sb < 0 then
    v6b := 0;
  {@0048-0052}
  if v6sb > 5 then
    v6b := 5;
  {@0052-0061}
  v2b := a1 - v6sb;
  for v4b := 0 to 10 do
  begin
    {@006A-0079}
    v8b := v4sb + v6sb;
    for v3b := 0 to 10 do
    begin
      {@0082-0091}
      v7b := v3sb + v5sb;
      {@0091-0096}
      v10w := 256;
      if pO12A_05B9(v7b, v8b, 0) > 0 then
        Inc(v10w);
      {@00AC-00C3}
      if pO12A_05B9(v7b, v8b, 2) > 0 then
        Inc(v10w, 2);
      {@00C3-00DA}
      if pO12A_05B9(v7b, v8b, 4) > 0 then
        Inc(v10w, 4);
      {@00DA-00F1}
      if pO12A_05B9(v7b, v8b, 6) > 0 then
        Inc(v10w, 8);
      {@00F1-0111}
      pO17E_0157(v3sb + 3 - 1, v4sb + 3 - 1, v10w, 1, 0);
    end;
  end;
  {@0123-014B}
  pO17E_0157(v1sb + 3 - 1, v2sb + 3 - 1, a2 shr 1 + 272, 1, 0);
  {@014B-0150}
  pR1C3_10FD;
end;

{ 0156 }
procedure pO12A_0156(a0: byte; a1: byte; a2: byte; a3: byte);
begin
  {@0159-015F}
  bA9EE := a0;
  {@015F-0165}
  bA9EF := a1;
  {@0165-016B}
  bA9F0 := a2;
  {@016B-0171}
  bA9F1 := a3;
end;

{ 019D }
procedure pO12A_019D;
var
  _f1: array[1..2] of byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
begin
  if false then begin
    if LSV = [0, 4] then;
    if LV = 'skygrnd' then;
    LP1('skygrnd');
  end;
  {@01A3-01C9}
  pR1C3_1AF7(2, 16, 11, 44, bA9EE, g3DC0_87e6, p8836);
  {@01C9-01EF}
  pR1C3_1AF7(2, 60, 11, 2, bA9F0, g3DC0_87e6, p8836);
  {@01EF-0215}
  pR1C3_1AF7(2, 62, 11, 42, bA9F1, g3DC0_87e6, p8836);
  {@0215-0219}
  v3b := 2;
  {@0219-021D}
  v4b := 2;
  {@021D-0221}
  v5b := 12;
  {@0221-0225}
  v6b := 12;
  if (bA9F7 and 128) <> 0 then
  begin
    {@022E-023F}
    if lC616 = 0 then
      pO12A_0F5F(bA9F8);
    asm
  db 138,70,253,48,228,80,138,70,252,48,228,80,176,0,80,176,0,80,255,54,24,198,255,54,22,198,255,54
  db 56,136,255,54,54,136
  call pR1C3_08C0
  db 128,62,19,198,0,117,10,198,6,18,198,1,198,6,19,198,1
    end;
    {@0277-027A}
    Exit;
  end;
  {@027A-0280}
  bC614 := bC615;
  {@0280-0285}
  bC615 := 1;
  if PR57_byte(p87F8)^.v in [0, 4] then
  begin
    {@029A-02BC}
    if PR7_byte(p87F8)^.v >= 14 then
      bC615 := 2
    else
    begin
      {@02AC-02BC}
      if PR58_byte(p87F8)^.v <> 0 then
        bC615 := 3;
    end;
  end
  else
    bC615 := 4;
  {@02C3-030F}
  if bC614 <> bC615 then
  begin
    {@02CC-02D6}
    pR1C3_1A83(@bC61A);
    {@02D6-02F9}
    pR1C3_0352('skygrnd', bC615, 0, 13, @bC61A);
    {@02F9-030A}
    pR1C3_1E9D(144, 32, @bC61E);
    {@030A-030F}
    bC613 := 1;
  end;
  {@030F-0320}
  if bC613 <> 0 then
  begin
    {@0316-031B}
    bC612 := 1;
    {@031B-0320}
    bC613 := 0;
  end;
  asm
  db 138,70,253,48,228,80,138,70,252,48,228,80,176,0,80,176,0,80,255,54,28,198,255,54,26,198,255,54
  db 56,136,255,54,54,136
  call pR1C3_08C0
  end;
end;

{ 034B }
procedure pO12A_034B(a0: shortint; a1: shortint; a2: byte; a3: byte);
var
  v2w: word;
  v4w: word;
  v6i: integer;
  v8i: integer;
  v9b: byte;
begin
  {@0351-035F}
  v9b := a0D64_ec3f[a3];
  {@035F-0378}
  v2w := a0D6E_ec3f[a3] + a0 - 1;
  {@0378-0391}
  v4w := a0D78_ec3f[a3] + a1 - 1;
  for v8i := a1 to v4w do
    for v6i := a0 to v2w do
    begin
      asm
  db 131,126,248,0,124,111,131,126,248,10,127,105,131,126,250,0,124,99,131,126,250,10,127,93,138,70,247,48
  db 228,139,200,138,70,8,48,228,186,156,0,247,226,196,62,230,169,3,248,3,249,38,128,189,100,255,0,118
  db 60,139,70,250,5,3,0,72,80,139,70,248,5,3,0,72,80,138,70,247,48,228,139,200,138,70,8,48
  db 228,186,156,0,247,226,196,62,230,169,3,248,3,249,38,138,133,100,255,48,228,80,176,1,80,176,1,80
  call pO17E_0157
      end;
      {@043A-043D}
      Inc(v9b);
    end;
end;

{ 0459 }
function pO12A_0459(a0: shortint; a1: shortint): byte;
var
  _f1: array[1..1] of byte;
begin
  {@045F-047D}
  if (a0 > 15) or (a0 < 0) or (a1 > 15) or (a1 < 0) then
  begin
    {@0477-047B}
    pO12A_0459 := 0;
    {@047B-047D}
    Exit;
  end;
  {@047D-0481}
  pO12A_0459 := 1;
end;

{ 048A }
function pO12A_048A(a0: byte; a1: byte; a2: byte): byte;
var
  v2b: byte;
begin
  {@0490-04B5}
  if (pO12A_0459(a0, a1) = 0) and ((bC580 = 0) or (bC580 = 80)) then
  begin
    {@04AE-04B2}
    pO12A_048A := 0;
    {@04B2-04B5}
    Exit;
  end;
  {@04B5-04CB}
  if shortint(a0) > 15 then
    a0 := 0
  else
  begin
    {@04C1-04CB}
    if shortint(a0) < 0 then
      a0 := 15;
  end;
  {@04CB-04E1}
  if shortint(a1) > 15 then
    a1 := 0
  else
  begin
    {@04D7-04E1}
    if shortint(a1) < 0 then
      a1 := 15;
  end;
  {@04E1-04E5}
  v2b := 1;
  if pO12A_05B9(a0, a1, a2) > 0 then
    case a2 of
      6: v2b := PRB768_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 192 shr 6;
      4: v2b := PRB768_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 48 shr 4;
      2: v2b := PRB768_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 12 shr 2;
      0: v2b := PRB768_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 3;
    end;
  {@05AA-05B0}
  pO12A_048A := v2b;
end;

{ 05B9 }
function pO12A_05B9(a0: byte; a1: byte; a2: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@05BF-05E4}
  if (pO12A_0459(a0, a1) = 0) and ((bC580 = 0) or (bC580 = 80)) then
  begin
    {@05DD-05E1}
    pO12A_05B9 := 0;
    {@05E1-05E4}
    Exit;
  end;
  {@05E4-05FA}
  if shortint(a0) > 15 then
    a0 := 0
  else
  begin
    {@05F0-05FA}
    if shortint(a0) < 0 then
      a0 := 15;
  end;
  {@05FA-0610}
  if shortint(a1) > 15 then
    a1 := 0
  else
  begin
    {@0606-0610}
    if shortint(a1) < 0 then
      a1 := 15;
  end;
  {@0610-06B3}
  case a2 of
    0: pO12A_05B9 := PRB0_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 240 shr 4;
    2: pO12A_05B9 := PRB0_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 15;
    4: pO12A_05B9 := PRB256_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 240 shr 4;
    6: pO12A_05B9 := PRB256_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)] and 15;
  end;
end;

{ 06BC }
function pO12A_06BC(a0: byte; a1: byte): byte;
var
  _f1: array[1..1] of byte;
begin
  {@06C2-06E6}
  if (pO12A_0459(a0, a1) = 0) and ((bC580 = 0) or (bC580 = 80)) then
  begin
    {@06E0-06E4}
    pO12A_06BC := 0;
    {@06E4-06E6}
    Exit;
  end;
  {@06E6-06FC}
  if shortint(a0) > 15 then
    a0 := 0
  else
  begin
    {@06F2-06FC}
    if shortint(a0) < 0 then
      a0 := 15;
  end;
  {@06FC-0706}
  if shortint(a1) > 15 then
    a1 := 0;
  {@0706-0710}
  if shortint(a1) < 0 then
    a1 := 15;
  {@0710-072E}
  pO12A_06BC := PRB512_16_byte(pA9EA)^.a[shortint(a1), shortint(a0)];
end;

{ 0737 }
procedure pO12A_0737(a0: byte; a1: byte; a2: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v5w: word;
  v7w: word;
  v9w: word;
  v11w: word;
  v13w: word;
  v15w: word;
  v16b: byte;
  v18w: word;
  v19b: byte;
  v20b: byte;
  v21b: byte;
  _f1: array[1..1] of byte;
  v23b: byte;
  _f2: array[1..1] of byte;
  v15b: byte absolute v15w;
  v13b: byte absolute v13w;
begin
  {@073D-0757}
  if bA9F2 <> 0 then
  begin
    {@0744-0754}
    pO12A_0000(a0, a1, a2);
    {@0754-0757}
    Exit;
  end;
  {@0757-075C}
  bAA08 := 0;
  {@075C-0760}
  pO12A_019D;
  {@0760-0772}
  v1b := Byte((a2 + 6) mod 8);
  {@0772-0784}
  v3b := Byte((a2 + 4) mod 8);
  {@0784-0795}
  v2b := Byte((a2 + 2) mod 8);
  {@0795-079C}
  v5w := shortint(a0);
  {@079C-07A3}
  v7w := shortint(a1);
  {@07A3-07B2}
  v9w := a3EAC_ff2a[a2];
  {@07B2-07C1}
  v11w := a3EB5_ff2a[a2];
  {@07C1-07C5}
  v19b := 2;
  {@07C5-07D0}
  Inc(v5w, v19b * v9w);
  {@07D0-07DB}
  Inc(v7w, v19b * v11w);
  {@07DB-0EE9}
  repeat
    {@07DB-0EB9}
    case v19b of
      2: begin
        {@07E5-07EB}
        v13w := v5w;
        {@07EB-07F1}
        v15w := v7w;
        {@07F1-07F5}
        v16b := 0;
        {@07F5-07FA}
        v18w := 0;
        {@07FA-07FE}
        v23b := 0;
        {@07FE-0906}
        while v16b < 4 do
        begin
          {@0807-081A}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if (pO12A_0459(v13b, v15b) = 0) and (pO12A_05B9(v13b, v15b, v2b) = 0) then
            v23b := 0;
          {@0842-08D8}
          if v20b <> 0 then
          begin
            {@0848-0865}
            if v23b > 0 then
              pO12A_034B(w0D94 + v18w + 1, b0DA8, v23b, 9);
            {@0865-086B}
            v23b := v20b;
            {@086B-0881}
            pO12A_034B(w0D82 + v18w, b0D96, v20b, 0);
          end
          else
          begin
            {@0883-08D4}
if (v23b > 0) and (pO12A_05B9(Integer(v13w) - a3EAC_ff2a[v1b], Integer(v15w) - a3EB5_ff2a[v1b],
                v1b) <> 0) then
              pO12A_034B(w0D94 + v18w + 1, b0DA8, v23b, 9);
            {@08D4-08D8}
            v23b := 0;
          end;
          {@08D8-08DB}
          Inc(v16b);
          {@08DB-08DF}
          Dec(v18w, 2);
          {@08DF-08F1}
          v13w := a3EAC_ff2a[v1b] + Integer(v13w);
          {@08F1-0903}
          v15w := a3EB5_ff2a[v1b] + Integer(v15w);
        end;
        {@0906-090C}
        v13w := v5w;
        {@090C-0912}
        v15w := v7w;
        {@0912-0916}
        v16b := 0;
        {@0916-091B}
        v18w := 0;
        {@091B-091F}
        v23b := 0;
        {@091F-0A27}
        while v16b < 4 do
        begin
          {@0928-093B}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if (pO12A_0459(v13b, v15b) = 0) and (pO12A_05B9(v13b, v15b, v1b) = 0) then
            v23b := 0;
          {@0963-09F9}
          if v20b <> 0 then
          begin
            {@0969-0986}
            if v23b > 0 then
              pO12A_034B(w0D94 + v18w - 1, b0DA8, v23b, 9);
            {@0986-098C}
            v23b := v20b;
            {@098C-09A2}
            pO12A_034B(w0D82 + v18w, b0D96, v20b, 0);
          end
          else
          begin
            {@09A4-09F5}
if (v23b > 0) and (pO12A_05B9(Integer(v13w) - a3EAC_ff2a[v2b], Integer(v15w) - a3EB5_ff2a[v2b],
                v2b) <> 0) then
              pO12A_034B(w0D94 + v18w - 1, b0DA8, v23b, 9);
            {@09F5-09F9}
            v23b := 0;
          end;
          {@09F9-09FC}
          Inc(v16b);
          {@09FC-0A00}
          Inc(v18w, 2);
          {@0A00-0A12}
          v13w := a3EAC_ff2a[v2b] + Integer(v13w);
          {@0A12-0A24}
          v15w := a3EB5_ff2a[v2b] + Integer(v15w);
        end;
        {@0A27-0A2D}
        v13w := v5w;
        {@0A2D-0A33}
        v15w := v7w;
        {@0A33-0A37}
        v16b := 0;
        {@0A37-0A3C}
        v18w := 0;
        {@0A3C-0ABE}
        while v16b < 3 do
        begin
          {@0A42-0A55}
          v21b := pO12A_05B9(v13b, v15b, v1b);
          if v21b <> 0 then
          begin
            {@0A5B-0A90}
            if v16b = 0 then
              pO12A_034B(w0D84 + v18w, b0D98, v21b, 1)
            else
              pO12A_034B(w0D84 + v18w - 1, b0D98, v21b, 1);
          end;
          {@0A90-0A93}
          Inc(v16b);
          {@0A93-0A97}
          Dec(v18w, 2);
          {@0A97-0AA9}
          v13w := a3EAC_ff2a[v1b] + Integer(v13w);
          {@0AA9-0ABB}
          v15w := a3EB5_ff2a[v1b] + Integer(v15w);
        end;
        {@0ABE-0AC4}
        v13w := v5w;
        {@0AC4-0ACA}
        v15w := v7w;
        {@0ACA-0ACE}
        v16b := 0;
        {@0ACE-0AD3}
        v18w := 0;
        {@0AD3-0B55}
        while v16b < 3 do
        begin
          {@0AD9-0AEC}
          v21b := pO12A_05B9(v13b, v15b, v2b);
          if v21b <> 0 then
          begin
            {@0AF2-0B27}
            if v16b = 0 then
              pO12A_034B(w0D86 + v18w, b0D9A, v21b, 2)
            else
              pO12A_034B(w0D86 + v18w + 1, b0D9A, v21b, 2);
          end;
          {@0B27-0B2A}
          Inc(v16b);
          {@0B2A-0B2E}
          Inc(v18w, 2);
          {@0B2E-0B40}
          v13w := a3EAC_ff2a[v2b] + Integer(v13w);
          {@0B40-0B52}
          v15w := a3EB5_ff2a[v2b] + Integer(v15w);
        end;
      end;
      1: begin
        {@0B5F-0B71}
        v13w := a3EAC_ff2a[v1b] + Integer(v5w);
        {@0B71-0B83}
        v13w := a3EAC_ff2a[v1b] + Integer(v13w);
        {@0B83-0B95}
        v15w := a3EB5_ff2a[v1b] + Integer(v7w);
        {@0B95-0BA7}
        v15w := a3EB5_ff2a[v1b] + Integer(v15w);
        {@0BA7-0BAB}
        v16b := 0;
        {@0BAB-0BB0}
        v18w := 65530;
        {@0BB0-0C45}
        while v16b < 3 do
        begin
          {@0BB9-0BCC}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if v20b <> 0 then
            pO12A_034B(w0D88 + v18w, b0D9C, v20b, 3);
          {@0BE8-0BFB}
          v21b := pO12A_05B9(v13b, v15b, v1b);
          if v21b <> 0 then
            pO12A_034B(w0D8A + v18w, b0D9E, v21b, 4);
          {@0C17-0C1A}
          Inc(v16b);
          {@0C1A-0C1E}
          Inc(v18w, 3);
          {@0C1E-0C30}
          v13w := a3EAC_ff2a[v2b] + Integer(v13w);
          {@0C30-0C42}
          v15w := a3EB5_ff2a[v2b] + Integer(v15w);
        end;
        {@0C45-0C57}
        v13w := a3EAC_ff2a[v2b] + Integer(v5w);
        {@0C57-0C69}
        v13w := a3EAC_ff2a[v2b] + Integer(v13w);
        {@0C69-0C7B}
        v15w := a3EB5_ff2a[v2b] + Integer(v7w);
        {@0C7B-0C8D}
        v15w := a3EB5_ff2a[v2b] + Integer(v15w);
        {@0C8D-0C91}
        v16b := 0;
        {@0C91-0C96}
        v18w := 6;
        {@0C96-0D2B}
        while v16b < 3 do
        begin
          {@0C9F-0CB2}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if v20b <> 0 then
            pO12A_034B(w0D88 + v18w, b0D9C, v20b, 3);
          {@0CCE-0CE1}
          v21b := pO12A_05B9(v13b, v15b, v2b);
          if v21b <> 0 then
            pO12A_034B(w0D8C + v18w, b0DA0, v21b, 5);
          {@0CFD-0D00}
          Inc(v16b);
          {@0D00-0D04}
          Dec(v18w, 3);
          {@0D04-0D16}
          v13w := a3EAC_ff2a[v1b] + Integer(v13w);
          {@0D16-0D28}
          v15w := a3EB5_ff2a[v1b] + Integer(v15w);
        end;
      end;
      0: begin
        {@0D35-0D47}
        v13w := a3EAC_ff2a[v1b] + Integer(v5w);
        {@0D47-0D59}
        v15w := a3EB5_ff2a[v1b] + Integer(v7w);
        {@0D59-0D5D}
        v16b := 0;
        {@0D5D-0D62}
        v18w := 65529;
        {@0D62-0DF7}
        while v16b < 2 do
        begin
          {@0D6B-0D7E}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if v20b <> 0 then
            pO12A_034B(w0D8E + v18w, b0DA2, v20b, 6);
          {@0D9A-0DAD}
          v21b := pO12A_05B9(v13b, v15b, v1b);
          if v21b <> 0 then
            pO12A_034B(w0D90 + v18w, b0DA4, v21b, 7);
          {@0DC9-0DCC}
          Inc(v16b);
          {@0DCC-0DD0}
          Inc(v18w, 7);
          {@0DD0-0DE2}
          v13w := a3EAC_ff2a[v2b] + Integer(v13w);
          {@0DE2-0DF4}
          v15w := a3EB5_ff2a[v2b] + Integer(v15w);
        end;
        {@0DF7-0E09}
        v13w := a3EAC_ff2a[v2b] + Integer(v5w);
        {@0E09-0E1B}
        v15w := a3EB5_ff2a[v2b] + Integer(v7w);
        {@0E1B-0E1F}
        v16b := 0;
        {@0E1F-0E24}
        v18w := 7;
        {@0E24-0EB9}
        while v16b < 2 do
        begin
          {@0E2D-0E40}
          v20b := pO12A_05B9(v13b, v15b, a2);
          if v20b <> 0 then
            pO12A_034B(w0D8E + v18w, b0DA2, v20b, 6);
          {@0E5C-0E6F}
          v21b := pO12A_05B9(v13b, v15b, v2b);
          if v21b <> 0 then
            pO12A_034B(w0D92 + v18w, b0DA6, v21b, 8);
          {@0E8B-0E8E}
          Inc(v16b);
          {@0E8E-0E92}
          Dec(v18w, 7);
          {@0E92-0EA4}
          v13w := a3EAC_ff2a[v1b] + Integer(v13w);
          {@0EA4-0EB6}
          v15w := a3EB5_ff2a[v1b] + Integer(v15w);
        end;
      end;
    end;
    {@0EB9-0ECB}
    v5w := a3EAC_ff2a[v3b] + Integer(v5w);
    {@0ECB-0EDD}
    v7w := a3EB5_ff2a[v3b] + Integer(v7w);
    {@0EDD-0EE0}
    Dec(v19b);
  until v19b = 255;
  {@0EE9-0EEE}
  pR1C3_10FD;
  if bC612 <> 0 then
  begin
    {@0EF5-0F4E}
    if bC613 <> 0 then
    begin
      {@0EFC-0F0E}
      pR1C3_1F24(144, 32, gC91E_9554);
      {@0F0E-0F24}
      pR1C3_1EE1(144, 32, @bC91E, @bD21E);
    end
    else
    begin
      {@0F26-0F38}
      pR1C3_1F24(144, 32, gC61E_9554);
      {@0F38-0F4E}
      pR1C3_1EE1(144, 32, @bC61E, @bD21E);
    end;
    {@0F4E-0F53}
    bC612 := 0;
  end;
end;

{ 0F5F }
procedure pO12A_0F5F(a0: byte);
var
  v6a: string[5];
  v6a2: string[5] absolute v6a;
begin
  if false then begin
    if LV = 'back1' then;
  end;
  {@0F65-0F78}
  v6a := 'back1';
  {@0F78-0F92}
  pR1C3_0352(v6a2, a0, 0, bA9EE, @bC616);
  {@0F92-0FA3}
  pR1C3_1E9D(144, 32, @bC91E);
  {@0FA3-0FA8}
  bC612 := 1;
end;

{ 0FDC }
procedure pO12A_0FDC(a0: byte; a1: byte);
var
  v2w: word;
  v6p: pointer;
  v8w: word;
  _f1: array[1..1] of byte;
  v11w: word;
  _f2: array[1..2] of byte;
  v14b: byte;
  v15b: byte;
  v6b: byte absolute v6p;
  v2b: byte absolute v2w;
begin
  if false then begin
    if LV = 'WALLDEF1' then;
    if LV = '.dax' then;
    if LV = 'Unable to load ' then;
    if LV = ' from WALLDEF1.' then;
  end;
  {@0FE2-0FEB}
  if a1 > 3 then
    Exit;
  {@0FEB-101C}
  pR5C3_0915('WALLDEF1', '.dax', a0, @v2b, @v6b);
  if (v2w = 0) or ((v2w div 780 + a1) > 4) then
  begin
    {@103A-103F}
    pR1C3_00AC;
    {@103F-1074}
    WriteLn(Output, 'Unable to load ', a0, ' from WALLDEF1.');
    {@1074-107C}
    v15b := pR670_0187;
    {@107C-1081}
    pR1C3_00AC;
    {@1081-1089}
    pR670_0000(0);
  end;
  {@1089-108E}
  v8w := 0;
  {@108E-1093}
  v11w := 1;
  {@1093-10CF}
  repeat
    {@1093-10BF}
    Move(PRA0_byte(v6p)^.a[v8w], PAL780_byte(pA9E6)^[(a1 + v11w) * 780], 780);
    {@10BF-10C4}
    Inc(v8w, 780);
    {@10C4-10C7}
    Inc(v11w);
  until v8w >= v2w;
  {@10CF-10DD}
  pR5C0_0000(v6p, v2w);
  {@10DD-10E4}
  v14b := v11w - 1;
  {@10E4-10F1}
  pO17E_004B(a0, a1);
  {@10F1-10F6}
  bD91E := 1;
  {@10F6-10FE}
  pO12A_0F5F(a0);
  {@10FE-110F}
  pR1C3_1E9D(32, 115, @bD21E);
  {@110F-1117}
  wA9F8 := a0;
  {@1117-111F}
  wA9FA := a1;
end;

{ 1150 }
procedure pO12A_1150(a0: byte);
var
  v2w: word;
  v6p: pointer;
  v8w: word;
  v9b: byte;
  v6b: byte absolute v6p;
  v2b: byte absolute v2w;
begin
  if false then begin
    if LV = 'GEO1' then;
    if LV = '.dax' then;
    if LV = 'Unable to load geo in Load3DMap.' then;
  end;
  {@1156-1187}
  pR5C3_0915('GEO1', '.dax', a0, @v2b, @v6b);
  if (v2w = 0) or (v2w <> 1026) then
  begin
    {@1194-1199}
    pR1C3_00AC;
    {@1199-11B0}
    WriteLn(Output, 'Unable to load geo in Load3DMap.');
    {@11B0-11B8}
    v9b := pR670_0187;
    {@11B8-11BD}
    pR1C3_00AC;
    {@11BD-11C5}
    pR670_0000(0);
  end;
  {@11C5-11CA}
  v8w := 2;
  {@11CA-11E3}
  Move(PRA0_byte(v6p)^.a[v8w], PR0_byte(pA9EA)^.v, 256);
  {@11E3-11E8}
  Inc(v8w, 256);
  {@11E8-1205}
  Move(PRA0_byte(v6p)^.a[v8w], PR256_byte(pA9EA)^.v, 256);
  {@1205-120A}
  Inc(v8w, 256);
  {@120A-1227}
  Move(PRA0_byte(v6p)^.a[v8w], PR512_byte(pA9EA)^.v, 256);
  {@1227-122C}
  Inc(v8w, 256);
  {@122C-1249}
  Move(PRA0_byte(v6p)^.a[v8w], PR768_byte(pA9EA)^.v, 256);
  {@1249-1257}
  pR5C0_0000(v6p, v2w);
  {@1257-1263}
  PR197_byte(p87F8)^.v := a0;
end;

{ 1269 }
begin
end.

