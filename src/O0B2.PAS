{ O0B2: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0B2;

interface

uses GAMEDATA;

procedure pO0B2_02E7(a0: byte; a1: shortint);
function pO0B2_0B81(a0: byte): byte;

implementation

uses LIT, O0BB, O0E2, O0EC, O108, R47F, R670;

type
  AL1_byte = array[1..32001] of byte;
  E16_byte = record f: byte; _r: array[1..15] of byte end;
  E2_byte = record f: byte; _r: array[1..1] of byte end;
  R0_byte = record v: byte end;
  R12_word = record _p: array[1..12] of byte; v: word end;
  R171_byte = record _p: array[1..171] of byte; v: byte end;
  R171_shortint = record _p: array[1..171] of byte; v: shortint end;
  R176_word = record _p: array[1..176] of byte; v: word end;
  R1_word = record _p: array[1..1] of byte; v: word end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_byte = record _p: array[1..42] of byte; v: byte end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R43_byte = record _p: array[1..43] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  RA0_word = record a: array[0..16000] of word end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA59_byte = record _p: array[1..59] of byte; a: array[0..32000] of byte end;
  PAL1_byte = ^AL1_byte;
  PR0_byte = ^R0_byte;
  PR12_word = ^R12_word;
  PR171_byte = ^R171_byte;
  PR171_shortint = ^R171_shortint;
  PR176_word = ^R176_word;
  PR1_word = ^R1_word;
  PR31_byte = ^R31_byte;
  PR323_pointer = ^R323_pointer;
  PR423_pointer = ^R423_pointer;
  PR42_byte = ^R42_byte;
  PR42_pointer = ^R42_pointer;
  PR43_byte = ^R43_byte;
  PR483_pointer = ^R483_pointer;
  PR494_byte = ^R494_byte;
  PR5_pointer = ^R5_pointer;
  PRA0_word = ^RA0_word;
  PRA30_byte = ^RA30_byte;
  PRA59_byte = ^RA59_byte;
var
  a651B_3981: array[0..2046] of E16_byte absolute d651B;
  a6D0A_2fc5: array[0..16379] of word absolute d6D0A;
  a82E5_ec3f: array[0..32759] of byte absolute d82E5;
  aAE65_2fc5: array[0..16379] of word absolute dAE65;
  aAE65_71c0: array[0..16379] of E2_byte absolute dAE65;
  aAE72_ec3f: array[0..32759] of byte absolute dAE72;
  b5362: byte absolute d5362;
  b82E6: byte absolute d82E6;
  b880C: byte absolute d880C;
  b9CFE: byte absolute d9CFE;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAE64: byte absolute dAE64;
  bAE65: byte absolute dAE65;
  bAE7D: byte absolute dAE7D;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  s278C: string absolute d278C;
  s2D27: string absolute d2D27;
  w6D12: word absolute d6D12;
  w6D16: word absolute d6D16;
  w8812: word absolute d8812;
  wAE67: word absolute dAE67;
  wAE69: word absolute dAE69;
  wAE6B: word absolute dAE6B;
  wAE6D: word absolute dAE6D;
  wAE6F: word absolute dAE6F;
  wAE7B: word absolute dAE7B;

procedure pO0B2_0000(a0: byte; a1: byte); far; forward;
procedure pO0B2_01E9(a0: pointer); far; forward;
procedure pO0B2_02B5; far; forward;
procedure pO0B2_038A(a0: byte; a1: shortint); far; forward;
function pO0B2_0472(a0: byte): S40; far; forward;
procedure pO0B2_04FD(a0: shortint); far; forward;
function pO0B2_05F1: byte; far; forward;
procedure pO0B2_0705(a0: byte); far; forward;
function pO0B2_07C4(a0: pointer; a1: pointer): byte; far; forward;
function pO0B2_08A2(a0: pointer; a1: pointer): byte; far; forward;
procedure pO0B2_09D8; far; forward;
procedure pO0B2_0A8F(a0: pointer); far; forward;

{ 0000 }
procedure pO0B2_0000(a0: byte; a1: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v5w: word;
  v9p: pointer;
  v13p: pointer;
  v17p: pointer;
  _f1: array[1..1] of byte;
  v5b: byte absolute v5w;
  v1sb: shortint absolute v1b;
begin
  {@0006-0053}
  if b880C <> 2 then
    FillChar(b82E6, 72, 1)
  else
  begin
    {@0020-0024}
    v2b := 0;
    {@0024-0042}
    repeat
      {@0024-0027}
      Inc(v2b);
    until (v2b > PR31_byte(p87F8)^.v) or (a82E5_ec3f[v2b] <> 0);
    {@0042-0053}
    if a82E5_ec3f[v2b] = 0 then
      Exit;
  end;
  {@0053-005B}
  v5w := a0;
  {@005B-0061}
  v1b := a1;
  {@0061-0085}
  while v1sb > 1 do
  begin
    {@0067-007B}
    v5w := a6D0A_2fc5[Pred(v1sb)] * v5w;
    asm
  db 138,70,255,254,200,136,70,255
    end;
  end;
  {@0085-01E3}
  while v5w > 0 do
  begin
    {@008E-00A0}
    if v5w > 10 then
      v3b := 10
    else
      v3b := v5b;
    {@00A0-00A4}
    v2b := 1;
    {@00A4-00B1}
    v9p := p9CF2;
    {@00B1-01CF}
    while v9p <> nil do
    begin
      {@00BC-01B6}
      if a82E5_ec3f[v2b] <> 0 then
      begin
        {@00CD-00D9}
        a82E5_ec3f[v2b] := 0;
        {@00D9-00EC}
        v13p := PR323_pointer(v9p)^.v;
        {@00EC-0185}
        while v13p <> nil do
        begin
          {@00F7-0182}
          if PR1_word(v13p)^.v = 0 then
            v13p := PR5_pointer(v13p)^.v
          else
          begin
            {@0114-0182}
            if v3b < PR1_word(v13p)^.v then
            begin
              {@0122-012E}
              Dec(PR1_word(v13p)^.v, v3b);
              {@012E-013A}
              a82E5_ec3f[v2b] := 1;
              {@013A-014B}
              v13p := PR5_pointer(v13p)^.v;
            end
            else
            begin
              {@014D-015E}
              v17p := PR5_pointer(v13p)^.v;
              {@015E-0176}
              pO0E2_0104(v9p, PR0_byte(v13p)^.v, v13p);
              {@0176-0182}
              v13p := v17p;
            end;
          end;
        end;
        {@0185-01B6}
        while v13p <> nil do
        begin
          {@018D-01A3}
          if PR1_word(v13p)^.v > 0 then
            a82E5_ec3f[v2b] := 1;
          {@01A3-01B4}
          v13p := PR5_pointer(v13p)^.v;
        end;
      end;
      {@01B6-01B9}
      Inc(v2b);
      {@01B9-01CC}
      v9p := PR483_pointer(v9p)^.v;
    end;
    {@01CF-01E0}
    if v5w > 10 then
      Dec(v5w, 10)
    else
      v5w := 0;
  end;
end;

{ 01E9 }
procedure pO0B2_01E9(a0: pointer);
var
  v1b: byte;
  v5p: pointer;
  _f1: array[1..1] of byte;
  v1sb: shortint absolute v1b;
begin
  {@01EF-02AF}
  for v1b := 0 to 6 do
  begin
    {@01F8-02A6}
    if PRA0_word(a0)^.a[v1sb] >= a6D0A_2fc5[v1sb] then
    begin
      {@0219-02A6}
      if v1b <> 6 then
      begin
        {@021F-022F}
        Inc(PRA0_word(a0)^.a[Succ(v1sb)]);
        {@022F-025B}
        PRA0_word(a0)^.a[v1sb] := PRA0_word(a0)^.a[v1sb] - a6D0A_2fc5[v1sb];
      end
      else
      begin
        {@025D-026A}
        v5p := p9CF2;
        {@026A-028F}
        while v5p <> nil do
        begin
          {@0272-027A}
          Inc(PR176_word(v5p)^.v);
          {@027A-028D}
          v5p := PR483_pointer(v5p)^.v;
        end;
        {@028F-02A1}
        PR12_word(a0)^.v := PR12_word(a0)^.v - w6D16;
        {@02A1-02A6}
        b9CFE := 1;
      end;
    end;
  end;
end;

{ 02B5 }
procedure pO0B2_02B5;
begin
  {@02B8-02C1}
  pO0B2_01E9(@bAE65);
  if wAE6F > 0 then
  begin
    {@02C8-02D3}
    Inc(wAE6D, w6D12 * wAE6F);
    {@02D3-02D8}
    wAE6F := 0;
    if wAE6D > 99 then
      wAE6D := 99;
  end;
end;

{ 02E7 }
procedure pO0B2_02E7(a0: byte; a1: shortint);
var
  v14a: array[0..6] of word;
  v15b: byte;
  v16b: byte;
  v15sb: shortint absolute v15b;
  v14a2: array[0..6] of E2_byte absolute v14a;
  v14b: byte absolute v14a;
begin
  {@02ED-031C}
  for v15b := 0 to 6 do
    v14a[v15sb] := PAL1_byte(p87F8)^[v15sb + 5];
  {@031C-034D}
  for v16b := 1 to a0 do
  begin
    {@0331-033C}
    Inc(v14a[a1]);
    {@033C-0345}
    pO0B2_01E9(@v14b);
  end;
  {@034D-0378}
  for v15b := 0 to 6 do
    PAL1_byte(p87F8)^[v15sb + 5] := v14a2[v15sb].f;
  {@0378-0384}
  pO0B2_0000(a0, byte(a1));
end;

{ 038A }
procedure pO0B2_038A(a0: byte; a1: shortint);
var
  _f1: array[1..4] of byte;
begin
  asm
  db 131,62,109,174,0,117,24,131,62,107,174,0,117,17,131,62,105,174,0,117,10,131,62,103,174,0,117,3
  db 233,187,0
  end;
  {@03AF-0453}
  while a0 > aAE65_2fc5[a1] do
  begin
    asm
  db 138,70,6,254,192,136,70,255
    end;
    asm
  db 138,70,255,152,139,248,209,231,131,189,101,174,0,117,16,128,126,255,5,125,10,138,70,255,254,192,136,70
  db 255,235,225
    end;
    asm
  db 128,126,255,5,117,20,191,101,174,30,87,184,14,0,80
  call XR670_046E
  db 198,70,8,0,235,72,138,70,6,254,192,136,70,253,138,70,255,58,70,253,124,56,136,70,254,235,3,254
db 78,254,138,70,254,152,139,248,209,231,255,141,101,174,138,70,254,254,200,152,139,248,209,231,139,149,10,109
  db 138,70,254,254,200,152,139,248,209,231,1,149,101,174,138,70,254,58,70,253,117,205
    end;
  end;
  {@0453-0466}
  Dec(aAE65_2fc5[a1], a0);
  {@0466-046A}
  pO0B2_02B5;
end;

{ 0472 }
function pO0B2_0472(a0: byte): S40;
var
  v41a: string[40];
  v41a2: string[40] absolute v41a;
begin
  if false then begin
    if LV = '0' then;
  end;
  {@0479-0496}
  v41a := pR47F_0FB2(a0);
  if a0 < 10 then
    v41a := '0' + v41a2;
  {@04C4-04EA}
  pO0B2_0472 := Copy(v41a2, 1, 2);
end;

{ 04FD }
procedure pO0B2_04FD(a0: shortint);
var
  v1b: byte;
  _f1: array[1..9] of byte;
  v11b: byte;
  v15a: array[0..1] of word;
  v16b: byte;
  v15a2: array[0..1] of E2_byte absolute v15a;
  v1sb: shortint absolute v1b;
begin
  if false then begin
    if LV = 'Rest Time:' then;
    if LV = ':' then;
  end;
  {@0504-0520}
  for v1b := 0 to 6 do
    v15a[v1sb] := 10;
  {@0520-052D}
  v15a[a0] := 15;
  {@052D-054D}
  pR47F_0354(1, 17, 10, 0, 'Rest Time:');
  {@054D-0551}
  v16b := 11;
  for v1b := 4 downto 3 do
  begin
    {@055A-058F}
    pR47F_0354(v16b + 1, 17, v15a2[v1sb].f, 0, pO0B2_0472(aAE65_71c0[v1sb].f));
    {@058F-05B5}
    pR47F_0354(v16b + 2 + 1, 17, 10, 0, ':');
    {@05B5-05B9}
    Inc(v16b, 3);
  end;
  {@05BF-05EB}
  pR47F_0354(v16b + 1, 17, v11b, 0, pO0B2_0472(10 * wAE69 + wAE67));
end;

{ 05F1 }
function pO0B2_05F1: byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v4sb: shortint absolute v4b;
begin
  {@05F7-05FC}
  bAAE5 := 1;
  {@05FC-0600}
  pO0B2_05F1 := 0;
  {@0600-0604}
  v4b := 2;
  {@0604-06E4}
  repeat
    {@0604-060C}
    pO0B2_04FD(v4b);
    {@060C-0614}
    pO108_00CB(6);
    {@0614-062C}
    v2b := pO108_1009(s278C, s2D27, 1, 0);
    if bAAE6 <> 0 then
    begin
      {@0633-0639}
      v3b := v2b;
      case v3b of
        72: v2b := 4;
        80: v2b := 5;
        77, 75: v2b := 255;
      else
        {@065E-0662}
        v2b := 6;
      end;
    end;
    {@0662-06D5}
    case v2b of
      0: pO0B2_05F1 := 1;
      1: v4b := 4;
      2: v4b := 3;
      3: v4b := 2;
      4: begin
        {@0691-06AA}
        if v4b = 2 then
          Inc(wAE67, 5)
        else
          Inc(aAE65_2fc5[v4sb]);
        {@06AA-06AE}
        pO0B2_02B5;
      end;
      5: begin
        {@06B4-06D1}
        if v4b = 2 then
          pO0B2_038A(5, 1)
        else
          pO0B2_038A(1, v4b);
        {@06D1-06D5}
        pO0B2_02B5;
      end;
    end;
  until (v2b = 6) or (v2b = 0);
end;

{ 0705 }
procedure pO0B2_0705(a0: byte);
var
  v1b: byte;
  v5p: pointer;
begin
  if false then begin
    if LV = 'The Whole Party Is Healed' then;
  end;
  {@070B-070F}
  Inc(wAE7B);
  {@070F-071A}
  if wAE7B < 288 then
    Exit;
  {@071A-071E}
  v1b := 0;
  {@071E-072B}
  v5p := p9CF2;
  {@072B-0761}
  while v5p <> nil do
  begin
    {@0733-074C}
    if pO0E2_212C(v5p, 1, 0) <> 0 then
      v1b := 1;
    {@074C-075F}
    v5p := PR483_pointer(v5p)^.v;
  end;
  {@0761-076E}
  if a0 <> 0 then
    pO0B2_04FD(0);
  {@076E-078E}
  pR47F_0354(1, 19, 10, 0, 'The Whole Party Is Healed');
  if v1b <> 0 then
    pO0EC_07C0(p9CEE);
  {@07A1-07A6}
  pR47F_0D1A;
  {@07A6-07AB}
  pO0EC_1BEF;
  {@07AB-07B0}
  wAE7B := 0;
end;

{ 07C4 }
function pO0B2_07C4(a0: pointer; a1: pointer): byte;
var
  v2b: byte;
  v3b: byte;
begin
  if false then begin
    if LV = 'has memorized' then;
  end;
  {@07CA-07D8}
  if bAE64 <> 0 then
  begin
    {@07D1-07D5}
    pO0B2_07C4 := 0;
    {@07D5-07D8}
    Exit;
  end;
  {@07D8-07DC}
  v2b := 0;
  {@07DC-07E0}
  v3b := 0;
  if PR494_byte(a0)^.v <> 0 then
    while (v3b <= 140) and (v2b = 0) do
    begin
      {@0800-0881}
      if PRA30_byte(a0)^.a[v3b] > 127 then
      begin
        {@0811-0881}
        if PR0_byte(a1)^.v <> 0 then
          v2b := a651B_3981[PRA30_byte(a0)^.a[v3b] and 127].f
        else
        begin
          {@083B-084A}
          Dec(PRA30_byte(a0)^.a[v3b], 128);
          {@084A-0851}
          pO0B2_04FD(0);
          {@0851-087A}
          pO0BB_6CF9(pointer(a0), 'has memorized', PRA30_byte(a0)^.a[v3b]);
          {@087A-0881}
          PR0_byte(a1)^.v := 1;
        end;
      end;
      {@0881-0884}
      Inc(v3b);
    end;
  {@0887-088D}
  pO0B2_07C4 := v2b;
end;

{ 08A2 }
function pO0B2_08A2(a0: pointer; a1: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v8p: pointer;
  v9b: byte;
begin
  if false then begin
    if LV = 'has scribed' then;
  end;
  {@08A8-08B2}
  if bAE64 <> 0 then
    Exit;
  {@08B2-08B6}
  v4b := 0;
  {@08B6-08BA}
  v9b := 0;
  {@08BA-08CD}
  v8p := PR423_pointer(a0)^.v;
  {@08CD-09C9}
  while (v8p <> nil) and (v4b = 0) do
  begin
    {@08E1-08E5}
    v2b := 1;
    if pO0BB_6C36(v8p) <> 0 then
      while (v2b <= 3) and (v4b = 0) do
      begin
        {@0909-09AF}
        if PRA59_byte(v8p)^.a[v2b] > 128 then
        begin
          asm
  db 198,70,247,1
          end;
          if PR0_byte(a1)^.v <> 0 then
            v4b := a651B_3981[PRA59_byte(v8p)^.a[v2b] and 127].f
          else
          begin
            asm
  db 138,70,254,48,228,196,126,248,3,248,38,138,69,59,36,127,136,70,253
            end;
            asm
  db 138,70,253,48,228,196,126,10,3,248,38,198,133,178,0,1
            end;
            {@096E-0983}
            pO0BB_6C6B(pointer(a0), v8p, v3b);
            {@0983-098A}
            pO0B2_04FD(0);
            {@098A-09A8}
            pO0BB_6CF9(pointer(a0), 'has scribed', v3b);
            {@09A8-09AF}
            PR0_byte(a1)^.v := 1;
          end;
        end;
        {@09AF-09B2}
        Inc(v2b);
      end;
    {@09B5-09C6}
    v8p := PR42_pointer(v8p)^.v;
  end;
  {@09C9-09CF}
  pO0B2_08A2 := v4b;
end;

{ 09D8 }
procedure pO0B2_09D8;
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  _f1: array[1..1] of byte;
begin
  {@09DE-09E2}
  v1b := 1;
  {@09E2-09EF}
  v6p := p9CF2;
  {@09EF-0A8B}
  while v6p <> nil do
  begin
    {@09FA-0A13}
    if aAE72_ec3f[v1b] > 0 then
      Dec(aAE72_ec3f[v1b]);
    {@0A13-0A72}
    if (aAE72_ec3f[v1b] = 0) and (PR171_byte(v6p)^.v = 0) then
    begin
      {@0A2C-0A30}
      v7b := 0;
      {@0A30-0A42}
      v2b := pO0B2_08A2(v6p, @v7b);
      if v2b = 0 then
        v2b := pO0B2_07C4(v6p, @v7b);
      {@0A5A-0A72}
      aAE72_ec3f[v1b] := v2b * 3;
    end;
    {@0A72-0A85}
    v6p := PR483_pointer(v6p)^.v;
    {@0A85-0A88}
    Inc(v1b);
  end;
end;

{ 0A8F }
procedure pO0B2_0A8F(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v6p: pointer;
  v7b: byte;
  _f1: array[1..1] of byte;
begin
  {@0A95-0A9B}
  Inc(PR0_byte(a0)^.v);
  {@0A9B-0AA7}
  if PR0_byte(a0)^.v < 12 then
    Exit;
  {@0AA7-0AAE}
  PR0_byte(a0)^.v := 0;
  {@0AAE-0AB2}
  v1b := 1;
  {@0AB2-0ABF}
  v6p := p9CF2;
  {@0ABF-0B47}
  while v6p <> nil do
  begin
    {@0ACA-0B2E}
    if PR171_shortint(v6p)^.v > 0 then
    begin
      {@0AD5-0ADD}
      Dec(PR171_byte(v6p)^.v);
      if PR171_byte(v6p)^.v = 0 then
      begin
        {@0AE8-0AEC}
        v7b := 1;
        {@0AEC-0AFE}
        v2b := pO0B2_08A2(v6p, @v7b);
        if v2b = 0 then
          v2b := pO0B2_07C4(v6p, @v7b);
        {@0B16-0B2E}
        aAE72_ec3f[v1b] := v2b * 3;
      end;
    end;
    {@0B2E-0B41}
    v6p := PR483_pointer(v6p)^.v;
    {@0B41-0B44}
    Inc(v1b);
  end;
end;

{ 0B81 }
function pO0B2_0B81(a0: byte): byte;
var
  v5p: pointer;
  _f1: array[1..5] of byte;
  v11b: byte;
  v12b: byte;
  v13b: byte;
  v14b: byte;
  v15b: byte;
begin
  if false then begin
    if LV = 'Stop Resting? ' then;
    if LV = 'Your repose is suddenly interrupted!' then;
  end;
  {@0B87-0B8B}
  pO0B2_0B81 := 0;
  {@0B8B-0B8F}
  v15b := 0;
  {@0B8F-0B93}
  v11b := 1;
  {@0B93-0BA0}
  v5p := p9CF2;
  {@0BA0-0BCC}
  while v5p <> nil do
  begin
    {@0BA8-0BB4}
    aAE72_ec3f[v11b] := 0;
    {@0BB4-0BB7}
    Inc(v11b);
    {@0BB7-0BCA}
    v5p := PR483_pointer(v5p)^.v;
  end;
  {@0BCC-0BDD}
  FillChar(b82E6, 72, 1);
  {@0BDD-0BE1}
  v12b := 0;
  {@0BE1-0BE5}
  v13b := 0;
  if a0 <> 0 then
  begin
    {@0BEB-0BFC}
    pR47F_0F07(1, 17, 38, 22);
    {@0BFC-0C03}
    pO0B2_04FD(0);
  end;
  {@0C03-0C08}
  bAE7D := 1;
  if a0 <> 0 then
    v14b := Ord(pO0B2_05F1 = 0)
  else
    v14b := 0;
  {@0C22-0D4A}
  while (v14b = 0) and ((wAE6D > 0) or (wAE6B > 0) or (wAE69 > 0) or (wAE67 > 0)) do
  begin
    {@0C4A-0C89}
    if (a0 <> 0) and (pR670_0277 <> 0) then
    begin
      {@0C59-0C60}
      pO0B2_04FD(0);
      if Byte(pO108_2254('Stop Resting? ', b5362)) = b5362 then
        v14b := 1
      else
        pR47F_0F9D;
    end;
    {@0C89-0D47}
    if v14b = 0 then
    begin
      {@0C92-0C9C}
      pO0B2_038A(5, 1);
      {@0C9C-0C9F}
      Inc(v13b);
      if (a0 <> 0) and (v13b >= 5) then
      begin
        {@0CAB-0CB2}
        pO0B2_04FD(0);
        {@0CB2-0CB6}
        v13b := 0;
      end;
      {@0CB6-0CC0}
      pO0B2_02E7(5, 1);
      {@0CC0-0CC8}
      pO0B2_0705(a0);
      {@0CC8-0CCC}
      pO0B2_09D8;
      {@0CCC-0CD5}
      pO0B2_0A8F(@v12b);
      if PR42_byte(p87F8)^.v > 0 then
      begin
        {@0CE0-0CE4}
        Inc(w8812);
        if PR42_byte(p87F8)^.v <= w8812 then
        begin
          {@0CF4-0CF9}
          w8812 := 0;
          if Byte(pO0E2_1374(1, 100)) <= PR43_byte(p87F8)^.v then
          begin
            {@0D0E-0D13}
            pO0EC_1BEF;
            {@0D13-0D1A}
            pO0B2_04FD(0);
            {@0D1A-0D3A}
            pR47F_0354(1, 19, 15, 0, 'Your repose is suddenly interrupted!');
            {@0D3A-0D3E}
            v14b := 1;
            {@0D3E-0D42}
            pO0B2_0B81 := 1;
            {@0D42-0D47}
            pR47F_0D1A;
          end;
        end;
      end;
    end;
  end;
  {@0D4A-0D5B}
  pR47F_0F07(1, 17, 38, 22);
  {@0D5B-0D60}
  bAE7D := 0;
end;

{ 0D69 }
begin
end.

