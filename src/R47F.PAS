{ R47F: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R47F;

interface

uses GAMEDATA;

procedure pR47F_0000;
procedure pR47F_0071(a0: byte);
procedure pR47F_00A0(a0: byte);
procedure pR47F_00B7(a0: shortint; a1: shortint; a2: shortint; a3: shortint; a4: byte; a5: byte);
procedure pR47F_017C;
procedure pR47F_01DF(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte);
procedure pR47F_030B(a0: byte; a1: byte; a2: byte; a3: byte);
procedure pR47F_0354(a0: byte; a1: byte; a2: byte; a3: byte; a4: string);
procedure pR47F_0498(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte; a7: string);
function pR47F_0711(a0: S40; a1: byte; a2: byte; a3: byte): S40;
function pR47F_0A0A(a0: S40; a1: byte; a2: byte; a3: byte): longint;
procedure pR47F_0B2E(a0: byte; a1: byte; a2: S40);
function pR47F_0BAD: longint;
procedure pR47F_0C27;
procedure pR47F_0CC0(a0: S40; a1: byte; a2: byte);
procedure pR47F_0D1A;
procedure pR47F_0D34(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte);
procedure pR47F_0F07(a0: byte; a1: byte; a2: byte; a3: byte);
procedure pR47F_0F25;
procedure pR47F_0F64;
procedure pR47F_0F9D;
function pR47F_0FB2(a0: byte): string;
procedure pR47F_0FF0(a0: pointer; a1: byte);

implementation

uses LIT, Crt, Dos, R5C0, R5C3, R670, R6DD;

type
  R0_byte = record v: byte end;
  R0_string = record v: string end;
  R0_string_40_ = record v: string[40] end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  PR0_byte = ^R0_byte;
  PR0_string = ^R0_string;
  PR0_string_40_ = ^R0_string_40_;
  PR17_byte = ^R17_byte;
  PRA0_byte = ^RA0_byte;
var
  MB800_160: array[0..405, 0..159] of byte absolute $B800:0;
  MBA00_160: array[0..405, 0..159] of byte absolute $BA00:0;
  MBC00_160: array[0..405, 0..159] of byte absolute $BC00:0;
  MBE00_160: array[0..405, 0..159] of byte absolute $BE00:0;
  b880E: byte absolute d880E;
  b8815: byte absolute d8815;
  b8818: byte absolute d8818;
  b8819: byte absolute d8819;
  b8830: byte absolute d8830;
  b8834: byte absolute d8834;
  b9D8A: byte absolute d9D8A;
  b9D92: byte absolute d9D92;
  b9D93: byte absolute d9D93;
  bB16D: byte absolute dB16D;
  bC5C5: byte absolute dC5C5;
  g8818_6095: Registers absolute d8818;
  p87F8: pointer absolute d87F8;
  p9D86: pointer absolute d9D86;
  s0E12: string absolute d0E12;
  sbB16D: shortint absolute dB16D;
  w882C: word absolute d882C;
  w882E: word absolute d882E;

{$L R47FA.OBJ}
procedure XR47F_1037; near; external;
procedure XR47F_1097; near; external;
procedure XR47F_11A6; far; external;


{ 0000 }
procedure pR47F_0000;
begin
  {@0003-0009}
  Port[974] := 0;
  {@0009-000F}
  Port[975] := 0;
  {@000F-0015}
  Port[974] := 1;
  {@0015-001B}
  Port[975] := 0;
  {@001B-0021}
  Port[974] := 2;
  {@0021-0027}
  Port[975] := 0;
  {@0027-002D}
  Port[974] := 3;
  {@002D-0033}
  Port[975] := 0;
  {@0033-0039}
  Port[974] := 4;
  {@0039-003F}
  Port[975] := 0;
  {@003F-0045}
  Port[974] := 5;
  {@0045-004B}
  Port[975] := 0;
  {@004B-0051}
  Port[974] := 7;
  {@0051-0057}
  Port[975] := 15;
  {@0057-005D}
  Port[974] := 8;
  {@005D-0063}
  Port[975] := 255;
  {@0063-0069}
  Port[964] := 2;
  {@0069-006F}
  Port[965] := 15;
end;

{ 0071 }
procedure pR47F_0071(a0: byte);
begin
  {@0074-0079}
  b8819 := 5;
  {@0079-007F}
  b8818 := a0;
  {@007F-008C}
  Intr(16, g8818_6095);
  {@008C-009C}
  w882C := a0 shl 9 + 40960;
end;

{ 00A0 }
procedure pR47F_00A0(a0: byte);
begin
  {@00A3-00B3}
  w882E := a0 shl 9 + 40960;
end;

{ 00B7 }
procedure pR47F_00B7(a0: shortint; a1: shortint; a2: shortint; a3: shortint; a4: byte; a5: byte);
var
  v1b: byte;
  v3w: word;
  v5w: word;
  v7w: word;
begin
  {@00BD-00C3}
  v1b := b8830;
  asm
  db 138,70,16,152,153,82,80,138,70,14,152,186,40,0,247,226,177,3,211,224,49,210,89,91,3,193,19,211
  db 137,70,253
  end;
  {@00E2-00F7}
  v5w := (a3 - a1 + 1) * 8 - 1;
  {@00F7-00FF}
  pR47F_00A0(a4);
  {@00FF-0103}
  pR47F_0000;
  {@0103-0109}
  Port[974] := 5;
  {@0109-010F}
  Port[975] := 2;
  for v7w := 0 to v5w do
  begin
    {@0124-0145}
    FillChar(Mem[w882E:v3w], a2 - a0 + 1, a5);
    {@0145-0149}
    Inc(v3w, 40);
  end;
  {@0151-0157}
  Port[974] := 5;
  {@0157-015D}
  Port[975] := 0;
  {@015D-0163}
  b8830 := v1b;
  {@0163-016B}
  pR47F_00A0(b8830);
end;

{ 017C }
procedure pR47F_017C;
var loc: array[1..18] of byte;
begin
  if false then begin
    if LV = '8X8d0' then;
    if LV = '.dax' then;
  end;
  asm
    db 141,126,244,22,87,191,113,1,14,87,154,111,10,37,8,141,126,239,22,87,191,119,1,14,87,154,111,10
    db 37,8,176,201,80,141,126,254,22,87,141,126,250,22,87
    call pR5C3_0915
    db 131,126,254,0,117,2,235,33,196,126,250,6,87,196,62,134,157,6,87,255,118,254,154,92,26,37,8,255
    db 118,252,255,118,250,255,118,254
    call pR5C0_0000
  end;
end;

{ 01DF }
procedure pR47F_01DF(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte);
var
  _f1: array[1..1] of byte;
  v2b: byte;
  _f2: array[1..16] of byte;
begin
  asm
  db 128,126,18,39,119,15,128,126,16,24,119,9,161,134,157,11,6,136,157,117,3,233,8,1
  end;
  {@01FD-0220}
  if a6 <> 0 then
    v2b := Byte(Ord(UpCase(Chr(a5))) mod 64)
  else
    asm
  db 138,70,8,136,70,254
    end;
  {@0220-023F}
  Move(PRA0_byte(p9D86)^.a[v2b * 8], b9D8A, 8);
  case b8834 of
    0: asm
  db 138,70,10,136,70,239,176,1,58,70,239,119,46,136,70,255,235,3,254,70,255,138,70,18,48,228,80,138
  db 70,16,48,228,80,138,70,14,80,138,70,12,80,138,70,254,80
  call near ptr XR47F_1037
  db 254,70,18,138,70,255,58,70,239,117,215
      end;
    1: asm
  db 138,70,10,136,70,239,176,1,58,70,239,119,46,136,70,255,235,3,254,70,255,138,70,18,48,228,80,138
  db 70,16,48,228,80,138,70,14,80,138,70,12,80,138,70,254,80
  call near ptr XR47F_1097
  db 254,70,18,138,70,255,58,70,239,117,215
      end;
    2: begin
      asm
  db 138,70,10,136,70,239,176,1,58,70,239,119,47
      end;
      asm
  db 136,70,255,235,3,254,70,255,138,70,18,48,228,80,138,70,16,48,228,80,138,70,14,80,138,70,12,80
  db 138,70,254,80
  push cs
  call near ptr XR47F_11A6
  db 254,70,18,138,70,255,58,70,239,117,214
      end;
    end;
  end;
end;

{ 030B }
procedure pR47F_030B(a0: byte; a1: byte; a2: byte; a3: byte);
begin
  {@030E-0313}
  pR6DD_0051;
  if (a0 < 0) or (a0 > 39) or (a1 < 0) or (a1 > 24) then
    Exit;
  {@032D-034B}
  pR47F_01DF(a0, a1, a2, a2, a3, 32, 1);
  {@034B-0350}
  pR6DD_0030;
end;

{ 0354 }
procedure pR47F_0354(a0: byte; a1: byte; a2: byte; a3: byte; a4: string);
var
  v257b: byte;
  v258b: byte;
begin
  {@036F-0374}
  pR6DD_0051;
  if (a0 > 39) or (a1 > 39) then
    Exit;
  {@0382-038A}
  v257b := Length(a4);
  for v258b := 1 to v257b do
  begin
    {@03A4-03CB}
    pR47F_01DF(a0, a1, a2, a3, 1, Ord(a4[v258b]), 1);
    {@03CB-03CE}
    Inc(a0);
  end;
  {@03D8-03DD}
  pR6DD_0030;
end;

{ 0498 }
procedure pR47F_0498(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte; a5: byte; a6: byte; a7: string);
var
  v257b: byte;
  v258b: byte;
  v259b: byte;
  v260b: byte;
  _f1: array[1..34] of byte;
  { 03E3 }
  procedure pR47F_03E3;
  begin
    {@03E6-045A}
    while v259b <= v260b do
    begin
      {@03F8-042F}
      pR47F_01DF(b9D92, b9D93, a4, a5, 1, Ord(a7[v259b]), 1);
      if b8815 <> 0 then
        Delay(PR17_byte(p87F8)^.v * 3);
      {@044C-0454}
      Inc(v259b);
      {@0454-0458}
      Inc(b9D92);
    end;
  end;

  { 045E }
  procedure pR47F_045E;
  begin
    {@0461-0494}
    while (v259b < v257b) and (Ord(a7[v259b]) = 32) do
      Inc(v259b);
  end;

begin
  {@04B3-04B8}
  pR6DD_0051;
  if (a0 > 39) or (a1 > 24) or (a2 > 39) or (a3 > 39) then
    Exit;
  {@04D3-04FF}
  if (b9D92 < a0) or (b9D92 > a2) or (b9D93 < a1) or (b9D93 > a3) then
  begin
    {@04F3-04F9}
    b9D92 := a0;
    {@04F9-04FF}
    b9D93 := a1;
  end;
  {@04FF-0525}
  if a6 <> 0 then
  begin
    {@0505-0519}
    pR47F_0F07(a0, a1, a2, a3);
    {@0519-051F}
    b9D92 := a0;
    {@051F-0525}
    b9D93 := a1;
  end;
  {@0525-052A}
  v259b := 1;
  {@052A-0532}
  v257b := Length(a7);
  if v257b = 0 then
  begin
    {@0539-053E}
    pR6DD_0030;
    {@053E-0541}
    Exit;
  end;
  {@0541-0554}
  v258b := a2 - a0 + 1;
  {@0554-06F2}
  repeat
    {@0554-055C}
    v260b := v259b;
    asm
  db 138,134,252,254,58,134,255,254,115,46,138,134,252,254,48,228,139,248,138,131,0,255,80,141,190,219,254,22
  db 87,191,4,14,30,87,184,4,4,80,154,118,12,37,8,154,36,13,37,8,116,6,254,134,252,254,235,200
    end;
    asm
  db 138,134,252,254,58,134,255,254,115,61,138,134,252,254,48,228,139,248,138,131,0,255,80,141,190,219,254,22
  db 87,191,4,14,30,87,184,4,4,80,154,118,12,37,8,154,36,13,37,8,117,21,138,134,252,254,48,228
  db 139,248,128,187,0,255,32,116,6,254,134,252,254,235,185
    end;
    asm
  db 138,134,252,254,48,228,139,248,128,187,0,255,32,116,66,138,134,255,254,48,228,139,208,138,134,252,254,48
  db 228,64,59,194,125,47,138,134,252,254,48,228,64,139,248,138,131,0,255,80,141,190,219,254,22,87,191,4
  db 14,30,87,184,4,4,80,154,118,12,37,8,154,36,13,37,8,116,6,254,134,252,254,235,190
    end;
    {@062C-06E5}
    if (v260b - v259b + b9D92) > a2 then
    begin
      {@0653-068F}
      if ((v260b - v259b + b9D92) = a2) and (Ord(a7[v260b]) = 32) then
      begin
        {@0686-068A}
        Dec(v260b);
        {@068A-068F}
        pR47F_03E3;
      end;
      {@068F-0695}
      b9D92 := a0;
      {@0695-0699}
      Inc(b9D93);
      {@0699-069E}
      pR47F_045E;
      if (b9D93 > a3) and (v259b < v257b) then
      begin
        {@06B0-06B6}
        b9D92 := a0;
        {@06B6-06BC}
        b9D93 := a1;
        {@06BC-06C0}
        pR47F_0F25;
        {@06C0-06C5}
        pR670_0311;
        {@06C5-06D9}
        pR47F_0F07(a0, a1, a2, a3);
        {@06D9-06DE}
        pR47F_03E3;
      end;
    end
    else
      pR47F_03E3;
  until v259b > v257b;
  {@06F2-0704}
  if b9D92 > a2 then
  begin
    {@06FA-0700}
    b9D92 := a0;
    {@0700-0704}
    Inc(b9D93);
  end;
  {@0704-0709}
  pR6DD_0030;
end;

{ 0711 }
function pR47F_0711(a0: S40; a1: byte; a2: byte; a3: byte): S40;
var
  v42b: byte;
  v43b: byte;
  v299a: string;
  v300b: byte;
  v300a: char absolute v300b;
  v299a2: array[0..255] of byte absolute v299a;
  v299b: byte absolute v299a;
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@072B-073B}
  pR47F_030B(0, 24, 0, 40);
  {@073B-0752}
  pR47F_0354(0, 24, a1, a2, a0);
  {@0752-0758}
  v42b := Length(a0);
  {@0758-075D}
  v299b := 0;
  {@075D-093E}
  repeat
    {@075D-0771}
    pR47F_030B(v42b + 1, 24, 15, 1);
    {@0771-077A}
    v300b := Ord(ReadKey);
    if v300b = 0 then
    begin
      {@0784-078D}
      v300b := Ord(ReadKey);
      case v300b of
        71: v300b := 55;
        72: v300b := 56;
        73: v300b := 57;
        75: v300b := 52;
        32: v300b := 53;
        77: v300b := 54;
        79: v300b := 49;
        80: v300b := 50;
        81: v300b := 51;
        82: v300b := 48;
      else
        {@07FF-0804}
        v300b := 0;
      end;
    end;
    {@0804-080B}
    v43b := v299b;
    case v300b of
      32: begin
        {@0813-086F}
        if (v43b <> 0) and (v43b < a3) then
        begin
          asm
  db 141,190,212,253,22,87,141,190,213,254,22,87,154,111,10,37,8,191,15,7,14,87,154,252,10,37,8,141
  db 190,213,254,22,87,184,255,0,80,154,137,10,37,8
          end;
          asm
  db 254,70,214
          end;
          asm
  db 138,70,214,80,176,24,80,176,15,80,176,0,80,141,190,210,254,22,87,191,15,7,14,87,154,111,10,37
  db 8
  push cs
  call near ptr pR47F_0354
          end;
        end;
      end;
      33..122: begin
        {@087A-08DB}
        if v43b < a3 then
        begin
          {@0882-08B7}
          v299a := v299a + v300a;
          {@08B7-08BA}
          Inc(v42b);
          {@08BA-08DB}
          pR47F_0354(v42b, 24, 15, 0, v300a);
        end;
      end;
      8: begin
        {@08E1-0926}
        if v43b > 0 then
        begin
          {@08E7-0912}
          v299a := Copy(v299a, 1, v43b - 1);
          {@0912-0923}
          pR47F_030B(v42b, 24, 0, 2);
          {@0923-0926}
          Dec(v42b);
        end;
      end;
    end;
  until (v300b = 13) or (v300b = 27) or (b880E <> 0);
  {@093E-094E}
  pR47F_030B(0, 24, 0, 40);
  {@094E-0955}
  v43b := v299b;
  {@0955-0968}
  while v299a2[v43b] = 32 do
    Dec(v43b);
  {@0968-0992}
  v299a := Copy(v299a, 1, v43b);
  for v42b := 1 to v43b do
    v299a2[v42b] := Ord(UpCase(Chr(v299a2[v42b])));
  {@09D0-09E4}
  pR47F_0711 := v299a;
