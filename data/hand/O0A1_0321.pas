type
  TB2 = array[0..1] of byte;
  PB2 = ^TB2;
var
  vRow: byte;
  vMsg: string[80];
  vRes: byte;
  b9D93: byte absolute d9D93;
{BODY}
  case a2 of
    2: vMsg := '-Backstabs-';
    3: vMsg := 'slays helpless';
  else
    vMsg := 'Attacks';
  end;
  pO0EC_1B08(pointer(a0), vMsg, 10, 0);
  vRow := 12;
  pO0EC_1C22(a1, 23, vRow, 0);
  inc(vRow);
  if a2 = 1 then
    vMsg := '(from behind) '
  else
    vMsg := '';
  if a5 <> 0 then
  begin
    if a2 = 3 then
      vMsg := 'with one cruel blow'
    else
    begin
      vMsg := vMsg + 'Hitting for ' + pO0EC_142F(a4);
      if a4 = 1 then
        vMsg := vMsg + ' point '
      else
        vMsg := vMsg + ' points ';
      vMsg := vMsg + 'of damage';
    end;
    pO0EC_2851(a1, a3);
  end
  else
    vMsg := vMsg + 'and Misses';
  if PR493_byte(a1)^.v <> 8 then
    pR47F_0498(23, vRow, 38, vRow + 3, 10, 0, 1, vMsg);
  vRow := b9D93 + 1;
  if a3 > 0 then
  begin
    PB2(PR487_pointer(a1)^.v)^[1] := 0;
    if PR0_byte(PR487_pointer(a1)^.v)^.v > 0 then
    begin
      pR47F_0D1A;
      pO0EC_1B08(a1, 'lost a spell', 12, 1);
      pO0EC_186D(a1, PR0_byte(PR487_pointer(a1)^.v)^.v);
      vRes := pO0EC_2CF6(a1);
    end
    else
      pR47F_0D1A;
  end
  else
    pR47F_0D1A;
  if PR494_byte(a1)^.v = 0 then
  begin
    pO0EC_1B08(a1, 'goes down', vRow, 0);
    if (PR421_byte(a1)^.v and 8) = 0 then
    begin
      inc(vRow, 2);
      if PR493_byte(a1)^.v = 5 then
        pR47F_0354(23, vRow, 10, 0, 'and is Dying');
      if PR493_byte(a1)^.v in [6..8] then
        pO0EC_1B08(a1, 'is killed', vRow, 0);
      inc(vRow, 2);
    end;
    pO0E2_15A0(a1);
    pO0E2_04DD(13, @a1);
    if (PR494_byte(a1)^.v = 0) and (PR493_byte(a1)^.v <> 10) then
      pO135_0F14(a1)
    else
      pR47F_0D1A;
  end;
  pO0EC_1BEF;
