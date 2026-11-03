type
  PItem = ^TItem;
  TItem = record
    _p: array[0..$29] of byte;
    next: PItem;
    f2e, f2f, f30, f31: byte;
    _p2: array[$32..$33] of byte;
    f34, f35: byte;
    _p3: byte;
    f37: word;
    _p4: byte;
    f3a: word;
  end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_pitem = record _p: array[1..423] of byte; v: PItem end;
  PR333_word = ^R333_word;
  R333_word = record _p: array[1..333] of byte; v: word end;
  PR335_word = ^R335_word;
  R335_word = record _p: array[1..335] of byte; v: word end;
var
  s1: string[40];
  s2: string[40];
  key: byte;
  _f1: array[$54..$A5] of byte;
  v166: byte;
  val: longint;
  arr: array[1..4] of byte;
  cur: PItem;
  newp: PItem;
  done: byte;
  _f2: byte;
  flag: byte;
  b: byte;
  s15F0: string absolute d15F0;
  s1619: string absolute d1619;
  s1642: string absolute d1642;
  s278C: string absolute d278C;
  s2830: string absolute d2830;
  s2CD5: string absolute d2CD5;
  s2CFE: string absolute d2CFE;
  bAB10: byte absolute dAB10;
  bAB0E: byte absolute dAB0E;
  s159E: string absolute d159E;
  s15C7: string absolute d15C7;
{BODY}
  PR0_byte(a0)^.v := 1;
  if (PR333_word(p9CEE)^.v = 0) and (PR335_word(p9CEE)^.v = 0) then
  begin
    pO0EC_1AAC('No Gems or Jewelry');
    PR0_byte(a0)^.v := 0;
    exit;
  end;
  repeat
    if (PR333_word(p9CEE)^.v = 0) and (PR335_word(p9CEE)^.v = 0) then
      done := 1
    else
    begin
      done := 0;
      Str(PR333_word(p9CEE)^.v, s1);
      Str(PR335_word(p9CEE)^.v, s2);
      s1 := s159E + s1;
      s2 := s15C7 + s2;
      pR47F_0F07(1, 1, 38, 22);
      pO0EC_1C22(p9CEE, 1, 1, 0);
      pR47F_0354(1, 7, 15, 0, s15F0);
      pR47F_0354(1, 9, 15, 0, s1);
      pR47F_0354(1, 10, 15, 0, s2);
      FillChar(bAB0E, 40, 255);
      b := 0;
      if PR333_word(p9CEE)^.v <> 0 then pO108_00AB(0, @b);
      if PR335_word(p9CEE)^.v <> 0 then pO108_00AB(1, @b);
      pO108_00AB(2, @b);
      key := pO108_1009(s2830, s2CD5, 1, 0);
      if (bAAE6 <> 0) and (key = 27) then key := 2;
      case key of
        0:
          if PR333_word(p9CEE)^.v <> 0 then
          begin
            Dec(PR333_word(p9CEE)^.v);
            v166 := pO0E2_1374(1, 100);
            case v166 of
              1..25: val := 5;
              26..50: val := 25;
              51..70: val := 50;
              71..90: val := 250;
              91..99: val := 500;
              100: val := 2500;
            end;
            Str(val, s1);
            s1 := s1619 + s1 + ' platinum.';
            pR47F_0354(1, 12, 15, 0, s1);
            FillChar(bAB0E, 40, 255);
            bAB0E := 0;
            if (pO0B5_005E(p9CEE, 1, @arr) <> 0) or (R422_byte(p9CEE^).v >= 16) then
              flag := 1
            else
            begin
              bAB10 := 1;
              flag := 0;
            end;
            key := pO108_1009(s278C, s2CFE, 0, 0);
            if (key = 1) and (flag = 0) then
            begin
              newp := pR670_037F;
              XR670_046E(@newp^, 63);
              newp^.next := nil;
              newp^.f34 := 0;
              newp^.f31 := 122;
              newp^.f30 := 0;
              newp^.f2f := 0;
              newp^.f2e := 47;
              newp^.f3a := val;
              newp^.f37 := 1;
              newp^.f35 := 0;
              cur := R423_pitem(p9CEE^).v;
              if cur = nil then
                cur := newp
              else
              begin
                while cur^.next <> nil do
                  cur := cur^.next;
                cur^.next := newp;
              end;
            end
            else
              pO0B5_010D(val);
          end;
        1:
          if PR335_word(p9CEE)^.v <> 0 then
          begin
            Dec(PR335_word(p9CEE)^.v);
            v166 := pO0E2_1374(1, 100);
            case v166 of
              1..10: val := Trunc(Random(450)) + 50;
              11..20: val := Trunc(Random(500)) + 100;
              21..40: val := Trunc(Random(750)) + 150;
              41..50: val := Trunc(Random(1250)) + 250;
              51..70: val := Trunc(Random(2500)) + 500;
              71..90: val := Trunc(Random(3000)) + 1000;
              91..100: val := Trunc(Random(5000)) + 1000;
            end;
            Str(val, s2);
            s2 := s1642 + s2 + ' platinum.';
            pR47F_0354(1, 12, 15, 0, s2);
            FillChar(bAB0E, 40, 255);
            bAB0E := 0;
            if (pO0B5_005E(p9CEE, 1, @arr) <> 0) or (R422_byte(p9CEE^).v >= 16) then
              flag := 1
            else
            begin
              bAB10 := 1;
              flag := 0;
            end;
            key := pO108_1009(s278C, s2CFE, 0, 0);
            if (key = 1) and (flag = 0) then
            begin
              newp := pR670_037F;
              XR670_046E(@newp^, 63);
              newp^.next := nil;
              newp^.f34 := 0;
              newp^.f31 := 123;
              newp^.f30 := 0;
              newp^.f2f := 0;
              newp^.f2e := 47;
              newp^.f3a := val;
              newp^.f37 := 1;
              newp^.f35 := 0;
              cur := R423_pitem(p9CEE^).v;
              if cur = nil then
                cur := newp
              else
              begin
                while cur^.next <> nil do
                  cur := cur^.next;
                cur^.next := newp;
              end;
            end
            else
              pO0B5_010D(val);
          end;
        2: done := 1;
      end;
      pO0EC_0EBF(p9CEE);
    end;
  until done <> 0;
