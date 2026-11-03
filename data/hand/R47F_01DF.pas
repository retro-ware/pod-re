type
  TB = array[0..65520] of byte;
var
  v1b: byte;
  v2b: byte;
  _pad: array[1..14] of byte;
  p9D86: ^TB absolute d9D86;
  b8834: byte absolute d8834;
{BODY}
  if (a0 > 39) or (a1 > 24) or (p9D86 = nil) then Exit;
  if a6 <> 0 then
    v2b := Ord(UpCase(Chr(a5))) mod 64
  else
    v2b := a5;
  Move(p9D86^[v2b * 8], d9D8A, 8);
  case b8834 of
    0: for v1b := 1 to a4 do
       begin
         XR47F_1037(a0, a1, a2, a3, v2b);
         Inc(a0);
       end;
    1: for v1b := 1 to a4 do
       begin
         XR47F_1097(a0, a1, a2, a3, v2b);
         Inc(a0);
       end;
    2: for v1b := 1 to a4 do
       begin
         XR47F_11A6(a0, a1, a2, a3, v2b);
         Inc(a0);
       end;
  end;
