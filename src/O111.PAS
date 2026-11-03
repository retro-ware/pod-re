{ O111: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O111;

interface

uses GAMEDATA;

procedure pO111_00A8(a0: longint; a1: byte; a2: byte);
procedure pO111_01F1(a0: S8; a1: byte; a2: byte);
procedure pO111_096E;
procedure pO111_0A91(a0: byte);
procedure pO111_0B1C(a0: byte);
procedure pO111_0BAF;
procedure pO111_0BD8(a0: byte);

implementation

uses LIT, R116, R142, R1C3, R47F, R5C0, R5C3, R670, R6DD;

type
  E3_byte = record f: byte; _r: array[1..2] of byte end;
  PV4_0_word = record v: word; _r: array[1..2] of byte end;
  PV4_2_word = record _p: array[1..2] of byte; v: word end;
  X12 = array[0..11] of byte;
var
  a0CB0_0c20: array[0..2729] of X12 absolute d0CB0;
  aAA06_fd21: array[0..10919] of E3_byte absolute dAA06;
  aAA07_fd21: array[0..10919] of E3_byte absolute dAA07;
  aAA1F_2fc5: array[0..16379] of word absolute dAA1F;
  aAA35_9f8b: array[0..8189] of pointer absolute dAA35;
  aAA35_b676: array[0..8189] of longint absolute dAA35;
  aAA5D_0389: array[0..8189] of array[0..3] of byte absolute dAA5D;
  aAA5D_9f8b: array[0..8189] of pointer absolute dAA5D;
  aCC1E_eec0: array[0..10919] of array[0..2] of byte absolute dCC1E;
  aD51E_eec0: array[0..10919] of array[0..2] of byte absolute dD51E;
  b8834: byte absolute d8834;
  bAA08: byte absolute dAA08;
  bAA15: byte absolute dAA15;
  bAA31: byte absolute dAA31;
  bAA33: byte absolute dAA33;
  bAA35: byte absolute dAA35;
  bAA59: byte absolute dAA59;
  bAA5D: byte absolute dAA5D;
  bAAC3: byte absolute dAAC3;
  bAAD5: byte absolute dAAD5;
  bAAD7: byte absolute dAAD7;
  bAADB: byte absolute dAADB;
  bCC1E: byte absolute dCC1E;
  gAA09_f028: X12 absolute dAA09;
  gCC1E_9554: B768 absolute dCC1E;
  gD51E_9554: B768 absolute dD51E;
  l8836: longint absolute d8836;
  lAAD7: longint absolute dAAD7;
  pAA59: pointer absolute dAA59;
  sbB16D: shortint absolute dB16D;

procedure pO111_0000(a0: byte); far; forward;

{ 0000 }
procedure pO111_0000(a0: byte);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0006-000B}
  bAA08 := 1;
  case a0 of
    7: v1b := 0;
    128: v1b := 1;
    133: v1b := 2;
    136: v1b := 3;
    137: v1b := 4;
    139: v1b := 5;
    142: v1b := 6;
    149: v1b := 7;
    240..246: v1b := a0 - 240 + 8;
  else
    {@0076-007B}
    bAA08 := 0;
  end;
  {@007B-00A2}
  if bAA08 = 1 then
    gAA09_f028 := a0CB0_0c20[v1b];
end;

{ 00A8 }
procedure pO111_00A8(a0: longint; a1: byte; a2: byte);
var
  _f1: array[1..14] of byte;
