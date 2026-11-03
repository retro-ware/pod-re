{ R670: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R670;

interface

uses GAMEDATA;

procedure pR670_0000(a0: byte);
function pR670_0187: byte;
function pR670_0277: byte;
procedure pR670_0311;
procedure pR670_032E;
function pR670_0347(a0: word): word;
function pR670_037F: pointer;
procedure pR670_03ED(a0: pointer);
procedure XR670_046E;

implementation

uses LIT, Crt, R6B9, R6C9, R6DD, R716;

type
  R0_pointer = record v: pointer end;
  PR0_pointer = ^R0_pointer;
var
  a7D72_ec3f: array[0..32759] of byte absolute d7D72;
  b880E: byte absolute d880E;
  b92A8: byte absolute d92A8;
  b92A9: byte absolute d92A9;
  b92AA: byte absolute d92AA;
  b92C0: byte absolute d92C0;
  bC5C4: byte absolute dC5C4;
  bC5C5: byte absolute dC5C5;
  bC5C7: byte absolute dC5C7;
  bC5C9: byte absolute dC5C9;
  bC60C: byte absolute dC60C;
  w3DE8: word absolute d3DE8;
  w3DEA: word absolute d3DEA;
  w3DEC: word absolute d3DEC;

{$L R670A.OBJ}
procedure XR670_046E; external;


{ 0000 }
procedure pR670_0000(a0: byte);
var
  _f1: array[1..2] of byte;
begin
  {@0006-000B}
  pR6DD_0051;
  {@000B-0010}
  pR6DD_0146;
  {@0010-0015}
  pR6B9_00D6;
  if b92C0 = 1 then
    pR6C9_0000(w3DE8);
  {@0025-002F}
  Halt(a0);
end;

{ 0187 }
function pR670_0187: byte;
var
  v2b: byte;
  _f1: array[1..4] of byte;
  v8w: word;
  v9b: byte;
  v10b: byte;
  _f2: array[1..2] of byte;
  v8b: byte absolute v8w;
  { 0035 }
  procedure pR670_0035;
  begin
    {@0038-0041}
    v8w := 0;
    {@0041-0049}
    v10b := 0;
    {@0049-00E4}
    while not KeyPressed and (v10b = 0) do
    begin
      {@0062-0079}
      pR716_018D(@v8b, @v9b);
      if (v9b < 8) or (Ord(v8w <> 0) <> 0) then
      begin
        {@0094-00D9}
        if v9b < 8 then
          v2b := a7D72_ec3f[v9b]
        else
          case v8w of
            1: v2b := 13;
            2: v2b := 27;
          end;
        {@00D9-00E1}
        v10b := 1;
      end;
    end;
  end;

  { 00E8 }
  procedure pR670_00E8;
  begin
    {@00EB-00F4}
    v8w := 0;
    {@00F4-00FC}
    v10b := 0;
    {@00FC-0163}
    while not KeyPressed and (v10b = 0) do
    begin
      {@010F-0127}
      pR6DD_0072(@v8b, @bC5C7, @bC5C9);
      if v8w <> 0 then
      begin
        {@0131-0154}
        case v8w of
          1: v2b := 13;
          2: v2b := 27;
        end;
        {@0154-0159}
        bC5C5 := 1;
        {@0159-0161}
        v10b := 1;
      end;
    end;
  end;

begin
  if false then begin
    if LSV = [3..4] then;
  end;
  {@018D-0192}
  bC5C5 := 0;
  if KeyPressed then
    v2b := Ord(ReadKey)
  else
  begin
    {@01A5-01EE}
    if (bC60C <> 0) or (bC5C4 <> 0) then
    begin
      {@01B3-01C6}
      if bC5C4 <> 0 then
        pR670_00E8
      else
        pR670_0035;
      {@01C6-01D7}
      if KeyPressed then
        v2b := Ord(ReadKey);
    end
    else
    begin
      {@01D9-01EE}
      if b880E <> 0 then
        v2b := 0
      else
        v2b := Ord(ReadKey);
    end;
  end;
  {@01EE-023E}
  if v2b = 19 then
  begin
    {@01F4-023E}
    if b92A8 <> 5 then
    begin
      {@01FB-0201}
      b92A9 := b92A8;
      if b92C0 = 1 then
        pR6C9_0000(w3DEA);
      {@0211-0216}
      b92A8 := 5;
    end
    else
    begin
      {@0218-023E}
      if b92A9 in [3..4] then
      begin
        {@0228-022E}
        b92A8 := b92A9;
        if b92C0 = 1 then
          pR6C9_0000(w3DEC);
      end;
    end;
  end;
  {@023E-025D}
  if v2b = 21 then
  begin
    {@0244-0251}
    b92AA := Ord(b92AA = 0);
    if b92AA = 0 then
      pR6B9_00D6;
  end;
  {@025D-026A}
  if v2b = 3 then
    pR670_0000(0);
  {@026A-0270}
  pR670_0187 := v2b;
end;

{ 0277 }
function pR670_0277: byte;
var
  v3w: word;
  v4b: byte;
  v3i: integer absolute v3w;
  v3b: byte absolute v3w;
begin
  asm
  call KeyPressed
  db 136,70,255
  end;
  if (bC60C <> 0) or (bC5C4 <> 0) then
  begin
    {@0293-02CF}
    if bC5C4 <> 0 then
    begin
      {@029A-02AE}
      pR6DD_0072(@v3b, @bC5C7, @bC5C9);
      {@02AE-02CD}
      pR670_0277 := Ord(KeyPressed or (Ord(v3w <> 0) <> 0));
      {@02CD-02CF}
      Exit;
    end;
    {@02CF-02DE}
    pR716_018D(@v3b, @v4b);
    {@02DE-030A}
    pR670_0277 := Ord(KeyPressed or (Ord(v3i > 0) <> 0) or (Ord(v4b < 8) <> 0));
  end;
end;

{ 0311 }
procedure pR670_0311;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0317-032A}
  while KeyPressed do
    v1b := Ord(ReadKey);
