{ O0FF: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O0FF;

interface

uses GAMEDATA;

procedure pO0FF_0000;
procedure pO0FF_00CC;

implementation

uses LIT, R1C3, R670;

type
  R36_byte = record _p: array[1..36] of byte; v: byte end;
  R37_byte = record _p: array[1..37] of byte; v: byte end;
  PR36_byte = ^R36_byte;
  PR37_byte = ^R37_byte;
var
  b884E: byte absolute d884E;
  b88F6: byte absolute d88F6;
  b8A46: byte absolute d8A46;
  b8B96: byte absolute d8B96;
  l9DBC: longint absolute d9DBC;
  p87F8: pointer absolute d87F8;
  p9DB8: pointer absolute d9DB8;
  p9DBC: pointer absolute d9DBC;
  pC5A1: pointer absolute dC5A1;


{ 0000 }
procedure pO0FF_0000;
begin
  {@0003-0028}
  pR1C3_0CC4(PR36_byte(p87F8)^.v + 1, PR37_byte(p87F8)^.v + 1, p9DB8);
  {@0028-0049}
  pR1C3_07C4(0, 0, 0, 0, p9DB8, l9DBC);
  {@0049-006A}
  pR1C3_07C4(0, 0, 0, 1, pC5A1, l9DBC);
  {@006A-008F}
  pR1C3_0EEB(PR36_byte(p87F8)^.v + 1, PR37_byte(p87F8)^.v + 1, p9DBC);
  {@008F-009D}
  XR670_046E(@b884E, 168);
  {@009D-00AB}
  XR670_046E(@b88F6, 336);
  {@00AB-00BC}
  FillChar(b8A46, 336, 255);
  {@00BC-00CA}
  XR670_046E(@b8B96, 336);
end;

{ 00CC }
procedure pO0FF_00CC;
begin
  {@00CF-00F4}
  pR1C3_0EEB(PR36_byte(p87F8)^.v + 1, PR37_byte(p87F8)^.v + 1, p9DB8);
end;

{ 00F6 }
begin
end.