begin
  {@00AE-00F0}
  if (b8834 = 2) and (aAA35_b676[a2] = 0) or ((b8834 <> 2) or (bAA15 <> 0)) and (aAA5D_9f8b[a2] = nil) then
    Exit;
  {@00F0-0107}
  if (b8834 = 2) and (bAA15 = 0) then
    pR116_006E(a2);
  {@0107-010B}
  a1 := 0;
  if a1 <> 0 then
  begin
    {@0111-0176}
    if (b8834 = 2) and (bAA15 = 0) then
      pR1C3_08C0(PV4_2_word(a0).v - 1, PV4_0_word(a0).v - 1, 0, 0, pAA59, l8836)
    else
      pR1C3_08C0(PV4_2_word(a0).v - 1, PV4_0_word(a0).v - 1, 0, 0, pointer(aAA5D_9f8b[a2]), l8836);
    {@0176-017B}
    pR6DD_0051;
    {@017B-0180}
    pR1C3_10FD;
    {@0180-0185}
    pR6DD_0030;
    {@0185-0187}
    Exit;
  end;
  {@0187-018C}
  pR6DD_0051;
  if (b8834 = 2) and (bAA15 = 0) then
    pR1C3_0EEB(PV4_2_word(a0).v, PV4_0_word(a0).v, pAA59)
  else
    pR1C3_0EEB(PV4_2_word(a0).v, PV4_0_word(a0).v, pointer(aAA5D_9f8b[a2]));
  {@01CD-01D2}
  pR6DD_0030;
end;

{ 01F1 }
procedure pO111_01F1(a0: S8; a1: byte; a2: byte);
type
  R0_byte = record v: byte end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R4_word = record _p: array[1..4] of byte; v: word end;
  R6_word = record _p: array[1..6] of byte; v: word end;
  RA0_byte = record a: array[0..32000] of byte end;
  PR0_byte = ^R0_byte;
  PR22_byte = ^R22_byte;
  PR4_word = ^R4_word;
  PR6_word = ^R6_word;
  PRA0_byte = ^RA0_byte;
var
  v11w, v13w, v15w, v17w: word;
  v18b, v19b, v20b: byte;
  v24p, v28p, v32p: pointer;
  v34w, v36w, v38w: word;
  _g2: word;
  v42w, v44w, v46w: word;
  v48a: string[1];
  v50w: word;
  v11b: byte absolute v11w;
  v13b: byte absolute v13w;
  v15i: integer absolute v15w;
  v32b: byte absolute v32p;
  v34b: byte absolute v34w;
  v36b: byte absolute v36w;
  v38b: byte absolute v38w;
  v42b: byte absolute v42w;
  aAA16: array[0..8] of byte absolute dAA16;
  bAA32: byte absolute dAA32;
  aD81E_ec3f: array[0..32759] of byte absolute dD81E;
  bAA16: byte absolute dAA16;
  gAAC3_bd31: string[8] absolute dAAC3;
  sAAC3: string absolute dAAC3;
