type
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  PR0_X63 = ^R0_X63;
  R408_word = record _p: array[1..408] of byte; v: word end;
  PR408_word = ^R408_word;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  PR423_pointer = ^R423_pointer;
  R50_shortint = record _p: array[1..50] of byte; v: shortint end;
  PR50_shortint = ^R50_shortint;
  R52_byte = record _p: array[1..52] of byte; v: byte end;
  PR52_byte = ^R52_byte;
  RA331_word = record _p: array[1..331] of byte; a: array[0..16000] of word end;
  PRA331_word = ^RA331_word;
var
  aA7BE_b676: array[0..8189] of longint absolute dA7BE;
  lA7BE: longint absolute dA7BE;
  lA7C2: longint absolute dA7C2;
  lA7C6: longint absolute dA7C6;
  p9CFA: pointer absolute d9CFA;
  v4p: pointer;
  v5b: byte;
  v9l: longint;
  v13p: pointer;
  v17p: pointer;
  v18b: byte;
  v5sb: shortint absolute v5b;
  v4l: longint absolute v4p;
type PL = ^longint;
{BODY}
  {@024D-0255}
  v9l := 0;
  {@0255-0262}
  v4p := p9CF2;
  {@0262-0266}
  v18b := 0;
  {@0266-044D}
  while v4p <> nil do
  begin
    {@0271-0284}
    v17p := PR423_pointer(v4p)^.v;
if (PR495_byte(v4p)^.v = 1) and (PR493_byte(v4p)^.v <> 0) and (PR493_byte(v4p)^.v <> 9)
        and (PR493_byte(v4p)^.v <> 3) then
    begin
      {@02BC-02C1}
      b7FF4 := 1;
      if PR18_byte(PR487_pointer(v4p)^.v)^.v = 1 then
        for v5b := 0 to 2 do
          Inc(aA7BE_b676[v5sb], PRA331_word(v4p)^.a[v5sb]);
      {@0307-0317}
      Inc(v9l, PR408_word(v4p)^.v);
      if PR29_byte(p87F8)^.v <> 1 then
        while v17p <> nil do
        begin
          {@0330-0333}
          Inc(v18b);
          if PR46_byte(v17p)^.v <> 73 then
          begin
            {@0340-040C}
            if pA7CA = nil then
            begin
              {@0349-0359}
              GetMem(pA7CA, 63);
              {@0359-0376}
              pO0EC_0484(v4l, v17p, 0, 0, 0, 0);
              {@0376-038A}
              PR0_X63(pA7CA)^.v := PR0_X63(v17p)^.v;
              {@038A-0393}
              PR52_byte(pA7CA)^.v := 0;
              {@0393-03A1}
              PR42_pointer(pA7CA)^.v := nil;
            end
            else
            begin
              {@03A3-03B0}
              v13p := pA7CA;
              {@03B0-03C0}
              GetMem(pA7CA, 63);
              {@03C0-03DD}
              pO0EC_0484(v4l, v17p, 0, 0, 0, 0);
              {@03DD-03F1}
              PR0_X63(pA7CA)^.v := PR0_X63(v17p)^.v;
              {@03F1-03FA}
              PR52_byte(pA7CA)^.v := 0;
              {@03FA-040C}
              PR42_pointer(pA7CA)^.v := v13p;
            end;
            {@040C-0423}
            if PR57_byte(pA7CA)^.v > 0 then
              pO04F_0000(pA7CA);
          end;
          {@0423-0434}
          v17p := PR42_pointer(v17p)^.v;
        end;
    end;
    {@0437-044A}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@044D-0464}
  Inc(v9l, lA7BE * LongInt(2));
  {@0464-047B}
  Inc(v9l, lA7C2 * LongInt(250));
  {@047B-0492}
  Inc(v9l, lA7C6 * LongInt(2200));
  {@0492-049F}
  v13p := pA7CA;
  {@049F-04EA}
  while (v13p <> nil) and (v13p <> p9CFA) do
  begin
    {@04B9-04D7}
    if PR50_shortint(v13p)^.v > 0 then
      Inc(v9l, PR50_shortint(v13p)^.v * 400);
    {@04D7-04E8}
    v13p := PR42_pointer(v13p)^.v;
  end;
  PL(a0)^ := v9l div (PR31_byte(p87F8)^.v - bC57A);