end;

{ 0A0A }
function pR47F_0A0A(a0: S40; a1: byte; a2: byte; a3: byte): longint;
var
c61: record case byte of 0: (v61a3: string[15]); 1: (v61a: string[10]); 2: (v61a2: array[0..10] of byte);
      3: (v61b: byte); 4: (_p4: array[1..11] of byte; v50l: longint); 5: (_p5: array[1..15] of byte;
      v46b: byte) end;
  v63w: word;
  v63i: integer absolute v63w;
begin
  if false then begin
    if LSV = [48..57] then;
  end;
  {@0A24-0AF6}
  repeat
    {@0A24-0A4D}
    c61.v61a := pR47F_0711(a0, a1, a2, a3);
    {@0A4D-0A55}
    c61.v50l := 0;
    {@0A55-0A5A}
    v63w := 0;
    {@0A5A-0A5E}
    c61.v46b := 1;
    if c61.v61b > 0 then
    begin
      {@0A67-0A6C}
      bB16D := 1;
      {@0A6C-0AA3}
      while (sbB16D <= c61.v61b) and (c61.v46b <> 0) do
      begin
        {@0A81-0A9D}
        c61.v46b := Ord(c61.v61a2[sbB16D] in [48..57]);
        {@0A9D-0AA1}
        Inc(bB16D);
      end;
      {@0AA3-0AED}
      if c61.v46b <> 0 then
      begin
        {@0AA9-0ABE}
        Val(c61.v61a3, c61.v50l, v63i);
        if (v63w = 0) and ((c61.v50l > 2147483647) or (c61.v50l < 0)) then
          v63w := 1;
      end
      else
        v63w := 1;
    end;
  until v63w = 0;
  {@0AF6-0B02}
  pR47F_0A0A := c61.v50l;
