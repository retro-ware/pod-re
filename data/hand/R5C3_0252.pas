var
  key: byte;
  ok: byte;
{BODY}
  repeat
    ok := pR5C3_055E('game.ovr');
    if ok = 0 then
    begin
      Writeln('Please insert overlay disk.');
      key := pR670_0187;
    end;
  until ok <> 0;
