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
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b7FF8: byte absolute d7FF8;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bC578: byte absolute dC578;
  lA7BE: longint absolute dA7BE;
  lA7CA: longint absolute dA7CA;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  pA7CA: pointer absolute dA7CA;
  s2297: string absolute d2297;
  s22C0: string absolute d22C0;
  s22E9: string absolute d22E9;
  s2312: string absolute d2312;
  s2363: string absolute d2363;
  s278C: string absolute d278C;
  s2AC0: string absolute d2AC0;
  s3058: string absolute d3058;
  s3081: string absolute d3081;
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
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v12p: pointer;
  v13b: byte;
  _f1: array[1..1] of byte;
begin
  {@0724-072A}
  b880D := b880C;
  {@072A-072F}
  b880C := 1;
  {@072F-0734}
  bC578 := 0;
  {@0734-0739}
  pO0EC_2ED1;
  {@0739-073E}
  bC578 := 1;
  {@073E-074B}
  pO0EC_07C0(p9CEE);
  asm
  db 191,190,167,30,87,184,12,0,80
  call XR670_046E
  db 198,6,98,174,0,198,70,254,0,161,202,167,139,22,204,167,137,70,244,137,86,246
  end;
  {@076F-07A7}
  while v12p <> nil do
  begin
    {@0777-0794}
    pO0EC_0484(0, v12p, 0, 0, 0, 0);
    {@0794-07A5}
    v12p := PR42_pointer(v12p)^.v;
  end;
  {@07A7-07AB}
  v13b := 1;
  {@07AB-095E}
  repeat
    {@07AB-07BA}
    pO0B5_0E45(@v6b, @v7b);
    if v6b <> 0 then
      pO108_00CB(6)
    else
    begin
      {@07CA-07CE}
      v3b := 0;
      for v4b := 0 to 6 do
      begin
        {@07D7-07F1}
        if (v4b <> 2) and (v4b <> 4) then
          pO108_00AB(v4b, @v3b);
      end;
    end;
    {@07F7-07FD}
    bAAE5 := v13b;
    {@07FD-0815}
    v5b := pO108_1009(s278C, s3081, 1, 0);
    {@0815-081B}
    v13b := bAAE5;
    if bAAE6 <> 0 then
      case v5b of
        72, 80: begin
          {@082D-0836}
          pO0AA_2F7B(v5b);
          {@0836-083A}
          v5b := 255;
        end;
        27: v5b := 6;
      end;
    {@0844-0923}
    case v5b of
      0: pO052_0484;
      1: pO0AA_0C9D(@v1b);
      2: pO0B5_0B93;
      3: pO0B5_0453;
      4: pO0B5_0567;
      5: pO0B5_0EB7(@v8b);
      6: begin
        {@089F-08AE}
        pO0B5_0E45(@v6b, @v7b);
        if v6b <> 0 then
        begin
          {@08B4-08D3}
          pR47F_0498(1, 17, 38, 22, 10, 0, 1, s2312);
          {@08D3-08F2}
          pR47F_0498(1, 17, 38, 22, 15, 0, 0, s2363);
          if Byte(pO108_2254(s278C, b5362)) = b5363 then
            v2b := 1
          else
            pR47F_0F07(1, 17, 38, 22);
        end
        else
          v2b := 1;
      end;
    end;
    {@0923-0948}
    case v5b of
      0, 2, 5: pO0EC_2ED1;
      3: begin
        {@093D-0948}
        if v8b <> 0 then
          pO0EC_2ED1;
      end;
    end;
    {@0948-0955}
    pO0EC_07C0(p9CEE);
  until v2b <> 0;
  {@095E-0964}
  b880C := b880D;
end;

{ 0968 }
begin
end.

