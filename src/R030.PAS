{ R030: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit R030;

interface

uses GAMEDATA;

function pR030_0042(a0: word): word;

implementation

uses LIT, O06E, R47F, R670;



{ 0042 }
function pR030_0042(a0: word): word;
var
  done: byte;
  b8816: byte absolute d8816;
begin
  if false then begin
    if LV = 'WARNING: Insufficient Memory' then;
    if LV = 'Insufficient Memory. Exiting Program' then;
  end;
  if a0 > 0 then
  begin
    done := 0;
    repeat
      pR47F_0B2E(14, 0, 'WARNING: Insufficient Memory');
      if b8816 <> 0 then
      begin
        pO06E_2989(1, 0);
        done := d94D5;
      end
      else
      begin
        done := 1;
        pR47F_0B2E(14, 0, 'Insufficient Memory. Exiting Program');
      end;
    until done <> 0;
    pR670_0000(0);
  end;
end;

{ 00BB }
begin
  {@00BE-00CB}
  Heaperror := Pointer(@pR030_0042);
end.

