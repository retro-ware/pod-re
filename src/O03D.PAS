{ O03D: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O03D;

interface

uses GAMEDATA;

procedure pO03D_00FC;

implementation

uses LIT, O111, R1C3, R47F, R5A0, R670, R6DD;

var
  b7DE1: byte absolute d7DE1;
  gD51E_9554: B768 absolute dD51E;
  p7DE1: pointer absolute d7DE1;

function pO03D_0000(a0: word): byte; far; forward;
procedure pO03D_007E; far; forward;
procedure pO03D_008E; far; forward;

{ 0000 }
function pO03D_0000(a0: word): byte;
var
  v5l: longint;
  v9l: longint;
  _f1: array[1..1] of byte;
begin
  {@0006-000B}
  pR670_0311;
  {@000B-0016}
  v5l := pR47F_0BAD;
  {@0016-002A}
  v9l := LongInt(100 * a0) + v5l;
  {@002A-0055}
  repeat
  until (pR670_0277 <> 0) or (pR47F_0BAD >= v9l) or (pR47F_0BAD < v5l);
  {@0055-0070}
  if pR47F_0BAD >= v9l then
    pO03D_0000 := 0
  else
    pO03D_0000 := 1;
  {@0070-0075}
  pR670_0311;
end;

{ 007E }
procedure pO03D_007E;
begin
  {@0081-0086}
  pR6DD_0030;
end;

{ 008E }
procedure pO03D_008E;
begin
  if false then begin
    if LV = 'title' then;
  end;
  {@0094-00B6}
  pR1C3_0352('title', 3, 0, 0, @b7DE1);
  {@00B6-00C7}
  pR1C3_1F24(0, 256, gD51E_9554);
  asm
  db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
  call pR1C3_0EEB
  end;
  {@00DA-00E4}
  pR1C3_1A83(@b7DE1);
  if pO03D_0000(20) <> 0 then
    Exit;
end;

{ 00FC }
procedure pO03D_00FC;
var
  _f1: array[1..1] of byte;
begin
  if false then begin
    if LV = 'title' then;
  end;
  {@0102-010A}
  p7DE1 := nil;
  {@010A-010F}
  pO111_096E;
  {@010F-0114}
  pR6DD_0051;
  {@0114-0119}
  pR47F_0C27;
  {@0119-0122}
  pR5A0_0031(1);
  {@0122-0144}
  pR1C3_0352('title', 1, 0, 0, @b7DE1);
  {@0144-0155}
  pR1C3_1F24(0, 256, gD51E_9554);
  asm
  db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
  call pR1C3_0EEB
  end;
  {@0168-0172}
  pR1C3_1A83(@b7DE1);
  if pO03D_0000(5) <> 0 then
  begin
    {@017E-0182}
    pO03D_008E;
    {@0182-0186}
    pO03D_007E;
    {@0186-0188}
    Exit;
  end;
  {@0188-01AA}
  pR1C3_0352('title', 2, 0, 0, @b7DE1);
  {@01AA-01AF}
  pR47F_0C27;
  {@01AF-01C0}
  pR1C3_1F24(0, 256, gD51E_9554);
  asm
  db 49,192,80,49,192,80,255,54,227,125,255,54,225,125
  call pR1C3_0EEB
  end;
  {@01D3-01DD}
  pR1C3_1A83(@b7DE1);
  if pO03D_0000(5) <> 0 then
  begin
    {@01E9-01ED}
    pO03D_008E;
    {@01ED-01F1}
    pO03D_007E;
    {@01F1-01F3}
    Exit;
  end;
  {@01F3-01F7}
  pO03D_008E;
  {@01F7-01FB}
  pO03D_007E;
  {@01FB-01FD}
  Exit;
end;

{ 0201 }
begin
end.

