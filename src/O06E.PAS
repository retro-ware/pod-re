{ O06E: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O06E;

interface

uses GAMEDATA;

procedure pO06E_033C(a0: pointer; a1: pointer);
function pO06E_0450: byte;
procedure pO06E_07FF(a0: byte);
procedure pO06E_09F2(a0: pointer);
procedure pO06E_0AD8(a0: pointer; a1: S8);
procedure pO06E_10BA(a0: string; a1: pointer; a2: byte; a3: byte);
procedure pO06E_1AA3(a0: byte; a1: byte; a2: pointer);
procedure pO06E_1E05(a0: byte);
procedure pO06E_203E(a0: byte);
procedure pO06E_2989(a0: byte; a1: byte);
procedure pO06E_1EA6(a0: pointer);
procedure pO06E_30B1(a0: pointer; a1: pointer);
procedure pO06E_3314(a0: string);

implementation

uses LIT, Dos, O075, O0E2, O0EC, O102, O108, O111, O12A, O13E, O17E, R1C3, R47F, R5C0, R5C3, R670;

type
  E2_byte = record f: byte; _r: array[1..1] of byte end;
  E8_pointer = record f: pointer; _r: array[1..4] of byte end;
  X63 = array[0..62] of byte;
  R0_X63 = record v: X63 end;
  X9 = array[0..8] of byte;
  R0_X9 = record v: X9 end;
  R0_byte = record v: byte end;
  R0_longint = record v: longint end;
  R0_pointer = record v: pointer end;
  R0_string = record v: string end;
  R0_string_15_ = record v: string[15] end;
  R0_string_40_ = record v: string[40] end;
  R105_byte = record _p: array[1..105] of byte; v: byte end;
  R171_byte = record _p: array[1..171] of byte; v: byte end;
  R173_byte = record _p: array[1..173] of byte; v: byte end;
  R178_byte = record _p: array[1..178] of byte; v: byte end;
  R18_byte = record _p: array[1..18] of byte; v: byte end;
  R18_word = record _p: array[1..18] of byte; v: word end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R231_byte = record _p: array[1..231] of byte; v: byte end;
  R23_pointer = record _p: array[1..23] of byte; v: pointer end;
  R242_byte = record _p: array[1..242] of byte; v: byte end;
  R267_byte = record _p: array[1..267] of byte; v: byte end;
  R287_byte = record _p: array[1..287] of byte; v: byte end;
  R299_byte = record _p: array[1..299] of byte; v: byte end;
  R304_byte = record _p: array[1..304] of byte; v: byte end;
  R305_byte = record _p: array[1..305] of byte; v: byte end;
  R313_byte = record _p: array[1..313] of byte; v: byte end;
  R314_byte = record _p: array[1..314] of byte; v: byte end;
  R31_byte = record _p: array[1..31] of byte; v: byte end;
  R323_pointer = record _p: array[1..323] of byte; v: pointer end;
  R327_byte = record _p: array[1..327] of byte; v: byte end;
  R331_byte = record _p: array[1..331] of byte; v: byte end;
  R339_byte = record _p: array[1..339] of byte; v: byte end;
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R352_byte = record _p: array[1..352] of byte; v: byte end;
  R358_byte = record _p: array[1..358] of byte; v: byte end;
  R369_byte = record _p: array[1..369] of byte; v: byte end;
  R379_byte = record _p: array[1..379] of byte; v: byte end;
  R380_byte = record _p: array[1..380] of byte; v: byte end;
  R390_byte = record _p: array[1..390] of byte; v: byte end;
  R399_byte = record _p: array[1..399] of byte; v: byte end;
  R410_byte = record _p: array[1..410] of byte; v: byte end;
  R412_byte = record _p: array[1..412] of byte; v: byte end;
  R41_byte = record _p: array[1..41] of byte; v: byte end;
  R420_byte = record _p: array[1..420] of byte; v: byte end;
  R421_byte = record _p: array[1..421] of byte; v: byte end;
  R422_byte = record _p: array[1..422] of byte; v: byte end;
  R423_byte = record _p: array[1..423] of byte; v: byte end;
  R423_pointer = record _p: array[1..423] of byte; v: pointer end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  R46_byte = record _p: array[1..46] of byte; v: byte end;
  R483_longint = record _p: array[1..483] of byte; v: longint end;
  R483_pointer = record _p: array[1..483] of byte; v: pointer end;
  R487_longint = record _p: array[1..487] of byte; v: longint end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  R50_byte = record _p: array[1..50] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  R5_pointer = record _p: array[1..5] of byte; v: pointer end;
  R61_byte = record _p: array[1..61] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  RA27_byte = record _p: array[1..27] of byte; a: array[0..32000] of byte end;
W16_25_1AA3 = record case byte of 0: (_p0: array[1..323] of byte; _w25_323longint: longint);
      1: (_p1: array[1..423] of byte; _w25_423longint: longint); 2: (_p2: array[1..483] of byte;
      _w25_483longint: longint); 3: (_p3: array[1..487] of byte; _w25_487longint: longint) end;
W18_25_1AA3 = record case byte of 0: (_p0: array[1..337] of byte; _w25_337abyte: array[0..32000] of byte);
      1: (_p1: array[1..379] of byte; _w25_379byte: byte) end;
W1_41_07FF = record case byte of 0: (_p0: array[1..410] of byte; _w41_410byte: byte);
      1: (_p1: array[1..411] of byte; _w41_411byte: byte); 2: (_p2: array[1..412] of byte;
      _w41_412byte: byte); 3: (_p3: array[1..413] of byte; _w41_413byte: byte);
      4: (_p4: array[1..413] of byte; _w41_413abyte: array[0..32000] of byte) end;
W66_1020_10BA = record case byte of 0: (_p0: array[1..313] of byte; _w1020_313byte: byte);
      1: (_p1: array[1..344] of byte; _w1020_344abyte: array[0..32000] of byte) end;
W86_1020_10BA = record case byte of 0: (_p0: array[1..313] of byte; _w1020_313byte: byte);
      1: (_p1: array[1..344] of byte; _w1020_344abyte: array[0..32000] of byte) end;
  W8_16_1EA6 = record case byte of 0: (_p0: array[1..412] of byte; _w16_412byte: byte) end;
  PR0_X63 = ^R0_X63;
  PR0_X9 = ^R0_X9;
  PR0_byte = ^R0_byte;
  PR0_longint = ^R0_longint;
  PR0_pointer = ^R0_pointer;
  PR0_string = ^R0_string;
  PR0_string_15_ = ^R0_string_15_;
  PR0_string_40_ = ^R0_string_40_;
  PR105_byte = ^R105_byte;
  PR171_byte = ^R171_byte;
  PR173_byte = ^R173_byte;
  PR178_byte = ^R178_byte;
  PR18_byte = ^R18_byte;
  PR18_word = ^R18_word;
  PR22_byte = ^R22_byte;
  PR231_byte = ^R231_byte;
  PR23_pointer = ^R23_pointer;
  PR242_byte = ^R242_byte;
  PR267_byte = ^R267_byte;
  PR287_byte = ^R287_byte;
  PR299_byte = ^R299_byte;
  PR304_byte = ^R304_byte;
  PR305_byte = ^R305_byte;
  PR313_byte = ^R313_byte;
  PR314_byte = ^R314_byte;
  PR31_byte = ^R31_byte;
  PR323_pointer = ^R323_pointer;
  PR327_byte = ^R327_byte;
  PR331_byte = ^R331_byte;
  PR339_byte = ^R339_byte;
  PR33_byte = ^R33_byte;
  PR352_byte = ^R352_byte;
  PR358_byte = ^R358_byte;
  PR369_byte = ^R369_byte;
  PR379_byte = ^R379_byte;
  PR380_byte = ^R380_byte;
  PR390_byte = ^R390_byte;
  PR399_byte = ^R399_byte;
  PR410_byte = ^R410_byte;
  PR412_byte = ^R412_byte;
  PR41_byte = ^R41_byte;
  PR420_byte = ^R420_byte;
  PR421_byte = ^R421_byte;
  PR422_byte = ^R422_byte;
  PR423_byte = ^R423_byte;
  PR423_pointer = ^R423_pointer;
  PR42_pointer = ^R42_pointer;
  PR46_byte = ^R46_byte;
  PR483_longint = ^R483_longint;
  PR483_pointer = ^R483_pointer;
  PR487_longint = ^R487_longint;
  PR493_byte = ^R493_byte;
  PR50_byte = ^R50_byte;
  PR57_byte = ^R57_byte;
  PR5_pointer = ^R5_pointer;
  PR61_byte = ^R61_byte;
  PRA0_byte = ^RA0_byte;
  PRA27_byte = ^RA27_byte;
  PW16_25_1AA3 = ^W16_25_1AA3;
  PW18_25_1AA3 = ^W18_25_1AA3;
  PW1_41_07FF = ^W1_41_07FF;
  PW66_1020_10BA = ^W66_1020_10BA;
  PW86_1020_10BA = ^W86_1020_10BA;
  PW8_16_1EA6 = ^W8_16_1EA6;
var
  a09AC_ec3f: array[0..32759] of byte absolute d09AC;
  a09AE_2fc5: array[0..16379] of word absolute d09AE;
  a09B2_2fc5: array[0..16379] of word absolute d09B2;
  a09B5_ec3f: array[0..32759] of byte absolute d09B5;
  a6DB2_ec3f: array[0..32759] of byte absolute d6DB2;
  a6DDD_ec3f: array[0..32759] of byte absolute d6DDD;
  a7D08_ec3f: array[0..32759] of byte absolute d7D08;
  a9DC4_7c92: array[0..4094] of E8_pointer absolute d9DC4;
  a9DC8_7c92: array[0..4094] of E8_pointer absolute d9DC8;
  aAB0E_71c0: array[0..16379] of E2_byte absolute dAB0E;
  b5362: byte absolute d5362;
  b5363: byte absolute d5363;
  b880C: byte absolute d880C;
  b880D: byte absolute d880D;
  b8810: byte absolute d8810;
  b8811: byte absolute d8811;
  b8834: byte absolute d8834;
  b94D4: byte absolute d94D4;
  b94D5: byte absolute d94D5;
  bA7BE: byte absolute dA7BE;
  bA9F3: byte absolute dA9F3;
  bA9F8: byte absolute dA9F8;
  bA9FA: byte absolute dA9FA;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bAE83: byte absolute dAE83;
  bD21E: byte absolute dD21E;
  bD924: byte absolute dD924;
  bD925: byte absolute dD925;
  g93D5_579f: char absolute d93D5;
  gD51E_9554: B768 absolute dD51E;
  gD925_579f: char absolute dD925;
  iA9F8: integer absolute dA9F8;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  p9CF2: pointer absolute d9CF2;
  p9E1C: pointer absolute d9E1C;
  p9E20: pointer absolute d9E20;
  pA7CA: pointer absolute dA7CA;
  pD926: pointer absolute dD926;
  s099C: string absolute d099C;
  s1F8C: string absolute d1F8C;
  s1FB5: string absolute d1FB5;
  s1FDE: string absolute d1FDE;
  s2007: string absolute d2007;
  s2030: string absolute d2030;
  s2059: string absolute d2059;
  s2082: string absolute d2082;
  s20AB: string absolute d20AB;
  s20D4: string absolute d20D4;
  s28D4: string absolute d28D4;
  s28FD: string absolute d28FD;
  s2926: string absolute d2926;
  s294F: string absolute d294F;
  s2E1B: string absolute d2E1B;
  s2E96: string absolute d2E96;
  s2EBF: string absolute d2EBF;
  s3E0A: string absolute d3E0A;
  s8750: string absolute d8750;
  s92D4: string absolute d92D4;
  s93D4: string absolute d93D4;
  sbAE83: shortint absolute dAE83;

procedure pO06E_0723(a0: pointer; a1: pointer); far; forward;

{ 033C }
procedure pO06E_033C(a0: pointer; a1: pointer);
  { 0000 }
  procedure pO06E_0000(b0: S80; b1: word; b2: word; b3: word; b4: pointer; b5: pointer);
  var
  c144: record case byte of 0: (w144a: SearchRec); 1: (_p1: array[1..30] of byte; w114a: string[32]);
        2: (_p2: array[1..43] of byte; w101p: pointer); 3: (_p3: array[1..47] of byte; w97p: pointer);
        4: (_p4: array[1..51] of byte; w93p: pointer); 5: (_p5: array[1..55] of byte; w89p: pointer);
        6: (_p6: array[1..59] of byte; w85p: pointer) end;
    w146w: word;
    w274a: file;
    _f1: array[1..81] of byte;
    w356b: byte;
    _f2: array[1..17] of byte;
  begin
    {@001A-0022}
    c144.w85p := nil;
    {@0022-002A}
    c144.w93p := nil;
    {@002A-003D}
    FindFirst(b0, 0, c144.w144a);
    {@003D-032B}
    while word(Doserror) = 0 do
    begin
      {@0047-009A}
      if bAE83 = 1 then
        Assign(w274a, s93D4 + c144.w114a)
      else
        Assign(w274a, s92D4 + c144.w114a);
      {@009A-00A9}
      Reset(w274a, 1);
      if b3 = FileSize(w274a) then
      begin
        {@00CB-00DA}
        GetMem(c144.w85p, 46);
        {@00DA-00E9}
        GetMem(c144.w93p, 46);
        {@00E9-00F7}
        XR670_046E(@PR0_byte(c144.w85p)^.v, 46);
        {@00F7-0105}
        XR670_046E(@PR0_byte(c144.w93p)^.v, 46);
        {@0105-0117}
        Seek(w274a, b1);
        {@0117-0131}
        BlockRead(w274a, PR0_byte(c144.w85p)^.v, 16, w146w);
        {@0131-0143}
        Seek(w274a, b2);
        {@0143-015C}
        BlockRead(w274a, w356b, 1);
        {@015C-016F}
        PR0_string_40_(c144.w93p)^.v := c144.w114a;
        {@016F-01B6}
        PR0_string_40_(c144.w85p)^.v := PR0_string(c144.w85p)^.v + Copy(s099C, 1, 15 - PR0_byte(c144.w85p)^.v);
        {@01B6-01C3}
        c144.w101p := p9CF2;
        {@01C3-0238}
  while (c144.w101p <> nil) and (Copy(PR0_string(c144.w85p)^.v, 1, 15) <> (PR0_string(c144.w101p)^.v
      + Copy(s099C, 1,
            15 - PR0_byte(c144.w101p)^.v))) do
          c144.w101p := PR483_pointer(c144.w101p)^.v;
        {@0238-0275}
        if (w356b > 127) or (c144.w101p <> nil) then
        begin
          {@0247-0256}
          FreeMem(c144.w85p, 46);
          {@0256-0265}
          FreeMem(c144.w93p, 46);
          {@0265-026D}
          c144.w85p := nil;
          {@026D-0275}
          c144.w93p := nil;
        end;
        {@0275-0312}
        if c144.w85p <> nil then
        begin
          {@0280-0312}
          if PR0_pointer(b4)^.v = nil then
          begin
            {@028C-029C}
            PR0_pointer(b4)^.v := c144.w85p;
            {@029C-02AC}
            c144.w89p := PR0_pointer(b4)^.v;
            {@02AC-02BC}
            PR0_pointer(b5)^.v := c144.w93p;
            {@02BC-02CC}
            c144.w97p := PR0_pointer(b5)^.v;
          end
          else
          begin
            {@02CE-02DF}
            PR42_pointer(c144.w89p)^.v := c144.w85p;
            {@02DF-02F0}
            c144.w89p := PR42_pointer(c144.w89p)^.v;
            {@02F0-0301}
            PR42_pointer(c144.w97p)^.v := c144.w93p;
            {@0301-0312}
            c144.w97p := PR42_pointer(c144.w97p)^.v;
          end;
        end;
      end;
      {@0312-031D}
      Close(w274a);
      {@031D-0328}
      FindNext(c144.w144a);
    end;
  end;

begin
  if false then begin
    if LV = '*.who' then;
    if LV = '*.pc' then;
  end;
  {@0343-034F}
  PR0_longint(a0)^.v := 0;
  {@034F-035B}
  PR0_longint(a1)^.v := 0;
  {@035B-0366}
  if pO06E_0450 = 0 then
    Exit;
  {@0366-040F}
  case bAE83 of
0: pO06E_0000(s92D4 + '*.who', a09AC_ec3f[sbAE83], a09AE_2fc5[sbAE83], a09B2_2fc5[sbAE83],
        @PR0_byte(a0)^.v, @PR0_byte(a1)^.v);
1: pO06E_0000(s93D4 + '*.pc', a09AC_ec3f[sbAE83], a09AE_2fc5[sbAE83], a09B2_2fc5[sbAE83],
        @PR0_byte(a0)^.v, @PR0_byte(a1)^.v);
  end;
end;

{ 0450 }
function pO06E_0450: byte;
var
  v3w: word;
  v46a: SearchRec;
  v47b: byte;
c303: record case byte of 0: (v303a: string); 1: (v303b: byte); 2: (_p2: array[1..1] of byte; v302a: char);
      3: (_p3: array[1..1] of byte; v302b: byte) end;
  v3b: byte absolute v3w;
begin
  if false then begin
    if LV = 'SECRET' then;
    if LV = 'Put save disk in ' then;
    if LV = ':' then;
    if LSV = [0, 5] then;
  end;
  {@0457-045B}
  pO06E_0450 := 0;
  case bAE83 of
    1: c303.v303a := s93D4;
    2: c303.v303a := s8750;
  else
    {@0492-04A6}
    c303.v303a := s92D4;
  end;
  {@04A6-0718}
  repeat
    {@04A6-0510}
    while (pR5C3_02A3(c303.v302a) = 'SECRET') and (c303.v302b < 67) do
      pR47F_0B2E(14, 0, 'Put save disk in ' + c303.v302a + ':');
    {@0510-0705}
    repeat
      {@0510-053B}
      FindFirst(Copy(c303.v303a, 1, c303.v303b - 1), 16, v46a);
      {@053B-0541}
      v3w := word(Doserror);
      case v3w of
        0: ;
        2, 18: begin
          {@0559-062C}
          if Ord(UpCase(c303.v302a)) < 67 then
          begin
            {@056A-05E9}
            if bAE83 = 1 then
              v47b := pO108_2254(s1FB5 + c303.v302a + s1FDE, b5362)
            else
              v47b := pO108_2254(s1F8C + c303.v302a + s1FDE, b5362);
            {@05E9-062C}
            if v47b <> b5362 then
              pR47F_0B2E(14, 0, 'Put save disk in ' + c303.v302a + ':');
          end;
          {@062C-0675}
          if bAE83 = 1 then
            MkDir(Copy(s93D4, 1, Length(s93D4) - 1))
          else
            MkDir(Copy(s92D4, 1, Length(s92D4) - 1));
          {@0675-067B}
          v3w := word(Doserror);
        end;
      else
        {@067D-06F2}
        if Ord(UpCase(c303.v302a)) < 67 then
          pR47F_0B2E(14, 0, 'Put save disk in ' + c303.v302a + ':')
        else
        begin
          {@06C7-06F0}
          if bAE83 = 0 then
            pR47F_0B2E(14, 0, s2030)
          else
            pR47F_0B2E(14, 0, s2007);
          {@06F0-06F2}
          Exit;
        end;
      end;
    until v3b in [0, 5];
  until v3b in [0, 5];
  {@0718-071C}
  pO06E_0450 := 1;
end;

{ 0723 }
procedure pO06E_0723(a0: pointer; a1: pointer);
var
  _f1: array[1..2] of byte;
  v4w: word;
begin
  {@0729-07ED}
  for v4w := 0 to PR18_word(a0)^.v - 1 do
  begin
    {@0746-07A4}
    if b8834 = 2 then
    begin
      {@074D-077A}
      if PRA27_byte(a0)^.a[v4w] <> PR22_byte(a0)^.v then
        PRA27_byte(a1)^.a[v4w] := PRA27_byte(a0)^.a[v4w];
    end
    else
      PRA27_byte(a1)^.a[v4w] := PRA27_byte(a1)^.a[v4w] or PRA27_byte(a0)^.a[v4w];
    {@07A4-07E2}
    if PR23_pointer(a1)^.v <> nil then
PRA0_byte(PR23_pointer(a1)^.v)^.a[v4w] := PRA0_byte(PR23_pointer(a1)^.v)^.a[v4w]
          and PRA0_byte(PR23_pointer(a0)^.v)^.a[v4w];
  end;
end;

{ 07FF }
procedure pO06E_07FF(a0: byte);
var
  v19a: array[0..18] of byte;
  v35a: array[0..15] of byte;
  v36b: byte;
  _f1: array[1..1] of byte;
  v19a2: B16 absolute v19a;
  v35a2: B16 absolute v35a;
begin
  if false then begin
    if LV = 'CHEAD' then;
    if LV = 'CBODY' then;
  end;
  {@0806-09D1}
  with PW1_41_07FF(p9CEE)^ do
  begin
    pO13E_0182('CHEAD' + Chr(a09B5_ec3f[_w41_413byte]), _w41_410byte, 11);
    pO13E_0182('CBODY' + Chr(a09B5_ec3f[_w41_413byte]), _w41_411byte, _w41_412byte);
    pO06E_0723(p9E1C, pointer(a9DC4_7c92[_w41_412byte].f));
    pO06E_0723(p9E20, pointer(a9DC8_7c92[_w41_412byte].f));
    if a0 <> 0 then
    begin
      {@08EB-0914}
      for v36b := 0 to 15 do
      begin
        {@08F4-0901}
        v19a[v36b] := v36b;
        {@0901-090E}
        v35a[v36b] := v36b;
      end;
      {@0914-0977}
      for v36b := 1 to 6 do
      begin
        {@091D-0942}
        v35a[a6DDD_ec3f[v36b]] := _w41_413abyte[v36b] and 15;
        {@0942-0971}
        v35a[a6DDD_ec3f[v36b] + 8] := _w41_413abyte[v36b] and 240 shr 4;
      end;
      {@0977-09A4}
      pR1C3_1421(v19a2, v35a2, 0, 0, pointer(a9DC4_7c92[_w41_412byte].f));
      {@09A4-09D1}
      pR1C3_1421(v19a2, v35a2, 0, 0, pointer(a9DC8_7c92[_w41_412byte].f));
    end;
  end;
  {@09D1-09D9}
  pO13E_0101(11);
  {@09D9-09DE}
  pR670_0311;
end;

{ 09F2 }
procedure pO06E_09F2(a0: pointer);
var
  v81a: string[80];
  _f1: array[1..128] of byte;
  v81a2: string[80] absolute v81a;
begin
  if false then begin
    if LV = '.pc' then;
    if LV = '.thg' then;
    if LV = '.efx' then;
  end;
  {@09F9-0A2C}
  v81a := s93D4 + pR5C3_0677(PR0_string(a0)^.v);
  {@0A2C-0A4B}
  pR5C3_0174(v81a2 + '.pc');
  {@0A4B-0A6A}
  pR5C3_0174(v81a2 + '.thg');
  {@0A6A-0A89}
  pR5C3_0174(v81a2 + '.efx');
end;

{ 0AD8 }
procedure pO06E_0AD8(a0: pointer; a1: S8);
var
c183: record case byte of 0: (v183a2: string[173]); 1: (v183a: string[4]); 2: (_p2: array[1..5] of byte;
      v178a2: string[168]); 3: (_p3: array[1..5] of byte; v178a: string[40]); 4: (_p4: array[1..5] of byte;
      v178b: byte); 5: (_p5: array[1..46] of byte; v137a: file) end;
  v184b: byte;
  _f1: array[1..1] of byte;
  v189p: pointer;
  v193p: pointer;
  _f2: array[1..24] of byte;
  v219w: word;
  v221w: word;
  _f3: array[1..1] of byte;
  c478: record case byte of 0: (v478a: string); 1: (_p1: array[1..1] of byte; v477a: char) end;
  v219b: byte absolute v219w;
begin
  if false then begin
    if LV = '.pc' then;
    if LV = '.' then;
    if LV = '.sav' then;
    if LSV = [0, 2] then;
    if LV = 'Put save disk in ' then;
    if LV = ':' then;
    if LV = '.thg' then;
    if LV = '.efx' then;
  end;
  {@0AF2-0B28}
  if bAE83 <> 2 then
  begin
    {@0AF9-0AFE}
    bAE83 := 1;
    {@0AFE-0B12}
    c478.v478a := s93D4;
  end
  else
    c478.v478a := s8750;
  {@0B28-0C3A}
  repeat
    {@0B28-0B33}
    if pO06E_0450 = 0 then
      Exit;
    {@0B33-0B39}
    v221w := 0;
    {@0B39-0B3F}
    Inc(v221w, 510);
    if PR423_pointer(a0)^.v <> nil then
    begin
      {@0B4E-0B63}
      v189p := PR423_pointer(a0)^.v;
      {@0B63-0B88}
      while v189p <> nil do
      begin
        {@0B6D-0B72}
        Inc(v221w, 63);
        {@0B72-0B86}
        v189p := PR42_pointer(v189p)^.v;
      end;
    end;
    {@0B88-0BD1}
    if PR323_pointer(a0)^.v <> nil then
    begin
      {@0B97-0BAC}
      v193p := PR323_pointer(a0)^.v;
      {@0BAC-0BD1}
      while v193p <> nil do
      begin
        {@0BB6-0BBB}
        Inc(v221w, 9);
        {@0BBB-0BCF}
        v193p := PR5_pointer(v193p)^.v;
      end;
    end;
    {@0BD1-0BD6}
    v184b := 0;
    if v221w > DiskFree(Ord(UpCase(c478.v477a)) - 64) then
    begin
      {@0BFF-0C0F}
      pR47F_0B2E(14, 0, s2059);
      {@0C0F-0C17}
      pO108_00CB(1);
      {@0C17-0C30}
      v184b := pO108_1009(s28D4, s2E96, 0, 0);
    end;
  until v184b = 0;
  {@0C3A-0CB8}
  if Length(a1) = 0 then
  begin
    {@0C40-0C54}
    c183.v183a := '.pc';
    {@0C54-0C8E}
    c183.v178a := pR5C3_0677(pR5C3_05A8(PR0_string(a0)^.v, '.'));
  end
  else
  begin
    {@0C90-0CA4}
    c183.v183a := '.sav';
    {@0CA4-0CB8}
    c183.v178a := a1;
  end;
  {@0CB8-0D8A}
  repeat
    {@0CB8-0CEA}
    Assign(c183.v137a, c478.v478a + c183.v178a2 + c183.v183a2);
    {@0CEA-0CF9}
    Reset(c183.v137a, 1);
    {@0CF9-0D00}
    v219w := word(Doserror);
    if not (v219b in [0, 2]) then
    begin
      {@0D11-0D79}
      if Ord(UpCase(c478.v477a)) < 67 then
        pR47F_0B2E(14, 0, 'Put save disk in ' + c478.v477a + ':')
      else
      begin
        {@0D5B-0D6B}
        pR47F_0B2E(14, 0, s2007);
        {@0D6B-0D76}
        Close(c183.v137a);
        {@0D76-0D79}
        Exit;
      end;
    end;
  until (v219w = 0) or (v219w = 2);
  {@0D8A-0D95}
  Close(c183.v137a);
  {@0D95-0D9A}
  v184b := 1;
  {@0D9A-0E66}
  while (v184b = 1) and (Length(a1) = 0) and (pR5C3_055E(c478.v478a + c183.v178a2 + c183.v183a2) <> 0) do
  begin
    {@0DE0-0E12}
    v184b := pO108_2254(s2082 + c183.v178a2 + s20AB, b5363);
    if v184b = 1 then
    begin
      {@0E19-0E1E}
      c183.v178b := 0;
      {@0E1E-0E4F}
      while c183.v178b = 0 do
        c183.v178a := pR47F_0711(s20D4, 10, 0, 8);
      {@0E4F-0E63}
      PR0_string_15_(a0)^.v := c183.v178a2;
    end;
  end;
  {@0E66-0E98}
  Assign(c183.v137a, c478.v478a + c183.v178a2 + c183.v183a2);
  {@0E98-0EA7}
  Rewrite(c183.v137a, 1);
  {@0EA7-0EBF}
  BlockWrite(c183.v137a, PR0_byte(a0)^.v, 510);
  {@0EBF-0ECA}
  Close(c183.v137a);
  {@0ECA-0EF5}
  pR5C3_0174(c478.v478a + c183.v178a2 + '.thg');
  if PR423_pointer(a0)^.v <> nil then
  begin
    {@0F07-0F38}
    Assign(c183.v137a, c478.v478a + c183.v178a2 + '.thg');
    {@0F38-0F47}
    Rewrite(c183.v137a, 1);
    {@0F47-0F5C}
    v189p := PR423_pointer(a0)^.v;
    {@0F5C-0F95}
    while v189p <> nil do
    begin
      {@0F66-0F7F}
      BlockWrite(c183.v137a, PR0_byte(v189p)^.v, 63);
      {@0F7F-0F93}
      v189p := PR42_pointer(v189p)^.v;
    end;
    {@0F95-0FA0}
    Close(c183.v137a);
  end;
  {@0FA0-0FCB}
  pR5C3_0174(c478.v478a + c183.v178a2 + '.efx');
  {@0FCB-0FDD}
  if PR323_pointer(a0)^.v = nil then
    Exit;
  {@0FDD-100E}
  Assign(c183.v137a, c478.v478a + c183.v178a2 + '.efx');
  {@100E-101D}
  Rewrite(c183.v137a, 1);
  {@101D-1032}
  v193p := PR323_pointer(a0)^.v;
  {@1032-106B}
  while v193p <> nil do
  begin
    {@103C-1055}
    BlockWrite(c183.v137a, PR0_byte(v193p)^.v, 9);
    {@1055-1069}
    v193p := PR5_pointer(v193p)^.v;
  end;
  {@106B-1076}
  Close(c183.v137a);
end;

{ 10BA }
procedure pO06E_10BA(a0: string; a1: pointer; a2: byte; a3: byte);
var
c443: record case byte of 0: (v443a2: string[186]); 1: (v443a: string[40]); 2: (_p2: array[1..41] of byte;
      v402p: pointer); 3: (_p3: array[1..45] of byte; v398p: pointer); 4: (_p4: array[1..49] of byte;
      v394p: pointer); 5: (_p5: array[1..53] of byte; v390p: pointer); 6: (_p6: array[1..57] of byte;
      v386w: word); 7: (_p7: array[1..59] of byte; v384a: file); 8: (_p8: array[1..59] of byte;
      v384b: byte) end;
  v444b: byte;
  _f1: array[1..292] of byte;
  v737b: byte;
c1004: record case byte of 0: (v1004a2: string); 1: (v1004a: string[4]); 2: (_p2: array[1..5] of byte;
      v999a2: string); 3: (_p3: array[1..5] of byte; v999a: string[4]); 4: (_p4: array[1..11] of byte;
      v993a: string) end;
  v1008p: pointer;
  v1010w: word;
  v1014l: longint;
  v1015b: byte;
  v1016b: byte;
  v1015sb: shortint absolute v1015b;
begin
  if false then begin
    if LV = '.thg' then;
    if LV = '.efx' then;
    if LV = '.stf' then;
    if LV = '.sfx' then;
    if LV = 'Put save disk in ' then;
    if LV = 'Loading...Please Wait' then;
    if LV = '.' then;
  end;
  {@10D5-1198}
  case bAE83 of
    1: begin
      {@10DC-10F0}
      c1004.v993a := s93D4;
      {@10F0-1104}
      c1004.v999a := '.thg';
      {@1104-1118}
      c1004.v1004a := '.efx';
    end;
    2: begin
      {@111E-1132}
      c1004.v993a := s8750;
      {@1132-1146}
      c1004.v999a := '.thg';
      {@1146-115A}
      c1004.v1004a := '.efx';
    end;
  else
    {@115C-1170}
    c1004.v993a := s92D4;
    {@1170-1184}
    c1004.v999a := '.stf';
    {@1184-1198}
    c1004.v1004a := '.sfx';
  end;
  {@1198-11C8}
  if a3 <> 0 then
    c443.v443a := 'Put save disk in '
  else
    c443.v443a := s3E0A;
  {@11C8-11FC}
  v444b := pR5C3_0336(c1004.v993a + a0, c443.v443a2, 0, @c443.v384b);
  {@11FC-121D}
  pR47F_0354(0, 24, 10, 0, 'Loading...Please Wait');
  {@121D-122B}
  XR670_046E(@PR0_byte(a1)^.v, 510);
  case bAE83 of
    0: begin
      {@1235-1246}
      GetMem(v1008p, 439);
      {@1246-1255}
      XR670_046E(@PR0_byte(v1008p)^.v, 439);
      {@1255-1263}
      XR670_046E(@PR0_byte(a1)^.v, 510);
      {@1263-127E}
      BlockRead(c443.v384a, PR0_byte(v1008p)^.v, 439, c443.v386w);
      {@127E-1289}
      Close(c443.v384a);
      {@1289-129D}
      Move(PR0_byte(v1008p)^.v, PR0_byte(a1)^.v, 30);
      {@129D-12B9}
      Move(PR105_byte(v1008p)^.v, PR171_byte(a1)^.v, 126);
      {@12B9-12D5}
      Move(PR231_byte(v1008p)^.v, PR305_byte(a1)^.v, 9);
      {@12D5-12F1}
      Move(PR242_byte(v1008p)^.v, PR314_byte(a1)^.v, 17);
      {@12F1-130D}
      Move(PR267_byte(v1008p)^.v, PR331_byte(a1)^.v, 20);
      {@130D-1329}
      Move(PR287_byte(v1008p)^.v, PR358_byte(a1)^.v, 11);
      {@1329-1345}
      Move(PR299_byte(v1008p)^.v, PR369_byte(a1)^.v, 5);
      {@1345-1361}
      Move(PR304_byte(v1008p)^.v, PR379_byte(a1)^.v, 9);
      {@1361-137D}
      Move(PR313_byte(v1008p)^.v, PR390_byte(a1)^.v, 7);
      {@137D-1399}
      Move(PR327_byte(v1008p)^.v, PR399_byte(a1)^.v, 8);
      {@1399-13B5}
      Move(PR339_byte(v1008p)^.v, PR410_byte(a1)^.v, 12);
      {@13B5-13D1}
      Move(PR352_byte(v1008p)^.v, PR422_byte(a1)^.v, 70);
      {@13D1-13ED}
      Move(PR422_byte(v1008p)^.v, PR493_byte(a1)^.v, 17);
      asm
  db 196,126,10,38,138,133,173,0,254,200,196,126,10,38,136,133,173,0
      end;
      {@13FF-140E}
      PR423_pointer(a1)^.v := nil;
      {@140E-141D}
      PR323_pointer(a1)^.v := nil;
      {@141D-142C}
      PR487_longint(a1)^.v := 0;
      {@142C-143B}
      PR483_longint(a1)^.v := 0;
      {@143B-1444}
      PR420_byte(a1)^.v := 2;
      {@1444-144D}
      PR421_byte(a1)^.v := 2;
      {@144D-145E}
      FreeMem(v1008p, 439);
      with PW86_1020_10BA(a1)^ do
      begin
        _w1020_313byte := 0;
        if PR173_byte(a1)^.v = 5 then
          for v1015b := 0 to 6 do
          begin
            {@1489-14BD}
            if _w1020_344abyte[v1015sb] > _w1020_313byte then
              _w1020_313byte := _w1020_344abyte[v1015sb];
          end;
      end;
      {@14C4-14D0}
      v1016b := PR178_byte(a1)^.v;
      {@14D0-14DE}
      pO0E2_186E(pointer(a1), 4);
      if PR178_byte(a1)^.v < v1016b then
      begin
        {@14EC-1508}
        Inc(PR380_byte(a1)^.v, v1016b - PR178_byte(a1)^.v);
        {@1508-1516}
        pO0E2_186E(pointer(a1), 4);
      end;
    end;
    1, 2: begin
      {@1524-153E}
      BlockRead(c443.v384a, PR0_byte(a1)^.v, 510, c443.v386w);
      {@153E-1549}
      Close(c443.v384a);
      if bAE83 = 2 then
        pR5C3_0174(c1004.v993a + a0);
      {@1571-1580}
      PR423_pointer(a1)^.v := nil;
      {@1580-158F}
      PR323_pointer(a1)^.v := nil;
      {@158F-159E}
      PR487_longint(a1)^.v := 0;
      {@159E-15AD}
      PR483_longint(a1)^.v := 0;
    end;
  end;
  {@15AD-15CD}
  Delete(a0, Pos('.', a0), 4);
  {@15CD-15D2}
  v737b := 0;
  if pR5C3_055E(c1004.v993a + a0 + c1004.v999a2) <> 0 then
  begin
    {@1605-1616}
    GetMem(c443.v394p, 63);
    {@1616-1655}
    v444b := pR5C3_0336(c1004.v993a + a0 + c1004.v999a2, c443.v443a2, 0, @c443.v384b);
    {@1655-165B}
    v1010w := 63;
    if bAE83 = 0 then
      repeat
        {@1665-1680}
        BlockRead(c443.v384a, PR0_byte(c443.v394p)^.v, v1010w, c443.v386w);
        if c443.v386w = v1010w then
        begin
          {@168D-16A6}
          v1014l := FilePos(c443.v384a) + 4;
          {@16A6-16B9}
          Seek(c443.v384a, v1014l);
          if PR46_byte(c443.v394p)^.v = 73 then
          begin
            {@16C4-16E3}
            Inc(v1014l, PR57_byte(c443.v394p)^.v * (v1010w + 4));
            {@16E3-16F6}
            Seek(c443.v384a, v1014l);
          end
          else
          begin
            {@16F9-16FD}
            Inc(v737b);
            if PR423_pointer(a1)^.v = nil then
            begin
              {@170C-171E}
              PR423_pointer(a1)^.v := pR670_037F;
              {@171E-1733}
              c443.v390p := PR423_pointer(a1)^.v;
            end
            else
            begin
              {@1735-1746}
              PR42_pointer(c443.v390p)^.v := pR670_037F;
              {@1746-175A}
              c443.v390p := PR42_pointer(c443.v390p)^.v;
            end;
            {@175A-176E}
            if PR46_byte(c443.v394p)^.v = 45 then
              PR50_byte(c443.v394p)^.v := 2;
            {@176E-1782}
            if PR46_byte(c443.v394p)^.v = 58 then
              PR61_byte(c443.v394p)^.v := 89;
            {@1782-1797}
            PR0_X63(c443.v390p)^.v := PR0_X63(c443.v394p)^.v;
            {@1797-17A5}
            PR42_pointer(c443.v390p)^.v := nil;
          end;
        end;
      until c443.v386w <> v1010w
    else
      repeat
        {@17B5-17D0}
        BlockRead(c443.v384a, PR0_byte(c443.v394p)^.v, v1010w, c443.v386w);
        if c443.v386w = v1010w then
        begin
          {@17DD-17E1}
          Inc(v737b);
          if PR423_pointer(a1)^.v = nil then
          begin
            {@17F0-1802}
            PR423_pointer(a1)^.v := pR670_037F;
            {@1802-1817}
            c443.v390p := PR423_pointer(a1)^.v;
          end
          else
          begin
            {@1819-182A}
            PR42_pointer(c443.v390p)^.v := pR670_037F;
            {@182A-183E}
            c443.v390p := PR42_pointer(c443.v390p)^.v;
          end;
          {@183E-1853}
          PR0_X63(c443.v390p)^.v := PR0_X63(c443.v394p)^.v;
          {@1853-1861}
          PR42_pointer(c443.v390p)^.v := nil;
        end;
      until c443.v386w <> v1010w;
    {@186E-1879}
    Close(c443.v384a);
    if bAE83 = 2 then
      pR5C3_0174(c1004.v993a + a0 + c1004.v999a2);
    {@18AC-18BD}
    FreeMem(c443.v394p, 63);
  end;
  {@18BD-1A46}
  if pR5C3_055E(c1004.v993a + a0 + c1004.v1004a2) <> 0 then
  begin
    {@18F0-1901}
    GetMem(c443.v402p, 9);
    {@1901-1940}
    v444b := pR5C3_0336(c1004.v993a + a0 + c1004.v1004a2, c443.v443a2, 0, @c443.v384b);
    {@1940-19F7}
    repeat
      {@1940-195B}
      BlockRead(c443.v384a, PR0_byte(c443.v402p)^.v, 9, c443.v386w);
      if c443.v386w = 9 then
      begin
        {@1965-19CA}
        if PR323_pointer(a1)^.v = nil then
        begin
          {@1974-198A}
          GetMem(PR323_pointer(a1)^.v, 9);
          {@198A-199F}
          c443.v398p := PR323_pointer(a1)^.v;
        end
        else
        begin
          {@19A1-19B6}
          GetMem(PR5_pointer(c443.v398p)^.v, 9);
          {@19B6-19CA}
          c443.v398p := PR5_pointer(c443.v398p)^.v;
        end;
        {@19CA-19DF}
        PR0_X9(c443.v398p)^.v := PR0_X9(c443.v402p)^.v;
        {@19DF-19ED}
        PR5_pointer(c443.v398p)^.v := nil;
      end;
    until c443.v386w <> 9;
    {@19F7-1A02}
    Close(c443.v384a);
    if bAE83 = 2 then
      pR5C3_0174(c1004.v993a + a0 + c1004.v1004a2);
    {@1A35-1A46}
    FreeMem(c443.v402p, 9);
  end;
  {@1A46-1A4B}
  pR670_0311;
  {@1A4B-1A56}
  pO0EC_0EBF(pointer(a1));
  {@1A56-1A64}
  pO0E2_186E(pointer(a1), 0);
  {@1A64-1A6F}
  pO102_02F5(pointer(a1));
end;

{ 1AA3 }
procedure pO06E_1AA3(a0: byte; a1: byte; a2: pointer);
var
c18: record case byte of 0: (v18a2: string[17]); 1: (v18a: string[1]); 2: (_p2: array[1..2] of byte;
      v16p: pointer); 3: (_p3: array[1..6] of byte; v12p: pointer); 4: (_p4: array[1..10] of byte;
      v8w: word); 5: (_p5: array[1..12] of byte; v6p: pointer); 6: (_p6: array[1..12] of byte; v6b: byte);
      7: (_p7: array[1..16] of byte; v2w: word); 8: (_p8: array[1..16] of byte; v2b: byte) end;
  _f1: array[1..2] of byte;
  v21b: byte;
  v21sb: shortint absolute v21b;
begin
  if false then begin
    if LV = '1' then;
    if LV = 'MON' then;
    if LV = 'CHA' then;
    if LV = '.dax' then;
    if LV = 'Unable to load monster' then;
    if LV = 'SPC' then;
    if LV = 'ITM' then;
  end;
  {@1AAA-1ABD}
  c18.v18a := '1';
  {@1ABD-1B04}
  pR5C3_0915('MON' + c18.v18a2 + 'CHA', '.dax', a0, @c18.v2b, @c18.v6b);
  if c18.v2w = 0 then
  begin
    {@1B0A-1B24}
    pR47F_0B2E(15, 0, 'Unable to load monster');
    {@1B24-1B2C}
    pR670_0000(0);
  end;
  {@1B2C-1B3F}
  Move(PR0_byte(c18.v6p)^.v, PR0_byte(a2)^.v, 510);
  with PW16_25_1AA3(a2)^ do
  begin
    _w25_423longint := 0;
    _w25_323longint := 0;
    _w25_483longint := 0;
    _w25_487longint := 0;
  end;
  pR5C0_0000(c18.v6p, c18.v2w);
  b94D4 := 1;
  pR5C3_0915('MON' + c18.v18a2 + 'SPC', '.dax', a0, @c18.v2b, @c18.v6b);
  if c18.v2w <> 0 then
  begin
    {@1BE7-1BEC}
    c18.v8w := 0;
    {@1BEC-1C02}
    GetMem(PR323_pointer(a2)^.v, 9);
    {@1C02-1C15}
    c18.v16p := PR323_pointer(a2)^.v;
    {@1C15-1C73}
    repeat
      {@1C15-1C2D}
      Move(PRA0_byte(c18.v6p)^.a[c18.v8w], PR0_byte(c18.v16p)^.v, 9);
      {@1C2D-1C3A}
      PR5_pointer(c18.v16p)^.v := nil;
      {@1C3A-1C3E}
      Inc(c18.v8w, 9);
      if c18.v8w < c18.v2w then
      begin
        {@1C46-1C5A}
        GetMem(PR5_pointer(c18.v16p)^.v, 9);
        {@1C5A-1C6B}
        c18.v16p := PR5_pointer(c18.v16p)^.v;
      end;
    until c18.v8w >= c18.v2w;
    {@1C73-1C81}
    pR5C0_0000(c18.v6p, c18.v2w);
  end;
  {@1C81-1CC8}
  pR5C3_0915('MON' + c18.v18a2 + 'ITM', '.dax', a0, @c18.v2b, @c18.v6b);
  if c18.v2w <> 0 then
  begin
    {@1CD1-1CD6}
    c18.v8w := 0;
    if a1 <> 0 then
      PR423_pointer(a2)^.v := pR670_037F
    else
      GetMem(PR423_pointer(a2)^.v, 63);
    {@1D06-1D19}
    c18.v12p := PR423_pointer(a2)^.v;
    {@1D19-1D9E}
    repeat
      {@1D19-1D35}
      Move(PRA0_byte(c18.v6p)^.a[c18.v8w], PR46_byte(c18.v12p)^.v, 17);
      {@1D35-1D42}
      PR42_pointer(c18.v12p)^.v := nil;
      {@1D42-1D4A}
      PR41_byte(c18.v12p)^.v := 0;
      {@1D4A-1D4E}
      Inc(c18.v8w, 17);
      if c18.v8w < c18.v2w then
      begin
        {@1D56-1D82}
        if a1 <> 0 then
          PR42_pointer(c18.v12p)^.v := pR670_037F
        else
          GetMem(PR42_pointer(c18.v12p)^.v, 63);
        {@1D82-1D93}
        c18.v12p := PR42_pointer(c18.v12p)^.v;
      end;
    until c18.v8w >= c18.v2w;
    {@1D9E-1DAC}
    pR5C0_0000(c18.v6p, c18.v2w);
  end;
  {@1DAC-1DB1}
  b94D4 := 0;
  {@1DB1-1DB6}
  pR670_0311;
  with PW18_25_1AA3(a2)^ do
  begin
    _w25_379byte := 0;
    for v21b := 0 to 6 do
    begin
      {@1DD1-1DF4}
      if _w25_337abyte[v21sb] > 0 then
        Inc(_w25_379byte, a6DB2_ec3f[v21sb]);
    end;
  end;
end;

{ 1E05 }
procedure pO06E_1E05(a0: byte);
var
  _f1: array[1..4] of byte;
  v8p: pointer;
  _f2: array[1..1] of byte;
begin
  if false then begin
    if LV = 'CPIC' then;
  end;
  {@1E0B-1E18}
  if PR31_byte(p87F8)^.v > 7 then
    Exit;
  {@1E18-1E27}
  GetMem(v8p, 510);
  {@1E27-1E38}
  pO06E_1AA3(a0, 1, v8p);
  {@1E38-1E42}
  pO06E_1EA6(v8p);
  {@1E42-1E54}
  PR327_byte(v8p)^.v := PR327_byte(v8p)^.v or 128;
  {@1E54-1E5F}
  PR369_byte(v8p)^.v := a0;
  {@1E5F-1E80}
  pO13E_0182('CPIC', a0, PR412_byte(v8p)^.v);
end;

{ 1EA6 }
procedure pO06E_1EA6(a0: pointer);
var
  v4p: pointer;
  v12a: array[0..7] of byte;
  v12b: byte absolute v12a;
begin
  if false then begin
    if LSV = [0..7] then;
  end;
  {@1EAC-1EB5}
  PR412_byte(a0)^.v := 255;
  if p9CF2 = nil then
    p9CF2 := a0
  else
  begin
    {@1ECD-1EDA}
    v4p := p9CF2;
    {@1EDA-1EFE}
    while PR483_pointer(v4p)^.v <> nil do
      v4p := PR483_pointer(v4p)^.v;
    {@1EFE-1F11}
    PR483_pointer(v4p)^.v := a0;
  end;
  {@1F11-1F1E}
  p9CEE := a0;
  {@1F1E-1F2C}
  XR670_046E(@v12b, 8);
  {@1F2C-1F39}
  v4p := p9CF2;
  {@1F39-1F7B}
  while v4p <> nil do
  begin
    {@1F41-1F66}
    if PR412_byte(v4p)^.v in [0..7] then
      v12a[PR412_byte(v4p)^.v] := 1;
    {@1F66-1F79}
    v4p := PR483_pointer(v4p)^.v;
  end;
  {@1F7B-1F8E}
  with PW8_16_1EA6(p9CEE)^ do
  begin
    _w16_412byte := 0;
    {@1F8E-1FB5}
    while (_w16_412byte < 8) and (v12a[_w16_412byte] <> 0) do
      Inc(_w16_412byte);
  end;
  {@1FB5-1FBD}
  Inc(PR31_byte(p87F8)^.v);
  if PR327_byte(a0)^.v > 127 then
    pO102_02F5(pointer(a0));
end;

{ 203E }
procedure pO06E_203E(a0: byte);
var
  _f1: array[1..246] of byte;
c542: record case byte of 0: (v542a2: string); 1: (v542a: string[4]); 2: (_p2: array[1..5] of byte;
      v537a2: string); 3: (_p3: array[1..5] of byte; v537a: string[4]); 4: (_p4: array[1..10] of byte;
      v532b: byte); 5: (_p5: array[1..32] of byte; v510b: byte); 6: (_p6: array[1..32] of byte; v510a: char);
      7: (_p7: array[1..33] of byte; v509b: byte); 8: (_p8: array[1..34] of byte; v508b: byte);
      9: (_p9: array[1..35] of byte; v507b: byte); 10: (_p10: array[1..36] of byte; v506b: byte);
      11: (_p11: array[1..37] of byte; v505b: byte); 12: (_p12: array[1..38] of byte; v504w: word);
      13: (_p13: array[1..40] of byte; v502a2: string); 14: (_p14: array[1..40] of byte; v502a: string[40]);
      15: (_p15: array[1..81] of byte; v461p: pointer); 16: (_p16: array[1..85] of byte; v457b: byte);
      17: (_p17: array[1..86] of byte; v456a: file); 18: (_p18: array[1..86] of byte; v456b: byte);
      19: (_p19: array[1..173] of byte; v369a: array[0..0] of string[40]); 20: (_p20: array[1..214] of byte;
      v328b: byte) end;
  v546p: pointer;
  v550p: pointer;
  v806a: string;
  _f2: array[1..1] of byte;
  v808b: byte;
begin
  if false then begin
    if LV = '.pty' then;
    if LV = '.sav' then;
    if LV = '.dat' then;
    if LV = 'savgam' then;
    if LSV = [65..74] then;
    if LV = 'Put save disk in ' then;
    if LV = 'Loading...Please Wait' then;
    if LV = '.' then;
    if LV = 'CPIC' then;
  end;
  {@2045-2056}
  pR47F_0F07(1, 1, 38, 22);
  if a0 <> 0 then
  begin
    {@205C-2061}
    bAE83 := 2;
    {@2061-2075}
    c542.v542a := '.pty';
    {@2075-2089}
    c542.v537a := '.sav';
    {@2089-209D}
    v806a := s8750;
  end
  else
  begin
    {@20A0-20A8}
    pO108_00CB(2);
    {@20A8-20C1}
    c542.v509b := pO108_1009(s28FD, s2E1B, 0, 0);
    case c542.v509b of
      0: begin
        {@20C9-20CE}
        bAE83 := 1;
        {@20CE-20E2}
        v806a := s93D4;
        {@20E2-20F6}
        c542.v542a := '.pty';
        {@20F6-210A}
        c542.v537a := '.sav';
      end;
      1: begin
        {@2110-2115}
        bAE83 := 0;
        {@2115-2129}
        v806a := s92D4;
        {@2129-213D}
        c542.v542a := '.dat';
        {@213D-2151}
        c542.v537a := '.sav';
      end;
      2: Exit;
    else
      {@215C-216D}
      if (bAAE6 <> 0) and (c542.v509b = 27) then
        Exit;
    end;
  end;
  {@216D-2178}
  if pO06E_0450 = 0 then
    Exit;
  {@2178-22C4}
  if a0 <> 0 then
    c542.v510b := 90
  else
  begin
    {@2186-218B}
    c542.v532b := 0;
    {@218B-219C}
    FillChar(bAB0E, 40, 255);
    {@219C-21A1}
    c542.v508b := 0;
    {@21A1-21A6}
    c542.v507b := 0;
    for c542.v510b := 65 to 74 do
    begin
      {@21B1-220B}
      if pR5C3_055E(Concat(v806a + 'savgam', c542.v510a) + c542.v542a2) <> 0 then
      begin
        {@21F5-2207}
        aAB0E_71c0[c542.v508b].f := c542.v507b;
        {@2207-220B}
        Inc(c542.v508b);
      end;
      {@220B-220F}
      Inc(c542.v507b);
    end;
    {@2216-2220}
    if bAB0E = 255 then
      Exit;
    {@2220-22BA}
    repeat
      {@2220-2239}
      c542.v509b := pO108_1009(s2926, s2EBF, 0, 0);
      if (bAAE6 <> 0) and (c542.v509b = 27) then
        c542.v510b := 27
      else
        c542.v510b := c542.v509b + 65;
until (c542.v510b in [65..74]) and (pR5C3_055E(Concat(v806a + 'savgam', c542.v510a) + c542.v542a2) <> 0)
        or (c542.v510b = 27);
    {@22BA-22C4}
    if c542.v510b = 27 then
      Exit;
  end;
  {@22C4-232C}
c542.v506b := pR5C3_0336(Concat(v806a + 'savgam', c542.v510a) + c542.v542a2, 'Put save disk in ' + v806a,
      1, @c542.v456b);
  {@232C-2331}
  pO108_167D;
  {@2331-2352}
  pR47F_0354(0, 24, 10, 0, 'Loading...Please Wait');
  {@2352-235F}
  b8811 := Ord(bAE83 = 1);
  {@235F-236B}
  v808b := PR57_byte(p87F8)^.v;
  if bAE83 <> 0 then
  begin
    {@2375-237C}
    bD925 := c542.v510b;
    {@237C-2397}
    BlockRead(c542.v456a, PR0_byte(p87F8)^.v, 1024, c542.v504w);
    {@2397-23B1}
    BlockRead(c542.v456a, bA9F3, 5, c542.v504w);
    {@23B1-23CB}
    BlockRead(c542.v456a, b880D, 1, c542.v504w);
    {@23CB-23E5}
    BlockRead(c542.v456a, b880C, 1, c542.v504w);
    {@23E5-23FF}
    BlockRead(c542.v456a, bA9F8, 2, c542.v504w);
    {@23FF-2419}
    BlockRead(c542.v456a, bA9FA, 2, c542.v504w);
  end
  else
    Seek(c542.v456a, 5140);
  {@242D-2448}
  BlockRead(c542.v456a, c542.v505b, 1, c542.v504w);
  {@2448-2463}
  BlockRead(c542.v456a, c542.v328b, 328, c542.v504w);
  {@2463-246E}
  Close(c542.v456a);
  if a0 <> 0 then
    pR5C3_0174(Concat(v806a + 'savgam', c542.v510a) + c542.v542a2);
  {@24B4-24B9}
  b8810 := 1;
  {@24B9-24C2}
  PR31_byte(p87F8)^.v := 0;
  for c542.v457b := 1 to c542.v505b do
  begin
    {@24DF-2527}
    c542.v502a := pR5C3_0677(pR5C3_05A8(c542.v369a[c542.v457b], '.'));
    if pR5C3_055E(v806a + c542.v502a2 + c542.v537a2) <> 0 then
    begin
      {@255A-256B}
      GetMem(c542.v461p, 510);
      {@256B-2599}
      pO06E_10BA(c542.v502a2 + c542.v537a2, c542.v461p, 1, 1);
      if (bAE83 = 0) and (PR327_byte(c542.v461p)^.v >= 128) then
      begin
        {@25B2-25C8}
        v550p := PR423_pointer(c542.v461p)^.v;
        {@25C8-2612}
        while v550p <> nil do
        begin
          {@25D2-25EB}
          v550p := PR42_pointer(PR423_pointer(c542.v461p)^.v)^.v;
          {@25EB-25FA}
          pR670_03ED(@PR423_byte(c542.v461p)^.v);
          {@25FA-2610}
          PR423_pointer(c542.v461p)^.v := v550p;
        end;
        {@2612-2628}
        v546p := PR323_pointer(c542.v461p)^.v;
        {@2628-267A}
        while v546p <> nil do
        begin
          {@2632-264B}
          v546p := PR5_pointer(PR323_pointer(c542.v461p)^.v)^.v;
          {@264B-2662}
          FreeMem(PR323_pointer(c542.v461p)^.v, 9);
          {@2662-2678}
          PR323_pointer(c542.v461p)^.v := v546p;
        end;
        {@267A-268B}
        FreeMem(c542.v461p, 510);
      end
      else
        pO06E_1EA6(c542.v461p);
      {@2699-26A4}
      if pO06E_0450 = 0 then
        Exit;
    end;
  end;
  {@26B1-26C0}
  c542.v461p := p9CF2;
  {@26C0-26EE}
  while c542.v461p <> nil do
  begin
    {@26CA-26D6}
    pO06E_09F2(c542.v461p);
    {@26D6-26EC}
    c542.v461p := PR483_pointer(c542.v461p)^.v;
  end;
  {@26EE-26FC}
  p9CEE := p9CF2;
  {@26FC-275A}
  while p9CEE <> nil do
  begin
    {@2705-2743}
    if PR327_byte(p9CEE)^.v < 128 then
      pO06E_07FF(1)
    else
      pO13E_0182('CPIC', PR369_byte(p9CEE)^.v, PR412_byte(p9CEE)^.v);
    {@2743-2758}
    p9CEE := PR483_pointer(p9CEE)^.v;
  end;
  {@275A-2768}
  p9CEE := p9CF2;
  if bAE83 <> 0 then
  begin
    {@276F-27B4}
    if PR33_byte(p87F8)^.v <> 0 then
    begin
      {@277A-279C}
      if iA9F8 > 0 then
      begin
        {@2781-278F}
        pO12A_1150(PR18_byte(p87F8)^.v);
        {@278F-279C}
        pO12A_0FDC(bA9F8, bA9FA);
      end;
    end
    else
      pO111_0B1C(a7D08_ec3f[PR57_byte(p87F8)^.v]);
  end;
  {@27B4-280E}
  if v808b <> PR57_byte(p87F8)^.v then
  begin
    {@27C2-27EB}
    if PR57_byte(p87F8)^.v = 4 then
      pO17E_004B(0, 2)
    else
      pO17E_004B(PR57_byte(p87F8)^.v, 2);
    {@27EB-27FC}
    pR1C3_1E9D(16, 16, @bD21E);
    {@27FC-280E}
    pR1C3_1F24(16, 16, gD51E_9554);
  end;
  {@280E-2813}
  pR670_0311;
  {@2813-2818}
  pO108_167D;
  {@2818-281D}
  b880C := 0;
end;

{ 2989 }
procedure pO06E_2989(a0: byte; a1: byte);
var
  _f1: array[1..327] of byte;
  v328b: byte;
c676: record case byte of 0: (v676a2: string); 1: (v676a: string[80]); 2: (_p2: array[1..81] of byte;
      v595a2: string); 3: (_p3: array[1..81] of byte; v595a: string[1]); 4: (_p4: array[1..83] of byte;
      v593p: pointer); 5: (_p5: array[1..87] of byte; v589p: pointer); 6: (_p6: array[1..91] of byte;
      v585b: byte); 7: (_p7: array[1..220] of byte; v456a: file); 8: (_p8: array[1..307] of byte;
      v369a: array[0..0] of string[40]) end;
  v677b: byte;
  v678b: byte;
  _f2: array[1..1] of byte;
  v680b: byte;
  v681b: byte;
  v683w: word;
  v685w: word;
  c941: record case byte of 0: (v941a: string); 1: (_p1: array[1..1] of byte; v940a: char) end;
  v683b: byte absolute v683w;
  v681a: char absolute v681b;
  { 2823 }
  function pO06E_2823: word;
  var
    w6p: pointer;
    w10p: pointer;
    w14p: pointer;
    w16w: word;
  begin
    {@2829-282E}
    w16w := 0;
    {@282E-283B}
    w6p := p9CF2;
    {@283B-28E3}
    while w6p <> nil do
    begin
      {@2846-284B}
      Inc(w16w, 510);
      if PR423_pointer(w6p)^.v <> nil then
      begin
        {@285A-286D}
        w10p := PR423_pointer(w6p)^.v;
        {@286D-288C}
        while w10p <> nil do
        begin
          {@2875-2879}
          Inc(w16w, 63);
          {@2879-288A}
          w10p := PR42_pointer(w10p)^.v;
        end;
      end;
      {@288C-28CD}
      if PR323_pointer(w6p)^.v <> nil then
      begin
        {@289B-28AE}
        w14p := PR323_pointer(w6p)^.v;
        {@28AE-28CD}
        while w14p <> nil do
        begin
          {@28B6-28BA}
          Inc(w16w, 9);
          {@28BA-28CB}
          w14p := PR5_pointer(w14p)^.v;
        end;
      end;
      {@28CD-28E0}
      w6p := PR483_pointer(w6p)^.v;
    end;
    {@28E3-28E9}
    pO06E_2823 := w16w;
  end;

begin
  if false then begin
    if LV = 'savgam' then;
    if LV = '.pty' then;
    if LSV = [0, 2, 18] then;
    if LV = 'Put save disk in ' then;
    if LV = ':' then;
    if LV = 'Saving...Please Wait' then;
    if LV = 'WARNING: Problem Saving Characters' then;
    if LV = 'CHRDAT' then;
    if LV = 'vault' then;
    if LV = '.dat' then;
    if LV = 'tmpvault.dat' then;
  end;
  {@2990-2A11}
  if a0 <> 0 then
  begin
    {@2996-299B}
    c676.v585b := 0;
    {@299B-29AA}
    c676.v593p := p9CF2;
    {@29AA-2A11}
    while c676.v593p <> nil do
    begin
      {@29B4-2A0F}
      if c676.v585b >= PR31_byte(p87F8)^.v then
      begin
        {@29C2-29D8}
        c676.v589p := PR483_pointer(c676.v593p)^.v;
        {@29D8-29E3}
        pO075_3770(1, 1);
        {@29E3-29F3}
        c676.v593p := c676.v589p;
      end
      else
      begin
        {@29F5-29F9}
        Inc(c676.v585b);
        {@29F9-2A0F}
        c676.v593p := PR483_pointer(c676.v593p)^.v;
      end;
    end;
  end;
  {@2A11-2AFA}
  if a1 <> 0 then
  begin
    {@2A17-2A1C}
    v681b := 90;
    {@2A1C-2A21}
    bAE83 := 2;
    {@2A21-2A5F}
    c941.v941a := Concat(s8750 + 'savgam', v681a);
  end
  else
  begin
    {@2A62-2AA0}
    repeat
      {@2A62-2A6A}
      pO108_00CB(9);
      {@2A6A-2A8B}
      v680b := pO108_1009(s294F, s2EBF, 0, Ord(b880C = 2));
    until (v680b < 10) or (bAAE6 <> 0) and (v680b = 27);
    {@2AA0-2AAA}
    if v680b > 9 then
      Exit;
    {@2AAA-2AB7}
    v681b := v680b + 65;
    {@2AB7-2ABC}
    bAE83 := 1;
    {@2ABC-2AFA}
    c941.v941a := Concat(s93D4 + 'savgam', v681a);
  end;
  {@2AFA-2B05}
  if pO06E_0450 = 0 then
    Exit;
  {@2B05-2B37}
  if pR5C3_055E(c941.v941a + '.pty') <> 0 then
    v685w := 0
  else
    v685w := 1031;
  {@2B37-2B40}
  Inc(v685w, pO06E_2823);
  if v685w > DiskFree(Ord(UpCase(c941.v940a)) - 64) then
  begin
    {@2B69-2B79}
    pR47F_0B2E(14, 0, s2059);
    {@2B79-2B7C}
    Exit;
  end;
  {@2B7C-2C45}
  repeat
    {@2B7C-2BA2}
    Assign(c676.v456a, c941.v941a + '.pty');
    {@2BA2-2BB1}
    Rewrite(c676.v456a, 1);
    {@2BB1-2BB8}
    v683w := word(Doserror);
    if not (v683b in [0, 2, 18]) then
    begin
      {@2BC9-2C31}
      if Ord(UpCase(c941.v940a)) < 67 then
        pR47F_0B2E(14, 0, 'Put save disk in ' + c941.v940a + ':')
      else
      begin
        {@2C13-2C23}
        pR47F_0B2E(14, 0, s2007);
        {@2C23-2C2E}
        Close(c676.v456a);
        {@2C2E-2C31}
        Exit;
      end;
    end;
  until v683b in [0, 2, 18];
  {@2C45-2C4A}
  pO108_167D;
  {@2C4A-2C6B}
  pR47F_0354(0, 24, 10, 0, 'Saving...Please Wait');
  {@2C6B-2C84}
  BlockWrite(c676.v456a, PR0_byte(p87F8)^.v, 1024);
  {@2C84-2C9C}
  BlockWrite(c676.v456a, bA9F3, 5);
  {@2C9C-2CB4}
  BlockWrite(c676.v456a, b880D, 1);
  {@2CB4-2CCC}
  BlockWrite(c676.v456a, b880C, 1);
  {@2CCC-2CE4}
  BlockWrite(c676.v456a, bA9F8, 2);
  {@2CE4-2CFC}
  BlockWrite(c676.v456a, bA9FA, 2);
  {@2CFC-2D01}
  c676.v585b := 0;
  {@2D01-2D10}
  c676.v593p := p9CF2;
  if c676.v593p = nil then
    pR47F_0B2E(14, 0, 'WARNING: Problem Saving Characters');
  {@2D35-2DD1}
  while (c676.v593p <> nil) and (c676.v585b < 8) do
  begin
    {@2D4C-2D50}
    Inc(c676.v585b);
    {@2D50-2D6C}
    Str(c676.v585b, c676.v595a);
    {@2D6C-2DB8}
    c676.v369a[c676.v585b] := 'CHRDAT' + v681a + c676.v595a2;
    {@2DB8-2DCE}
    c676.v593p := PR483_pointer(c676.v593p)^.v;
  end;
  {@2DD1-2DEA}
  BlockWrite(c676.v456a, c676.v585b, 1);
  {@2DEA-2E03}
  BlockWrite(c676.v456a, v328b, 328);
  {@2E03-2E0E}
  Close(c676.v456a);
  {@2E0E-2E1D}
  c676.v593p := p9CF2;
  {@2E1D-2E22}
  c676.v585b := 0;
  {@2E22-2EBA}
  while (c676.v593p <> nil) and (c676.v585b < 8) do
  begin
    {@2E39-2E3D}
    Inc(c676.v585b);
    {@2E3D-2E59}
    Str(c676.v585b, c676.v595a);
    {@2E59-2E95}
    pO06E_0AD8(c676.v593p, 'CHRDAT' + v681a + c676.v595a2);
    {@2E95-2EA1}
    pO06E_09F2(c676.v593p);
    {@2EA1-2EB7}
    c676.v593p := PR483_pointer(c676.v593p)^.v;
  end;
  {@2EBA-2F52}
  if a1 <> 0 then
    c676.v676a := Concat(s8750 + 'vault', v681a) + '.dat'
  else
    c676.v676a := Concat(s93D4 + 'vault', v681a) + '.dat';
  {@2F52-307D}
  if bD924 <> 0 then
  begin
    {@2F59-2F64}
    pR5C3_0174(c676.v676a2);
    {@2F64-2FBC}
    pR5C3_01C3(s93D4 + 'tmpvault.dat', Concat(s93D4 + 'vault', v681a) + '.dat');
  end
  else
  begin
    {@2FBF-307D}
    if bD925 <> v681b then
    begin
      {@2FCB-2FDB}
      pO06E_30B1(@v677b, @v678b);
      if a1 <> 0 then
        c676.v676a := Concat(s8750 + 'vault', v681a) + '.dat'
      else
        c676.v676a := Concat(s93D4 + 'vault', v681a) + '.dat';
      {@3073-307D}
      pO06E_3314(c676.v676a2);
    end;
  end;
  {@307D-3084}
  bD925 := v681b;
  {@3084-3089}
  bD924 := 0;
  {@3089-308E}
  b94D5 := 1;
  {@308E-3093}
  pO108_167D;
end;

{ 30B1 }
procedure pO06E_30B1(a0: pointer; a1: pointer);
var
  v128a: file;
  c425: record case byte of 0: (v425a: string); 1: (_p1: array[1..41] of byte; v384a: string) end;
  _f1: array[1..2] of byte;
  v431p: pointer;
  v433w: word;
  v434b: byte;
  _f2: array[1..2] of byte;
  v128b: byte absolute v128a;
begin
  if false then begin
    if LV = 'tmpVault.dat' then;
    if LV = 'vault' then;
    if LV = '.dat' then;
  end;
  {@30B8-30BF}
  PR0_byte(a0)^.v := 0;
  {@30BF-30C6}
  PR0_byte(a1)^.v := 0;
  if bD924 <> 0 then
    c425.v384a := s93D4 + 'tmpVault.dat'
  else
  begin
    {@30F9-3190}
    if bD925 = 90 then
      c425.v384a := Concat(s8750 + 'vault', gD925_579f) + '.dat'
    else
      c425.v384a := Concat(s93D4 + 'vault', gD925_579f) + '.dat';
  end;
  {@3190-31A2}
  if pR5C3_055E(c425.v384a) = 0 then
    Exit;
  {@31A2-31BF}
  v434b := pR5C3_0336(c425.v384a, c425.v425a, 0, @v128b);
  {@31BF-31D8}
  BlockRead(v128a, bA7BE, 12, v433w);
  {@31D8-31DF}
  PR0_byte(a1)^.v := 0;
  {@31DF-31F0}
  GetMem(v431p, 63);
  {@31F0-32A0}
  repeat
    {@31F0-320A}
    BlockRead(v128a, PR0_byte(v431p)^.v, 63, v433w);
    if v433w = 63 then
    begin
      {@3214-328F}
      if pA7CA = nil then
      begin
        {@321D-322D}
        GetMem(pA7CA, 63);
        {@322D-3242}
        PR0_X63(pA7CA)^.v := PR0_X63(v431p)^.v;
        {@3242-3250}
        pD926 := pA7CA;
      end
      else
      begin
        {@3252-3267}
        GetMem(PR42_pointer(pD926)^.v, 63);
        {@3267-327A}
        pD926 := PR42_pointer(pD926)^.v;
        {@327A-328F}
        PR0_X63(pD926)^.v := PR0_X63(v431p)^.v;
      end;
      {@328F-3296}
      PR0_byte(a1)^.v := 1;
    end;
  until v433w <> 63;
  {@32A0-32AA}
  Close(v128a);
  if bD925 = 90 then
    pR5C3_0174(c425.v384a);
  {@32BC-32CD}
  FreeMem(v431p, 63);
  {@32CD-32CF}
  Exit;
end;

{ 3314 }
procedure pO06E_3314(a0: string);
var
  v384a: file;
  v386w: word;
  v390p: pointer;
begin
  if false then begin
    if LV = 'Can''t save.  No room on this disk.' then;
    if LV = 'Please insert another disk.' then;
  end;
  {@332F-3335}
  v386w := 0;
  {@3335-333A}
  Inc(v386w, 12);
  if pA7CA <> nil then
  begin
    {@3343-3351}
    pD926 := pA7CA;
    {@3351-3374}
    while pD926 <> nil do
    begin
      {@335A-335F}
      Inc(v386w, 63);
      {@335F-3372}
      pD926 := PR42_pointer(pD926)^.v;
    end;
  end;
  {@3374-337F}
  pR5C3_0174(a0);
  if v386w > DiskFree(Ord(UpCase(g93D5_579f)) - 64) then
  begin
    {@33A7-33C2}
    pR47F_0B2E(14, 0, 'Can''t save.  No room on this disk.');
    {@33C2-33DD}
    pR47F_0B2E(14, 0, 'Please insert another disk.');
  end;
  {@33DD-33EE}
  Assign(v384a, a0);
  {@33EE-33FD}
  Rewrite(v384a, 1);
  {@33FD-3415}
  BlockWrite(v384a, bA7BE, 12);
  {@3415-3423}
  pD926 := pA7CA;
  {@3423-3469}
  while pD926 <> nil do
  begin
    {@342C-3445}
    BlockWrite(v384a, PR0_byte(pD926)^.v, 63);
    {@3445-3454}
    v390p := pD926;
    {@3454-3467}
    pD926 := PR42_pointer(pD926)^.v;
  end;
  {@3469-3474}
  Close(v384a);
  {@3474-3479}
  bD924 := 1;
  {@3479-347E}
  pO0EC_3E0E;
end;

{ 3484 }
begin
end.