end;

{ 0B2E }
procedure pR47F_0B2E(a0: byte; a1: byte; a2: S40);
var
  v42b: byte;
  v44w: word;
  _f1: array[1..1] of byte;
  v46b: byte;
  _f2: array[1..1] of byte;
  v48b: byte;
  v44b: byte absolute v44w;
begin
  if false then begin
    if LSV = [13, 27] then;
  end;
  {@0B47-0B57}
  pR47F_030B(0, 24, 0, 40);
  {@0B57-0B6E}
  pR47F_0354(0, 24, a0, a1, a2);
  {@0B6E-0B86}
  repeat
    {@0B6E-0B76}
    v42b := pR670_0187;
  until v42b in [13, 27];
  {@0B86-0BA7}
  if bC5C5 <> 0 then
    repeat
      {@0B8D-0BA1}
      pR6DD_0072(@v44b, @v46b, @v48b);
    until v44w = 0;
end;

{ 0BAD }
function pR47F_0BAD: longint;
var
  v6w: word;
  v8w: word;
  v10w: word;
  v12w: word;
begin
  {@0BB3-0BCC}
  GetTime(v6w, v8w, v10w, v12w);
  {@0BCC-0C1D}
pR47F_0BAD := LongInt(v12w) + (LongInt(v6w) * 360000 + LongInt(v8w) * LongInt(6000)
      + LongInt(v10w) * LongInt(100));
