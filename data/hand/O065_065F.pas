type
  TMap = record _p: array[0..6] of byte; v: array[1..$4E2] of byte end;
var
  v1b: byte;
  v2sb: shortint;
  _f1: array[1..2] of byte;
  v2b: byte absolute v2sb;
  v1sb: shortint absolute v1b;
  pMap: ^TMap absolute dA6E0;
  y: shortint absolute d8217;
  x: shortint absolute d8216;
  ox: shortint absolute dA9F3;
  oy: shortint absolute dA9F4;
{BODY}
  FillChar(pMap^.v, $4E2, $16);
  for y := -2 to 2 do
    for x := -6 to 6 do begin
      v1sb := ox + x;
      v2sb := oy + y;
      d8219 := pO065_010F(v1b, v2sb, 6);
      d8218 := pO065_010F(v1b, v2sb, 0);
      d821A := pO065_010F(v1b, v2sb, 2);
      d821B := pO065_010F(v1b, v2sb, 4);
      pO065_0183;
      pO065_0228;
      pO065_02A5;
      pO065_047B;
    end;
