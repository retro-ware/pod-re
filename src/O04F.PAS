{ O04F: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O04F;

interface

uses GAMEDATA;

procedure pO04F_145F;
procedure pO04F_0F77(a0: pointer; a1: pointer);

implementation

uses LIT, O052, O075, O0AA, O0B5, O0BB, O0E2, O0EC, O108, R142, R47F, R670;

type
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R174_shortint = record _p: array[1..174] of byte; v: shortint end;
  R17_byte = record _p: array[1..17] of byte; v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R19_byte = record _p: array[1..19] of byte; v: byte end;
  R20_byte = record _p: array[1..20] of byte; v: byte end;
  R21_byte = record _p: array[1..21] of byte; v: byte end;
  R23_byte = record _p: array[1..23] of byte; v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R28_byte = record _p: array[1..28] of byte; v: byte end;
  R29_byte = record _p: array[1..29] of byte; v: byte end;
  R30_byte = record _p: array[1..30] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R370_longint = record _p: array[1..370] of byte; v: longint end;
  R408_word = record _p: array[1..408] of byte; v: word end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R47_byte = record _p: array[1..47] of byte; v: byte end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_pointer = record _p: array[1..487] of byte; v: pointer end;
  R48_byte = record _p: array[1..48] of byte; v: byte end;
  R492_byte = record _p: array[1..492] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R494_byte = record _p: array[1..494] of byte; v: byte end;
  R495_byte = record _p: array[1..495] of byte; v: byte end;
  R49_byte = record _p: array[1..49] of byte; v: byte end;
  R508_byte = record _p: array[1..508] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R50_shortint = record _p: array[1..50] of byte; v: shortint end;
  R51_byte = record _p: array[1..51] of byte; v: byte end;
  R54_byte = record _p: array[1..54] of byte; v: byte end;
  R55_word = record _p: array[1..55] of byte; v: word end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R60_byte = record _p: array[1..60] of byte; v: byte end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  R62_byte = record _p: array[1..62] of byte; v: byte end;
  RA30_byte = record _p: array[1..30] of byte; a: array[0..32000] of byte end;
  RA331_word = record _p: array[1..331] of byte; a: array[0..16000] of word end;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR174_shortint = ^R174_shortint;
  PR17_byte = ^R17_byte;
  PR18_byte = ^R18_byte;
  PR19_byte = ^R19_byte;
  PR20_byte = ^R20_byte;
  PR21_byte = ^R21_byte;
  PR23_byte = ^R23_byte;
  PR27_byte = ^R27_byte;
  PR28_byte = ^R28_byte;
  PR29_byte = ^R29_byte;
  PR30_byte = ^R30_byte;
  PR31_byte = ^R31_byte;
  PR327_byte = ^R327_byte;
  PR370_longint = ^R370_longint;
  PR408_word = ^R408_word;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR47_byte = ^R47_byte;
  PR483_pointer = ^R483_pointer;
  PR487_pointer = ^R487_pointer;
  PR48_byte = ^R48_byte;
  PR492_byte = ^R492_byte;
  PR493_byte = ^R493_byte;
  PR494_byte = ^R494_byte;
  PR495_byte = ^R495_byte;
  PR49_byte = ^R49_byte;
  PR508_byte = ^R508_byte;
  PR50_byte = ^R50_byte;
  PR50_shortint = ^R50_shortint;
  PR51_byte = ^R51_byte;
  PR54_byte = ^R54_byte;
  PR55_word = ^R55_word;
  PR57_byte = ^R57_byte;
  PR60_byte = ^R60_byte;
  PR61_byte = ^R61_byte;
  PR62_byte = ^R62_byte;
  PRA30_byte = ^RA30_byte;
  PRA331_word = ^RA331_word;
var
  a4015_ec3f: array[0..32759] of byte absolute d4015;
  aA7BE_b676: array[0..8189] of longint absolute dA7BE;
  b5363: byte absolute d5363;
  b7FF4: byte absolute d7FF4;
  b7FF5: byte absolute d7FF5;
  b7FF6: byte absolute d7FF6;
  b7FF7: byte absolute d7FF7;
  b880C: byte absolute d880C;
  b880E: byte absolute d880E;
  b8814: byte absolute d8814;
  b8815: byte absolute d8815;
  b9D92: byte absolute d9D92;
  b9D93: byte absolute d9D93;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bB01E: byte absolute dB01E;
  bB01F: byte absolute dB01F;
  bC57A: byte absolute dC57A;
  bC57B: byte absolute dC57B;
  bC57F: byte absolute dC57F;
  lA7BE: longint absolute dA7BE;
  lA7C2: longint absolute dA7C2;
  lA7C6: longint absolute dA7C6;
  lC57B: longint absolute dC57B;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9CFA: pointer absolute d9CFA;
  pA7CA: pointer absolute dA7CA;
  s0E12: string absolute d0E12;
  s2481: string absolute d2481;
  s24AA: string absolute d24AA;
  s24D3: string absolute d24D3;
  s24FC: string absolute d24FC;
  s2525: string absolute d2525;
  s254E: string absolute d254E;
  s278C: string absolute d278C;
  s2AC0: string absolute d2AC0;
  s30C9: string absolute d30C9;
  s311B: string absolute d311B;

procedure pO04F_0000(a0: pointer); far; forward;
procedure pO04F_0247(a0: pointer); far; forward;
procedure pO04F_051D(a0: longint); far; forward;
procedure pO04F_072B; far; forward;
procedure pO04F_0B99(a0: word; a1: word); far; forward;
procedure pO04F_0D89(a0: pointer; a1: pointer; a2: pointer; a3: pointer); far; forward;
procedure pO04F_0E4B; far; forward;
procedure pO04F_107C; far; forward;
procedure pO04F_1308; far; forward;

{ 0000 }
procedure pO04F_0000(a0: pointer);
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  v16p: pointer;
  v17b: byte;
  _f1: array[1..1] of byte;
  v8b: byte absolute v8p;
begin
  {@0006-0012}
  v16p := a0;
  {@0012-001C}
  v17b := PR57_byte(v16p)^.v;
  {@001C-0029}
  v8p := pA7CA;
  {@0029-0237}
  while v8p <> nil do
  begin
    {@0034-0045}
    v12p := PR42_pointer(v8p)^.v;
if (v8p <> v16p) and (PR57_byte(v8p)^.v > 0) and (PR47_byte(v8p)^.v = PR47_byte(v16p)^.v)
        and (PR48_byte(v8p)^.v = PR48_byte(v16p)^.v) and (PR49_byte(v8p)^.v = PR49_byte(v16p)^.v)
        and (PR46_byte(v8p)^.v = PR46_byte(v16p)^.v) and (PR50_byte(v8p)^.v = PR50_byte(v16p)^.v)
        and (PR51_byte(v8p)^.v = PR51_byte(v16p)^.v) and (PR54_byte(v8p)^.v = PR54_byte(v16p)^.v)
        and (PR55_word(v8p)^.v = PR55_word(v16p)^.v) and (PR60_byte(v8p)^.v = PR60_byte(v8p)^.v)
        and (PR60_byte(v8p)^.v < 2) and (PR61_byte(v8p)^.v = PR61_byte(v8p)^.v)
        and (PR62_byte(v8p)^.v = PR62_byte(v8p)^.v) then
    begin
      {@0143-0228}
      if (v17b + PR57_byte(v8p)^.v) <= 255 then
      begin
        {@015D-0167}
        Inc(v17b, PR57_byte(v8p)^.v);
        {@0167-0174}
        v4p := pA7CA;
        if v8p = v4p then
          pA7CA := PR42_pointer(v8p)^.v
        else
          while (v4p <> nil) and (PR42_pointer(v4p)^.v <> v8p) do
            v4p := PR42_pointer(v4p)^.v;
        {@01C8-01DE}
        PR42_pointer(v4p)^.v := PR42_pointer(v8p)^.v;
        {@01DE-01E8}
        pR670_03ED(@v8b);
      end
      else
      begin
        {@01EA-01F2}
        PR57_byte(v16p)^.v := 255;
        {@01F2-0212}
        PR57_byte(v8p)^.v := PR57_byte(v8p)^.v - (255 - v17b);
        {@0212-021C}
        v17b := PR57_byte(v8p)^.v;
        {@021C-0228}
        v16p := v8p;
      end;
    end;
    {@0228-0234}
    v8p := v12p;
  end;
  {@0237-0241}
  PR57_byte(v16p)^.v := v17b;
end;

{ 0247 }
procedure pO04F_0247(a0: pointer);
var
  v4p: pointer;
  v5b: byte;
  v9l: longint;
  v13p: pointer;
  v17p: pointer;
  v18b: byte;
  v5sb: shortint absolute v5b;
begin
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
            asm
  db 161,202,167,11,6,204,167,117,90,184,63,0,80,154,63,2,37,8,163,202,167,137,22,204,167,255,118,254
  db 255,118,252,255,118,241,255,118,239,176,0,80,176,0,80,176,0,80,176,0,80
  call pO0EC_0484
  db 196,126,239,6,87,196,62,202,167,6,87,184,63,0,80,154,163,9,37,8,196,62,202,167,38,198,69,52
  db 0,196,62,202,167,49,192,38,137,69,42,38,137,69,44,235,105,161,202,167,139,22,204,167,137,70,243,137
  db 86,245,184,63,0,80,154,63,2,37,8,163,202,167,137,22,204,167,255,118,254,255,118,252,255,118,241,255
  db 118,239,176,0,80,176,0,80,176,0,80,176,0,80
  call pO0EC_0484
  db 196,126,239,6,87,196,62,202,167,6,87,184,63,0,80,154,163,9,37,8,196,62,202,167,38,198,69,52
  db 0,139,70,243,139,86,245,196,62,202,167,38,137,69,42,38,137,85,44
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
  asm
  db 160,122,197,48,228,139,208,196,62,248,135,38,138,69,31,48,228,43,194,153,139,200,139,218,139,70,247,139
  db 86,249,154,218,9,37,8,196,126,6,38,137,5,38,137,85,2
  end;
end;

{ 051D }
procedure pO04F_051D(a0: longint);
var
  v4p: pointer;
  v8l: longint;
begin
  {@0523-0531}
  if PR30_byte(p87F8)^.v <> 0 then
    Exit;
  {@0531-053E}
  v4p := p9CF2;
  {@053E-0725}
  while v4p <> nil do
  begin
    {@0549-070F}
    if (PR494_byte(v4p)^.v <> 0) and (PR493_byte(v4p)^.v <> 1) then
    begin
      {@0565-0571}
      v8l := a0;
      case PR174_shortint(v4p)^.v of
        0: begin
          {@057D-05A3}
          if PR21_byte(v4p)^.v > 14 then
            v8l := a0 div LongInt(10) + a0;
        end;
        2: begin
          {@05AA-05D0}
          if PR17_byte(v4p)^.v > 15 then
            v8l := a0 div LongInt(10) + a0;
        end;
        3: begin
          {@05D7-0607}
          if (PR17_byte(v4p)^.v > 15) and (PR21_byte(v4p)^.v > 15) then
            v8l := a0 div LongInt(10) + a0;
        end;
        4: begin
          {@060E-0648}
          if (PR17_byte(v4p)^.v > 15) and (PR19_byte(v4p)^.v > 15) and (PR21_byte(v4p)^.v > 15) then
            v8l := a0 div LongInt(10) + a0;
        end;
        5: begin
          {@064F-0675}
          if PR19_byte(v4p)^.v > 15 then
            v8l := a0 div LongInt(10) + a0;
        end;
        6: begin
          {@067B-06A1}
          if PR23_byte(v4p)^.v > 15 then
            v8l := a0 div LongInt(10) + a0;
        end;
        8, 10..14, 16: v8l := a0 div LongInt(2);
        9, 15: v8l := a0 div LongInt(3);
      end;
      {@06E9-06FC}
      Inc(PR370_longint(v4p)^.v, v8l);
      {@06FC-070F}
      PR492_byte(v4p)^.v := pO0EC_38FA(v4p);
    end;
    {@070F-0722}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 072B }
