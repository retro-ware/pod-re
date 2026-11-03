{ R116: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R116;

interface

uses GAMEDATA;

procedure pR116_006E(a0: byte);
procedure XR116_00D7(a0,a1,a2: pointer; a3: word);
procedure XR116_00FF(a0,a1: pointer; a2: word);

implementation

uses LIT, R5C0;

type
  R0_byte = record v: byte end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  PR0_byte = ^R0_byte;
  PR27_byte = ^R27_byte;
var
  aAA1F_2fc5: array[0..16379] of word absolute dAA1F;
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
    {@0003-003A}
    XR116_00FF(pointer(aAA35_9f8b[a0]), pointer(v8p), aAA1F_2fc5[a0]);
    {@003A-006A}
    XR116_00D7(pointer(v8p), @PR27_byte(pAA59)^.v, pointer(aAA35_9f8b[bAA31]), 7744);
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
