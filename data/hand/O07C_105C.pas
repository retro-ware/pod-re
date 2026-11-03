type
  PS17 = ^RS17;
  RS17 = record _p: array[1..17] of byte; v: byte end;
var
  _f1: longint;
{BODY}
  {@1063-10EB}
  if (a2 = 0) and (pO07C_00A0(@PR0_byte(a0)^.v, 43, PR3_byte(a1)^.v, 60) <> 0) then
  begin
    if PS17(PR0_pointer(a0)^.v)^.v > 3 then
    begin
      pO0EC_1B08(pointer(PR0_pointer(a0)^.v), s4025 + 'weakened', 10, 1);
      Dec(PS17(PR0_pointer(a0)^.v)^.v);
    end
    else
    {@10D0-10EB}
    pO0E2_13E5(pointer(PR0_pointer(a0)^.v), 31, 0, 255, 0);
  end;
