var
  b851B: byte absolute d851B;
  b8751: byte absolute d8751;
  b87A1: byte absolute d87A1;
  b87F0: byte absolute d87F0;
  b8818: byte absolute d8818;
  b8819: byte absolute d8819;
  b8830: byte absolute d8830;
  b8831: byte absolute d8831;
  b8832: byte absolute d8832;
  b8833: byte absolute d8833;
  b8834: byte absolute d8834;
  b92A8: byte absolute d92A8;
  bC5C4: byte absolute dC5C4;
  bC60C: byte absolute dC60C;
  g851B_579f: char absolute d851B;
  g851D_a7c7: text absolute d851D;
  g86F0_8563: NameStr absolute d86F0;
  g86F9_9ab2: ExtStr absolute d86F9;
  g8750_a8f9: DirStr absolute d8750;
  g87A0_45dd: string[79] absolute d87A0;
  g8818_6095: Registers absolute d8818;
  l8516: longint absolute d8516;
  pC59B: pointer absolute dC59B;
  s8750: string absolute d8750;
  s92D4: string absolute d92D4;
  s93D4: string absolute d93D4;
  b869E: byte absolute d869E;
  w1: array[0..6] of word absolute dC5D4;
  w2: array[0..6] of word absolute dC5E2;
{BODY}
  asm
  db 198,6,118,251,0
  end;
  {@0082-0087}
  pR5C3_0252;
  {@0087-009B}
  OvrInit('GAME.OVR');
  asm
  db 161,140,251,139,22,142,251,163,155,197,137,22,157,197
  end;
  asm
  mov ax, offset pR670_0347
  mov dx, seg pR670_0347
  db 163,140,251,137,22,142,251
  end;
  {@00B6-00E4}
  FSplit(FExpand('*.exe'), g8750_a8f9, g86F0_8563, g86F9_9ab2);
  if b8751 < 67 then
  begin
    {@00EB-011A}
    if b8751 = 65 then
      g87A0_45dd := 'B:\'
    else
      g87A0_45dd := 'A:\';
  end
  else
    g87A0_45dd := s8750;
  {@012F-0135}
  b87F0 := b87A1;
  if pR5C3_055E('pool4.cfg') = 0 then
    Halt(1);
  {@0155-0164}
  Assign(g851D_a7c7, 'pool4.cfg');
  {@0164-016E}
  Reset(g851D_a7c7);
  {@016E-0180}
  ReadLn(g851D_a7c7, g851B_579f);
  case b851B of
    49: b92A8 := 0;
    50: b92A8 := 2;
    51, 52: b92A8 := 3;
    53: b92A8 := 4;
  else
    {@01B3-01B8}
    b92A8 := 5;
  end;
  {@01B8-01CA}
  ReadLn(g851D_a7c7, g851B_579f);
  {@01CA-01CF}
  b8819 := 15;
  {@01CF-01DC}
  Intr(16, g8818_6095);
  {@01DC-01E2}
  b8832 := b8818;
  {@01E2-01E8}
  b8833 := b8832;
  case b851B of
    69: begin
      {@01EF-01F4}
      b8834 := 0;
      {@01F4-01FC}
      pR1C3_007C(13);
      {@01FC-0201}
      b8831 := 0;
      {@0201-0206}
      b8830 := 0;
      {@0206-020F}
      pR47F_0071(b8831);
      {@020F-0218}
      pR47F_00A0(b8830);
    end;
    84: begin
      {@021E-0223}
      b8834 := 1;
      asm
  db 161,186,125,45,0,4,139,208,161,184,125,163,22,133
      end;
      asm
  db 137,22,24,133
      end;
      {@0235-0243}
      longint(Heapend) := l8516;
      {@0243-024B}
      pR1C3_007C(9);
    end;
    86: begin
      {@0251-0256}
      b8834 := 2;
      {@0256-025E}
      pR1C3_007C(19);
    end;
  end;
  {@025E-02ED}
  if (143360 - OvrGetBuf) <= MemAvail then
    OvrSetBuf(143360)
  else
  begin
    {@0293-0298}
    pR1C3_00AC;
    {@0298-02E6}
WriteLn(Output, 'Not enough memory to run game.  You need ', 143360 - OvrGetBuf - MemAvail,
        ' more bytes.');
    {@02E6-02ED}
    Halt;
  end;
  {@02ED-0317}
  if word(Ovrresult) <> 0 then
  begin
    {@02F4-02F9}
    pR1C3_00AC;
    {@02F9-0310}
    WriteLn(Output, 'Overlay error, program abort!');
    {@0310-0317}
    Halt;
  end;
  {@0317-0329}
  ReadLn(g851D_a7c7, g851B_579f);
  case b851B of
    74: begin
      {@0330-0335}
      bC60C := 1;
      {@0335-033A}
      bC5C4 := 0;
    end;
    77: begin
      {@0340-0345}
      bC5C4 := 1;
      {@0345-034A}
      bC60C := 0;
    end;
    78: begin
      {@0350-0355}
      bC5C4 := 0;
      {@0355-035A}
      bC60C := 0;
    end;
  end;
  {@035A-0372}
  ReadLn(g851D_a7c7, s93D4);
  {@0372-038A}
  ReadLn(g851D_a7c7, s92D4);
  {@038A-039C}
  ReadLn(g851D_a7c7, g851B_579f);
  {@039C-03A1}
  pR716_0000;
  if bC60C <> 0 then
    for b869E := 0 to 6 do
    begin
      ReadLn(g851D_a7c7, w1[b869E]);
      ReadLn(g851D_a7c7, w2[b869E]);
    end;
  {@03F6-0400}
  Close(g851D_a7c7);
