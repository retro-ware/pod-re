{ O17E: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O17E;

interface

uses GAMEDATA;

procedure pO17E_004B(a0: byte; a1: byte);
procedure pO17E_0157(a0: shortint; a1: shortint; a2: word; a3: byte; a4: byte);
procedure pO17E_02E6(a0: byte; a1: byte; a2: shortint; a3: byte; a4: byte; a5: byte);

implementation

uses LIT, R1C3, R670;

type
  R27_byte = record _p: array[1..27] of byte; v: byte end;
W2_5_0157 = record case byte of 0: (_p0: array[1..18] of byte; _w5_18word: word);
      1: (_p1: array[1..27] of byte; _w5_27abyte: array[0..32000] of byte) end;
  PR27_byte = ^R27_byte;
  PW2_5_0157 = ^W2_5_0157;
var
  a3EA0_2fc5: array[0..16379] of word absolute d3EA0;
  a3EA6_2fc5: array[0..16379] of word absolute d3EA6;
  a9DA8_0389: array[0..8189] of array[0..3] of byte absolute d9DA8;
  a9DA8_9f8b: array[0..8189] of pointer absolute d9DA8;
  a9DA8_b676: array[0..8189] of longint absolute d9DA8;
  l8836: longint absolute d8836;
  p9DB4: pointer absolute d9DB4;
  w3EA4: word absolute d3EA4;


{ 004B }
procedure pO17E_004B(a0: byte; a1: byte);
var
  v9a: string[8];
  _f1: array[1..2] of byte;
  v12b: byte;
  v9a2: string[8] absolute v9a;
begin
  if false then begin
    if LSV = [0..2] then;
    if LV = 'borders' then;
    if LV = '8x8d0' then;
    if LV = '8x8d1' then;
    if LV = 'Unable to load ' then;
    if LV = ' from ' then;
  end;
  {@0052-0065}
  if not (a1 in [0..2]) then
    Exit;
  {@0065-00AE}
  if a1 = 2 then
    v9a := 'borders'
  else
  begin
    {@0080-00AE}
    if a1 = 1 then
      v9a := '8x8d0'
    else
      v9a := '8x8d1';
  end;
  {@00AE-00D3}
  pR1C3_0352(v9a2, a0, 1, 13, @a9DA8_0389[a1]);
  if a9DA8_b676[a1] = 0 then
  begin
    {@00E8-00ED}
    pR1C3_00AC;
    {@00ED-0137}
    WriteLn(Output, 'Unable to load ', a0, ' from ' + v9a2);
    {@0137-013F}
    v12b := pR670_0187;
    {@013F-0144}
    pR1C3_00AC;
    {@0144-014C}
    pR670_0000(0);
  end;
  {@014C-0151}
  pR670_0311;
end;

{ 0157 }
procedure pO17E_0157(a0: shortint; a1: shortint; a2: word; a3: byte; a4: byte);
var
  v1b: byte;
begin
  {@015D-0161}
  v1b := 0;
  {@0161-0178}
  while a3EA6_2fc5[v1b] < a2 do
    Inc(v1b);
  {@0178-0187}
  if (a2 = 0) or (v1b > 2) then
    Exit;
  {@0187-019F}
  if a9DA8_9f8b[v1b] = nil then
    Exit;
  {@019F-01AF}
  Dec(a2, a3EA0_2fc5[v1b]);
  if a3 <> 0 then
  begin
    {@01B5-01E7}
    pR1C3_07C4(a0, a1, a2, a4, pointer(a9DA8_9f8b[v1b]), l8836);
    {@01E7-01E9}
    Exit;
  end;
  {@01E9-0240}
  with PW2_5_0157(a9DA8_9f8b[v1b])^ do
  begin
    Move(_w5_27abyte[a2 * _w5_18word], PR27_byte(p9DB4)^.v, _w5_18word);
  end;
  pR1C3_0EEB(a0, a1, p9DB4);
end;

{ 02E6 }
procedure pO17E_02E6(a0: byte; a1: byte; a2: shortint; a3: byte; a4: byte; a5: byte);
var
  v1b: byte;
  v2b: byte;
  v2sb: shortint absolute v2b;
  { 0246 }
  procedure pO17E_0246(b0: byte);
  var
    w1b: byte;
    _f1: array[1..1] of byte;
    w1sb: shortint absolute w1b;
  begin
    {@024C-028C}
    case b0 of
      0: w1b := 255;
      1: w1b := v1b + 4;
      2: w1b := a4;
      3: w1b := a5;
    end;
    {@028C-02BF}
    if w1sb >= 0 then
      pO17E_0157(a0, a1, Word(LongInt(w1sb) + LongInt(w3EA4)), 0, 0);
    {@02BF-02D9}
    if v1b <> 0 then
      Inc(a1)
    else
      Inc(a0);
    {@02D9-02E0}
    Dec(v2b);
  end;

begin
  {@02EC-0352}
  if a1 = a3 then
  begin
    {@02F4-02F8}
    v1b := 0;
    if shortint(a0) > a2 then
    begin
      {@0300-0306}
      v2b := a0;
      {@0306-030C}
      a0 := byte(a2);
      {@030C-0312}
      byte(a2) := v2b;
    end;
    {@0312-0322}
    v2b := a2 - shortint(a0) + 1;
  end
  else
  begin
    {@0324-0328}
    v1b := 1;
    if shortint(a1) > shortint(a3) then
    begin
      {@0330-0336}
      v2b := a1;
      {@0336-033C}
      a1 := a3;
      {@033C-0342}
      a3 := v2b;
    end;
    {@0342-0352}
    v2b := shortint(a3) - shortint(a1) + 1;
  end;
  {@0352-035A}
  pO17E_0246(2);
  {@035A-0362}
  pO17E_0246(1);
  {@0362-0372}
  while v2sb > 2 do
    pO17E_0246(1);
  {@0372-0380}
  if v2b = 2 then
    pO17E_0246(1);
  {@0380-038E}
  if v2b = 1 then
    pO17E_0246(3);
end;

{ 0394 }
begin
end.

