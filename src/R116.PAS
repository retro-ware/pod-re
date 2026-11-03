{ R116: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R116;

interface

uses GAMEDATA;

procedure pR116_006E(a0: byte);
procedure XR116_00D7;
procedure XR116_00FF;

implementation

uses LIT, R5C0;

type
  R0_byte = record v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  PR0_byte = ^R0_byte;
  PR27_byte = ^R27_byte;
var
  aAA35_9f8b: array[0..8189] of pointer absolute dAA35;
  bAA31: byte absolute dAA31;
  lAA35: longint absolute dAA35;
  pAA59: pointer absolute dAA59;

{$L R116A.OBJ}
procedure XR116_00D7; external;
procedure XR116_00FF; external;


{ 006E }
procedure pR116_006E(a0: byte);
var
  _f1: array[1..4] of byte;
  v8p: pointer;
  { 0000 }
  procedure pR116_0000;
  begin
    asm
    db 139,126,6,54,138,69,6,48,228,139,248,209,231,209,231,255,181,55,170,255,181,53,170,139,126,6,54,255
    db 117,250,54,255,117,248,139,126,6,54,138,69,6,48,228,139,248,209,231,255,181,31,170
    push cs
    call near ptr XR116_00FF
    db 139,126,6,54,255,117,250,54,255,117,248,196,62,89,170,129,199,27,0,6,87,160,49,170,48,228,139,248
    db 209,231,209,231,255,181,55,170,255,181,53,170,184,64,30,80
    push cs
    call near ptr XR116_00D7
    end;
  end;

begin
  {@0074-007F}
  if lAA35 = 0 then
    Exit;
  {@007F-008E}
  GetMem(v8p, 7744);
  if a0 <> bAA31 then
    pR116_0000
  else
    Move(PR0_byte(aAA35_9f8b[a0])^.v, PR27_byte(pAA59)^.v, 7744);
  {@00C2-00D1}
  pR5C0_0000(v8p, 7744);
end;

end.
