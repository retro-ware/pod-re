{BODY}
  {@0A17-0A21}
  if b880C <> 5 then
    Exit;
  if PR2_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v <> 0 then
    pO0EC_1B08(pointer(PR0_pointer(a0)^.v), 'is coughing', 10, 1);
  {@0A57-0A67}
  PR2_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@0A67-0A77}
  PR1_byte(PR487_pointer(PR0_pointer(a0)^.v)^.v)^.v := 0;
  {@0A77-0A86}
  pO0EC_0EBF(pointer(PR0_pointer(a0)^.v));
  {@0A86-0A92}
  Dec(PR498_byte(PR0_pointer(a0)^.v)^.v, 2);
  {@0A92-0A9E}
  Dec(PR499_byte(PR0_pointer(a0)^.v)^.v, 2);
  if PR0_pointer(a0)^.v = p9CEE then
    pO0EC_0C95(pointer(PR0_pointer(a0)^.v));