begin
  if false then begin
    if LV = 'PIC' then;
    if LV = '1' then;
    if LV = '.dax' then;
    if LV = 'PIC not found' then;
  end;
  {@020B-0214}
  if a1 = 255 then
    Exit;
  {@0214-0234}
  if a0 = 'PIC' then
    pO111_0000(a1)
  else
    bAA08 := 0;
  {@0234-027E}
  if (a0 = sAAC3) and (a1 = bAAD5) then
  begin
    {@024E-027B}
    if bAA15 <> 0 then
      pR1C3_1F24(176, 80, gCC1E_9554)
    else
      pR1C3_1F24(32, 224, gCC1E_9554);
    {@027B-027E}
    Exit;
  end;
  {@027E-0291}
  if lAAD7 <> 0 then
    pR1C3_1A83(@bAAD7);
  {@0291-0296}
  pR47F_0F64;
  {@0296-029A}
  pO111_096E;
  {@029A-02A8}
  XR670_046E(@bAA16, 31);
  {@02A8-02BB}
  gAAC3_bd31 := a0;
  {@02BB-02CE}
  bAA15 := Ord(Ord(UpCase(a0[1])) = 83);
  {@02CE-02D4}
  bAAD5 := a1;
  {@02D4-02E7}
  v48a := '1';
  {@02E7-0324}
  pR5C3_0915(a0 + v48a, '.dax', a1, @v42b, @v32b);
  if v42w = 0 then
  begin
    {@032A-0344}
    pR47F_0B2E(14, 0, 'PIC not found');
    {@0344-0347}
    Exit;
  end;
  {@0347-034C}
  v46w := 0;
  {@034C-0364}
  Move(PRA0_byte(v32p)^.a[v46w], v36b, 2);
  {@0364-0368}
  Inc(v46w, 2);
  {@0368-0380}
  Move(PRA0_byte(v32p)^.a[v46w], v38b, 2);
  {@0380-0384}
  Inc(v46w, 2);
  {@0384-039C}
  Move(PRA0_byte(v32p)^.a[v46w], v11b, 2);
  {@039C-03A0}
  Inc(v46w, 2);
  {@03A0-03B8}
  Move(PRA0_byte(v32p)^.a[v46w], v13b, 2);
  {@03B8-03BC}
  Inc(v46w, 2);
  {@03BC-03D4}
  Move(PRA0_byte(v32p)^.a[v46w], v18b, 1);
  {@03D4-03D7}
  Inc(v46w);
  if v18b > 8 then
    v18b := 8;
  {@03E1-03E7}
  bAA33 := v18b;
  {@03E7-03FF}
  Move(PRA0_byte(v32p)^.a[v46w], v19b, 1);
  {@03FF-0402}
  Inc(v46w);
  {@0402-041A}
  Move(PRA0_byte(v32p)^.a[v46w], v20b, 1);
  {@041A-041D}
  Inc(v46w);
  {@041D-044B}
  Move(PRA0_byte(v32p)^.a[v46w], aD51E_eec0[v19b], v20b * 3);
  {@044B-0459}
  Inc(v46w, v20b * 3);
  for v15i := 0 to v20b shr 1 - 1 do
  begin
    {@0473-049B}
    aD81E_ec3f[v19b + v15w * 2] := PRA0_byte(v32p)^.a[v46w] shr 4;
    {@049B-04BF}
    aD81E_ec3f[v19b + v15w * 2 + 1] := PRA0_byte(v32p)^.a[v46w] and 15;
    {@04BF-04C2}
    Inc(v46w);
  end;
  Inc(v46w, 4);
  Move(PRA0_byte(v32p)^.a[v46w], bAA31, 1);
  Inc(v46w);
  Move(PRA0_byte(v32p)^.a[v46w], bAA32, 1);
  Inc(v46w);
  for v15i := 0 to v18b do
  begin
    Move(PRA0_byte(v32p)^.a[v46w], aAA1F_2fc5[v15w], 2);
    Move(PRA0_byte(v32p)^.a[v46w + 2], aAA16[v15w], 1);
    Inc(v46w, 3);
  end;
  {@0563-05A8}
  if (b8834 = 2) and (bAA15 = 0) then
  begin
    {@0571-0589}
    pR1C3_19A4(v36w, v38w, 1, a2, @bAA59);
    {@0589-0592}
    PR22_byte(pAA59)^.v := 13;
    {@0592-059D}
    PR4_word(pAA59)^.v := v11w;
    {@059D-05A8}
    PR6_word(pAA59)^.v := v13w;
  end;
  {@05A8-05AD}
  v50w := 7744;
  for v15i := 0 to v18b do
  begin
    {@05C4-05DE}
    if aAA1F_2fc5[v15w] > v50w then
      v50w := aAA1F_2fc5[v15w];
  end;
  {@05E6-05F4}
  GetMem(v28p, v50w);
  if (b8834 = 2) and (bAA15 = 0) then
    for v15i := 0 to v18b do
    begin
      {@0622-06C8}
      if bAA31 = v15w then
      begin
        {@062C-0644}
        GetMem(aAA35_9f8b[v15w], 7744);
        {@0644-0661}
        Move(PRA0_byte(v32p)^.a[v46w], PR0_byte(v28p)^.v, aAA1F_2fc5[v15w]);
        {@0661-0684}
        XR116_00FF(v28p, pointer(aAA35_9f8b[v15w]), aAA1F_2fc5[v15w]);
      end
      else
      begin
        {@0686-06A3}
        GetMem(aAA35_9f8b[v15w], aAA1F_2fc5[v15w]);
        {@06A3-06C8}
        Move(PRA0_byte(v32p)^.a[v46w], PR0_byte(aAA35_9f8b[v15w])^.v, aAA1F_2fc5[v15w]);
      end;
      {@06C8-06D4}
      Inc(v46w, aAA1F_2fc5[v15w]);
    end
  else
  begin
    {@06E2-06F1}
    GetMem(v24p, 7744);
    {@06F1-06F7}
    v44w := v46w;
    {@06F7-06FC}
    v15w := 0;
    {@06FC-0717}
    while bAA31 > v15i do
    begin
      {@0706-0712}
      Inc(v46w, aAA1F_2fc5[v15w]);
      {@0712-0715}
      Inc(v15w);
    end;
    {@0717-0739}
    XR116_00FF(@PRA0_byte(v32p)^.a[v46w], v24p, aAA1F_2fc5[bAA31]);
    {@0739-073F}
    v46w := v44w;
    for v15i := 0 to v18b do
    begin
      {@0759-0779}
      pR1C3_19A4(v36w, v38w, 1, a2, @aAA5D_0389[v15w]);
      {@0779-078B}
      PR4_word(aAA5D_9f8b[v15w])^.v := v11w;
      {@078B-079D}
      PR6_word(aAA5D_9f8b[v15w])^.v := v13w;
      {@079D-07AD}
      PR22_byte(aAA5D_9f8b[v15w])^.v := 13;
      if bAA31 <> v15w then
      begin
        {@07BA-07D8}
        XR116_00FF(@PRA0_byte(v32p)^.a[v46w], v28p, aAA1F_2fc5[v15w]);
        {@07D8-07F3}
        XR116_00D7(v28p, v28p, v24p, 7744);
        if bAA15 <> 0 then
          for v17w := 0 to 7743 do
            case PRA0_byte(v28p)^.a[v17w] of
              0: PRA0_byte(v28p)^.a[v17w] := 13;
              13: PRA0_byte(v28p)^.a[v17w] := 0;
            end;
        {@0838-083D}
        v34w := 0;
        {@083D-0863}
        pR1C3_03FF(v28p, @v34b, a2, 13, pointer(aAA5D_9f8b[v15w]));
      end;
      {@0863-086F}
      Inc(v46w, aAA1F_2fc5[v15w]);
    end;
    {@087A-08BF}
    if bAA15 <> 0 then
      for v17w := 0 to 7743 do
        case PRA0_byte(v24p)^.a[v17w] of
          0: PRA0_byte(v24p)^.a[v17w] := 13;
          13: PRA0_byte(v24p)^.a[v17w] := 0;
        end;
    {@08BF-08C4}
    v34w := 0;
    {@08C4-08EE}
    pR1C3_03FF(v24p, @v34b, a2, 13, pointer(aAA5D_9f8b[bAA31]));
    {@08EE-08FD}
    pR5C0_0000(v24p, 7744);
  end;
  {@08FD-090B}
  pR5C0_0000(v32p, v42w);
  {@090B-0919}
  pR5C0_0000(v28p, v50w);
  if bAA15 <> 0 then
  begin
    {@0920-0931}
    pR1C3_1E9D(176, 80, @bCC1E);
    {@0931-0943}
    pR1C3_1F24(176, 80, gCC1E_9554);
    {@0943-0945}
    Exit;
  end;
  {@0945-0956}
  pR1C3_1E9D(32, 224, @bCC1E);
  {@0956-0968}
  pR1C3_1F24(32, 224, gCC1E_9554);