procedure pO04F_072B;
var
  v4p: pointer;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  _f1: array[1..1] of byte;
begin
  {@0731-0736}
  bC57A := 0;
  {@0736-073B}
  b8814 := 1;
  {@073B-0740}
  b7FF5 := 0;
  {@0740-074D}
  v4p := p9CF2;
  {@074D-0789}
  while (v4p <> nil) and (PR18_byte(PR487_pointer(v4p)^.v)^.v <> 1) do
  begin
    {@0764-0774}
    if PR493_byte(v4p)^.v = 3 then
      b7FF5 := 1;
    {@0774-0787}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@0789-0796}
  v4p := p9CF2;
  {@0796-079A}
  v7b := 0;
  {@079A-07ED}
  while (v4p <> nil) and (v7b = 0) do
  begin
    {@07A8-07D8}
if (PR494_byte(v4p)^.v <> 0) or (PR493_byte(v4p)^.v = 4) or (PR493_byte(v4p)^.v = 3)
        or (PR493_byte(v4p)^.v = 5) then
      v7b := 1;
    {@07D8-07EB}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@07ED-0803}
  if (PR28_byte(p87F8)^.v <> 0) and (v7b <> 0) then
    b8814 := 0;
  {@0803-0808}
  bC57F := 0;
  {@0808-0815}
  v4p := p9CF2;
  if b880E = 0 then
  begin
    {@081F-08F4}
    while (v4p <> nil) and (PR18_byte(PR487_pointer(v4p)^.v)^.v <> 1) do
    begin
      {@083C-0878}
