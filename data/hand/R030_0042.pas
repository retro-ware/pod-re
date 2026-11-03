var
  done: byte;
  b8816: byte absolute d8816;
{BODY}
  if a0 > 0 then
  begin
    done := 0;
    repeat
      pR47F_0B2E(14, 0, 'WARNING: Insufficient Memory');
      if b8816 <> 0 then
      begin
        pO06E_2989(1, 0);
        done := d94D5;
      end
      else
      begin
        done := 1;
        pR47F_0B2E(14, 0, 'Insufficient Memory. Exiting Program');
      end;
    until done <> 0;
    pR670_0000(0);
  end;
