{ R5C0: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R5C0;

interface

uses GAMEDATA;

procedure pR5C0_0000(a0: word; a1: word; a2: word);

implementation

uses LIT, R670;



{ 0000 }
procedure pR5C0_0000(a0: word; a1: word; a2: word);
begin
  asm
    db 196,126,8,6,87,255,118,6
    call XR670_046E
    db 255,118,10,255,118,8,255,118,6,154,84,2,37,8
  end;
end;

{ 0022 }
begin
  asm
  end;
end.