end;

{ 096E }
procedure pO111_096E;
begin
  {@0974-0A64}
  if (b8834 = 2) and (bAA15 = 0) then
  begin
    {@0988-0A09}
    for sbB16D := 0 to bAA33 do
    begin
      {@099E-0A01}
      if aAA35_9f8b[sbB16D] <> nil then
      begin
        {@09B2-0A01}
        if sbB16D = bAA31 then
          pR5C0_0000(pointer(aAA35_9f8b[sbB16D]), 7744)
        else
          pR5C0_0000(pointer(aAA35_9f8b[sbB16D]), aAA1F_2fc5[sbB16D]);
      end;
    end;
    {@0A09-0A13}
    pR1C3_1A83(@bAA59);
    {@0A13-0A21}
    XR670_046E(@bAA35, 66);
  end
  else
  begin
    {@0A23-0A56}
    for sbB16D := 0 to bAA33 do
      pR1C3_1A83(@aAA5D_0389[sbB16D]);
    {@0A56-0A64}
    XR670_046E(@bAA5D, 36);
  end;
  {@0A64-0A69}
  bAAC3 := 0;
  {@0A69-0A6E}
  bAAD5 := 255;
end;

{ 0A91 }
procedure pO111_0A91(a0: byte);
begin
  if false then begin
    if LV = 'Illegal range in Show3DSprite.' then;
  end;
  {@0A94-0AC4}
  if (a0 < 1) or (a0 > 3) then
  begin
    {@0AA0-0AA5}
    pR1C3_00AC;
    {@0AA5-0ABC}
    WriteLn(Output, 'Illegal range in Show3DSprite.');
    {@0ABC-0AC4}
    pR670_0000(0);
  end;
  {@0AC4-0ADC}
  if aAA5D_9f8b[a0 - 1] = nil then
    Exit;
  {@0ADC-0B0B}
  pR1C3_08C0(2, 2, 0, 1, pointer(aAA5D_9f8b[a0 - 1]), l8836);
  {@0B0B-0B10}
  pR1C3_10FD;