if ((PR493_byte(v4p)^.v = 3) or (PR493_byte(v4p)^.v = 1) or (PR493_byte(v4p)^.v = 0))
          and (PR495_byte(v4p)^.v = 0) and (PR327_byte(v4p)^.v < 128) then
        b8814 := 0;
      {@0878-0898}
      if (PR493_byte(v4p)^.v = 1) or (PR493_byte(v4p)^.v = 0) then
      begin
        {@088E-0893}
        bC57F := 1;
        {@0893-0898}
        b7FF5 := 0;
      end;
      {@0898-08B2}
      if (PR494_byte(v4p)^.v = 0) or (PR493_byte(v4p)^.v = 1) then
        Inc(bC57A);
      {@08B2-08DE}
      for v6b := 1 to 15 do
        pO0E2_0104(v4p, a4015_ec3f[v6b], nil);
      {@08DE-08F1}
      v4p := PR483_pointer(v4p)^.v;
    end;
    {@08F4-0910}
    if bC57F <> 0 then
    begin
      {@08FB-0904}
      pO04F_0247(@bC57B);
      {@0904-0910}
      pO04F_051D(lC57B);
    end;
    {@0910-091D}
    v4p := p9CF2;
    if b8814 = 0 then
      while (v4p <> nil) and (PR18_byte(PR487_pointer(v4p)^.v)^.v <> 1) do
      begin
        {@0944-0A61}
        if b7FF5 = 0 then
        begin
          {@094E-09EF}
          case PR493_byte(v4p)^.v of
            3: begin
              {@095A-0963}
              PR493_byte(v4p)^.v := 0;
              {@0963-096C}
              PR494_byte(v4p)^.v := 1;
            end;
            5: begin
              {@0973-09A4}
              if PR28_byte(p87F8)^.v <> 0 then
              begin
                {@097E-0987}
                PR493_byte(v4p)^.v := 0;
                {@0987-0990}
                PR494_byte(v4p)^.v := 1;
                {@0990-0999}
                PR508_byte(v4p)^.v := 1;
              end
              else
                PR493_byte(v4p)^.v := 4;
            end;
            4: begin
              {@09AA-09EF}
              if PR508_byte(v4p)^.v > 0 then
              begin
                {@09B5-09BE}
                PR493_byte(v4p)^.v := 0;
                {@09BE-09C7}
                PR494_byte(v4p)^.v := 1;
              end
              else
              begin
                {@09C9-09EF}
                if PR28_byte(p87F8)^.v <> 0 then
                begin
                  {@09D4-09DD}
                  PR493_byte(v4p)^.v := 0;
                  {@09DD-09E6}
                  PR494_byte(v4p)^.v := 1;
                  {@09E6-09EF}
                  PR508_byte(v4p)^.v := 1;
                end;
              end;
            end;
          end;
          {@09EF-0A02}
          v4p := PR483_pointer(v4p)^.v;
        end
        else
        begin
          {@0A04-0A61}
          if PR493_byte(v4p)^.v = 3 then
          begin
            {@0A0F-0A18}
            PR493_byte(v4p)^.v := 0;
            {@0A18-0A21}
            PR494_byte(v4p)^.v := 1;
            {@0A21-0A34}
            v4p := PR483_pointer(v4p)^.v;
          end
          else
          begin
            {@0A36-0A43}
            p9CEE := v4p;
            {@0A43-0A56}
            v4p := PR483_pointer(v4p)^.v;
            {@0A56-0A61}
            pO075_3770(0, 1);
          end;
        end;
      end
    else
    begin
      {@0A66-0A73}
      v4p := p9CF2;
      {@0A73-0A77}
      v5b := 0;
      {@0A77-0AC7}
      while (v4p <> nil) and (v5b = 0) do
      begin
        {@0A85-0AB2}
        if PR18_byte(PR487_pointer(v4p)^.v)^.v <> 1 then
        begin
          {@0A94-0AA1}
          p9CEE := v4p;
          {@0AA1-0AAC}
          pO075_3770(0, 1);
        end
        else
          v5b := 1;
        {@0AB2-0AC5}
        v4p := PR483_pointer(v4p)^.v;
      end;
      {@0AC7-0AD0}
      PR31_byte(p87F8)^.v := 0;
    end;
    {@0AD0-0AD3}
    Exit;
  end;
  {@0AD3-0AE0}
  v4p := p9CF2;
  {@0AE0-0B38}
  while v4p <> nil do
  begin
    {@0AE8-0B23}
    if (PR494_byte(v4p)^.v = 1) and (PR493_byte(v4p)^.v = 0) and (PR495_byte(v4p)^.v <> 1) then
    begin
      {@0B09-0B0E}
      bC57F := 1;
      {@0B0E-0B17}
      pO04F_0247(@bC57B);
      {@0B17-0B23}
      pO04F_051D(lC57B);
    end;
    {@0B23-0B36}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@0B38-0B45}
  v4p := p9CF2;
  {@0B45-0B95}
  while v4p <> nil do
  begin
    {@0B4D-0B6C}
    if (PR493_byte(v4p)^.v = 0) or (PR493_byte(v4p)^.v = 1) then
      PR494_byte(v4p)^.v := 1;
    {@0B6C-0B80}
    if PR493_byte(v4p)^.v = 5 then
      PR493_byte(v4p)^.v := 4;
    {@0B80-0B93}
    v4p := PR483_pointer(v4p)^.v;
  end;
