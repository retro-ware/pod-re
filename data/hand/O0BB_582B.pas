var
  v1b: byte;
  s4417: string absolute d4417;
{BODY}
  bA7DC := 1;
  for v1b := 1 to bAD3A do
    if (PR495_byte(aAD37_9f8b[v1b])^.v <> PR495_byte(p9CEE)^.v) or (b880C = 5)
        and (pO0EC_2A6F(pointer(aAD37_9f8b[v1b]), 1, 0) > 0) then
      aAD37_9f8b[v1b] := nil;
  pO0BB_0ED6(bA7D5, 0, 0, 0, 0, s4025 + s4417);
