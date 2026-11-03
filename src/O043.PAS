{ O043: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O043;

interface

uses GAMEDATA;

procedure pO043_0000;

implementation

uses LIT, O06E, R670;



{ 0000 }
procedure pO043_0000;
begin
  asm
    db 176,0,80,176,1,80
    call pO06E_2989
    db 176,23,80
    call pR670_0000
  end;
end;

{ 0018 }
begin
  asm
  end;
end.