end;

{ 0B99 }
procedure pO04F_0B99(a0: word; a1: word);
var
  v11a: string[10];
  v267a: string;
  v268b: byte;
  _f1: array[1..1] of byte;
  v270b: byte;
  _f2: array[1..8] of byte;
begin
  if false then begin
    if LV = FS then;
  end;
  {@0BA0-0BA5}
  v270b := 0;
  {@0BA5-0BAD}
  pR142_00D4(0);
  if b7FF4 <> 0 then
    asm
  db 128,62,245,127,0,116,120,176,1,80,176,3,80,176,10,80,176,0,80,191,180,35,30,87
  call pR47F_0354
  db 49,192,137,70,6,137,70,8,161,202,167,139,22,204,167,137,134,238,254,137,150,240,254,139,134,238,254,11
  db 134,240,254,116,49,196,190,238,254,38,139,69,42,38,139,85,44,137,134,234,254,137,150,236,254,141,190,238
  db 254,22,87
  call pR670_03ED
  db 139,134,234,254,139,150,236,254,137,134,238,254,137,150,240,254,235,197,191,190,167,30,87,184,12,0,80
  call XR670_046E
  db 235,72,128,62,127,197,0,117,43,196,62,248,135,38,128,125,28,0,116,32,176,1,80,176,3,80,176,10
  db 80,176,0,80,191,221,35,30,87
  call pR47F_0354
  db 49,192,137,70,6,137,70,8,235,22,176,1,80,176,3,80,176,10,80,176,0,80,191,6,36,30,87
  call pR47F_0354
    end
  else
    pR47F_0354(1, 3, 10, 0, s2481);
  asm
  db 255,118,8,255,118,6,49,192,80,141,126,245,22,87,184,10,0,80,154,61,23,37,8
  end;
  {@0CAD-0CD6}
  v267a := s24D3 + v11a;
  if PR30_byte(p87F8)^.v = 0 then
  begin
    {@0CE1-0CF8}
    pR47F_0354(1, 5, 10, 0, v267a);
    {@0CF8-0D0E}
    pR47F_0354(1, 7, 10, 0, s24FC);
  end;
  {@0D0E-0D13}
  b7FF6 := 0;
  {@0D13-0D18}
  b7FF7 := 0;
  {@0D18-0D27}
  pO0B5_0E45(@b7FF6, @b7FF7);
  if b7FF4 <> 0 then
  begin
    {@0D2E-0D6A}
    if (b7FF6 <> 0) or (b7FF7 <> 0) then
      pR47F_0354(1, 10, 10, 0, s2481)
    else
      pR47F_0354(1, 10, 10, 0, s24AA);
  end;
  {@0D6A-0D83}
  v268b := pO108_1009(s278C, s0E12, 1, 0);
