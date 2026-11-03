type
  TPVX = procedure(a0: byte; a1: byte; var a2: byte);
  PPX = ^pointer;
  PLX = ^longint;
  RXK = record k: byte; _p: array[1..2] of byte; n: byte end;
  RXB2 = record _p: array[1..$B2] of byte; v: byte end;
  RX1EF = record _p: array[1..$1EF] of byte; v: byte end;
var
  v1b: byte;
  v2b: shortint;
  v3b: shortint;
  v4b: byte;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  vS: string[20];
  vW: word;
  v23b: byte;
  qA7DC: byte absolute dA7DC;
  qAE8D: byte absolute dAE8D;
  qA7D2: byte absolute dA7D2;
  qB16C: byte absolute dB16C;
  qAE5B: byte absolute dAE5B;
  qAE5C: byte absolute dAE5C;
  qAD3A: byte absolute dAD3A;
  aAD3B: array[1..255] of pointer absolute dAD3B;
  lAD3B: longint absolute dAD3B;
  gAB3E: TPVX absolute dAB3E;
{BODY}
  qA7DC := 1;
  if (qAE8D = 0) or (RXK(a1^).n > 3) then
    RXK(a1^).n := 3;
  if RXK(a1^).n > 0 then
  begin
    vW := RXB2(PPX(a0)^^).v;
    case RXK(a1^).k of
      $54, $53:
        begin
          qA7D2 := $21;
          v10b := 3;
          v11b := 9;
          vS := 'Fire';
          if RXK(a1^).k = $53 then
            vW := pO0E2_13BF(24, 10) + 12;
        end;
      $55:
        begin
          qA7D2 := $22;
          v10b := 3;
          v11b := 7;
          vS := 'cold';
        end;
      $60:
        begin
          qA7D2 := $20;
          v10b := 1;
          v11b := 6;
          vS := 'acid';
        end;
    end;
    v2b := pO135_0CA2(PLX(a0)^);
    v3b := pO135_0CCA(PLX(a0)^);
    gAB3E($17, 1, qB16C);
    if qB16C <> 0 then
    begin
      pO0BB_1736(v2b, v3b, qAE5B, qAE5C, v10b, v11b);
      for v4b := 1 to qAD3A do
        if RX1EF(aAD3B[v4b]^).v <> pO0EC_29F3(PPX(a0)^) then
          qB16C := 0;
      if qAD3A > 0 then
        if qB16C <> 0 then
        begin
          pO0EC_1B08(PPX(a0)^, 'breathes ' + vS, 10, 1);
          v23b := pO135_17F9(PLX(a0)^, lAD3B);
          pO0EC_0C95(PPX(a0)^);
          pO135_0BAF(PPX(a0)^, v23b, 1, 0);
          pR1C3_2120($11);
          pO0EC_1F07(pO135_0CA2(PLX(a0)^), pO135_0CCA(PLX(a0)^), pO135_0CA2(lAD3B), pO135_0CCA(lAD3B), 1, 30);
          for v4b := 1 to qAD3A do
            if aAD3B[v4b] <> nil then
            begin
              v8p := aAD3B[v4b];
              v9b := pO0E2_12C9(v8p, 3, 0);
              pO0E2_1D19(v8p, vW, 2, v9b);
            end;
          Dec(RXK(a1^).n);
          v1b := pO0EC_2CF6(PPX(a0)^);
        end;
    end;
  end;
  qA7DC := 0;
