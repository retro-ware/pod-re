{ R030: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R030;

interface

uses GAMEDATA;

function pR030_0042(a0: word): word;

implementation

uses LIT, O06E, R47F, R670;



{ 0042 }
function pR030_0042(a0: word): word;
var loc: array[1..38] of byte;
begin
  if false then begin
    if LV = 'WARNING: Insufficient Memory' then;
    if LV = 'Insufficient Memory. Exiting Program' then;
  end;
  asm
    db 131,126,6,0,118,100,198,70,253,0,176,14,80,176,0,80,141,126,224,22,87,191,0,0,14,87,154,111
    db 10,37,8
    call pR47F_0B2E
    db 128,62,22,136,0,116,19,176,1,80,176,0,80
    call pO06E_2989
    db 160,213,148,136,70,253,235,30,198,70,253,1,176,14,80,176,0,80,141,126,216,22,87,191,29,0,14,87
    db 154,111,10,37,8
    call pR47F_0B2E
    db 128,126,253,0,116,168,176,0,80
    call pR670_0000
  end;
end;

{ 00BB }
begin
  asm
    mov ax, offset pR030_0042
    mov dx, seg pR030_0042
    db 163,196,125,137,22,198,125
  end;
end.