end;

{ 0D89 }
procedure pO04F_0D89(a0: pointer; a1: pointer; a2: pointer; a3: pointer);
var
  v4p: pointer;
  _f1: array[1..19] of byte;
  v24b: byte;
  v28p: pointer;
begin
  {@0D8F-0D93}
  v24b := 1;
  {@0D93-0D9B}
  pR142_00D4(0);
  {@0D9B-0DA8}
  v28p := pA7CA;
  {@0DA8-0DE0}
  while v28p <> nil do
  begin
    asm
  db 49,192,49,210,82,80,255,118,230,255,118,228,176,0,80,176,0,80,176,0,80,176,0,80
  call pO0EC_0484
    end;
    {@0DCD-0DDE}
    v28p := PR42_pointer(v28p)^.v;
  end;
  {@0DE0-0DED}
  v4p := pA7CA;
  {@0DED-0DF5}
  pO108_00CB(0);
  {@0DF5-0E31}
PR0_byte(a0)^.v := pO108_1D45(s2AC0, s30C9, 1, 1, 38, 22, v4p, 1, 0, @v24b, @PR0_byte(a3)^.v,
      @PR0_byte(a2)^.v);
  {@0E31-0E45}
  PR0_longint(a1)^.v := PR0_longint(a2)^.v;
