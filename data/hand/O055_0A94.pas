type
  PB1 = ^TB1;
  TB1 = array[1..65000] of byte;
  PS15 = ^string15;
  string15 = string[15];
var
  v1b: byte;
  v2b: byte;
  _f1: word;
{BODY}
  v1b := pO055_05B3(a0);
  v2b := Length(a1);
  case v1b of
    0: begin
      Move(a1[1], PB1(p87F8)^[a0], v2b);
      PB1(p87F8)^[v2b + a0] := 0;
    end;
    1: if a0 = $401 then
      PS15(p9CEE)^ := a1;
  end;
