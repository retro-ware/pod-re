{ O10E: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O10E;

interface

uses GAMEDATA;

procedure pO10E_0000;

implementation

uses LIT, O111, O12A, R1C3;

type
  R33_byte = record _p: array[1..33] of byte; v: byte end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R57_byte = record _p: array[1..57] of byte; v: byte end;
  PR33_byte = ^R33_byte;
  PR35_byte = ^R35_byte;
  PR57_byte = ^R57_byte;
var
  a7D08_ec3f: array[0..32759] of byte absolute d7D08;
  b880C: byte absolute d880C;
  b8814: byte absolute d8814;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bAE7E: byte absolute dAE7E;
  bD91E: byte absolute dD91E;
  gD21E_9554: B768 absolute dD21E;
  p87F8: pointer absolute d87F8;


{ 0000 }
procedure pO10E_0000;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@0006-000F}
  if b8814 <> 0 then
    Exit;
  {@000F-0087}
  if ((PR33_byte(p87F8)^.v <> 1) or (PR35_byte(p87F8)^.v <> 0)) and (bAE7E <> 0) then
  begin
    {@002C-003F}
    v1b := a7D08_ec3f[PR57_byte(p87F8)^.v];
    {@003F-0048}
    pO111_0B1C(v1b);
    {@0048-004D}
    pO111_0BAF;
  end
  else
  begin
    {@004F-0058}
    if b880C <> 4 then
      Exit;
    {@0058-0069}
    pO12A_0737(bA9F3, bA9F4, bA9F5);
    if bD91E <> 0 then
    begin
      {@0070-0082}
      pR1C3_1F24(32, 148, gD21E_9554);
      {@0082-0087}
      bD91E := 0;
    end;
  end;
  {@0087-008C}
  bAE7E := 0;
end;

{ 0090 }
begin
end.