end;

{ 032E }
procedure pR670_032E;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0334-0343}
  if pR670_0277 <> 0 then
    v1b := pR670_0187;
end;

{ 0347 }
function pR670_0347(a0: word): word;
begin
  asm
  db 255,118,6,255,30,155,197,9,192,116,25,184,160,15,80
  call Sound
  db 184,20,0,80
  call Delay
  call NoSound
  db 235,220
  end;
  {@0371-0376}
  pR670_0347 := 0;
end;

{ 037F }
function pR670_037F: pointer;
var
  v5b: byte;
  v6b: byte;
  v10l: longint;
begin
  {@0385-0389}
  v6b := 0;
  {@0389-038D}
  v5b := 1;
  {@038D-0395}
  v10l := 0;
  {@0395-03D7}
  while (v5b <= 138) and (v6b = 0) do
    asm
  db 138,70,251,48,228,186,63,0,247,226,139,248,128,189,25,217,0,117,30,138,70,251,48,228,186,63,0,247
  db 226,139,248,141,133,235,216,140,218,137,70,246,137,86,248,198,70,250,1,235,3,254,70,251
    end;
  asm
  db 139,70,246,139,86,248,137,70,252,137,86,254
  end;
end;

{ 03ED }
procedure pR670_03ED(a0: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@03F3-03F7}
  v1b := 1;
  asm
  db 128,126,255,138,119,37,138,70,255,48,228,186,63,0,247,226,139,248,141,133,235,216,140,218,196,126,6,38
  db 59,85,2,117,5,38,59,5,116,5,254,70,255,235,213
  end;
  {@0422-0450}
  if v1b <= 138 then
    asm
  db 138,70,255,48,228,186,63,0,247,226,139,248,129,199,235,216,30,87,184,63,0,80
  push cs
  call near ptr XR670_046E
  db 196,126,6,49,192,38,137,5,38,137,69,2,235,19
    end;
  {@0450-0463}
  FreeMem(PR0_pointer(a0)^.v, 63);
end;

{ 0469 }
begin
end.

