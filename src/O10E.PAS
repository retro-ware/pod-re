{ O10E: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O10E;

interface

uses GAMEDATA;

procedure pO10E_0000;

implementation

uses LIT, O111, O12A, R1C3;



{ 0000 }
procedure pO10E_0000;
var loc: array[1..2] of byte;
begin
  asm
    db 128,62,20,136,0,116,2,235,125,196,62,248,135,38,128,125,33,1,117,11,196,62,248,135,38,128,125,35
    db 0,116,42,128,62,126,174,0,116,35,196,62,248,135,38,138,69,57,48,228,139,248,138,133,8,125,136,70
    db 255,138,70,255,80
    call pO111_0B1C
    call pO111_0BAF
    db 235,56,128,62,12,136,4,116,2,235,52,160,243,169,80,160,244,169,80,160,245,169,80
    call pO12A_0737
    db 128,62,30,217,0,116,23,184,32,0,80,184,148,0,80,191,30,210,30,87
    call pR1C3_1F24
    db 198,6,30,217,0,198,6,126,174,0
  end;
end;

{ 0090 }
begin
  asm
  end;
end.

