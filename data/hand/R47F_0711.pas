var
  v42b: byte;
  v43b: byte;
  v299a: string;
  v300a: char;
  v300b: byte absolute v300a;
  v299a2: array[0..255] of byte absolute v299a;
  b880E: byte absolute d880E;
{BODY}
  pR47F_030B(0, 24, 0, 40);
  pR47F_0354(0, 24, a1, a2, a0);
  v42b := Length(a0);
  v299a := '';
  repeat
    pR47F_030B(v42b + 1, 24, 15, 1);
    v300a := ReadKey;
    if v300b = 0 then
    begin
      v300a := ReadKey;
      case v300b of
        71: v300b := 55;
        72: v300b := 56;
        73: v300b := 57;
        75: v300b := 52;
        32: v300b := 53;
        77: v300b := 54;
        79: v300b := 49;
        80: v300b := 50;
        81: v300b := 51;
        82: v300b := 48;
      else
        v300b := 0;
      end;
    end;
    v43b := Length(v299a);
    case v300b of
      32: if (v43b <> 0) and (v43b < a3) then
        begin
          v299a := v299a + ' ';
          Inc(v42b);
          pR47F_0354(v42b, 24, 15, 0, ' ');
        end;
      33..122: if v43b < a3 then
        begin
          v299a := v299a + v300a;
          Inc(v42b);
          pR47F_0354(v42b, 24, 15, 0, v300a);
        end;
      8: if v43b > 0 then
        begin
          v299a := Copy(v299a, 1, v43b - 1);
          pR47F_030B(v42b, 24, 0, 2);
          Dec(v42b);
        end;
    end;
  until (v300b = 13) or (v300b = 27) or (b880E <> 0);
  pR47F_030B(0, 24, 0, 40);
  v43b := Length(v299a);
  while v299a2[v43b] = 32 do
    Dec(v43b);
  v299a := Copy(v299a, 1, v43b);
  for v42b := 1 to v43b do
    v299a2[v42b] := Ord(UpCase(Chr(v299a2[v42b])));
  pR47F_0711 := v299a;
