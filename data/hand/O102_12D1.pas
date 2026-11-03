type
  TRow = record _p: array[0..17] of byte; v: array[0..11] of longint; _q: array[1..235] of byte end;
var
  tab: array[0..0] of TRow absolute d719C;
  step: array[-26..0] of longint absolute d6E73;
{BODY}
  pO102_12D1 := $7FFFFFFF;
  if a1 < 41 then
    if a1 < 12 then
      pO102_12D1 := tab[a2].v[a1]
    else
      pO102_12D1 := tab[a2].v[11] + (a1 - 11) * step[a2];
