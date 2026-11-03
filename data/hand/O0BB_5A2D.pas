type
  RX1A5 = record _p: array[1..$1A5] of byte; v: byte end;
  RX131 = record _p: array[1..$131] of byte; v: byte end;
  RX138 = record _p: array[1..$138] of byte; v: byte end;
var
  v4: longint;
  v8: pointer;
  v9: boolean;
  va: byte;
  vb: byte;
  vc: byte;
  vd: byte;
{BODY}
  bA7DC := 1;
  v9 := false;
  vc := 0;
  va := 1;
  vd := pO0EC_2D90(bA7D5, 0) * 2;
  while (va <= bAD3A) and not v9 do
  begin
    v8 := aAD37_9f8b[va];
    if v8 <> nil then
      if (RX1A5(v8^).v and 2 = 0) or (RX131(v8^).v > 1)
          or (PR495_byte(v8)^.v = PR495_byte(p9CEE)^.v) then
        pO0EC_1B08(v8, 'is unaffected', 10, 1)
      else
      begin
        vb := RX138(v8^).v;
        if vb + vc <= vd then
        begin
          Inc(vc, vb);
          v9 := vc = vd;
          pO0E2_2039(longint(v8), 11, pO0BB_0E1D(bA7D5),
            PR495_shortint(p9CEE)^.v * 128 + pO0EC_2D90(bA7D5, 1), 1, 1,
            pO0E2_12C9(v8, 4, -2), 'is charmed');
          if pO0EC_27C1(v8, 11, @v4) <> 0 then
            pO0E2_00BD(11, @v8, v4, 0);
        end;
      end;
    Inc(va);
  end;
