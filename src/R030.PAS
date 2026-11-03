{ R030: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R030;

interface

uses GAMEDATA;

function pR030_0042(a0: word): word;

implementation

uses LIT, O06E, R47F, R670;

var
  b8816: byte absolute d8816;


{ 0042 }
function pR030_0042(a0: word): word;
var
  v3b: byte;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    if LV = 'WARNING: Insufficient Memory' then;
    if LV = 'Insufficient Memory. Exiting Program' then;
    with LPR^ do with LPR^ do LM0_1([LB]);
  end;
  {@0048-00B2}
  if a0 > 0 then
  begin
    asm
  db 198,70,253,0
    end;
    {@0052-00AA}
    repeat
      {@0052-006C}
      pR47F_0B2E(14, 0, 'WARNING: Insufficient Memory');
      if b8816 <> 0 then
      begin
        asm
  db 176,1,80,176,0,80
  call pO06E_2989
        end;
        asm
  db 160,213,148,136,70,253
        end;
      end
      else
      begin
        asm
  db 198,70,253,1
        end;
        {@008A-00A4}
        pR47F_0B2E(14, 0, 'Insufficient Memory. Exiting Program');
      end;
    until v3b <> 0;
    asm
  db 176,0,80
  call pR670_0000
    end;
  end;
end;

{ 00BB }
begin
  {@00BE-00CB}
  Heaperror := Pointer(@pR030_0042);
end.

