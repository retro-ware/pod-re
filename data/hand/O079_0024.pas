type
  X17H = array[0..16] of byte;
  S17H = array[1..255] of X17H;
  B4318 = array[1..4318] of byte;
  BBuf = array[0..32000] of byte;
var
  v2w: word;
  v4w: word;
  v5b: byte;
  v9p: pointer;
  s: X17H;
  v9b: byte absolute v9p;
  v2b: byte absolute v2w;
  q9CFF: pointer absolute d9CFF;
{BODY}
  FillChar(B4318(q9CFF^), 4318, 255);
  pR5C3_0915('ITEM0', '.dax', 1, @v2b, @v9b);
  if v2w = 0 then
  begin
    pR47F_0B2E(15, 0, 'Unable to find item file');
    pR670_0000(0);
  end;
  v4w := 0;
  v5b := 1;
  repeat
    Move(BBuf(v9p^)[v4w], s, 17);
    S17H(q9CFF^)[v5b] := s;
    Inc(v5b);
    Inc(v4w, 17);
  until (v4w >= v2w) or (v5b > 254);
  pR5C0_0000(v9p, v2w);
