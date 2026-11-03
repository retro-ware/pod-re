type
  RX21 = record _p: array[1..$21] of byte; v: byte end;
  RXB2 = record _p: array[1..$B2] of byte; v: byte end;
  RX131 = record _p: array[1..$131] of byte; v: byte end;
  RX1E3 = record _p: array[1..$1E3] of byte; v: pointer end;
  RX1ED = record _p: array[1..$1ED] of byte; v: byte end;
  RX1EF = record _p: array[1..$1EF] of byte; v: byte end;
  R4 = record x, y, z, c: byte end;
var
  v1: shortint;
  v2: shortint;
  vx: shortint;
  vy: shortint;
  vk: shortint;
  p2: pointer;
  p1: pointer;
  vDone: boolean;
  vRes: byte;
  vCnt: byte;
  v11: byte;
  v12: byte;
  vTile: byte;
  vIdx: byte;
  a3EAC: array[0..8] of shortint absolute d3EAC;
  a3EB5: array[0..4] of shortint absolute d3EB5;
  a9EF1: array[0..71] of R4 absolute d9EF1;
{BODY}
  p1 := p9CF2;
  p2 := p9CF2;
  vDone := false;
  vk := 0;
  vCnt := 0;
  if RX21(p87F8^).v <> 0 then
    vTile := $17
  else
    vTile := $45;
  while (p1 <> nil) and (RX1ED(p1^).v <> 9) do
    p1 := RX1E3(p1^).v;
  repeat
    if vk > 7 then
    begin
      if (p2 = nil) or (RX1E3(p2^).v = nil) or (RX1ED(p2^).v = 9) then
      begin
        p2 := p9CEE;
        vDone := true;
      end
      else
        p2 := RX1E3(p2^).v;
      vk := 0;
    end;
    if (p1 = nil) or (vCnt = 2) then
      vDone := true
    else
    begin
      RX1EF(p1^).v := RX1EF(p9CEE^).v;
      v1 := pO135_0CA2(longint(p2));
      v2 := pO135_0CCA(longint(p2));
      vRes := 0;
      repeat
        vx := v1 + a3EAC[vk];
        vy := v2 + a3EB5[vk];
        if (vx <= $31) and (vx >= 0) and (vy <= $18) and (vy >= 0) then
        begin
          pO135_060F(vx, vy, @v12, @v11);
          if (v12 = 0) and (v11 = vTile) then
          begin
            vIdx := pO135_0D1A(longint(p1));
            a9EF1[vIdx].c := RX131(p1^).v and 7;
            a9EF1[vIdx].x := vx;
            a9EF1[vIdx].y := vy;
            vRes := pO0E2_21FC(p1, RXB2(p1^).v, 'gates in');
            if vRes <> 0 then
            begin
              Inc(vCnt);
              p1 := RX1E3(p1^).v;
              if (p1 = nil) or (RX1ED(p1^).v <> 9) then
                vDone := true;
            end;
          end;
          Inc(vk);
        end;
      until (vRes <> 0) or (vk > 7);
    end;
  until vDone;
  if vCnt = 0 then
    pO0EC_1B08(p9CEE, 'summons is not answered', 10, 1);
