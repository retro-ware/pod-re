var
  vRnd: byte;
  vRad: real;
  vAng: real;
  vRings: byte;
  vRing: byte;
  vStep: byte;
  vOne: byte;
  vX0: shortint;
  vY0: shortint;
  vX: shortint;
  vY: shortint;
  vDy: shortint;
  vDx: shortint;
  p8836: longint absolute d8836;
  pAEE0: pointer absolute dAEE0;
{BODY}
begin
  pO135_0A4D(dAE5B, dAE5C, 255, 8);
  vX0 := dAE5B;
  vY0 := dAE5C;
  pR5A0_0000(a2);
  pO0EC_1CBC(a1, 0, 0, 0);
  pO0EC_1CBC(a1, 0, 1, 1);
  pO0EC_1CBC(a1, 1, 2, 0);
  pO0EC_1CBC(a1, 1, 3, 1);
  vOne := 1;
  vDx := 0;
  vDy := 0;
  if vX0 < 3 then
    vDx := (vX0 - 3) * 3
  else if vX0 > 46 then
    vDx := (vX0 - 49 + 3) * 3;
  if vY0 < 3 then
    vDy := (vY0 - 3) * 3
  else if vY0 > 21 then
    vDy := (vY0 - 24 + 3) * 3;
  vRings := a0 * 3 + 1;
  for vRing := 1 to vRings do
  begin
    vRad := vRing;
    for vStep := vRing * 2 - 2 downto 0 do
    begin
      vAng := Random * 2.0 * Pi;
      vX := vDx + Trunc(Cos(vAng) * vRad);
      vY := vDy + Trunc(Sin(vAng) * vRad);
      if (vX >= -9) and (vX <= 9) and (vY >= -9) and (vY <= 9) then
      begin
        vRnd := Random(4);
        pR1C3_08C0(vX + 9, vY + 9, vRnd, vOne, pAEE0, p8836);
      end;
    end;
    pR1C3_10FD;
  end;
  pO135_0A4D(dAE5B, dAE5C, 255, 8);
end;