end;

{ 0E4B }
procedure pO04F_0E4B;
var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  v10b: byte;
  v14p: pointer;
  v16w: word;
  v17b: byte;
  _f1: array[1..1] of byte;
  v16b: byte absolute v16w;
  v14b: byte absolute v14p;
  v4b: byte absolute v4p;
begin
  {@0E51-0E59}
  v4p := nil;
  {@0E59-0E66}
  v14p := pA7CA;
  {@0E66-0E6B}
  v16w := 0;
  {@0E6B-0E70}
  bAAE5 := 1;
  {@0E70-0F56}
  repeat
    {@0E70-0E88}
    pO04F_0D89(@v9b, @v4b, @v14b, @v16b);
    if v9b <> 0 then
      v10b := 1
    else
    begin
      {@0E95-0E99}
      v10b := 0;
      {@0E99-0EA9}
      pO052_035E(v4p, @v17b);
      if v17b = 0 then
      begin
        {@0EB2-0EBF}
        v8p := pA7CA;
        if v8p = v4p then
          pA7CA := PR42_pointer(v4p)^.v
        else
        begin
          {@0EE3-0F0B}
          while PR42_pointer(v8p)^.v <> v4p do
            v8p := PR42_pointer(v8p)^.v;
          {@0F0B-0F21}
          PR42_pointer(v8p)^.v := PR42_pointer(v4p)^.v;
        end;
        {@0F21-0F2E}
        PR42_pointer(v4p)^.v := nil;
        if v4p <> nil then
          pR670_03ED(@v4b);
        {@0F40-0F4D}
        if pA7CA = nil then
          v10b := 1;
      end;
    end;
  until v10b <> 0;
  {@0F56-0F5B}
  pO0EC_2ED1;
end;

{ 0F77 }
procedure pO04F_0F77(a0: pointer; a1: pointer);
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..1] of byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'Take: ' then;
    if LV = 'Money Items Exit' then;
    with LPR^ do LM3_0('Take: ', 'Take: ', 'Take: ');
  end;
  {@0F7D-0F82}
  bAAE5 := 1;
  {@0F82-0F86}
  v2b := 0;
  if PR0_byte(a0)^.v <> 0 then
  begin
    {@0F92-1070}
    if PR0_byte(a1)^.v <> 0 then
      repeat
        {@0F9E-0FA6}
        pO108_00CB(2);
        {@0FA6-0FD2}
        v1b := pO108_1009('Take: ', 'Money Items Exit', 1, 1);
        if bAAE6 <> 0 then
          case v1b of
            27: v2b := 1;
            72: pO0AA_2F7B(v1b);
            80: pO0AA_2F7B(v1b);
          end
        else
          case v1b of
            0: begin
              {@100B-1010}
              pO0B5_0B93;
              {@1010-1015}
              pO0EC_2ED1;
            end;
            1: pO04F_0E4B;
            2: v2b := 1;
          end;
        asm
  db 255,54,240,156,255,54,238,156
  call pO0EC_07C0
  db 196,126,10,6,87,196,126,6,6,87
  call pO0B5_0E45
  db 196,126,10,38,128,61,0,116,9,196,126,6,38,128,61,0,117,4,198,70,254,1
        end;
      until v2b <> 0
    else
    begin
      {@1066-106B}
      pO0B5_0B93;
      {@106B-1070}
      pO0EC_2ED1;
    end;
    {@1070-1072}
    Exit;
  end;
  {@1072-1076}
  pO04F_0E4B;
