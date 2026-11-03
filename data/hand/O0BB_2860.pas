type
  E4_2860 = record f: byte; _r: array[1..3] of byte end;
  R2860 = record
    l: longint; next: pointer;
    f1: array[1..9] of byte;
    f2: array[1..9] of boolean;
    sx, sy, c: shortint; d, t: byte;
  end;
  M2860 = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
var
  x, y: integer;
  p: ^R2860;
  b9, bA, bB, j, i, bE: byte;
  arr: array[1..9] of byte;
  sa3EAC: array[0..8] of shortint absolute d3EAC;
  sa3EB5: array[0..4] of shortint absolute d3EB5;
  hAE5D: pointer absolute dAE5D;
  hA6E0: ^M2860 absolute dA6E0;
  h3EBA: array[0..8189] of E4_2860 absolute d3EBA;
  hA583: array[0..8189] of pointer absolute dA583;
  h9CEE: longint absolute d9CEE;
  h7D5: byte absolute dA7D5;
  h5B: shortint absolute dAE5B;
  h5C: shortint absolute dAE5C;
  h53E5: array[0..4404] of byte absolute d53E5;
{BODY}
  XR670_046E(@arr, 9);
  GetMem(p, $1F);
  XR670_046E(@p^, $1F);
  with p^ do
  begin
    sx := h5B;
    sy := h5C;
    l := h9CEE;
    d := pO0EC_2D90(h7D5, 1);
    c := d;
    case h7D5 of
      $22: begin bA := 4; t := $1D; end;
      $5B: begin bA := 9; t := $1C; end;
      $65: begin bA := 4; t := $1B; c := c * 3; end;
    end;
    for i := 1 to bA do
    begin
      b9 := h53E5[i];
      x := sx + sa3EAC[b9];
      y := sy + sa3EB5[b9];
      if (x >= 0) and (x <= 49) and (y >= 0) and (y <= 24) then
      begin
        pO135_060F(x, y, @bE, @bB);
        for j := 1 to i - 1 do
          if arr[j] = bE then bE := 0;
        arr[i] := bE;
        bB := pO135_14A9(x, y);
        f2[i] := (bB > 0) and (h3EBA[bB].f < $FF);
        f1[i] := bB;
        if f2[i] then
          hA6E0^.a[y, x] := t;
      end
      else
        f2[i] := false;
    end;
  end;
  p^.next := hAE5D;
  hAE5D := p;
  pO135_0A4D(h5B, h5C, $FF, 8);
  for i := 1 to bA do
    if arr[i] > 0 then
      pO0E2_0CAF(hA583[arr[i]], 1, 0);
