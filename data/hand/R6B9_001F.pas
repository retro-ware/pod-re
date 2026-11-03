var
  l92CB: longint absolute d92CB;
  w92CF: word absolute d92CF;
  w92D1: word absolute d92D1;
{BODY}
  b92C0 := 2;
  if boolean(a0 and $0F) then
    Halt;
  Inc(a0, (a0 and $FFF0) shl 12);
  a0 := a0 and $FFFF0000;
  Inc(a0, $100);
  Dec(a0, $100000);
  l92CB := a0;
  Move(a1, w92CF, 4);
  w87F2 := pR6B9_0000(0, w92CF, w92D1);
