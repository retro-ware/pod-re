type
  RX33 = record _p: array[1..33] of byte; v: byte end;
  RX57 = record _p: array[1..57] of byte; v: byte end;
  RX4 = record _p: array[1..4] of byte; v4, v5, v6: byte end;
var
  vB: byte;
  qA9F8: byte absolute dA9F8;
  q87F8: pointer absolute d87F8;
  qA6E0: pointer absolute dA6E0;
{BODY}
  if RX33(q87F8^).v <> 0 then
    pO13E_0022('DungCom', qA9F8, 0, 25)
  else
  begin
    if RX57(q87F8^).v in [1..2] then
      vB := RX57(q87F8^).v
    else
      vB := 0;
    pO13E_0022('WildCom', vB, 0, 39);
  end;
  GetMem(qA6E0, $4E9);
  RX4(qA6E0^).v4 := 0;
  RX4(qA6E0^).v5 := 1;
  RX4(qA6E0^).v6 := 0;
  if RX33(q87F8^).v <> 0 then
    pO065_065F
  else
    pO065_0E34;
