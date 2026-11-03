var
  v2w: word;
  v6p: pointer;
  p9D86: pointer absolute d9D86;
{BODY}
  pR5C3_0915('8X8d0', '.dax', 201, @v2w, @v6p);
  if v2w = 0 then Exit;
  Move(v6p^, p9D86^, v2w);
  pR5C0_0000(v6p, v2w);
