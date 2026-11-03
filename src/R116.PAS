{ R116: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R116;

interface

uses GAMEDATA;

procedure pR116_006E(a0: word);
procedure XR116_00D7;
procedure XR116_00FF;

implementation

uses LIT, R5C0;


{$L R116A.OBJ}
procedure XR116_00D7; external;
procedure XR116_00FF; external;


{ 006E }
procedure pR116_006E(a0: word);
var loc: array[1..8] of byte;
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
  asm
    db 161,53,170,11,6,55,170,117,2,235,82,184,64,30,80,154,63,2,37,8,137,70,248,137,86,250,138,70
    db 6,58,6,49,170,116,7,85
    push cs
    call near ptr pR116_0000
    db 235,36,138,70,6,48,228,139,248,209,231,209,231,196,189,53,170,6,87,196,62,89,170,129,199,27,0,6
    db 87,184,64,30,80,154,92,26,37,8,255,118,250,255,118,248,184,64,30,80
    call pR5C0_0000
  end;
end;

end.
