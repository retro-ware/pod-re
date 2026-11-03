var
  v4p: pointer;
  q9CF2: pointer absolute d9CF2;
{BODY}
  pO0EC_2ED1;
  v4p := q9CF2;
  pO0EC_3497('Heal whom? ', 1, 0, @v4p);
  if v4p = nil then
  begin
    pO0AA_0041;
    exit;
  end;
  if pO0E2_212C(v4p, pO102_1276(pointer(a0), 3) * 2, 0) <> 0 then
  begin
    pO0EC_0987(v4p, 1);
    pO0EC_1AAC(string(v4p^) + ' feels better');
  end
  else
    pO0EC_1AAC(string(v4p^) + ' is unaffected');
  pO0E2_13E5(pointer(a0), 109, 1440, 0, 0);
  pO0AA_0041;