end;

{ 0B1C }
procedure pO111_0B1C(a0: byte);
begin
  if false then begin
    if LV = 'bigpic1' then;
  end;
  {@0B22-0B26}
  pO111_096E;
  if (bAADB = a0) and (lAAD7 <> 0) then
  begin
    {@0B37-0B49}
    pR1C3_1F24(32, 224, gCC1E_9554);
    {@0B49-0B4B}
    Exit;
  end;
  {@0B4B-0B50}
  pR47F_0F64;
  {@0B50-0B73}
  pR1C3_0352('bigpic1', a0, 0, 0, @bAAD7);
  {@0B73-0B7B}
  pO111_0000(a0);
  {@0B7B-0B81}
  bAADB := a0;
  {@0B81-0B92}
  pR1C3_1E9D(32, 224, @bCC1E);
  {@0B92-0BA4}
  pR1C3_1F24(32, 224, gD51E_9554);
  {@0BA4-0BA9}
  pR47F_0F9D;
end;

{ 0BAF }
procedure pO111_0BAF;
begin
  {@0BB2-0BB7}
  pR6DD_0051;
  {@0BB7-0BBC}
  pR142_0137;
  asm
  db 184,1,0,80,184,1,0,80,255,54,217,170,255,54,215,170
  call pR1C3_0EEB
  end;
  {@0BD1-0BD6}
  pR6DD_0030;
end;

{ 0BD8 }
procedure pO111_0BD8(a0: byte);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..2] of byte;
begin
  {@0BDE-0BF2}
  v1b := aAA06_fd21[a0].f;
  {@0BF2-0C06}
  v2b := aAA07_fd21[a0].f;
  {@0C06-0C3F}
  Move(aCC1E_eec0[v1b], aD51E_eec0[v1b + 1], (v2b - 1) * 3);
  {@0C3F-0C78}
  Move(aCC1E_eec0[v1b + v2b - 1], aD51E_eec0[v1b], 3);
  {@0C78-0C8C}
  pR1C3_1E9D(v1b, v2b, @bCC1E);
  {@0C8C-0CA2}
  pR1C3_1F24(v1b, v2b, gCC1E_9554);
end;

{ 0CA8 }
begin
end.

