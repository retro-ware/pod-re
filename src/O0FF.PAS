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
  l9DBC: longint absolute d9DBC;
  p87F8: pointer absolute d87F8;
  p9DB8: pointer absolute d9DB8;
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
  asm
  db 196,62,248,135,38,138,69,36,48,228,64,80,196,62,248,135,38,138,69,37,48,228,64,80,255,54,190,157
  db 255,54,188,157
  call pR1C3_0EEB
  db 191,78,136,30,87,184,168,0,80
  call XR670_046E
  db 191,246,136,30,87,184,80,1,80
  call XR670_046E
  db 191,70,138,30,87,184,80,1,80,176,255,80,154,127,26,37,8,191,150,139,30,87,184,80,1,80
  call XR670_046E
  end;
end;

{ 00CC }
procedure pO0FF_00CC;
begin
  asm
  db 196,62,248,135,38,138,69,36,48,228,64,80,196,62,248,135,38,138,69,37,48,228,64,80,255,54,186,157
  db 255,54,184,157
  call pR1C3_0EEB
  end;
end;

{ 00F6 }
begin
end.

