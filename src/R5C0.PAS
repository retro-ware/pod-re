{ R5C0: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R5C0;

interface

uses GAMEDATA;

procedure pR5C0_0000(a0: pointer; a1: word);

implementation

uses LIT, R670;

type
  R0_byte = record v: byte end;
  PR0_byte = ^R0_byte;


{ 0000 }
procedure pR5C0_0000(a0: pointer; a1: word);
begin
  {@0003-0010}
  XR670_046E(@PR0_byte(a0)^.v, a1);
  {@0010-001E}
  FreeMem(a0, a1);
end;

{ 0022 }
begin
end.

