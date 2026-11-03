type
  R5C8B = record _p: array[0..$B1] of byte; f: byte end;
  P5C8B = ^R5C8B;
var
  bA7DC: byte absolute dA7DC;
  bAD3A: byte absolute dAD3A;
  bA7D5: byte absolute dA7D5;
  aAD37_b676: array[0..8189] of longint absolute dAD37;
  pad: longint;
  p: longint;
  n, i, s: byte;
{BODY}
  bA7DC := 1;
  i := 1;
  s := 0;
  while (i <= bAD3A) and (s <= 100) do
  begin
    p := aAD37_b676[i];
    if (P5C8B(p)^.f <= 100) and (P5C8B(p)^.f + s <= 100) then
      inc(s, P5C8B(p)^.f);
    inc(i);
  end;
  n := pO0E2_1374(1, 4) + 1;
  if s < 51 then
    n := n * 10;
  i := 1;
  s := 0;
  while (i <= bAD3A) and (s <= 100) do
  begin
    p := aAD37_b676[i];
    if (P5C8B(p)^.f <= 100) and (P5C8B(p)^.f + s <= 100) then
    begin
      inc(s, P5C8B(p)^.f);
      pO0E2_2039(p, $21, pO0BB_0E1D(bA7D5), 0, 0, 0, 0, 'is blinded');
    end;
    inc(i);
  end;
