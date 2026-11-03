type
  BX = array[0..$1F0] of byte;
var
  v1b: byte;
  v3w: word;
  v4b: byte;
  v3b: byte absolute v3w;
  q880C: byte absolute d880C;
  q9D93: byte absolute d9D93;
  qAE61: byte absolute dAE61;
  q9CEE: pointer absolute d9CEE;
  qAB3A: pointer absolute dAB3A;
  q6525: array[0..255] of record b: byte; _p: array[1..15] of byte end absolute d6525;
{BODY}
  v3w := 65535;
  qAE61 := 0;
  v1b := 0;
  if pO0BB_6C36(a0) <> 0 then
  begin
    qAB3A := a0;
    v1b := pO0AA_30F3(2, 1, @v3b, @v4b);
  end
  else
  begin
    if (BX(a0^)[61] > 0) and (BX(a0^)[62] < 128) then
    begin
      qAE61 := 1;
      v1b := BX(a0^)[61] and 127;
    end;
  end;
  if v1b = 0 then
    byte(a1^) := 0
  else
  begin
    if (q880C = 5) and (BX(q9CEE^)[$1F0] = 0) then
      pO0EC_324C;
    if qAE61 <> 0 then
    begin
      pO0EC_1B08(q9CEE, 'uses an item', 10, 0);
      if q880C = 5 then
      begin
        pR47F_0354(0, 23, 10, 0, 'Item:');
        pO0EC_0484(longint(q9CEE), a0, 5, 23, 0, 1);
      end
      else
        pO0EC_0484(longint(q9CEE), a0, 1, 22, 0, 1);
      pR47F_0D1A;
      pO0EC_1BEF;
    end;
    qAE61 := 1;
    if pO0BB_6C36(a0) <> 0 then
    begin
      if (pO102_1276(q9CEE, 5) > 0) or (pO102_1276(q9CEE, 0) > 0) then
        pO0BB_121C(v1b, BX(q9CEE^)[$1F0], 0, @byte(a1^))
      else if (pO102_1276(q9CEE, 6) > 9) and (pO0E2_1374(1, 100) <= 75) then
        pO0BB_121C(v1b, BX(q9CEE^)[$1F0], 0, @byte(a1^))
      else
        pO0EC_1B08(q9CEE, 'oops!', q9D93 + 1, 1);
    end
    else
      pO0BB_121C(v1b, BX(q9CEE^)[$1F0], 0, @byte(a1^));
    qAE61 := 0;
    if (q880C = 5) and (q6525[v1b].b <> 0) then
      byte(a1^) := pO0EC_2CF6(q9CEE);
  end;
  if byte(a1^) <> 0 then
  begin
    if pO0BB_6C36(a0) <> 0 then
    begin
      pO0BB_6C6B(q9CEE, a0, v1b);
      Exit;
    end;
    if BX(a0^)[60] > 0 then
    begin
      if BX(a0^)[57] > 1 then
      begin
        Dec(BX(a0^)[57]);
        Exit;
      end;
      Dec(BX(a0^)[60]);
      if BX(a0^)[60] = 0 then
        pO0EC_18EF(q9CEE, a0);
    end;
  end;