end;

{ 107C }
procedure pO04F_107C;
var
  _f1: array[1..1] of byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  _f2: array[1..1] of byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
begin
  {@1082-1086}
  v5b := 0;
  {@1086-108B}
  pO0EC_2ED1;
  {@108B-108F}
  v10b := 1;
  {@108F-1304}
  repeat
    {@108F-10A0}
    FillChar(bAB0E, 40, 255);
    {@10A0-10AF}
    pO0B5_0E45(@b7FF6, @b7FF7);
    {@10AF-10B3}
    v2b := 0;
    {@10B3-10B7}
    v9b := 0;
    if b7FF7 <> 0 then
      while (v2b <= 140) and (v9b = 0) do
      begin
        {@10CA-1122}
if ((PRA30_byte(p9CEE)^.a[v2b] = 5) or ((PRA30_byte(p9CEE)^.a[v2b] = 11)
            or (PRA30_byte(p9CEE)^.a[v2b] = 77))) and (PR494_byte(p9CEE)^.v <> 0) then
        begin
          {@110C-1110}
          v9b := 1;
          {@1110-1122}
          v8b := PRA30_byte(p9CEE)^.a[v2b];
        end;
        {@1122-1125}
        Inc(v2b);
      end;
    {@1127-112B}
    v3b := 0;
    for v2b := 0 to 5 do
      case v2b of
        1: begin
          {@113B-1156}
          if (b7FF6 <> 0) or (b7FF7 <> 0) then
            pO108_00AB(1, @v3b);
        end;
        3: begin
          {@115C-1170}
          if b7FF6 <> 0 then
            pO108_00AB(3, @v3b);
        end;
        4: begin
          {@1176-1189}
          if v9b <> 0 then
            pO108_00AB(4, @v3b);
        end;
      else
        {@118B-1199}
        pO108_00AB(v2b, @v3b);
      end;
    {@119F-11A5}
    bAAE5 := v10b;
    {@11A5-11BD}
    v4b := pO108_1009(s278C, s311B, 1, 1);
    {@11BD-11C3}
    v10b := bAAE5;
    if bAAE6 <> 0 then
      case v4b of
        27: v4b := 5;
        72, 80: begin
          {@11DF-11EF}
          pO0EC_0987(p9CEE, 0);
          {@11EF-11F8}
          pO0AA_2F7B(v4b);
          {@11F8-1208}
          pO0EC_0987(p9CEE, 1);
          {@1208-120C}
          v4b := 255;
        end;
      end;
    {@120C-12FB}
    case v4b of
      0: pO0AA_0C9D(@v6b);
      1: pO04F_0F77(@b7FF6, @b7FF7);
      2: pO0B5_0453;
      3: pO0B5_0567;
      4: pO0BB_121C(v8b, 0, 0, @v6b);
      5: begin
        {@126F-127E}
        pO0B5_0E45(@b7FF6, @b7FF7);
        if (b7FF6 <> 0) or (b7FF7 <> 0) then
        begin
          {@128C-12AB}
          pR47F_0498(1, 17, 38, 22, 10, 0, 1, s2525);
          {@12AB-12CA}
          pR47F_0498(1, 17, 38, 22, 15, 0, 0, s254E);
          if Byte(pO108_2254(s278C, b5363)) = b5363 then
            v5b := 1
          else
            pR47F_0F07(1, 17, 38, 22);
        end
        else
          v5b := 1;
      end;
    end;
  until v5b <> 0;
end;

{ 1308 }
procedure pO04F_1308;
var
  v4p: pointer;
  v8p: pointer;
  v9b: byte;
  _f1: array[1..1] of byte;
