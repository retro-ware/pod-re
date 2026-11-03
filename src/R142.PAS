{ R142: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R142;

interface

uses GAMEDATA;

procedure pR142_0000(a0: pointer);
procedure pR142_00C6;
procedure pR142_00D4(a0: byte);
procedure pR142_00F9(a0: byte; a1: byte; a2: byte);
procedure pR142_011B;
procedure pR142_0137;
procedure pR142_017B;
procedure pR142_01C7;
procedure pR142_01EF;
procedure pR142_0217(a0: byte; a1: byte; a2: byte; a3: byte);

implementation

uses LIT, O17E, R1C3, R47F, R670, R6DD;

type
  RA0_byte = record a: array[0..32000] of byte end;
  PRA0_byte = ^RA0_byte;
var
  b0DAA: byte absolute d0DAA;
  b0DC4: byte absolute d0DC4;
  b0DE4: byte absolute d0DE4;
  b8834: byte absolute d8834;
  b9D97: byte absolute d9D97;
  b9D98: byte absolute d9D98;
  b9D99: byte absolute d9D99;
  b9D9A: byte absolute d9D9A;
  bB16C: byte absolute dB16C;


{ 0000 }
procedure pR142_0000(a0: pointer);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  _f1: array[1..1] of byte;
begin
  {@0006-000B}
  bB16C := 0;
  {@000B-000F}
  v7b := 0;
  {@000F-00C0}
  repeat
    {@000F-00B6}
    if PRA0_byte(a0)^.a[v7b] = 254 then
      bB16C := 1
    else
    begin
      {@0027-0037}
      v1b := PRA0_byte(a0)^.a[v7b];
      {@0037-003A}
      Inc(v7b);
      {@003A-004A}
      v2b := PRA0_byte(a0)^.a[v7b];
      {@004A-004D}
      Inc(v7b);
      {@004D-005D}
      v3b := PRA0_byte(a0)^.a[v7b];
      {@005D-0060}
      Inc(v7b);
      {@0060-0070}
      v4b := PRA0_byte(a0)^.a[v7b];
      {@0070-0073}
      Inc(v7b);
      {@0073-0083}
      v5b := PRA0_byte(a0)^.a[v7b];
      {@0083-0086}
      Inc(v7b);
      {@0086-0096}
      v6b := PRA0_byte(a0)^.a[v7b];
      {@0096-0099}
      Inc(v7b);
      {@0099-00B6}
      pO17E_02E6(v1b, v2b, v3b, v4b, v5b, v6b);
    end;
  until bB16C <> 0;
end;

{ 00C6 }
procedure pR142_00C6;
begin
  {@00C9-00D2}
  pR142_0000(@b0DAA);
end;

{ 00D4 }
procedure pR142_00D4(a0: byte);
begin
  {@00D7-00DC}
  pR6DD_0051;
  {@00DC-00EC}
  pR142_0217(0, 0, 38, 22);
  {@00EC-00F0}
  pR142_00C6;
  {@00F0-00F5}
  pR6DD_0030;
end;

{ 00F9 }
procedure pR142_00F9(a0: byte; a1: byte; a2: byte);
begin
  {@00FC-0117}
  pO17E_02E6(a1, a0, a2, a0, 9, 7);
end;

{ 011B }
procedure pR142_011B;
begin
  {@011E-0123}
  pR6DD_0051;
  {@0123-0127}
  pR142_0137;
  {@0127-0130}
  pR142_0000(@b0DC4);
  {@0130-0135}
  pR6DD_0030;
end;

{ 0137 }
procedure pR142_0137;
begin
  {@013A-013F}
  pR6DD_0051;
  {@013F-014F}
  pR142_0217(1, 1, 38, 22);
  {@014F-0153}
  pR142_00C6;
  {@0153-0160}
  pR142_00F9(16, 0, 39);
  {@0160-0165}
  b9D97 := 1;
  {@0165-016A}
  b9D98 := 17;
  {@016A-016F}
  b9D99 := 38;
  {@016F-0174}
  b9D9A := 22;
  {@0174-0179}
  pR6DD_0030;
end;

{ 017B }
procedure pR142_017B;
begin
  {@017E-0183}
  pR6DD_0051;
  {@0183-0193}
  pR142_0217(1, 1, 38, 21);
  {@0193-019C}
  pR142_0000(@b0DE4);
  {@019C-01AC}
  pR142_0217(0, 23, 39, 23);
  {@01AC-01B1}
  b9D97 := 23;
  {@01B1-01B6}
  b9D98 := 1;
  {@01B6-01BB}
  b9D99 := 23;
  {@01BB-01C0}
  b9D9A := 21;
  {@01C0-01C5}
  pR6DD_0030;
end;

{ 01C7 }
procedure pR142_01C7;
var
  _f1: array[1..4] of byte;
begin
  {@01CD-01D2}
  pR6DD_0051;
  {@01D2-01E2}
  pR142_0217(1, 1, 38, 22);
  {@01E2-01E6}
  pR142_00C6;
  {@01E6-01EB}
  pR6DD_0030;
end;

{ 01EF }
procedure pR142_01EF;
var
  _f1: array[1..2] of byte;
begin
  {@01F5-01FA}
  pR6DD_0051;
  {@01FA-020A}
  pR142_0217(1, 1, 38, 16);
  {@020A-020E}
  pR142_00C6;
  {@020E-0213}
  pR6DD_0030;
end;

{ 0217 }
procedure pR142_0217(a0: byte; a1: byte; a2: byte; a3: byte);
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  _f1: array[1..2] of byte;
  v12w: word;
  _f2: array[1..4] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    for _fw := _fw to _fw do ;
  end;
  {@021D-0222}
  pR1C3_000F;
  {@0222-0227}
  pR1C3_0000;
  {@0227-022C}
  pR6DD_0051;
  case b8834 of
    0: begin
      {@0233-024E}
      pR47F_00B7(a0, a1, a2, a3, 0, 0);
      {@024E-0269}
      pR47F_00B7(a0, a1, a2, a3, 1, 0);
    end;
    1: begin
      {@0273-027C}
      v2w := shortint(a1) * 2;
      {@027C-0286}
      v4w := shortint(a3) * 2 + 1;
      {@0286-0291}
      v6w := shortint(a0) * 4;
      {@0291-02A5}
      v8w := (shortint(a2) - shortint(a0) + 1) * 4;
      for v12w := v2w to v4w do
      begin
        asm
  db 139,78,250,184,160,0,247,102,244,139,248,3,249,184,0,184,80,87,255,118,248
  call XR670_046E
        end;
        asm
  db 139,78,250,184,160,0,247,102,244,139,248,3,249,184,0,186,80,87,255,118,248
  call XR670_046E
        end;
        asm
  db 139,78,250,184,160,0,247,102,244,139,248,3,249,184,0,188,80,87,255,118,248
  call XR670_046E
        end;
        asm
  db 139,78,250,184,160,0,247,102,244,139,248,3,249,184,0,190,80,87,255,118,248
  call XR670_046E
        end;
      end;
    end;
    2: asm
  db 138,70,12,152,177,3,211,224,139,216,138,70,10,152,177,3,211,224,186,64,1,247,226,3,195,137,70,242
  db 138,70,12,152,139,208,138,70,8,152,43,194,64,177,3,211,224,137,70,240,138,70,6,152,64,177,3,211
  db 224,72,137,70,238,138,70,10,152,177,3,211,224,59,70,238,119,47,137,70,244,235,3,255,70,244,139,70
  db 242,49,210,5,0,0,129,210,0,160,137,199,142,194,6,87,255,118,240
  call XR670_046E
  db 129,70,242,64,1,139,70,244,59,70,238,117,214
      end;
  end;
  {@03AA-03AF}
  pR6DD_0030;
end;

{ 03B5 }
begin
end.