end;

{ 0C27 }
procedure pR47F_0C27;
begin
  asm
  db 160,52,136,60,0,117,46,176,0,80,176,0,80,176,39,80,176,24,80,176,0,80,176,0,80
  push cs
  call near ptr pR47F_00B7
  db 176,0,80,176,0,80,176,39,80,176,24,80,176,1,80,176,0,80
  push cs
  call near ptr pR47F_00B7
  db 235,95
  end;
  asm
  db 60,2,117,19,191,0,0,184,0,160,80,87,184,0,250,80
  call XR670_046E
  db 235,72
  end;
  asm
  db 60,1,117,68
  end;
  asm
  db 191,0,0,184,0,184,80,87,184,64,31,80
  call XR670_046E
  db 191,0,0,184,0,186,80,87,184,64,31,80
  call XR670_046E
  db 191,0,0,184,0,188,80,87,184,64,31,80
  call XR670_046E
  db 191,0,0,184,0,190,80,87,184,64,31,80
  call XR670_046E
  end;
end;

{ 0CC0 }
procedure pR47F_0CC0(a0: S40; a1: byte; a2: byte);
var
  _f1: array[1..1] of byte;
begin
  {@0CD9-0CE9}
  pR47F_030B(0, 24, 0, 40);
  {@0CE9-0D00}
  pR47F_0354(0, 24, a1, a2, a0);
  {@0D00-0D04}
  pR47F_0D1A;
  {@0D04-0D14}
  pR47F_030B(0, 24, 0, 40);
