var
  v2w: word;
  v4w: word;
  v5b: byte;
  _f1: array[1..5] of byte;
  v12w: word;
  _f2: array[1..1] of byte;
  bC60C: byte absolute dC60C;
  wC5DA: word absolute dC5DA;
  wC5E8: word absolute dC5E8;
  bB16D: byte absolute dB16D;
  wC5D4: word absolute dC5D4;
  wC5D6: word absolute dC5D6;
  wC5D8: word absolute dC5D8;
  wC5E2: word absolute dC5E2;
  wC5E4: word absolute dC5E4;
  wC5E6: word absolute dC5E6;
  wC5E0: word absolute dC5E0;
  wC5DC: word absolute dC5DC;
  wC5DE: word absolute dC5DE;
  wC5EE: word absolute dC5EE;
  wC5EA: word absolute dC5EA;
  wC5EC: word absolute dC5EC;
{BODY}
  {@5706-570B}
  pR716_0000;
  {@570B-5715}
  if bC60C = 0 then
    Exit;
  asm
  db 49,192,137,70,254,49,192,137,70,252,199,70,244,1,0,235,3,255,70,244,176,1,80,141,126,249,22,87
  db 141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,139,70,249,1,70,254,139,70,247,1,70,252,131,126,244,20,117,209
  end;
  {@5755-5762}
  wC5DA := v2w div 20;
  {@5762-576F}
  wC5E8 := v4w div 20;
  {@576F-58E3}
  repeat
    {@576F-5780}
    pR142_0217(1, 1, 38, 22);
    {@5780-57A0}
    pR47F_0354(1, 3, 13, 0, 'Push JOYSTICK #1 to the extreme upper');
    {@57A0-57C0}
    pR47F_0354(1, 5, 13, 0, 'left position and press button #1.');
    {@57C0-57C5}
    v12w := 0;
    asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,255,70,244,129,126,244,32,78,119,15,128,126,251,0,116,214,138,70,243,36,1,8,192,116,205
    end;
    {@57F8-583C}
    if v12w > 20000 then
    begin
      {@57FF-5810}
      pR142_0217(1, 1, 38, 22);
      {@5810-5830}
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      Delay(2000);
      Exit;
    end;
    v2w := 65535;
    v4w := 65535;
    for bB16D := 1 to 20 do
    begin
      asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 8,192,116,39,138,70,243,36,1,8,192,116,28,139,70,249,59,70,254,115,6,139,70,249,137,70,254,139
  db 70,247,59,70,252,115,6,139,70,247,137,70,252,235,61
      end;
      pR142_0217(1, 1, 38, 22);
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      Delay(2000);
      Exit;
    end;
  until v5b <> 0;
  {@58E3-58E9}
  wC5D4 := v2w;
  {@58E9-58FE}
  wC5D6 := (wC5DA - wC5D4) div 3 + wC5D4;
  {@58FE-5915}
  wC5D8 := (wC5DA - wC5D4) * 2 div 3 + wC5D4;
  {@5915-591B}
  wC5E2 := v4w;
  {@591B-5930}
  wC5E4 := (wC5E8 - wC5E2) div 3 + wC5E2;
  {@5930-5947}
  wC5E6 := (wC5E8 - wC5E2) * 2 div 3 + wC5E2;
  {@5947-5956}
  repeat
  until pR716_0107(1, 1) = 0;
  {@5956-5AC9}
  repeat
    {@5956-5967}
    pR142_0217(1, 1, 38, 22);
    {@5967-5987}
    pR47F_0354(1, 3, 13, 0, 'Push JOYSTICK #1 to the extreme lower');
    {@5987-59A7}
    pR47F_0354(1, 5, 13, 0, 'right position and press button #1.');
    {@59A7-59AC}
    v12w := 0;
    asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 136,70,251,255,70,244,129,126,244,32,78,119,15,128,126,251,0,116,214,138,70,243,36,1,8,192,116,205
    end;
    {@59DF-5A23}
    if v12w > 20000 then
    begin
      {@59E6-59F7}
      pR142_0217(1, 1, 38, 22);
      {@59F7-5A17}
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      {@5A17-5A20}
      Delay(2000);
      {@5A20-5A23}
      Exit;
    end;
    {@5A23-5A28}
    v2w := 0;
    {@5A28-5A2D}
    v4w := 0;
    for bB16D := 1 to 20 do
    begin
      asm
  db 176,1,80,141,126,249,22,87,141,126,247,22,87,141,126,243,22,87
  call XR716_01DC
  db 8,192,116,39,138,70,243,36,1,8,192,116,28,139,70,249,59,70,254,118,6,139,70,249,137,70,254,139
  db 70,247,59,70,252,118,6,139,70,247,137,70,252,235,60
      end;
      pR142_0217(1, 1, 38, 22);
      pR47F_0354(1, 3, 13, 0, 'Unable to read joystick');
      Delay(2000);
      Exit;
    end;
  until v5b <> 0;
  {@5AC9-5ACF}
  wC5E0 := v2w;
  {@5ACF-5AE4}
  wC5DC := (wC5E0 - wC5DA) div 3 + wC5DA;
  {@5AE4-5AFB}
  wC5DE := (wC5E0 - wC5DA) * 2 div 3 + wC5DA;
  {@5AFB-5B01}
  wC5EE := v4w;
  {@5B01-5B16}
  wC5EA := (wC5EE - wC5E8) div 3 + wC5E8;
  {@5B16-5B2D}
  wC5EC := (wC5EE - wC5E8) * 2 div 3 + wC5E8;
  {@5B2D-5B32}
  bC60C := 1;
