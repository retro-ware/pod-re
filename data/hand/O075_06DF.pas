type
  WX = record case byte of 0: (_0: array[1..17] of byte; x17r2_0: array[0..16000] of WE2_byte);
    1: (_1: array[1..17] of byte; x17byte: byte);
    2: (_2: array[1..28] of byte; x28byte: byte);
    3: (_3: array[1..172] of byte; x172byte: byte);
    4: (_4: array[1..173] of byte; x173byte: byte);
    5: (_5: array[1..173] of byte; x173shortint: shortint);
    6: (_6: array[1..174] of byte; x174byte: byte);
    7: (_7: array[1..174] of byte; x174shortint: shortint);
    8: (_8: array[1..176] of byte; x176word: word);
    9: (_9: array[1..178] of byte; x178byte: byte);
    10: (_10: array[1..305] of byte; x305byte: byte);
    11: (_11: array[1..311] of byte; x311byte: byte);
    12: (_12: array[1..312] of byte; x312byte: byte);
    13: (_13: array[1..331] of byte; x331word: word);
    14: (_14: array[1..337] of byte; x337abyte: array[0..32000] of byte);
    15: (_15: array[1..337] of byte; x337byte: byte);
    16: (_16: array[1..339] of byte; x339byte: byte);
    17: (_17: array[1..340] of byte; x340byte: byte);
    18: (_18: array[1..341] of byte; x341byte: byte);
    19: (_19: array[1..342] of byte; x342byte: byte);
    20: (_20: array[1..343] of byte; x343byte: byte);
    21: (_21: array[1..358] of byte; x358shortint: shortint);
    22: (_22: array[1..360] of byte; x360byte: byte);
    23: (_23: array[1..362] of byte; x362byte: byte);
    24: (_24: array[1..364] of byte; x364byte: byte);
    25: (_25: array[1..368] of byte; x368byte: byte);
    26: (_26: array[1..370] of byte; x370l: longint);
    28: (_28: array[1..379] of byte; x379byte: byte);
    29: (_29: array[1..380] of byte; x380byte: byte);
    30: (_30: array[1..381] of byte; x381byte: byte);
    31: (_31: array[1..412] of byte; x412byte: byte);
    32: (_32: array[1..413] of byte; x413abyte: array[0..32000] of byte);
    33: (_33: array[1..413] of byte; x413byte: byte);
    34: (_34: array[1..493] of byte; x493byte: byte);
    35: (_35: array[1..494] of byte; x494byte: byte);
    36: (_36: array[1..508] of byte; x508byte: byte) end;
  PWX = ^WX;
  E10_byte = record f: byte; _r: array[1..9] of byte end;
  E10_word = record f: word; _r: array[1..8] of byte end;
  E14_byte = record f: byte; _r: array[1..13] of byte end;
  R173_shortint = record _p: array[1..173] of byte; v: shortint end;
  R174_shortint = record _p: array[1..174] of byte; v: shortint end;
  R175_byte = record _p: array[1..175] of byte; v: byte end;
  R358_byte = record _p: array[1..358] of byte; v: byte end;
  R420_byte = record _p: array[1..420] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  RA337_byte = record _p: array[1..337] of byte; a: array[0..32000] of byte end;
  RA344_byte = record _p: array[1..344] of byte; a: array[0..32000] of byte end;
  PR173_shortint = ^R173_shortint;
  PR174_shortint = ^R174_shortint;
  PR175_byte = ^R175_byte;
  PR358_byte = ^R358_byte;
  PR420_byte = ^R420_byte;
  PR421_byte = ^R421_byte;
  PRA337_byte = ^RA337_byte;
  PRA344_byte = ^RA344_byte;
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v18w: word;
  v19b, v20b, v21b, v22b, v23b, v24b, v25b, v26b, v27b: byte;
  _g1: array[1..3] of byte;
  v31b, v32b, v33b, v34b: byte;
  _g2: byte;
  v36b: byte;
  v77a: string[40];
  v78b: byte;
  _f1: array[1..9] of byte;
  v4b: byte absolute v4p;
  v12b: byte absolute v12p;
  v16b: byte absolute v16p;
  v18b: byte absolute v18w;
  v23sb: shortint absolute v23b;
  v24sb: shortint absolute v24b;
  v25sb: shortint absolute v25b;
  v26sb: shortint absolute v26b;
  v77b: byte absolute v77a;
  a103D_c528: array[0..3639] of string[8] absolute d103D;
  a107C_6df8: array[0..1926] of string[16] absolute d107C;
  a1115_ae45: array[0..4679] of string[6] absolute d1115;
  a6D18_9aee: array[0..1488, 0..21] of byte absolute d6D18;
  a6DB2_ec3f: array[0..32759] of byte absolute d6DB2;
  a6F57_527e: array[0..2339, 0..13] of byte absolute d6F57;
  a6F57_5caa: array[0..2339, 0..13] of shortint absolute d6F57;
  a6F57_9794: array[0..2339] of E14_byte absolute d6F57;
  a7053_9461: array[0..3275] of E10_word absolute d7053;
  a7055_9461: array[0..3275] of E10_word absolute d7055;
  a7057_9461: array[0..3275] of E10_word absolute d7057;
  a7059_9461: array[0..3275] of E10_word absolute d7059;
  a708F_c768: array[0..5459, 0..5] of byte absolute d708F;
  a70F5_3b44: array[0..3275, 0..9] of shortint absolute d70F5;
  a70F5_7b1e: array[0..3275] of E10_byte absolute d70F5;
  s19F1: string absolute d19F1;
  s1A1A: string absolute d1A1A;
  s1A43: string absolute d1A43;
  s1A95: string absolute d1A95;
{BODY}
  {@06E6-06F5}
  GetMem(v4p, 510);
  {@06F5-0703}
  XR670_046E(@PR0_byte(v4p)^.v, 510);
  with PWX(v4p)^ do
  begin
    for v19b := 1 to 6 do
      x413abyte[v19b] := a6DDD_ec3f[v19b] + (a6DDD_ec3f[v19b] + 8) * 16;
    {@0751-075A}
    x368byte := 50;
    {@075A-0763}
    x172byte := 40;
    {@0763-076C}
    x493byte := 0;
    {@076C-0775}
    x494byte := 1;
    {@0775-077E}
    x305byte := 1;
    {@077E-0787}
    x412byte := 10;
  end;
  {@0787-0795}
  pO108_22B0(7, @v12b);
  {@0795-079D}
  PR41_byte(v12p)^.v := 1;
  {@079D-07B0}
  PR0_string_40_(v12p)^.v := s19F1;
  for v23b := 0 to 5 do
  begin
    {@07B9-07D0}
    v16p := Pointer(pO108_0000(v23sb + 1, v12p));
    {@07D0-0804}
    PR0_string_40_(v16p)^.v := '  ' + a103D_c528[v23sb];
  end;
  {@080A-0816}
  v16p := v12p;
  {@0816-081B}
  v18w := 1;
  {@081B-081F}
  v34b := 1;
  {@081F-0823}
  v33b := 1;
  {@0823-082B}
  pO108_00CB(0);
  {@082B-08B2}
  repeat
    {@082B-0879}
    v22b := pO108_1D45('', 'Select', 1, 2, 38, 22, v12p, v33b, 0, @v34b, @v18b, @v16b);
    if (bAAE6 <> 0) and (v22b = 27) or (bAAE6 = 0) and (v22b > 0) then
    begin
      {@0893-089D}
      pO108_2363(@v12b);
      {@089D-08A6}
      pO075_0015(@v4b);
      {@08A6-08A9}
      Exit;
    end;
  until v22b = 0;
  {@08B2-09E0}
  with PWX(v4p)^ do
  begin
    x173byte := v18w - 1;
    x413byte := 2;
    case x173byte of
      4: begin
        {@08DC-08F3}
        pO0E2_13E5(v4p, 97, 0, 255, 0);
        {@08F3-08FC}
        x413byte := 1;
      end;
      2: begin
        {@0903-091A}
        pO0E2_13E5(v4p, 47, 0, 255, 0);
        {@091A-0931}
        pO0E2_13E5(v4p, 26, 0, 255, 0);
        {@0931-0948}
        pO0E2_13E5(v4p, 97, 0, 255, 0);
        {@0948-0951}
        x413byte := 1;
      end;
      3: begin
        {@0958-096F}
        pO0E2_13E5(v4p, 48, 0, 255, 0);
        {@096F-0986}
        pO0E2_13E5(v4p, 7, 0, 255, 0);
        {@0986-099D}
        pO0E2_13E5(v4p, 97, 0, 255, 0);
        {@099D-09A6}
        x413byte := 1;
      end;
      0: pO0E2_13E5(v4p, 95, 0, 255, 0);
      1: pO0E2_13E5(v4p, 18, 0, 255, 0);
    end;
  end;
  {@09E0-09EA}
  pO108_2363(@v12b);
  {@09EA-09F8}
  pO108_22B0(3, @v12b);
  {@09F8-0A00}
  PR41_byte(v12p)^.v := 1;
  {@0A00-0A13}
  PR0_string_40_(v12p)^.v := s1A1A;
  for v24b := 0 to 1 do
  begin
    {@0A1C-0A33}
    v16p := Pointer(pO108_0000(v24sb + 1, v12p));
    {@0A33-0A67}
    PR0_string_40_(v16p)^.v := '  ' + a1115_ae45[v24sb];
  end;
  {@0A6D-0A79}
  v16p := v12p;
  {@0A79-0A7E}
  v18w := 1;
  {@0A7E-0A82}
  v33b := 1;
  {@0A82-0A86}
  v34b := 1;
  {@0A86-0B0D}
  repeat
    {@0A86-0AD4}
    v22b := pO108_1D45('', 'Select', 1, 2, 38, 22, v12p, v33b, 0, @v34b, @v18b, @v16b);
    if (bAAE6 <> 0) and (v22b = 27) or (bAAE6 = 0) and (v22b > 0) then
    begin
      {@0AEE-0AF8}
      pO108_2363(@v12b);
      {@0AF8-0B01}
      pO075_0015(@v4b);
      {@0B01-0B04}
      Exit;
    end;
  until v22b = 0;
  {@0B0D-0B19}
  PR358_byte(v4p)^.v := v18w - 1;
  {@0B19-0B23}
  pO108_2363(@v12b);
  {@0B23-0B3A}
  v27b := a6F57_9794[PR173_shortint(v4p)^.v].f;
  {@0B3A-0B4B}
  pO108_22B0(v27b + 1, @v12b);
  {@0B4B-0B53}
  PR41_byte(v12p)^.v := 1;
  {@0B53-0B66}
  PR0_string_40_(v12p)^.v := s1A43;
  for v19b := 1 to v27b do
  begin
    {@0B7B-0B92}
    v16p := Pointer(pO108_0000(v19b, v12p));
    {@0B92-0BE0}
    PR0_string_40_(v16p)^.v := '  ' + a0E57_b7cc[a6F57_5caa[PR173_shortint(v4p)^.v, v19b]];
  end;
  {@0BE8-0BF4}
  v16p := v12p;
  {@0BF4-0BF9}
  v18w := 1;
  {@0BF9-0BFD}
  v33b := 1;
  {@0BFD-0C01}
  v34b := 1;
  {@0C01-0C88}
  repeat
    {@0C01-0C4F}
    v22b := pO108_1D45('', 'Select', 1, 2, 38, 22, v12p, v33b, 0, @v34b, @v18b, @v16b);
    if (bAAE6 <> 0) and (v22b = 27) or (bAAE6 = 0) and (v22b > 0) then
    begin
      {@0C69-0C73}
      pO108_2363(@v12b);
      {@0C73-0C7C}
      pO075_0015(@v4b);
      {@0C7C-0C7F}
      Exit;
    end;
  until v22b = 0;
  {@0C88-0F07}
  with PWX(v4p)^ do
  begin
    x370l := 1500001;
    x174byte := a6F57_527e[x173shortint, v18w];
    x312byte := 1;
    case x174shortint of
      0..2: x337abyte[x174shortint] := 1;
      5..6: x337abyte[x174shortint] := 1;
      3: begin
        {@0D16-0D1F}
        PR175_byte(v4p)^.v := 1;
        {@0D1F-0D28}
        x340byte := 1;
        {@0D28-0D3F}
        pO0E2_13E5(v4p, 8, 0, 255, 0);
      end;
      4: begin
        {@0D46-0D4F}
        x341byte := 1;
        {@0D4F-0D66}
        pO0E2_13E5(v4p, 105, 0, 255, 0);
      end;
      8: begin
        {@0D6D-0D76}
        x337byte := 1;
        {@0D76-0D7F}
        x339byte := 1;
        {@0D7F-0D89}
        x370l := 750000;
      end;
      9: begin
        {@0D97-0DA0}
        x337byte := 1;
        {@0DA0-0DA9}
        x339byte := 1;
        {@0DA9-0DB2}
        x342byte := 1;
        {@0DB2-0DBC}
        x370l := 500000;
      end;
      10: begin
        {@0DCA-0DD3}
        x337byte := 1;
        {@0DD3-0DDC}
        x341byte := 1;
        {@0DDC-0DF3}
        pO0E2_13E5(v4p, 105, 0, 255, 0);
        {@0DF3-0DFD}
        x370l := 750000;
      end;
      11: begin
        {@0E0B-0E14}
        x337byte := 1;
        {@0E14-0E1D}
        x342byte := 1;
        {@0E1D-0E27}
        x370l := 750000;
      end;
      12: begin
        {@0E35-0E3E}
        x337byte := 1;
        {@0E3E-0E47}
        x343byte := 1;
        {@0E47-0E51}
        x370l := 750000;
      end;
      13: begin
        {@0E5F-0E68}
        x339byte := 1;
        {@0E68-0E71}
        x342byte := 1;
        {@0E71-0E7B}
        x370l := 750000;
      end;
      14: begin
        {@0E89-0E92}
        x339byte := 1;
        {@0E92-0E9B}
        x343byte := 1;
        {@0E9B-0EA5}
        x370l := 750000;
      end;
      15: begin
        {@0EB2-0EBB}
        x339byte := 1;
        {@0EBB-0EC4}
        x342byte := 1;
        {@0EC4-0ECD}
        x343byte := 1;
        {@0ECD-0ED7}
        x370l := 500000;
      end;
      16: begin
        {@0EE4-0EED}
        x342byte := 1;
        {@0EED-0EF6}
        x343byte := 1;
        {@0EF6-0F00}
        x370l := 750000;
      end;
    end;
    {@0F07-0F1D}
    if x343byte > 0 then
      pO102_0970(v4p);
    {@0F1D-0F26}
    x379byte := 0;
    {@0F26-0F2F}
    x172byte := 0;
    for v25b := 0 to 6 do
    begin
      {@0F38-0FB3}
      if x337abyte[v25sb] > 0 then
      begin
        {@0F49-0FA1}
        if a6D18_9aee[v25sb, x337abyte[v25sb]] > x172byte then
          x172byte := a6D18_9aee[v25sb, x337abyte[v25sb]];
        {@0FA1-0FB3}
        Inc(x379byte, a6DB2_ec3f[v25sb]);
      end;
    end;
  end;
  {@0FBC-0FC7}
  pO102_0738(v4p);
  {@0FC7-0FDE}
  v27b := a70F5_7b1e[PR174_shortint(v4p)^.v].f;
  {@0FDE-0FEF}
  pO108_22B0(v27b + 1, @v12b);
  {@0FEF-0FF7}
  PR41_byte(v12p)^.v := 1;
  {@0FF7-100A}
  PR0_string_40_(v12p)^.v := s1A95;
  for v19b := 1 to v27b do
  begin
    {@101F-1036}
    v16p := Pointer(pO108_0000(v19b, v12p));
    {@1036-1084}
    PR0_string_40_(v16p)^.v := '  ' + a107C_6df8[a70F5_3b44[PR174_shortint(v4p)^.v, v19b]];
  end;
  {@108C-1098}
  v16p := v12p;
  {@1098-109D}
  v18w := 1;
  {@109D-10A1}
  v33b := 1;
  {@10A1-10A5}
  v34b := 1;
  {@10A5-112C}
  repeat
    {@10A5-10F3}
    v22b := pO108_1D45('', 'Select', 1, 2, 38, 22, v12p, v33b, 0, @v34b, @v18b, @v16b);
    if (bAAE6 <> 0) and (v22b = 27) or (bAAE6 = 0) and (v22b > 0) then
    begin
      {@110D-1117}
      pO108_2363(@v12b);
      {@1117-1120}
      pO075_0015(@v4b);
      {@1120-1123}
      Exit;
    end;
  until v22b = 0;
  asm
  db 139,78,238,196,126,252,38,138,133,174,0,152,186,10,0,247,226,139,248,3,249,138,133,245,112,196,126,252
  db 38,136,133,103,1,141,126,244,22,87
  call pO108_2363
  db 196,126,252,38,128,189,174,0,6,127,86,196,126,252,38,138,133,174,0,152,209,224,209,224,139,200,196,126
  db 252,38,138,133,173,0,152,186,28,0,247,226,139,248,3,249,129,199,171,111,137,126,165,140,94,167,196,126
  db 165,38,138,69,2,80,196,126,165,38,138,69,3,80
  call pO0E2_1374
  db 48,228,196,126,165,38,3,5,5,10,0,196,126,252,38,137,133,176,0,233,38,1,196,126,252,137,126,165
  db 140,70,167,196,126,165,38,138,133,174,0,60,8,116,12,60,9,116,8,60,11,116,4,60,10,117,83,196
  db 126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,173,111,48,228,139,200,196,126,165,38,138
  db 133,173,0,152,186,28,0,247,226,139,248,138,133,174,111,48,228,247,225,139,200,196,126,165,38,138,133,173
  db 0,152,186,28,0,247,226,139,248,139,133,171,111,3,193,196,126,165,38,137,133,176,0,233,178,0,60,13
  db 116,8,60,15,116,4,60,16,117,82,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133
  db 193,111,48,228,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,194,111,48,228
  db 247,225,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,139,133,191,111,3,193,196,126
  db 165,38,137,133,176,0,235,84,60,14,117,80,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248
  db 138,133,181,111,48,228,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,138,133,182,111
  db 48,228,247,225,139,200,196,126,165,38,138,133,173,0,152,186,28,0,247,226,139,248,139,133,179,111,3,193
  db 196,126,165,38,137,133,176,0
  end;
  {@12DE-12EB}
  v8p := p9CEE;
  {@12EB-12F8}
  p9CEE := v4p;
  {@12F8-12FD}
  pO0AA_0041;
  {@12FD-20A1}
  repeat
    {@12FD-132E}
    for v25b := 0 to 6 do
    begin
      {@1306-1328}
      if PRA337_byte(p9CEE)^.a[v25sb] > 0 then
        PRA337_byte(p9CEE)^.a[v25sb] := 1;
    end;
    {@132E-1336}
    PR28_byte(v4p)^.v := 0;
    for v26b := 0 to 5 do
    begin
      {@133F-134F}
      PRA17_byte(v4p)^.a[v26sb * 2] := 0;
      for v20b := 1 to 6 do
      begin
        {@1358-1369}
        v21b := pO0E2_1374(3, 6) + 1;
        case v23b of
          2: case v26b of
              4: Inc(v21b);
              5: Dec(v21b);
            end;
          0: case v26b of
              3: Inc(v21b);
              4: Dec(v21b);
            end;
          4: case v26b of
              0: Dec(v21b);
              3: Inc(v21b);
            end;
        end;
        {@13B5-13DB}
        if PRA17_byte(v4p)^.a[v26sb * 2] < v21b then
          PRA17_byte(v4p)^.a[v26sb * 2] := v21b;
      end;
      {@13E4-1DB0}
      with PWX(v4p)^ do
      begin
        case v26b of
          0: begin
            {@13F7-1436}
            if (x17r2_0[v26sb].f > 0) and (a7053_9461[x173shortint].f < x176word) then
              Inc(x17r2_0[v26sb].f);
            {@1436-1475}
            if (x17r2_0[v26sb].f > 0) and (a7055_9461[x173shortint].f < x176word) then
              Dec(x17r2_0[v26sb].f);
            {@1475-14B5}
            if (x17r2_0[v26sb].f > 0) and (a7057_9461[x173shortint].f < x176word) then
              Dec(x17r2_0[v26sb].f, 2);
            {@14B5-14F4}
            if (x17r2_0[v26sb].f > 0) and (a7059_9461[x173shortint].f < x176word) then
              Dec(x17r2_0[v26sb].f);
            {@14F4-1556}
            if x17r2_0[v26sb].f < a6EF7_9d21[x173shortint, x358shortint] then
              x17r2_0[v26sb].f := a6EF7_9d21[x173shortint, x358shortint];
            {@1556-15B8}
            if x17r2_0[v26sb].f > a6EF9_9d21[x173shortint, x358shortint] then
              x17r2_0[v26sb].f := a6EF9_9d21[x173shortint, x358shortint];
            {@15B8-1618}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
            {@1618-16A7}
            if (x17byte = 18) and ((x339byte > 0) or (x341byte > 0) or (x340byte > 0)) then
            begin
              {@1646-1657}
              x28byte := Random(100) + 1;
              if a6EFB_9d21[x173shortint, x358shortint] < x28byte then
                x28byte := a6EFB_9d21[x173shortint, x358shortint];
            end;
          end;
          1: begin
            {@16B1-16DE}
            if a7055_9461[x173shortint].f < x176word then
              Inc(x17r2_0[v26sb].f);
            {@16DE-170B}
            if a7059_9461[x173shortint].f < x176word then
              Inc(x17r2_0[v26sb].f);
            {@170B-1753}
            if x17r2_0[v26sb].f < a6EFD_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6EFD_3981[x173shortint].f;
            {@1753-179B}
            if x17r2_0[v26sb].f > a6EFE_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6EFE_3981[x173shortint].f;
            {@179B-17FB}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
          end;
          2: begin
            {@1805-1832}
            if a7053_9461[x173shortint].f >= x176word then
              Dec(x17r2_0[v26sb].f);
            {@1832-185F}
            if a7055_9461[x173shortint].f < x176word then
              Inc(x17r2_0[v26sb].f);
            {@185F-188C}
            if a7057_9461[x173shortint].f < x176word then
              Inc(x17r2_0[v26sb].f);
            {@188C-18B9}
            if a7059_9461[x173shortint].f < x176word then
              Inc(x17r2_0[v26sb].f);
            {@18B9-1901}
            if x17r2_0[v26sb].f < a6EFF_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6EFF_3981[x173shortint].f;
            {@1901-1949}
            if x17r2_0[v26sb].f > a6F00_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F00_3981[x173shortint].f;
            {@1949-19A9}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
            {@19A9-19E0}
            if (x17r2_0[v26sb].f < 13) and (x174byte in [8..12]) then
              x17r2_0[v26sb].f := 13;
          end;
          3: begin
            {@19EA-1A18}
            if a7057_9461[x173shortint].f < x176word then
              Dec(x17r2_0[v26sb].f, 2);
            {@1A18-1A45}
            if a7059_9461[x173shortint].f < x176word then
              Dec(x17r2_0[v26sb].f);
            {@1A45-1A8D}
            if x17r2_0[v26sb].f < a6F01_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F01_3981[x173shortint].f;
            {@1A8D-1AD5}
            if x17r2_0[v26sb].f > a6F02_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F02_3981[x173shortint].f;
            {@1AD5-1B35}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
          end;
          4: begin
            {@1B3F-1B6C}
            if a7055_9461[x173shortint].f < x176word then
              Dec(x17r2_0[v26sb].f);
            {@1B6C-1B99}
            if a7057_9461[x173shortint].f < x176word then
              Dec(x17r2_0[v26sb].f);
            {@1B99-1BC6}
            if a7059_9461[x173shortint].f < x176word then
              Dec(x17r2_0[v26sb].f);
            {@1BC6-1C0E}
            if x17r2_0[v26sb].f < a6F03_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F03_3981[x173shortint].f;
            {@1C0E-1C56}
            if x17r2_0[v26sb].f > a6F04_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F04_3981[x173shortint].f;
            {@1C56-1CB6}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
          end;
          5: begin
            {@1CC0-1D08}
            if x17r2_0[v26sb].f < a6F05_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F05_3981[x173shortint].f;
            {@1D08-1D50}
            if x17r2_0[v26sb].f > a6F06_3981[x173shortint].f then
              x17r2_0[v26sb].f := a6F06_3981[x173shortint].f;
            {@1D50-1DB0}
            if x17r2_0[v26sb].f < a708F_c768[x174shortint, v26sb] then
              x17r2_0[v26sb].f := a708F_c768[x174shortint, v26sb];
          end;
        end;
      end;
      {@1DB0-1DCE}
      PRA16_byte(v4p)^.a[v26sb * 2] := PRA17_byte(v4p)^.a[v26sb * 2];
      if v26b = 0 then
        PR29_byte(v4p)^.v := PR28_byte(v4p)^.v;
      {@1DE2-1DEE}
      pO0AA_0AE5(v26b, 0);
    end;
    {@1DF7-1ED2}
    with PWX(v4p)^ do
    begin
      x508byte := x178byte;
      x360byte := 2;
      x362byte := 1;
      x364byte := 2;
      x311byte := 12;
      v32b := 0;
      v31b := 0;
      XR670_046E(@x381byte, 27);
      for v25b := 0 to 6 do
      begin
        {@1E57-1ECC}
        if x337abyte[v25sb] > 0 then
        begin
          {@1E68-1EC9}
          if v25b = 0 then
            asm
  db 196,126,165,38,198,133,125,1,2,255,118,254,255,118,252
  call pO102_0594
  db 198,70,237,1,235,3,254,70,237,138,70,237,48,228,139,248,177,4,211,231,129,199,26,101,137,126,161,140
  db 94,163,196,126,161,38,128,61,0,117,26,196,126,161,38,128,125,1,1,117,16,138,70,237,48,228,196,126
  db 165,3,248,38,198,133,178,0,1,128,126,237,126,117,191
            end;
          {@1EC9-1ECC}
          Inc(v31b);
        end;
      end;
      {@1ED2-1EDC}
      x331word := 200;
      {@1EDC-1EE5}
      x178byte := 0;
      {@1EE5-1EEE}
      x380byte := 0;
      {@1EEE-1EF7}
      x508byte := 0;
    end;
    {@1EF7-1F0C}
    pO0AA_36BA(v4p, 255, v31b, 1);
    {@1F0C-1F17}
    v78b := PR47_byte(p87F8)^.v;
    {@1F17-1F20}
    PR47_byte(p87F8)^.v := 255;
    {@1F20-1F25}
    bAE84 := 0;
    {@1F25-1F2A}
    bAE87 := 1;
    {@1F2A-1F35}
    repeat
      {@1F2A-1F2E}
      pO075_4638;
    until bAE84 <> 0;
    {@1F35-1F40}
    PR47_byte(p87F8)^.v := v78b;
    {@1F40-1F45}
    bAE87 := 0;
    {@1F45-1F49}
    v36b := 0;
    {@1F49-1F4D}
    v77b := 0;
    for v25b := 0 to 6 do
    begin
      {@1F56-2029}
