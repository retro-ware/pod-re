type
  TPunct = set of ' '..'?';
var
  v257b: byte;
  v258b: byte;
  v259b: byte;
  v260b: byte;
  v261b: byte;  { unused }
  pset: TPunct absolute d0E04;
{BODY}
  pR6DD_0051;
  if (a0 > 39) or (a1 > 24) or (a2 > 39) or (a3 > 39) then
    Exit;
  if (b9D92 < a0) or (b9D92 > a2) or (b9D93 < a1) or (b9D93 > a3) then
  begin
    b9D92 := a0;
    b9D93 := a1;
  end;
  if a6 <> 0 then
  begin
    pR47F_0F07(a0, a1, a2, a3);
    b9D92 := a0;
    b9D93 := a1;
  end;
  v259b := 1;
  v257b := Length(a7);
  if v257b = 0 then
  begin
    pR6DD_0030;
    Exit;
  end;
  v258b := a2 - a0 + 1;
  repeat
    v260b := v259b;
    while (v260b < v257b) and (a7[v260b] in pset) do
      Inc(v260b);
    while (v260b < v257b) and not (a7[v260b] in pset) and (a7[v260b] <> ' ') do
      Inc(v260b);
    if a7[v260b] <> ' ' then
      while (v260b + 1 < v257b) and (a7[v260b + 1] in pset) do
        Inc(v260b);
    if (v260b - v259b + b9D92) > a2 then
    begin
      if ((v260b - v259b + b9D92) = a2) and (Ord(a7[v260b]) = 32) then
      begin
        Dec(v260b);
        pR47F_03E3;
      end;
      b9D92 := a0;
      Inc(b9D93);
      pR47F_045E;
      if (b9D93 > a3) and (v259b < v257b) then
      begin
        b9D92 := a0;
        b9D93 := a1;
        pR47F_0F25;
        pR670_0311;
        pR47F_0F07(a0, a1, a2, a3);
        pR47F_03E3;
      end;
    end
    else
      pR47F_03E3;
  until v259b > v257b;
  if b9D92 > a2 then
  begin
    b9D92 := a0;
    Inc(b9D93);
  end;
  pR6DD_0030;
