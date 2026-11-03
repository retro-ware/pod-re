type
  R652D = record _p: array[0..$B1] of byte; f: byte end;
  PR652D = ^R652D;
  PPR652D = ^PR652D;
  PL652D = ^longint;
  RC652D = record _p: array[0..2] of byte; c: byte end;
  PRC652D = ^RC652D;
var
  bA7DC: byte absolute dA7DC;
  bAD3A: byte absolute dAD3A;
  bA7D2: byte absolute dA7D2;
  bAE5B: byte absolute dAE5B;
  bAE5C: byte absolute dAE5C;
  lAD3B: longint absolute dAD3B;
  aAD37_9f8b: array[0..8189] of pointer absolute dAD37;
  gAB3E_dd92: procedure(p0: byte; p1: byte; var p2) absolute dAB3E;
  b1, b2: shortint;
  w4: word;
  b5, b6, b7: byte;
  l: pointer;
  i: byte;
  pad: array[1..30] of byte;
  b2B: byte;
  hAE8D: byte absolute dAE8D;
{BODY}
  bA7DC := 1;
  if hAE8D = 0 then
    PRC652D(a1)^.c := 3;
  if PRC652D(a1)^.c > 0 then
  begin
    b1 := pO135_0CA2(PL652D(a0)^);
    b2 := pO135_0CCA(PL652D(a0)^);
    gAB3E_dd92($3D, 1, b5);
    if b5 <> 0 then
    begin
      pO0BB_1736(b1, b2, bAE5B, bAE5C, $FF, 3);
      if bAD3A > 0 then
      begin
        bA7D2 := $20;
        pO0EC_1B08(PPR652D(a0)^, 'breathes poison', 10, 1);
        b2B := pO135_17F9(PL652D(a0)^, lAD3B);
        pO0EC_0C95(PPR652D(a0)^);
        pO135_0BAF(PPR652D(a0)^, b2B, 1, 0);
        pR1C3_2120($11);
        pO0EC_1F07(pO135_0CA2(PL652D(a0)^), pO135_0CCA(PL652D(a0)^), pO135_0CA2(lAD3B), pO135_0CCA(lAD3B), 1, $1E);
        for i := 1 to bAD3A do
          if aAD37_9f8b[i] <> nil then
          begin
            l := aAD37_9f8b[i];
            b6 := pO0E2_12C9(l, 3, 0);
            pO0E2_1D19(l, PPR652D(a0)^^.f, 2, b6);
          end;
        dec(PRC652D(a1)^.c);
        b7 := pO0EC_2CF6(PPR652D(a0)^);
      end;
    end;
  end;
  bA7DC := 0;
