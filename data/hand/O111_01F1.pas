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
{BODY}
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