end;

{ 0D1A }
procedure pR47F_0D1A;
begin
  {@0D1D-0D32}
  Delay(PR17_byte(p87F8)^.v * 100);
end;

{ 0D34 }
procedure pR47F_0D34(a0: byte; a1: byte; a2: byte; a3: byte; a4: byte);
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  v10w: word;
  _f1: array[1..4] of byte;
  v15b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for a0 := a0 to a0 do for _fw := _fw to _fw do ;
  end;
  {@0D3A-0D3F}
  pR6DD_0051;
  case b8834 of
    0: begin
      {@0D46-0D61}
      pR47F_00B7(a0, a1, a2, a3, 0, a4);
      {@0D61-0D7C}
      pR47F_00B7(a0, a1, a2, a3, 1, a4);
    end;
    2: asm
  db 138,70,14,48,228,177,3,211,224,139,216,138,70,12,48,228,177,3,211,224,186,64,1,247,226,3,195,137
  db 70,244,138,70,14,48,228,139,208,138,70,10,48,228,43,194,64,177,3,211,224,137,70,242,138,70,8,48
  db 228,64,177,3,211,224,72,137,70,239,138,70,12,48,228,177,3,211,224,59,70,239,119,51,137,70,246,235
  db 3,255,70,246,139,70,244,49,210,5,0,0,129,210,0,160,137,199,142,194,6,87,255,118,242,138,70,6
  db 80,154,127,26,37,8,129,70,244,64,1,139,70,246,59,70,239,117,210
      end;
    1: begin
      {@0E13-0E1D}
      v2w := a1 * 2;
      {@0E1D-0E28}
      v4w := a3 * 2 + 1;
      {@0E28-0E34}
      v6w := a0 * 4;
      {@0E34-0E4A}
      v8w := (a2 - a0 + 1) * 4;
      {@0E4A-0E60}
      v15b := a4 + a4 shl 4;
      for v10w := v2w to v4w do
      begin
        {@0E79-0E97}
        FillChar(MB800_160[v10w, v6w], v8w, v15b);
        {@0E97-0EB5}
        FillChar(MBA00_160[v10w, v6w], v8w, v15b);
        {@0EB5-0ED3}
        FillChar(MBC00_160[v10w, v6w], v8w, v15b);
        {@0ED3-0EF1}
        FillChar(MBE00_160[v10w, v6w], v8w, v15b);
      end;
    end;
  end;
  {@0EFC-0F01}
  pR6DD_0030;
