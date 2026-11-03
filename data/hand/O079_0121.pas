type
  TSnd = record size: word; p: pointer end;
var
  i: byte;
  snd: array[1..11] of TSnd absolute dFB20;
{BODY}
  XR670_046E(@snd, 66);
  for i := 1 to 11 do
    with snd[i] do
    begin
      pR5C3_0915('zounds', '.dax', i, @size, @p);
      if size = 0 then
      begin
        pR47F_0B2E(15, 0, 'unable to load sound');
        pR670_0000(0);
      end;
    end;
