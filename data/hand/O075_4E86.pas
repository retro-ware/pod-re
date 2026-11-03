var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v13w: word;
  v15i, v17i, v19i: integer;
  pC5CF: pointer absolute dC5CF;
  v23p: pointer;
  v279a: text;
  v535a: text;
  v536b: byte;
  _f2: array[1..512] of byte;
  v1304a: string;
  v2072a: array[1..2] of string[255];
  v1857a: string[40];
  v1898a: string[40];
  v1939a: string[40];
  _f3: array[1..1] of byte;
  v1980a: array[1..1] of string[40] absolute v1939a;
  v23b: byte absolute v23p;
  v13b: byte absolute v13w;
  v4b: byte absolute v4p;
  aC5D4_2fc5: array[0..16379] of word absolute dC5D4;
  aC5E2_2fc5: array[0..16379] of word absolute dC5E2;
  s28AB: string absolute d28AB;
  bC5C4: byte absolute dC5C4;
  bC5C6: byte absolute dC5C6;
  wC5C7: word absolute dC5C7;
  wC5C9: word absolute dC5C9;
  bC5C2: byte absolute dC5C2;
  bC60C: byte absolute dC60C;
{BODY}
  {@4E8D-4E9B}
  pO108_22B0(3, @v4b);
  {@4E9B-4E9F}
  v11b := 1;
  {@4E9F-4EA3}
  v9b := 0;
  {@4EA3-4EAF}
  v23p := v4p;
  {@4EAF-4EB4}
  v13w := 0;
  {@4EB4-546A}
  repeat
    {@4EB4-4EC4}
    Assign(v279a, 'krynn.cfg');
    {@4EC4-4ECF}
    Reset(v279a);
    for v536b := 1 to 5 do
      ReadLn(v279a, v2072a[v536b]);
    {@4F07-4F12}
    Close(v279a);
    if bC5C4 <> 0 then
      v1939a := 'mouse ON'
    else
      v1939a := 'mouse OFF';
    {@4F43-4F74}
    if bC60C <> 0 then
      v1898a := 'joystick ON'
    else
      v1898a := 'joystick OFF';
    {@4F74-4F88}
    v1857a := 'disable both';
    {@4F88-4F94}
    v8p := v4p;
    for v536b := 1 to 3 do
    begin
      {@4F9F-4FC0}
      PR0_string_40_(v8p)^.v := v1980a[v536b];
      {@4FC0-4FC8}
      PR41_byte(v8p)^.v := 0;
      {@4FC8-4FD9}
      v8p := PR42_pointer(v8p)^.v;
    end;
    {@4FE0-4FE4}
    v11b := 1;
    {@4FE4-4FEC}
    pO108_00CB(0);
    {@4FEC-5025}
    v10b := pO108_1D45(s28AB, s2B8D, 9, 12, 38, 22, v4p, 1, 0, @v11b, @v13b, @v23b);
    if v10b = 0 then
      case v13w of
        0: begin
          {@5039-5046}
          bC5C4 := Ord(bC5C4 = 0);
          {@5046-5056}
          Assign(v535a, 'krynn.cfg');
          {@5056-5061}
          Rewrite(v535a);
          if bC5C4 <> 0 then
          begin
            {@506B-5070}
            bC5C3 := 1;
            {@5070-5075}
            bC5C6 := 0;
            {@5075-507A}
            pR6DD_0000;
            if bC5C4 <> 0 then
            begin
              pC5CF := @d7D08[6];
              pR6DD_0107(0, 0, pC5CF);
              bC5C2 := 1;
              pR6DD_00C9(639, 100);
              pR6DD_0072(@v15i, @v17i, @v19i);
              bC5C2 := Ord((v17i >= 321) = False);
              bC60C := 0;
              pR6DD_0030;
              v1304a := 'M';
              for v536b := 1 to 5 do
                WriteLn(v535a, v2072a[v536b]);
              {@5132-515A}
              for v536b := 0 to 13 do
                WriteLn(v535a, Chr(48));
              {@515A-5165}
              Close(v535a);
              {@5165-516B}
              wC5C7 := 160;
              {@516B-5171}
              wC5C9 := 100;
              asm
  db 49,192,163,203,197,49,192,163,205,197
              end;
            end;
          end;
          {@517B-5212}
          if bC5C4 = 0 then
          begin
            {@5185-5199}
            v1304a := 'N';
            for v536b := 1 to 5 do
              WriteLn(v535a, v2072a[v536b]);
            {@51D0-51F8}
            for v536b := 0 to 13 do
              WriteLn(v535a, Chr(48));
            {@51F8-5203}
            Close(v535a);
            {@5203-5208}
            bC5C4 := 1;
            {@5208-520D}
            pR6DD_0051;
            {@520D-5212}
            bC5C4 := 0;
          end;
        end;
        1: begin
          {@521D-522A}
          bC60C := Ord(bC60C = 0);
          {@522A-523A}
          Assign(v535a, 'krynn.cfg');
          {@523A-5245}
          Rewrite(v535a);
          if bC60C <> 0 then
          begin
            {@524F-5253}
            pO075_5700;
            if bC60C <> 0 then
            begin
              {@525D-5271}
              v1304a := 'J';
              for v536b := 1 to 5 do
                WriteLn(v535a, v2072a[v536b]);
              {@52A8-5304}
              for v536b := 0 to 6 do
              begin
                {@52B3-52D8}
                WriteLn(v535a, aC5D4_2fc5[v536b]);
                {@52D8-52FD}
                WriteLn(v535a, aC5E2_2fc5[v536b]);
              end;
              {@5304-530F}
              Close(v535a);
              if bC60C <> 0 then
              begin
                {@5316-531B}
                pR6DD_0051;
                {@531B-5320}
                bC5C4 := 0;
              end;
            end;
          end;
          {@5320-53A8}
          if bC60C = 0 then
          begin
            {@532A-533E}
            v1304a := 'N';
            for v536b := 1 to 5 do
              WriteLn(v535a, v2072a[v536b]);
            {@5375-539D}
            for v536b := 0 to 13 do
              WriteLn(v535a, Chr(48));
            {@539D-53A8}
            Close(v535a);
          end;
        end;
        2: begin
          {@53B3-53B8}
          bC60C := 0;
          {@53B8-53BD}
          pR6DD_0051;
          {@53BD-53C2}
          bC5C4 := 0;
          {@53C2-53D2}
          Assign(v535a, 'krynn.cfg');
          {@53D2-53DD}
          Rewrite(v535a);
          {@53DD-53F1}
          v1304a := 'N';
          for v536b := 1 to 5 do
            WriteLn(v535a, v2072a[v536b]);
          {@5428-5450}
          for v536b := 0 to 13 do
            WriteLn(v535a, Chr(48));
          {@5450-545B}
          Close(v535a);
        end;
      end
    else
      v9b := 1;
  until v9b <> 0;
  {@546A-5474}
  pO108_2363(@v4b);
