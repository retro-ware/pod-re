{ O052: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O052;

interface

uses GAMEDATA;

procedure pO052_071E;
procedure pO052_035E(a0: pointer; a1: pointer);

implementation

uses LIT, O0AA, O0B5, O0EC, O108, R142, R47F, R670;

type
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R331_word = record _p: array[1..331] of byte; v: word end;
  R39_byte = record _p: array[1..39] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_longint = record _p: array[1..42] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R58_word = record _p: array[1..58] of byte; v: word end;
  RA0_byte = record a: array[0..32000] of byte end;
  PR0_X63 = ^R0_X63;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR331_word = ^R331_word;
  PR39_byte = ^R39_byte;
  PR423_pointer = ^R423_pointer;
  PR42_longint = ^R42_longint;
  PR42_pointer = ^R42_pointer;
  PR57_byte = ^R57_byte;
  PR58_word = ^R58_word;
  PRA0_byte = ^RA0_byte;
var
  b7FF8: byte absolute d7FF8;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  lA7BE: longint absolute dA7BE;
  lA7CA: longint absolute dA7CA;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  pA7CA: pointer absolute dA7CA;
  s2297: string absolute d2297;
  s22C0: string absolute d22C0;
  s22E9: string absolute d22E9;
  s2AC0: string absolute d2AC0;
  s3058: string absolute d3058;
  s30AA: string absolute d30AA;

procedure pO052_0020; far; forward;
procedure pO052_00D2(a0: pointer; a1: pointer; a2: pointer; a3: pointer); far; forward;
procedure pO052_0484; far; forward;

{ 0020 }
procedure pO052_0020;
var
  v11a: string[10];
  v11a2: string[10] absolute v11a;
  v11b: byte absolute v11a;
begin
  if false then begin
    if LV = 'Personal funds:' then;
    if LV = 'Pooled funds:  ' then;
  end;
  {@0027-0045}
  Str(PR331_word(p9CEE)^.v, v11a);
  {@0045-0052}
  pR47F_0FF0(@v11b, 10);
  {@0052-007D}
  pR47F_0354(1, 20, 15, 0, 'Personal funds:' + v11a2);
  {@007D-0096}
  Str(lA7BE, v11a);
  {@0096-00A3}
  pR47F_0FF0(@v11b, 10);
  {@00A3-00CE}
  pR47F_0354(1, 21, 15, 0, 'Pooled funds:  ' + v11a2);
end;

{ 00D2 }
procedure pO052_00D2(a0: pointer; a1: pointer; a2: pointer; a3: pointer);
var
c56: record case byte of 0: (v56a3: string[55]); 1: (v56a: string[30]); 2: (v56a2: array[0..30] of byte);
      3: (_p3: array[1..31] of byte; v25a: string[16]); 4: (_p4: array[1..31] of byte;
      v25a2: array[0..16] of byte); 5: (_p5: array[1..31] of byte; v25b: byte);
      6: (_p6: array[1..48] of byte; v8p: pointer); 7: (_p7: array[1..52] of byte; v4p: pointer) end;
  v57b: byte;
  v58b: byte;
  v60w: word;
begin
  {@00D8-00E5}
  c56.v8p := pA7CA;
  {@00E5-029E}
  while c56.v8p <> nil do
  begin
    {@00F0-0103}
    c56.v56a := s30AA;
    if PR58_word(c56.v8p)^.v = 0 then
      PR58_word(c56.v8p)^.v := 1;
    {@0116-01B0}
    case PR39_byte(p87F8)^.v of
      1: v60w := PR58_word(c56.v8p)^.v div 16;
      2: v60w := PR58_word(c56.v8p)^.v div 8;
      4: v60w := PR58_word(c56.v8p)^.v shr 1 shr 1;
      8: v60w := PR58_word(c56.v8p)^.v shr 1;
      32: v60w := PR58_word(c56.v8p)^.v * 2;
      64: v60w := PR58_word(c56.v8p)^.v * 4;
      128: v60w := PR58_word(c56.v8p)^.v * 8;
    else
      {@01A6-01B0}
      v60w := PR58_word(c56.v8p)^.v;
    end;
    {@01B0-01C9}
    if PR57_byte(c56.v8p)^.v > 1 then
      v60w := PR57_byte(c56.v8p)^.v * v60w;
    {@01C9-01D4}
    if v60w = 0 then
      v60w := 1;
    {@01D4-01EC}
    Str(v60w, c56.v25a);
    {@01EC-01F2}
    v57b := c56.v25b;
    for v58b := 1 to v57b do
      c56.v56a2[30 - v57b + v58b] := c56.v25a2[v58b];
    {@0233-023C}
    v57b := PR0_byte(c56.v8p)^.v;
    for v58b := 1 to v57b do
      c56.v56a2[v58b] := PRA0_byte(c56.v8p)^.a[v58b];
    {@0270-0283}
    PR0_string_40_(c56.v8p)^.v := c56.v56a3;
    {@0283-028A}
    PR0_byte(c56.v8p)^.v := 30;
    {@028A-029B}
    c56.v8p := PR42_pointer(c56.v8p)^.v;
  end;
  {@029E-02AB}
  c56.v4p := pA7CA;
  {@02AB-02B0}
  bAAE5 := 0;
  {@02B0-02B8}
  pO108_00CB(0);
  {@02B8-02F4}
PR0_byte(a0)^.v := pO108_1D45(s2AC0, s3058, 1, 1, 38, 18, c56.v4p, 1, 0, @b7FF8, @PR0_byte(a3)^.v,
      @PR0_byte(a2)^.v);
  {@02F4-0308}
  PR0_longint(a1)^.v := PR0_longint(a2)^.v;
  {@0308-0315}
  c56.v8p := pA7CA;
  {@0315-034D}
  while c56.v8p <> nil do
  begin
    asm
  db 49,192,49,210,82,80,255,118,250,255,118,248,176,0,80,176,0,80,176,0,80,176,0,80
  call pO0EC_0484
    end;
    {@033A-034B}
    c56.v8p := PR42_pointer(c56.v8p)^.v;
  end;
end;

{ 035E }
procedure pO052_035E(a0: pointer; a1: pointer);
var
  v4p: pointer;
  v8p: pointer;
begin
  if false then begin
    if LV = 'OverLoaded' then;
  end;
  {@0364-039C}
  if pO0AA_2DD0(p9CEE, 1, pointer(a0)) <> 0 then
  begin
    {@037E-0392}
    pO0EC_1AAC('OverLoaded');
    {@0392-0399}
    PR0_byte(a1)^.v := 1;
    {@0399-039C}
    Exit;
  end;
  {@039C-03A3}
  PR0_byte(a1)^.v := 0;
  {@03A3-03B7}
  v4p := PR423_pointer(p9CEE)^.v;
  if v4p = nil then
  begin
    {@03BF-03CA}
    v4p := pR670_037F;
    {@03CA-03DD}
    PR0_X63(v4p)^.v := PR0_X63(a0)^.v;
    {@03DD-03EA}
    PR42_pointer(v4p)^.v := nil;
    {@03EA-03FE}
    PR423_pointer(p9CEE)^.v := v4p;
  end
  else
  begin
    {@0400-0420}
    while PR42_pointer(v4p)^.v <> nil do
      v4p := PR42_pointer(v4p)^.v;
    {@0420-042B}
    v8p := pR670_037F;
    {@042B-043E}
    PR0_X63(v8p)^.v := PR0_X63(a0)^.v;
    {@043E-044B}
    PR42_longint(v8p)^.v := 0;
    {@044B-045C}
    PR42_pointer(v4p)^.v := v8p;
  end;
  {@045C-0471}
  if PR57_byte(a0)^.v > 0 then
    pO0AA_1C04(v8p);
  {@0471-047E}
  pO0EC_0EBF(p9CEE);
end;

{ 0484 }
procedure pO052_0484;
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v8w: word;
  v10w: word;
  v14l: longint;
  v15b: byte;
  v19l: longint;
  v21w: word;
  v21b: byte absolute v21w;
  v19b: byte absolute v19l;
  v4b: byte absolute v4p;
begin
  {@048B-0493}
  v4p := nil;
  {@0493-04A0}
  v19l := lA7CA;
  {@04A0-04A5}
  v21w := 0;
  {@04A5-04AD}
  pR142_00D4(0);
  {@04AD-04B2}
  b7FF8 := 1;
  {@04B2-071A}
  repeat
    {@04B2-04B6}
    pO052_0020;
    {@04B6-04CE}
    pO052_00D2(@v5b, @v4b, @v19b, @v21b);
    if (v5b = 27) and (bAAE6 <> 0) then
      v6b := 1
    else
    begin
      {@04E2-04E6}
      v6b := 0;
      case PR39_byte(p87F8)^.v of
        1: v8w := PR58_word(v4p)^.v div 16;
        2: v8w := PR58_word(v4p)^.v div 8;
        4: v8w := PR58_word(v4p)^.v shr 1 shr 1;
        8: v8w := PR58_word(v4p)^.v shr 1;
        16: v8w := PR58_word(v4p)^.v;
        32: v8w := PR58_word(v4p)^.v * 2;
        64: v8w := PR58_word(v4p)^.v * 4;
        128: v8w := PR58_word(v4p)^.v * 8;
      end;
      {@0585-059E}
      if PR57_byte(v4p)^.v > 1 then
        v8w := PR57_byte(v4p)^.v * v8w;
      {@059E-05A9}
      if v8w = 0 then
        v8w := 1;
      {@05A9-05B5}
      v10w := PR331_word(p9CEE)^.v;
      {@05B5-05C2}
      v14l := lA7BE;
      if v8w <= v10w then
      begin
        {@05CD-05DC}
        pO052_035E(v4p, @v15b);
        if v15b = 0 then
        begin
          {@05E2-05EE}
          Dec(PR331_word(p9CEE)^.v, v8w);
          if PR57_byte(v4p)^.v > 0 then
            pO0EC_1AAC(PR0_string(p9CEE)^.v + s2297 + PR0_string(v4p)^.v)
          else
            pO0EC_1AAC(PR0_string(p9CEE)^.v + s22C0 + PR0_string(v4p)^.v);
        end;
      end
      else
      begin
        {@0651-0711}
        if v8w <= (LongInt(v10w) + v14l) then
        begin
          {@0675-0684}
          pO052_035E(v4p, @v15b);
          if v15b = 0 then
          begin
            {@068A-0695}
            PR331_word(p9CEE)^.v := 0;
            {@0695-06A5}
            Dec(lA7BE, v8w - v10w);
            if PR57_byte(v4p)^.v > 0 then
              pO0EC_1AAC(PR0_string(p9CEE)^.v + s2297 + PR0_string(v4p)^.v)
            else
              pO0EC_1AAC(PR0_string(p9CEE)^.v + s22C0 + PR0_string(v4p)^.v);
          end;
        end
        else
          pO0EC_1AAC(s22E9);
      end;
    end;
  until v6b <> 0;
end;

{ 071E }
procedure pO052_071E;
var loc: array[1..14] of byte;
begin
  asm
    db 160,12,136,162,13,136,198,6,12,136,1,198,6,120,197,0
    call pO0EC_2ED1
    db 198,6,120,197,1,255,54,240,156,255,54,238,156
    call pO0EC_07C0
    db 191,190,167,30,87,184,12,0,80
    call XR670_046E
    db 198,6,98,174,0,198,70,254,0,161,202,167,139,22,204,167,137,70,244,137,86,246,139,70,244,11,70,246
    db 116,48,49,192,49,210,82,80,255,118,246,255,118,244,176,0,80,176,0,80,176,0,80,176,0,80
    call pO0EC_0484
    db 196,126,244,38,139,69,42,38,139,85,44,137,70,244,137,86,246,235,200,198,70,243,1,141,126,250,22,87
    db 141,126,249,22,87
    call pO0B5_0E45
    db 128,126,250,0,116,10,176,6,80
    call pO108_00CB
    db 235,45,198,70,253,0,198,70,252,0,235,3,254,70,252,128,126,252,2,116,20,128,126,252,4,116,14,138
    db 70,252,80,141,126,253,22,87
    call pO108_00AB
    db 128,126,252,6,117,221,138,70,243,162,229,170,191,140,39,30,87,191,129,48,30,87,176,1,80,176,0,80
    call pO108_1009
    db 136,70,251,160,229,170,136,70,243,128,62,230,170,0,116,34,138,70,251,60,72,116,4,60,80,117,15,138
    db 70,251,80
    call pO0AA_2F7B
    db 198,70,251,255,235,8,60,27,117,4,198,70,251,6,138,70,251,60,0,117,7
    push cs
    call near ptr pO052_0484
    db 233,209,0,60,1,117,13,141,126,255,22,87
    call pO0AA_0C9D
    db 233,192,0,60,2,117,8
    call pO0B5_0B93
    db 233,180,0,60,3,117,8
    call pO0B5_0453
    db 233,168,0,60,4,117,8
    call pO0B5_0567
    db 233,156,0,60,5,117,13,141,126,248,22,87
    call pO0B5_0EB7
    db 233,139,0,60,6,116,3,233,132,0,141,126,250,22,87,141,126,249,22,87
    call pO0B5_0E45
    db 128,126,250,0,116,107,176,1,80,176,17,80,176,38,80,176,22,80,176,10,80,176,0,80,176,1,80,191
    db 18,35,30,87
    call pR47F_0498
    db 176,1,80,176,17,80,176,38,80,176,22,80,176,15,80,176,0,80,176,0,80,191,99,35,30,87
    call pR47F_0498
    db 191,140,39,30,87,160,98,83,80
    call pO108_2254
    db 58,6,99,83,117,6,198,70,254,1,235,17,176,1,80,176,17,80,176,38,80,176,22,80
    call pR47F_0F07
    db 235,4,198,70,254,1,138,70,251,60,0,116,8,60,2,116,4,60,5,117,7
    call pO0EC_2ED1
    db 235,15,60,3,117,11,128,126,248,0,116,5
    call pO0EC_2ED1
    db 255,54,240,156,255,54,238,156
    call pO0EC_07C0
    db 128,126,254,0,117,3,233,77,254,160,13,136,162,12,136
  end;
end;

{ 0968 }
begin
end.

