type
  RXB0 = record v: byte end;
var
  q880C: byte absolute d880C;
  a53CD: array[0..255] of string[34] absolute d53CD;
{BODY}
  if q880C = 5 then
  begin
    pO0EC_1B08(a0, 'Casts a Spell', 10, 1);
    pR142_0217(0, 23, 39, 23);
    pR47F_0354(0, 23, 10, 0, 'Spell:' + a53CD[a2]);
  end
  else
  begin
    pR142_0217(1, 18, 38, 22);
    pO0EC_1C22(a0, 1, 19, 0);
    pR47F_0354(RXB0(a0^).v + 2, 19, 10, 0, a1);
    pR47F_0354(1, 20, 10, 0, a53CD[a2]);
    pR47F_0D1A;
    pO0EC_1BEF;
  end;
