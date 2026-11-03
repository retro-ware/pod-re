type
  PP = ^pointer;
var
  sz: word;
  p: pointer;
{BODY}
  if PP(a4)^ <> nil then
    pR1C3_1A83(@PP(a4)^);
  pR5C3_0915(a0, '.dax', a1, @sz, @p);
  if sz = 0 then
    Exit;
  pR1C3_00B9(@p, a2, a3, byte(b8834 <> 2), sz, @PP(a4)^);
  if b8834 <> 2 then
    pR5C0_0000(p, sz);
  pR670_0311;
