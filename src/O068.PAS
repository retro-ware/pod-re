{ O068: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O068;

interface

uses GAMEDATA;

procedure pO068_0664;
function pO068_0214: byte;

implementation

uses LIT, Crt, O06B, O0AA, O0B2, O0EC, O0FF, O108, O111, O12A, R142, R47F, R5A0, R6DD;

type
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R23_byte = record _p: array[1..23] of byte; v: byte end;
  R24_byte = record _p: array[1..24] of byte; v: byte end;
  R25_byte = record _p: array[1..25] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R32_byte = record _p: array[1..32] of byte; v: byte end;
  R35_byte = record _p: array[1..35] of byte; v: byte end;
  R36_byte = record _p: array[1..36] of byte; v: byte end;
  R37_byte = record _p: array[1..37] of byte; v: byte end;
  R493_byte = record _p: array[1..493] of byte; v: byte end;
  PR22_byte = ^R22_byte;
  PR23_byte = ^R23_byte;
  PR24_byte = ^R24_byte;
  PR25_byte = ^R25_byte;
  PR2_byte = ^R2_byte;
  PR32_byte = ^R32_byte;
  PR35_byte = ^R35_byte;
  PR36_byte = ^R36_byte;
  PR37_byte = ^R37_byte;
  PR493_byte = ^R493_byte;
var
  a3EAC_ec3f: array[0..32759] of byte absolute d3EAC;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ec3f: array[0..32759] of byte absolute d3EB5;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  b880C: byte absolute d880C;
  bA9F2: byte absolute dA9F2;
  bA9F3: byte absolute dA9F3;
  bA9F4: byte absolute dA9F4;
  bA9F5: byte absolute dA9F5;
  bA9F6: byte absolute dA9F6;
  bA9F7: byte absolute dA9F7;
  bAAE5: byte absolute dAAE5;
  bAAE6: byte absolute dAAE6;
  bAB0E: byte absolute dAB0E;
  bAE7E: byte absolute dAE7E;
  bC587: byte absolute dC587;
  bC591: byte absolute dC591;
  bC612: byte absolute dC612;
  p87F8: pointer absolute d87F8;
  p9CEE: pointer absolute d9CEE;
  s2178: string absolute d2178;
  s278C: string absolute d278C;
  s2F3A: string absolute d2F3A;
  s2F63: string absolute d2F63;
  sC5A6: string absolute dC5A6;
  sbA9F3: shortint absolute dA9F3;
  sbA9F4: shortint absolute dA9F4;
  w3DFE: word absolute d3DFE;
  w8802: word absolute d8802;
  w880A: word absolute d880A;

procedure pO068_0000; far; forward;
procedure pO068_00A4; far; forward;
procedure pO068_0153; far; forward;

{ 0000 }
procedure pO068_0000;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v6b: byte absolute v6w;
  v4i: integer absolute v4w;
  v4b: byte absolute v4w;
  v2i: integer absolute v2w;
  v2b: byte absolute v2w;
begin
  {@0006-000D}
  v2w := sbA9F3;
  {@000D-0014}
  v4w := sbA9F4;
  {@0014-001C}
  v6w := bA9F5;
  {@001C-0025}
  PR32_byte(p87F8)^.v := 0;
  if pO12A_048A(v2b, v4b, v6b) <> 0 then
  begin
    {@003A-0045}
    Inc(v2w, a3EAC_ff2a[v6w]);
    {@0045-0050}
    Inc(v4w, a3EB5_ff2a[v6w]);
    if v2i > 15 then
    begin
      {@0056-005B}
      bA9F3 := 15;
      {@005B-0064}
      PR32_byte(p87F8)^.v := 1;
    end;
    {@0064-0078}
    if v2i < 0 then
    begin
      {@006A-006F}
      bA9F3 := 0;
      {@006F-0078}
      PR32_byte(p87F8)^.v := 1;
    end;
    {@0078-008C}
    if v4i > 15 then
    begin
      {@007E-0083}
      bA9F4 := 15;
      {@0083-008C}
      PR32_byte(p87F8)^.v := 1;
    end;
    {@008C-00A0}
    if v4i < 0 then
    begin
      {@0092-0097}
      bA9F4 := 0;
      {@0097-00A0}
      PR32_byte(p87F8)^.v := 1;
    end;
  end;
end;

{ 00A4 }
procedure pO068_00A4;
begin
  {@00A7-00B0}
  pR5A0_0000(w3DFE);
  {@00B0-00B9}
  Delay(50);
  {@00B9-00C8}
  Inc(bA9F3, a3EAC_ec3f[bA9F5]);
  {@00C8-00D7}
  Inc(bA9F4, a3EB5_ec3f[bA9F5]);
  if sbA9F3 < 0 then
    bA9F3 := 15;
  {@00E3-00EF}
  if sbA9F3 > 15 then
    bA9F3 := 0;
  {@00EF-00FB}
  if sbA9F4 < 0 then
    bA9F4 := 15;
  {@00FB-0107}
  if sbA9F4 > 15 then
    bA9F4 := 0;
  {@0107-011B}
  bA9F6 := pO12A_05B9(bA9F3, bA9F4, bA9F5);
  {@011B-012B}
  bA9F7 := pO12A_06BC(bA9F3, bA9F4);
  if (PR24_byte(p87F8)^.v and 1) > 0 then
  begin
    {@0139-0144}
    pO0B2_02E7(1, 2);
    {@0144-0146}
    Exit;
  end;
  {@0146-0151}
  pO0B2_02E7(1, 1);
end;

{ 0153 }
procedure pO068_0153;
var
  _f1: array[1..1] of byte;
  v2b: byte;
  v3b: byte;
  _f2: array[1..1] of byte;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
begin
  {@0159-015E}
  pR6DD_0051;
  {@015E-0163}
  pO0FF_00CC;
  {@0163-0173}
  PR22_byte(p87F8)^.v := PR36_byte(p87F8)^.v;
  {@0173-0183}
  PR23_byte(p87F8)^.v := PR37_byte(p87F8)^.v;
  {@0183-01A0}
  v2b := PR36_byte(p87F8)^.v + a3EAC_ff2a[bA9F5];
  {@01A0-01BD}
  v3b := PR37_byte(p87F8)^.v + a3EB5_ff2a[bA9F5];
  if v2sb < 0 then
    v2b := 0;
  {@01C7-01D1}
  if v2sb > 37 then
    v2b := 37;
  {@01D1-01DB}
  if v3sb < 0 then
    v3b := 0;
  {@01DB-01E5}
  if v3sb > 14 then
    v3b := 14;
  {@01E5-01F0}
  PR36_byte(p87F8)^.v := v2b;
  {@01F0-01FB}
  PR37_byte(p87F8)^.v := v3b;
  {@01FB-0200}
  pO0FF_0000;
  {@0200-0205}
  pR6DD_0030;
  {@0205-0210}
  pO0B2_02E7(12, 3);
end;

{ 0214 }
function pO068_0214: byte;
var
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  _f1: array[1..12] of byte;
  v18b: byte;
begin
  {@021B-0224}
  PR2_byte(p87F8)^.v := 0;
  {@0224-022A}
  v18b := bAAE5;
  case b880C of
    4: begin
      {@0234-0238}
      v2b := 0;
      {@0238-023C}
      v4b := 255;
      {@023C-04E7}
      repeat
        {@023C-04DE}
        if bC591 = 0 then
        begin
          {@0246-024E}
          pO108_00CB(6);
          {@024E-0254}
          bAAE5 := v18b;
          {@0254-026C}
          v4b := pO108_1009(s278C, s2F3A, 1, 0);
          {@026C-0272}
          v18b := bAAE5;
          if bAAE6 = 0 then
            case v4b of
              0: begin
                {@0283-0288}
                pO108_167D;
                {@0288-028D}
                bC591 := 1;
              end;
              1: begin
                {@0294-02EF}
                if (PR25_byte(p87F8)^.v = 0) or (ParamStr(3) = sC5A6) then
                begin
                  {@02BA-02C7}
                  bA9F2 := Ord(bA9F2 = 0);
                  {@02C7-02CC}
                  bC612 := 1;
                  {@02CC-02DD}
                  pO12A_0737(bA9F3, bA9F4, bA9F5);
                end
                else
                  pR47F_0CC0(s2178, 14, 0);
              end;
              2: begin
                {@02F5-0306}
                if PR493_byte(p9CEE)^.v = 0 then
                  pO06B_04F2;
              end;
              3: pO0AA_0C9D(@v5b);
              4: v2b := 1;
              5: begin
                {@0326-0338}
                PR24_byte(p87F8)^.v := PR24_byte(p87F8)^.v xor 1;
                {@0338-033D}
                pO0EC_301C;
              end;
              6: begin
                {@0343-0355}
                PR24_byte(p87F8)^.v := PR24_byte(p87F8)^.v or 2;
                {@0355-035A}
                pO0EC_301C;
                {@035A-0365}
                pO0B2_02E7(1, 2);
                {@0365-036B}
                w880A := w8802;
                {@036B-036F}
                v2b := 1;
              end;
            end
          else
          begin
            {@0371-0381}
            pO0EC_0987(p9CEE, 0);
            {@0381-038A}
            pO0AA_2F7B(v4b);
            {@038A-039A}
            pO0EC_0987(p9CEE, 1);
            {@039A-039F}
            pO0EC_301C;
          end;
        end
        else
        begin
          {@03A2-03B3}
          FillChar(bAB0E, 40, 255);
          {@03B3-03BB}
          pO108_00CB(0);
          {@03BB-03D3}
          v4b := pO108_1009(s278C, s2F63, 1, 0);
          if bAAE6 = 0 then
          begin
            {@03DA-03E5}
            if v4b = 0 then
              bC591 := 0;
          end
          else
            case v4b of
              72: begin
                {@03EF-03F3}
                pO068_0000;
                {@03F3-03F7}
                v2b := 1;
                {@03F7-03FC}
                pO0EC_301C;
                {@03FC-0400}
                v4b := 255;
              end;
              80: begin
                {@0407-0419}
                bA9F5 := Byte((bA9F5 + 4) mod 8);
                {@0419-042D}
                bA9F6 := pO12A_05B9(bA9F3, bA9F4, bA9F5);
                {@042D-043E}
                pO12A_0737(bA9F3, bA9F4, bA9F5);
                {@043E-0443}
                pO0EC_301C;
                {@0443-0447}
                v4b := 255;
              end;
              75: begin
                {@044E-0460}
                bA9F5 := Byte((bA9F5 + 6) mod 8);
                {@0460-0474}
                bA9F6 := pO12A_05B9(bA9F3, bA9F4, bA9F5);
                {@0474-0485}
                pO12A_0737(bA9F3, bA9F4, bA9F5);
                {@0485-048A}
                pO0EC_301C;
                {@048A-048E}
                v4b := 255;
              end;
              77: begin
                {@0494-04A5}
                bA9F5 := Byte((bA9F5 + 2) mod 8);
                {@04A5-04B9}
                bA9F6 := pO12A_05B9(bA9F3, bA9F4, bA9F5);
                {@04B9-04CA}
                pO12A_0737(bA9F3, bA9F4, bA9F5);
                {@04CA-04CF}
                pO0EC_301C;
                {@04CF-04D3}
                v4b := 255;
              end;
              27: bC591 := 0;
            end;
        end;
      until v2b <> 0;
    end;
    3: begin
      {@04F1-063A}
      if PR35_byte(p87F8)^.v <> 0 then
      begin
        {@04FF-0503}
        v2b := 0;
        {@0503-063A}
        repeat
          {@0503-0514}
          FillChar(bAB0E, 40, 255);
          if bC591 = 0 then
          begin
            {@051B-051F}
            v3b := 0;
            {@051F-052C}
            pO108_00AB(0, @v3b);
            {@052C-0539}
            pO108_00AB(4, @v3b);
            {@0539-053F}
            bAAE5 := v18b;
            {@053F-0557}
            v4b := pO108_1009(s278C, s2F3A, 1, 0);
            {@0557-055D}
            v18b := bAAE5;
            if bAAE6 = 0 then
              case v4b of
                0: begin
                  {@056B-0570}
                  pO108_167D;
                  {@0570-0575}
                  bC591 := 1;
                end;
                4: v2b := 1;
              end;
          end
          else
          begin
            {@0582-0593}
            FillChar(bAB0E, 40, 255);
            {@0593-0598}
            bAB0E := 0;
            {@0598-05B0}
            v4b := pO108_1009(s278C, s2F63, 1, 0);
            if bAAE6 = 0 then
            begin
              {@05B7-05C2}
              if v4b = 0 then
                bC591 := 0;
            end
            else
            begin
              {@05C4-05C8}
              v2b := 1;
              case v4b of
                72: bA9F5 := 0;
                73: bA9F5 := 1;
                77: bA9F5 := 2;
                81: bA9F5 := 3;
                80: bA9F5 := 4;
                79: bA9F5 := 5;
                75: bA9F5 := 6;
                71: bA9F5 := 7;
                27: bC591 := 0;
              end;
              {@062C-0631}
              pO0EC_301C;
            end;
          end;
        until v2b <> 0;
      end;
    end;
  end;
  {@063A-0657}
  if bC587 = 0 then
  begin
    {@0641-0652}
    pR142_0217(1, 17, 38, 22);
    {@0652-0657}
    bC587 := 1;
  end;
  {@0657-065D}
  pO068_0214 := v4b;
end;

{ 0664 }
procedure pO068_0664;
var
  v1b: byte;
  _f1: array[1..1] of byte;
begin
  {@066A-066E}
  v1b := 0;
  case b880C of
    4: begin
      {@0675-06B2}
      if PR2_byte(p87F8)^.v < 255 then
      begin
        {@0680-0685}
        bAE7E := 1;
        if pO12A_048A(bA9F3, bA9F4, bA9F5) = 1 then
        begin
          {@069A-069E}
          v1b := 1;
          {@069E-06A2}
          pO068_00A4;
        end;
        {@06A2-06A7}
        pO0EC_301C;
      end
      else
        PR2_byte(p87F8)^.v := 0;
    end;
    3: begin
      {@06B8-06CC}
      if PR2_byte(p87F8)^.v < 255 then
      begin
        {@06C3-06C7}
        pO068_0153;
        {@06C7-06CC}
        pO0EC_301C;
      end;
    end;
  else
    {@06CE-06D7}
    PR2_byte(p87F8)^.v := 0;
  end;
  {@06D7-06DC}
  pO111_096E;
end;

{ 06E0 }
begin
end.

