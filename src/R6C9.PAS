{ R6C9: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R6C9;

interface

uses GAMEDATA;

procedure pR6C9_0000(a0: word);
procedure pR6C9_00CC;

implementation

uses LIT;


{$L R6C9A.OBJ}
procedure XR6C9_00D6(a0: word); far; external;
procedure XR6C9_00F5; far; external;
procedure XR6C9_00FF; far; external;


{ 0000 }
procedure pR6C9_0000(a0: word);
type
  TEnt = record w: word; p: pointer; end;
label L1, L9;
var
  p: pointer;
  tab: array[0..11] of TEnt absolute dFB1A;
  buf: pointer absolute dFB62;
  len: word absolute dFB6E;
begin
  if (a0 > 1) and (a0 < 13) then
  begin
    { XR6C9_00FF / 00F5 are asm tail entries returning a boolean in AL }
    asm
      push cs
      call near ptr XR6C9_00FF
      or al,al
      jnz @a
      jmp L9
    @a:
    end;
  L1:
    asm
      push cs
      call near ptr XR6C9_00F5
      or al,al
      jz @b
      jmp L1
    @b:
    end;
    FillChar(dFB6A, 12, 0);
    FillChar(buf^, 9000, 0);
    dFB74 := 9000;
    len := longint(tab[a0 - 1].w);
    Move(tab[a0 - 1].p^, buf^, tab[a0 - 1].w);
    p := buf;
    Move(p, dFB6A, 4);
    asm
      mov di, offset dFB6A
      push di
      push cs
      call near ptr XR6C9_00D6
    end;
  end;
L9:
end;

{ 00CC }
procedure pR6C9_00CC;
begin
end;

{ 00D1 }
begin
end.