end;

{ 0F07 }
procedure pR47F_0F07(a0: byte; a1: byte; a2: byte; a3: byte);
begin
  {@0F0A-0F21}
  pR47F_0D34(a0, a1, a2, a3, 0);
end;

{ 0F25 }
procedure pR47F_0F25;
begin
  {@0F28-0F2D}
  pR670_0311;
  {@0F2D-0F3C}
  pR47F_0B2E(0, 15, s0E12);
  {@0F3C-0F4C}
  pR47F_0F07(0, 24, 39, 24);
end;

{ 0F64 }
procedure pR47F_0F64;
var loc: array[1..22] of byte;
begin
  if false then begin
    if LV = 'Loading...Please Wait' then;
  end;
  asm
    db 176,21,80,176,24,80,176,39,80,176,24,80
    push cs
    call near ptr pR47F_0F07
    db 176,0,80,176,24,80,176,10,80,176,0,80,141,126,234,22,87,191,78,15,14,87,154,111,10,37,8
    push cs
    call near ptr pR47F_0354
  end;
end;

{ 0F9D }
procedure pR47F_0F9D;
begin
  {@0FA0-0FB0}
  pR47F_0F07(0, 24, 39, 24);
end;

{ 0FB2 }
function pR47F_0FB2(a0: byte): string;
var
  v256a: string;
begin
  {@0FB9-0FD4}
  Str(a0, v256a);
  {@0FD4-0FE8}
  pR47F_0FB2 := v256a;
end;

{ 0FF0 }
procedure pR47F_0FF0(a0: pointer; a1: byte);
begin
  if false then begin
    if LV = ' ' then;
  end;
  {@0FF7-102C}
  while PR0_byte(a0)^.v < a1 do
    PR0_string_40_(a0)^.v := ' ' + PR0_string(a0)^.v;
end;

{ 1032 }
begin
end.