begin
  {@130E-1312}
  v9b := 1;
  {@1312-131B}
  PR20_byte(p87F8)^.v := 0;
  {@131B-1328}
  v4p := p9CF2;
  {@1328-13FC}
  while v4p <> nil do
  begin
    {@1333-13F9}
    if (PR18_byte(PR487_pointer(v4p)^.v)^.v = 1) or (PR495_byte(v4p)^.v = 1) then
    begin
      {@134D-1352}
      b7FF4 := 1;
      if PR494_byte(v4p)^.v <> 1 then
        Inc(PR20_byte(p87F8)^.v);
      {@1365-1369}
      v9b := 0;
      {@1369-137C}
      v8p := PR483_pointer(v4p)^.v;
      {@137C-1389}
      p9CEE := v4p;
      {@1389-13A4}
      pO075_3770(Ord(PR18_byte(PR487_pointer(v4p)^.v)^.v = 1), 1);
      {@13A4-13B0}
      v4p := v8p;
    end
    else
    begin
      {@13B2-13E6}
      if PR487_pointer(v4p)^.v <> nil then
      begin
        {@13C1-13D7}
        FreeMem(PR487_pointer(v4p)^.v, 22);
        {@13D7-13E6}
        PR487_pointer(v4p)^.v := nil;
      end;
      {@13E6-13F9}
      v4p := PR483_pointer(v4p)^.v;
    end;
  end;
  {@13FC-140A}
  p9CEE := p9CF2;
end;

{ 145F }
procedure pO04F_145F;
var
  v4p: pointer;
  v8p: pointer;
  v12p: pointer;
  _f1: array[1..2] of byte;
  v8b: byte absolute v8p;
begin
  if false then begin
    if LV = 'The monsters rejoice for the party has been destroyed.' then;
    if LV = 'Press any key to continue' then;
    LP1('The monsters rejoice for the party has been destroyed.');
  end;
  asm
  db 191,30,176,30,87,184,6,0,80
  call XR670_046E
  db 198,6,244,127,0,128,62,14,136,0,117,4
  push cs
  call near ptr pO04F_072B
  end;
  {@1483-1488}
  b880C := 6;
  {@1488-148C}
  pO04F_1308;
  {@148C-1496}
  if b880E <> 0 then
    Exit;
  {@1496-14A3}
  v12p := p9CF2;
  {@14A3-14A8}
  bB01F := 1;
  {@14A8-14D0}
  while v12p <> nil do
  begin
    {@14B0-14BB}
    pO0EC_0EBF(v12p);
    {@14BB-14CE}
    v12p := PR483_pointer(v12p)^.v;
  end;
  {@14D0-15F5}
  if b8814 = 0 then
  begin
    {@14DA-1533}
    if b7FF5 <> 0 then
    begin
      {@14E1-14EE}
      v4p := pA7CA;
      {@14EE-151F}
      while v4p <> nil do
      begin
        {@14F6-1502}
        v8p := v4p;
        {@1502-1513}
        v4p := PR42_pointer(v4p)^.v;
        {@1513-151D}
        pR670_03ED(@v8b);
      end;
      {@151F-1527}
      pA7CA := nil;
    end
    else
    begin
      {@1529-152E}
      bB01E := 1;
      {@152E-1533}
      bB01F := 0;
    end;
    {@1533-1558}
    if b880E = 0 then
      asm
  db 255,54,125,197,255,54,123,197
  push cs
  call near ptr pO04F_0B99
  db 128,62,246,127,0,117,7,128,62,247,127,0,116,4
  push cs
  call near ptr pO04F_107C
      end;
    {@1558-1565}
    v4p := pA7CA;
    {@1565-1596}
    while v4p <> nil do
    begin
      {@156D-1579}
      v8p := v4p;
      {@1579-158A}
      v4p := PR42_pointer(v4p)^.v;
      {@158A-1594}
      pR670_03ED(@v8b);
    end;
    {@1596-159E}
    pA7CA := nil;
  end
  else
  begin
    {@15A0-15A8}
    pR142_00D4(0);
    {@15A8-15AD}
    b9D92 := 2;
    {@15AD-15B2}
    b9D93 := 6;
    {@15B2-15DB}
    pR47F_0498(2, 5, 37, 22, 10, 0, 1, 'The monsters rejoice for the party has been destroyed.');
    {@15DB-15F5}
    pR47F_0B2E(13, 0, 'Press any key to continue');
  end;
  {@15F5-15FA}
  b8815 := 1;
  {@15FA-1602}
  PR0_byte(p87F8)^.v := 0;
  {@1602-160B}
  PR46_byte(p87F8)^.v := 0;
  {@160B-1614}
  PR27_byte(p87F8)^.v := 0;
  {@1614-161D}
  PR29_byte(p87F8)^.v := 0;
  {@161D-1626}
  PR28_byte(p87F8)^.v := 0;
  {@1626-162F}
  PR30_byte(p87F8)^.v := 0;
  {@162F-1634}
  pO0EC_3E0E;
end;

{ 1638 }
begin
end.

