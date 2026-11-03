var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  v10w: word;
  v12w: word;
  v14w: word;
  v15b: byte;
  b8834: byte absolute d8834;
  MB800_160: array[0..405, 0..159] of byte absolute $B800:0;
  MBA00_160: array[0..405, 0..159] of byte absolute $BA00:0;
  MBC00_160: array[0..405, 0..159] of byte absolute $BC00:0;
  MBE00_160: array[0..405, 0..159] of byte absolute $BE00:0;
{BODY}
  pR6DD_0051;
  case b8834 of
    0: begin
      pR47F_00B7(a0, a1, a2, a3, 0, a4);
      pR47F_00B7(a0, a1, a2, a3, 1, a4);
    end;
    2: begin
      v12w := a1 * 8 * $140 + a0 * 8;
      v14w := (a2 - a0 + 1) * 8;
      for v10w := a1 * 8 to (a3 + 1) * 8 - 1 do
      begin
        FillChar(pointer(v12w + $A0000000)^, v14w, a4);
        Inc(v12w, $140);
      end;
    end;
    1: begin
      v2w := a1 * 2;
      v4w := a3 * 2 + 1;
      v6w := a0 * 4;
      v8w := (a2 - a0 + 1) * 4;
      v15b := a4 + a4 shl 4;
      for v10w := v2w to v4w do
      begin
        FillChar(MB800_160[v10w, v6w], v8w, v15b);
        FillChar(MBA00_160[v10w, v6w], v8w, v15b);
        FillChar(MBC00_160[v10w, v6w], v8w, v15b);
        FillChar(MBE00_160[v10w, v6w], v8w, v15b);
      end;
    end;
  end;
  pR6DD_0030;