if (PRA337_byte(p9CEE)^.a[v25sb] > 0) or (PRA344_byte(p9CEE)^.a[v25sb] < Byte(pO102_0BA1(p9CEE)))
          and (PRA344_byte(p9CEE)^.a[v25sb] > 0) then
      begin
        {@1FA2-1FD0}
        if v36b <> 0 then
          v77a := v77a + '/';
        {@1FD0-2025}
        v77a := v77a + pR47F_0FB2(PRA337_byte(p9CEE)^.a[v25sb] + PRA344_byte(p9CEE)^.a[v25sb]);
        {@2025-2029}
        v36b := 1;
      end;
    end;
    {@2032-205A}
    v77a := v77a + ' ';
    {@205A-2070}
    pR47F_0354(7, 7, 15, 0, v77a);
    {@2070-2075}
    pO0AA_0791;
    {@2075-207A}
    pO0AA_063D;
    {@207A-2095}
    v22b := pO108_2254('Reroll stats? ', b5362);
  until v22b = b5363;
  {@20A1-20A6}
  pO0AA_0041;
  {@20A6-20F4}
  repeat
    {@20A6-20E0}
    repeat
      {@20A6-20D7}
      PR0_string_15_(v4p)^.v := pR47F_0711('Character name: ', 13, 0, 15);
    until PR0_byte(v4p)^.v <> 0;
  until not (PR1_byte(v4p)^.v in [49..57]);
  {@20F4-20F8}
  pO075_38C5;
  {@20F8-20FC}
  pO075_3D36;
  for v26b := 0 to 5 do
    PRA16_byte(v4p)^.a[v26sb * 2] := PRA17_byte(v4p)^.a[v26sb * 2];
  {@2129-2137}
  PR29_byte(v4p)^.v := PR28_byte(v4p)^.v;
  {@2137-2140}
  PR420_byte(v4p)^.v := 2;
  {@2140-2149}
  PR421_byte(v4p)^.v := 2;
  {@2149-2179}
  v22b := pO108_2254('Save ' + PR0_string(v4p)^.v + '? ', b5362);
  if v22b = b5363 then
  begin
    {@2182-2191}
    FreeMem(v4p, 510);
    {@2191-219E}
    p9CEE := v8p;
    {@219E-21A0}
    Exit;
  end;
  {@21A0-21AA}
  pO075_21EE(v4p);
  {@21AA-21B4}
  pO075_5478(v4p);
  {@21B4-21CE}
  pO06E_0AD8(v4p, '');
  {@21CE-21DD}
  FreeMem(v4p, 510);
  {@21DD-21EA}
  p9CEE := v8p;
