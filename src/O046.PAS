{ O046: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O046;

interface

uses GAMEDATA;

procedure pO046_000E;

implementation

uses LIT, O04F, O06E, O0AA, O0B5, O0EC, O108, R47F, R670;

type
  R331_word = record _p: array[1..331] of byte; v: word end;
  R333_word = record _p: array[1..333] of byte; v: word end;
  R335_word = record _p: array[1..335] of byte; v: word end;
  R423_longint = record _p: array[1..423] of byte; v: longint end;
  R42_pointer = record _p: array[1..42] of byte; v: pointer end;
  PR331_word = ^R331_word;
  PR333_word = ^R333_word;
  PR335_word = ^R335_word;
  PR423_longint = ^R423_longint;
  PR42_pointer = ^R42_pointer;
var
  b880C: byte absolute d880C;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bAE62: byte absolute dAE62;
  bC578: byte absolute dC578;
  p9CEE: pointer absolute d9CEE;
  pA7CA: pointer absolute dA7CA;
  s3196: string absolute d3196;
  s93D4: string absolute d93D4;


{ 000E }
procedure pO046_000E;
var
  v1b: byte;
  v2b: byte;
  _f1: array[1..2] of byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  _f2: array[1..2] of byte;
  v10b: byte;
  v11b: byte;
  v12b: byte;
  v16p: pointer;
  v16b: byte absolute v16p;
begin
  if false then begin
    if Pos('', LV) = 0 then;
    if LV = 'tmpvault.dat' then;
  end;
  {@0015-001A}
  b880C := 10;
  {@001A-001F}
  bC578 := 1;
  {@001F-0024}
  pO0EC_2ED1;
  {@0024-0029}
  bC578 := 1;
  {@0029-0036}
  pO0EC_07C0(p9CEE);
  if pO06E_0450 = 0 then
  begin
    {@003F-0044}
    pO0EC_3E0E;
    {@0044-0047}
    Exit;
  end;
  {@0047-007C}
  while pA7CA <> nil do
  begin
    {@0050-005D}
    v16p := pA7CA;
    {@005D-0070}
    pA7CA := PR42_pointer(pA7CA)^.v;
    {@0070-007A}
    pR670_03ED(@v16b);
  end;
  {@007C-0084}
  pA7CA := nil;
  {@0084-0093}
  pO06E_30B1(@v6b, @v7b);
  {@0093-0098}
  bAE62 := 0;
  {@0098-009C}
  v5b := 0;
  {@009C-00A0}
  v12b := 1;
  {@00A0-0253}
  repeat
    {@00A0-00AE}
    XR670_046E(@bAB0E, 40);
    {@00AE-00B2}
    v10b := 0;
    {@00B2-00BF}
    pO108_00AB(0, @v10b);
    {@00BF-00CE}
    pO0B5_0E45(@v6b, @v7b);
    if (v6b <> 0) or (v7b <> 0) then
      pO108_00AB(1, @v10b);
    {@00E7-00F4}
    pO108_00AB(2, @v10b);
    if (PR331_word(p9CEE)^.v > 0) or (PR333_word(p9CEE)^.v > 0) or (PR335_word(p9CEE)^.v > 0) then
      pO108_00AB(3, @v10b);
    {@0125-0142}
    if PR423_longint(p9CEE)^.v <> 0 then
      pO108_00AB(4, @v10b);
    {@0142-014F}
    pO108_00AB(5, @v10b);
    {@014F-0155}
    bAAE5 := v12b;
    {@0155-0177}
    v2b := pO108_1009('', s3196, 1, 0);
    {@0177-017D}
    v12b := bAAE5;
    if (bAAE6 <> 0) and (v2b = 27) then
    begin
      {@018A-018F}
      bAAE6 := 0;
      {@018F-0193}
      v2b := 5;
    end;
    {@0193-0197}
    v11b := 0;
    if bAAE6 = 0 then
      case v2b of
        0: pO0AA_0C9D(@v11b);
        1: pO04F_0F77(@v6b, @v7b);
        2: pO0B5_0453;
        3: begin
          {@01D5-01DD}
          pO0AA_2A8A(0);
          {@01DD-01EE}
          pR47F_0F07(1, 17, 38, 22);
        end;
        4: begin
          {@01F4-01FE}
          pO0AA_1067(@v11b);
          {@01FE-0203}
          pO0EC_2ED1;
        end;
        5: v5b := 1;
      end
    else
    begin
      {@020F-0215}
      v1b := v2b;
      if (v1b = 80) or (v1b = 72) then
      begin
        {@0221-0231}
        pO0EC_0987(p9CEE, 0);
        {@0231-023A}
        pO0AA_2F7B(v2b);
        {@023A-024A}
        pO0EC_0987(p9CEE, 1);
      end;
    end;
  until v5b <> 0;
  {@0253-0272}
  pO06E_3314(s93D4 + 'tmpvault.dat');
  {@0272-0277}
  pO0EC_3E0E;
end;

{ 027B }
begin
end.

