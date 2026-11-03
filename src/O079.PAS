{ O079: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O079;

interface

uses GAMEDATA;

procedure pO079_01D1;
procedure pO079_08A7;

implementation

uses LIT, O07C, O0BB, O108, O17E, R1C3, R47F, R5C0, R5C3, R670, R6DD;

type
  R0_byte = record v: byte end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R38_byte = record _p: array[1..38] of byte; v: byte end;
  R56_byte = record _p: array[1..56] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  X17 = array[0..16] of byte;
  PR0_byte = ^R0_byte;
  PR17_byte = ^R17_byte;
  PR21_byte = ^R21_byte;
  PR31_byte = ^R31_byte;
  PR33_byte = ^R33_byte;
  PR38_byte = ^R38_byte;
  PR56_byte = ^R56_byte;
  PRA0_byte = ^RA0_byte;
var
  b8226: byte absolute d8226;
  b8228: byte absolute d8228;
  b825A: byte absolute d825A;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  b880F: byte absolute d880F;
  b8811: byte absolute d8811;
  b8814: byte absolute d8814;
  b8815: byte absolute d8815;
  b8834: byte absolute d8834;
  b884E: byte absolute d884E;
  b88F6: byte absolute d88F6;
  b8A46: byte absolute d8A46;
  b8B96: byte absolute d8B96;
  b92A6: byte absolute d92A6;
  b94D4: byte absolute d94D4;
  b94D5: byte absolute d94D5;
  b94D6: byte absolute d94D6;
  b9CFE: byte absolute d9CFE;
  bA9F2: byte absolute dA9F2;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bA9F8: byte absolute dA9F8;
  bAAC3: byte absolute dAAC3;
  bAACC: byte absolute dAACC;
  bAAD5: byte absolute dAAD5;
  bAAD6: byte absolute dAAD6;
  bAADB: byte absolute dAADB;
  bAADE: byte absolute dAADE;
  bAAE5: byte absolute dAAE5;
  bAE7D: byte absolute dAE7D;
  bAE80: byte absolute dAE80;
  bAE86: byte absolute dAE86;
  bAE87: byte absolute dAE87;
  bAEE7: byte absolute dAEE7;
  bAEE9: byte absolute dAEE9;
  bAEF0: byte absolute dAEF0;
  bB012: byte absolute dB012;
  bB013: byte absolute dB013;
  bC581: byte absolute dC581;
  bC582: byte absolute dC582;
  bC583: byte absolute dC583;
  bC584: byte absolute dC584;
  bC586: byte absolute dC586;
  bC58A: byte absolute dC58A;
  bC58C: byte absolute dC58C;
  bC590: byte absolute dC590;
  bC591: byte absolute dC591;
  bC593: byte absolute dC593;
  bC5A1: byte absolute dC5A1;
  bC5C3: byte absolute dC5C3;
  bC5C4: byte absolute dC5C4;
  bC5C5: byte absolute dC5C5;
  bD924: byte absolute dD924;
  g825A_3610: file absolute d825A;
  l9CEA: longint absolute d9CEA;
  l9CEE: longint absolute d9CEE;
  l9CF2: longint absolute d9CF2;
  p87F8: pointer absolute d87F8;
  p87FC: pointer absolute d87FC;
  p92C2: pointer absolute d92C2;
  p92C6: pointer absolute d92C6;
  p9CFF: pointer absolute d9CFF;
  p9D86: pointer absolute d9D86;
  pA9E6: pointer absolute dA9E6;
  pA9EA: pointer absolute dA9EA;
  pFB62: pointer absolute dFB62;
  s3E0A: string absolute d3E0A;
  w880A: word absolute d880A;
  w8812: word absolute d8812;
  w9D83: word absolute d9D83;
  wAAE3: word absolute dAAE3;

procedure pO079_0024; far; forward;
procedure pO079_0121; far; forward;

{ 0024 }
procedure pO079_0024;
var
  v2w: word;
  v4w: word;
  v5b: byte;
  v9p: pointer;
  _f1: array[1..16] of byte;
  v26b: byte;
  v9b: byte absolute v9p;
  v2b: byte absolute v2w;
begin
  if false then begin
    if LV = 'ITEM0' then;
    if LV = '.dax' then;
    if LV = 'Unable to find item file' then;
    LP1('Unable to find item file');
  end;
  {@002A-003C}
  FillChar(PR0_byte(p9CFF)^.v, 4318, 255);
  {@003C-006C}
  pR5C3_0915('ITEM0', '.dax', 1, @v2b, @v9b);
  if v2w = 0 then
  begin
    {@0072-008C}
    pR47F_0B2E(15, 0, 'Unable to find item file');
    {@008C-0094}
    pR670_0000(0);
  end;
  {@0094-0099}
  v4w := 0;
  {@0099-009D}
  v5b := 1;
  {@009D-00EE}
  repeat
    {@009D-00B5}
    Move(PRA0_byte(v9p)^.a[v4w], v26b, 17);
    asm
  db 141,126,230,22,87,138,70,251,48,228,186,17,0,247,226,196,62,255,156,3,248,129,199,239,255,6,87,184
  db 17,0,80,154,163,9,37,8
    end;
    {@00D9-00DC}
    Inc(v5b);
    {@00DC-00E0}
    Inc(v4w, 17);
  until (v4w >= v2w) or (v5b > 254);
  {@00EE-00FC}
  pR5C0_0000(v9p, v2w);
end;

{ 0121 }
procedure pO079_0121;
var
  _f1: array[1..26] of byte;
begin
  if false then begin
    if LV = 'zounds' then;
    if LV = '.dax' then;
    if LV = 'unable to load sound' then;
  end;
  asm
  db 191,32,251,30,87,184,66,0,80
  call XR670_046E
  db 198,70,255,1,235,3,254,70,255,138,70,255,48,228,139,248,209,231,139,247,209,231,1,247,129,199,26,251
  db 137,126,251,140,94,253,141,126,244,22,87,191,0,1,14,87,154,111,10,37,8,141,126,239,22,87,191,7
  db 1,14,87,154,111,10,37,8,138,70,255,80,196,126,251,6,87,196,126,251,129,199,2,0,6,87
  call pR5C3_0915
  db 196,126,251,38,131,61,0,117,34,176,15,80,176,0,80,141,126,230,22,87,191,12,1,14,87,154,111,10
  db 37,8
  call pR47F_0B2E
  db 176,0,80
  call pR670_0000
  db 128,126,255,11,116,3,233,123,255
  end;
end;

{ 01D1 }
procedure pO079_01D1;
var
  _f1: array[1..256] of byte;
begin
  if false then begin
    if LV = 'cursor' then;
    if LV = 'ITEMS' then;
    LP1('cursor');
  end;
  asm
  db 198,6,38,130,0,235,4,254,6,38,130,198,6,39,130,0,235,4,254,6,39,130,160,39,130,48,228,139
  db 208,160,38,130,48,228,139,248,139,247,209,231,1,247,3,250,138,141,214,9,160,39,130,48,228,139,208,160
  db 38,130,48,228,139,248,139,247,209,231,1,247,3,250,136,141,30,213,128,62,39,130,2,117,193,138,22,38
  db 130,160,38,130,48,228,139,248,136,149,30,216,128,62,38,130,15,117,160
  end;
  asm
  db 176,0,80,184,16,0,80,191,30,207,30,87
  call pR1C3_1E9D
  end;
  asm
  db 176,0,80,184,16,0,80,191,30,210,30,87
  call pR1C3_1E9D
  end;
  asm
  db 49,192,80,184,16,0,80,191,30,213,30,87
  call pR1C3_1F24
  end;
  asm
  db 190,0,0,142,198,38,160,23,4,12,32,190,0,0,142,198,38,162,23,4
  end;
  {@0286-028B}
  Randomize;
  if bC5C4 <> 0 then
  begin
    asm
  db 198,6,195,197,1
    end;
    asm
  db 198,6,198,197,0
    end;
    asm
  call pR6DD_0000
    end;
    if bC5C4 <> 0 then
    begin
      asm
  db 198,6,194,197,1
      end;
      asm
  db 184,14,125,140,218,163,207,197,137,22,209,197,49,192,80,49,192,80,255,54,209,197,255,54,207,197
  call pR6DD_0107
  db 184,127,2,80,184,100,0,80
  call pR6DD_00C9
  db 191,84,130,30,87,191,86,130,30,87,191,88,130,30,87
  call pR6DD_0072
  db 129,62,86,130,65,1,176,0,124,1,64,8,192,176,0,117,1,64,162,194,197
  call pR6DD_0030
      end;
    end;
    asm
  db 199,6,199,197,160,0
    end;
    asm
  db 199,6,201,197,100,0
    end;
    asm
  db 255,54,199,197,255,54,201,197
  call pR6DD_00C9
    end;
    asm
  db 49,192,163,203,197,49,192,163,205,197
    end;
  end;
  asm
  db 128,62,12,198,0,116,12,199,6,13,198,160,0,199,6,15,198,100,0
  end;
  {@0340-0350}
  GetMem(p87F8, 1024);
  {@0350-0360}
  GetMem(p87FC, 7680);
  {@0360-0370}
  GetMem(p9D86, 1416);
  {@0370-0380}
  GetMem(pA9E6, 2340);
  {@0380-0390}
  GetMem(pA9EA, 1024);
  asm
  db 184,8,0,80,184,1,0,80,184,1,0,80,176,0,80,191,180,157,30,87
  call pR1C3_19A4
  end;
  asm
  db 184,8,0,80,184,1,0,80,184,1,0,80,176,0,80,191,184,157,30,87
  call pR1C3_19A4
  end;
  asm
  db 184,8,0,80,184,1,0,80,184,1,0,80,176,0,80,191,188,157,30,87
  call pR1C3_19A4
  end;
  asm
  db 49,192,163,161,197,163,163,197
  end;
  asm
  db 184,168,0,80,184,21,0,80,184,1,0,80,176,0,80,191,54,136,30,87
  call pR1C3_19A4
  end;
  asm
  db 184,24,0,80,184,3,0,80,184,1,0,80,176,0,80,191,58,136,30,87
  call pR1C3_19A4
  end;
  asm
  db 191,78,136,30,87,184,168,0,80
  call XR670_046E
  end;
  asm
  db 191,78,136,30,87,184,168,0,80
  call XR670_046E
  end;
  asm
  db 191,246,136,30,87,184,80,1,80
  call XR670_046E
  end;
  {@043F-0450}
  FillChar(b8A46, 336, 255);
  asm
  db 191,150,139,30,87,184,80,1,80
  call XR670_046E
  end;
  case b8834 of
    0: begin
      asm
  db 49,192,163,219,130
      end;
      for b8226 := 0 to 199 do
      begin
        asm
  db 139,22,219,130,160,38,130,48,228,139,248,209,231,137,149,134,143
        end;
        asm
  db 131,6,219,130,40
        end;
      end;
    end;
    1: begin
      asm
  db 198,6,38,130,0
      end;
      asm
  db 49,192,163,219,130
      end;
      asm
  db 128,62,38,130,199,119,111,161,219,130,5,0,184,139,208,160,38,130,48,228,139,248,209,231,137,149,22,145
  db 254,6,38,130,161,219,130,5,0,186,139,208,160,38,130,48,228,139,248,209,231,137,149,22,145,254,6,38
  db 130,161,219,130,5,0,188,139,208,160,38,130,48,228,139,248,209,231,137,149,22,145,254,6,38,130,161,219
  db 130,5,0,190,139,208,160,38,130,48,228,139,248,209,231,137,149,22,145,254,6,38,130,161,219,130,5,10
  db 0,163,219,130,235,138
      end;
    end;
  end;
  asm
  db 191,168,157,30,87,184,12,0,80
  call XR670_046E
  end;
  asm
  db 191,192,157,30,87,184,4,0,80
  call XR670_046E
  end;
  asm
  db 49,192,163,194,146,163,196,146
  end;
  asm
  db 49,192,163,198,146,163,200,146
  end;
  {@0548-0558}
  GetMem(p92C2, 13000);
  {@0558-0568}
  GetMem(p92C6, 6144);
  asm
  db 191,22,198,30,87,184,8,0,80
  call XR670_046E
  end;
  asm
  db 198,6,20,198,0
  end;
  asm
  db 198,6,21,198,0
  end;
  asm
  db 196,62,248,135,6,87,184,0,4,80
  call XR670_046E
  end;
  asm
  db 196,62,248,135,38,198,69,38,3
  end;
  asm
  db 196,62,248,135,38,198,69,33,1
  end;
  asm
  db 196,62,248,135,38,198,69,21,0
  end;
  asm
  db 196,62,248,135,38,198,69,56,10
  end;
  asm
  db 196,62,252,135,6,87,184,0,30,80
  call XR670_046E
  end;
  asm
  db 191,196,157,30,87,184,48,1,80
  call XR670_046E
  end;
  asm
  db 191,129,170,30,87,184,66,0,80
  call XR670_046E
  end;
  asm
  db 191,53,170,30,87,184,40,0,80
  call XR670_046E
  end;
  asm
  db 191,93,170,30,87,184,36,0,80
  call XR670_046E
  end;
  asm
  db 191,22,170,30,87,184,31,0,80
  call XR670_046E
  end;
  asm
  db 49,192,163,215,170,163,217,170
  end;
  asm
  db 49,192,163,202,167,163,204,167
  end;
  asm
  db 191,243,169,30,87,184,5,0,80
  call XR670_046E
  end;
  asm
  db 198,6,243,169,7
  end;
  asm
  db 198,6,244,169,13
  end;
  asm
  db 198,6,245,169,0
  end;
  asm
  db 191,248,169,30,87,184,4,0,80
  call XR670_046E
  end;
  asm
  db 198,6,55,171,13
  end;
  asm
  db 198,6,54,171,10
  end;
  asm
  db 198,6,56,171,15
  end;
  asm
  db 198,6,16,136,1
  end;
  asm
  db 198,6,21,136,1
  end;
  asm
  db 198,6,17,136,0
  end;
  asm
  db 49,192,163,18,136
  end;
  asm
  db 49,192,163,242,156,163,244,156
  end;
  asm
  db 49,192,163,238,156,163,240,156
  end;
  asm
  db 49,192,163,234,156,163,236,156
  end;
  asm
  db 49,192,163,230,156,163,232,156
  end;
  asm
  db 199,6,10,136,0,128
  end;
  asm
  db 196,62,248,135,38,198,69,17,4
  end;
  asm
  db 198,6,14,136,0
  end;
  asm
  db 198,6,242,169,0
  end;
  asm
  db 199,6,122,251,1,0
  end;
  asm
  db 196,62,248,135,38,198,69,31,0
  end;
  asm
  db 199,6,227,170,1,0
  end;
  asm
  db 198,6,125,174,0
  end;
  asm
  db 198,6,129,197,0
  end;
  asm
  db 198,6,130,197,0
  end;
  asm
  db 198,6,131,197,0
  end;
  asm
  db 198,6,132,197,0
  end;
  asm
  db 198,6,20,136,0
  end;
  asm
  db 198,6,166,146,1
  end;
  asm
  db 198,6,134,197,0
  end;
  asm
  db 198,6,212,148,0
  end;
  asm
  db 198,6,195,170,0
  end;
  asm
  db 198,6,204,170,0
  end;
  asm
  db 198,6,213,170,255
  end;
  asm
  db 198,6,214,170,255
  end;
  asm
  db 198,6,213,148,0
  end;
  asm
  db 198,6,19,176,232
  end;
  asm
  db 198,6,18,176,219
  end;
  asm
  db 198,6,140,197,0
  end;
  asm
  db 198,6,222,170,0
  end;
  asm
  db 198,6,240,174,1
  end;
  asm
  db 198,6,219,170,255
  end;
  asm
  db 198,6,135,174,0
  end;
  asm
  db 198,6,229,170,1
  end;
  asm
  db 198,6,12,136,4
  end;
  asm
  db 198,6,13,136,0
  end;
  asm
  db 198,6,128,174,0
  end;
  asm
  db 198,6,15,136,0
  end;
  asm
  db 49,192,163,252,169,163,254,169
  end;
  asm
  db 49,192,163,0,170,163,2,170
  end;
  asm
  db 49,192,163,4,170,163,6,170
  end;
  asm
  db 198,6,144,197,0
  end;
  asm
  db 198,6,233,174,0
  end;
  asm
  db 198,6,231,174,0
  end;
  asm
  db 198,6,145,197,0
  end;
  asm
  db 198,6,197,197,0
  end;
  asm
  db 198,6,134,174,0
  end;
  asm
  db 198,6,254,156,0
  end;
  asm
  db 198,6,170,146,1
  end;
  asm
  db 198,6,191,146,0
  end;
  asm
  db 198,6,192,146,0
  end;
  asm
  db 198,6,193,146,0
  end;
  asm
  db 198,6,202,146,255
  end;
  asm
  db 198,6,100,174,0
  end;
  asm
  db 198,6,8,170,0
  end;
  asm
  db 198,6,36,217,0
  end;
  asm
  db 198,6,138,197,0
  end;
  asm
  call pR47F_017C
  end;
  asm
  call pR47F_0F64
  end;
  asm
  db 176,202,80,176,1,80
  call pO17E_004B
  end;
  asm
  db 176,0,80,176,2,80
  call pO17E_004B
  end;
  asm
  db 176,16,80,184,16,0,80,191,30,210,30,87
  call pR1C3_1E9D
  end;
  asm
  db 184,16,0,80,184,16,0,80,191,30,213,30,87
  call pR1C3_1F24
  end;
  {@07E1-0804}
  pR1C3_0352('cursor', 1, 1, 13, @bC5A1);
  {@0804-0829}
  b8228 := pR5C3_0336('ITEMS', s3E0A, 0, @b825A);
  {@0829-0837}
  Reset(g825A_3610, 1);
  {@0837-084F}
  BlockRead(g825A_3610, b94D6, 2064, w9D83);
  {@084F-0859}
  Close(g825A_3610);
  asm
  db 191,42,217,30,87,184,246,33,80
  call XR670_046E
  end;
  asm
  db 198,6,19,198,0
  end;
  asm
  db 198,6,18,198,0
  end;
  asm
  call pO0BB_6DFB
  end;
  asm
  call pO07C_32F6
  end;
  {@087B-088B}
  GetMem(p9CFF, 4318);
  asm
  push cs
  call near ptr pO079_0024
  end;
  {@088F-089F}
  GetMem(pFB62, 9000);
  asm
  push cs
  call near ptr pO079_0121
  end;
end;

{ 08A7 }
procedure pO079_08A7;
begin
  {@08AA-08B8}
  XR670_046E(@b884E, 168);
  {@08B8-08C6}
  XR670_046E(@b88F6, 336);
  {@08C6-08D7}
  FillChar(b8A46, 336, 255);
  {@08D7-08E5}
  XR670_046E(@b8B96, 336);
  {@08E5-08F4}
  XR670_046E(@PR0_byte(p87F8)^.v, 1024);
  {@08F4-08FD}
  PR38_byte(p87F8)^.v := 3;
  {@08FD-0906}
  PR33_byte(p87F8)^.v := 1;
  {@0906-090F}
  PR21_byte(p87F8)^.v := 0;
  {@090F-0918}
  PR56_byte(p87F8)^.v := 10;
  {@0918-0927}
  XR670_046E(@PR0_byte(p87FC)^.v, 7680);
  {@0927-0935}
  XR670_046E(@bA9F3, 5);
  {@0935-093A}
  bA9F3 := 7;
  {@093A-093F}
  bA9F4 := 13;
  {@093F-0944}
  bA9F5 := 2;
  {@0944-0949}
  bC5C3 := 1;
  {@0949-0957}
  XR670_046E(@bA9F8, 4);
  {@0957-095C}
  b8815 := 1;
  {@095C-0961}
  b8811 := 0;
  {@0961-0966}
  w8812 := 0;
  {@0966-096E}
  l9CF2 := 0;
  {@096E-0976}
  l9CEE := 0;
  {@0976-097E}
  l9CEA := 0;
  {@097E-0984}
  w880A := 32768;
  {@0984-098D}
  PR17_byte(p87F8)^.v := 4;
  {@098D-0992}
  bA9F2 := 0;
  asm
  db 199,6,122,251,1,0
  end;
  {@0998-09A1}
  PR31_byte(p87F8)^.v := 0;
  {@09A1-09A7}
  wAAE3 := 1;
  {@09A7-09AC}
  bAE7D := 0;
  {@09AC-09B1}
  bC581 := 0;
  {@09B1-09B6}
  bC582 := 0;
  {@09B6-09BB}
  bC583 := 0;
  {@09BB-09C0}
  bC584 := 0;
  {@09C0-09C5}
  b8814 := 0;
  {@09C5-09CA}
  b92A6 := 1;
  {@09CA-09CF}
  bC586 := 0;
  {@09CF-09D4}
  b94D4 := 0;
  {@09D4-09D9}
  bAAC3 := 0;
  {@09D9-09DE}
  bAACC := 0;
  {@09DE-09E3}
  bAAD5 := 255;
  {@09E3-09E8}
  bAAD6 := 255;
  {@09E8-09ED}
  b94D5 := 0;
  {@09ED-09F2}
  bB013 := 232;
  {@09F2-09F7}
  bB012 := 219;
  {@09F7-09FC}
  bC58C := 0;
  {@09FC-0A01}
  bAEF0 := 1;
  {@0A01-0A06}
  bAADB := 255;
  {@0A06-0A0B}
  bAE87 := 0;
  {@0A0B-0A10}
  pO108_167D;
  {@0A10-0A15}
  bAAE5 := 1;
  {@0A15-0A1A}
  b880C := 4;
  {@0A1A-0A1F}
  b880D := 0;
  {@0A1F-0A24}
  bAE80 := 0;
  {@0A24-0A29}
  bC590 := 0;
  {@0A29-0A2E}
  bAEE9 := 0;
  {@0A2E-0A33}
  bAEE7 := 0;
  {@0A33-0A38}
  bC591 := 0;
  {@0A38-0A3D}
  bC5C5 := 0;
  {@0A3D-0A42}
  bAADE := 0;
  {@0A42-0A47}
  bAE86 := 0;
  {@0A47-0A4C}
  b880F := 0;
  {@0A4C-0A51}
  b9CFE := 0;
  {@0A51-0A56}
  bC593 := 0;
  {@0A56-0A5B}
  bD924 := 0;
  {@0A5B-0A60}
  bC58A := 0;
end;

{ 0A62 }
begin
end.

