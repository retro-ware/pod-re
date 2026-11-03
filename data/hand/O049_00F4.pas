type
  TRec = record
    s: string[30];
    b: array[0..3] of byte;
    w: array[1..3] of string[20];
  end;
  THdr = record
    pad: array[0..72] of byte;
    r: array[0..20] of TRec;
  end;
var
  hdr: THdr absolute d0017;
  s7DEE: string absolute d7DEE;
  s7EEE: string absolute d7EEE;
  b7FEE: byte absolute d7FEE;
  bC5BB: byte absolute dC5BB;
  bC5BE: byte absolute dC5BE;
{BODY}
begin
  { Copy-protection question (journal word). The shipped GAME.OVR is cracked: the 'jz' after the
    loop's string compare was patched to 'jmp' (74->EB) and the 'jnz' before the result to two NOPs,
    so 3 bytes of this unit differ from the original binary; this is the unpatched source. }
  XR670_046E(@bC5BB, 4);
  pR142_00D4(1);
  b7FEE := 0;
  repeat
    Inc(b7FEE);
    s7DEE := '';
    bC5BB := 1;
    d7FF0 := Random(21) + 1;
    with hdr.r[d7FF0] do
    begin
      repeat
        d7FF1[0] := Random(3) + 1;
      until b[d7FF1[0]] <> 255;
      s7DEE := pO049_0000(w[d7FF1[0]]);
      pR47F_0354(3, 2, 10, 0, ' journal, page ');
      pR47F_0354(17, 2, 13, 0, ' (' + pO0EC_142F(b[0]) + ')         ');
      pR47F_0354(3, 4, 10, 0, ' what is word # ');
      pR47F_0354(19, 4, 13, 0, pO0EC_142F(b[d7FF1[0]]) + '     ');
      pR47F_0354(3, 6, 10, 0, ' after the heading ');
      pR142_0217(4, 8, 38, 8);
      pR47F_0354(4, 8, 13, 0, pO049_0000(s));
    end;
    s7EEE := pR47F_0711('Enter ', 14, 0, 20);
    dC5BC := 1;
  until (b7FEE = 3) or (s7EEE = s7DEE);
  dC5BD := 1;
  if s7EEE = s7DEE then
    pO049_00F4 := 1
  else
    pO049_00F4 := 0;
  bC5BE := 1;
end;
