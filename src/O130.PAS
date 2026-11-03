{ O130: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O+,R-,S-,V-,X-}
unit O130;

interface

uses GAMEDATA;

function pO130_0000(a0: integer): word;
procedure pO130_01A0(a0: pointer);
function pO130_0247(a0: pointer): byte;
function pO130_0549(a0: shortint; a1: shortint; a2: shortint; a3: shortint; a4: byte): byte;
function pO130_03EC(a0: shortint; a1: shortint; a2: pointer; a3: pointer; a4: pointer): byte;
procedure pO130_08D7(a0: shortint; a1: shortint; a2: word; a3: byte; a4: byte);

implementation

uses LIT, O135;

type
  E3_byte = record f: byte; _r: array[1..2] of byte end;
  E4_byte = record f: byte; _r: array[1..3] of byte end;
  E4_shortint = record f: shortint; _r: array[1..3] of byte end;
  R0_shortint = record v: shortint end;
  R0_word = record v: word end;
  RB7_50_byte = record _p: array[1..7] of byte; a: array[0..1198, 0..49] of byte end;
W0_7_0247 = record case byte of 0: (_p0: array[1..4] of byte; _w7_4word: word);
      1: (_p1: array[1..6] of byte; _w7_6word: word); 2: (_p2: array[1..8] of byte; _w7_8word: word);
      3: (_p3: array[1..8] of byte; _w7_8integer: integer); 4: (_p4: array[1..10] of byte;
      _w7_10integer: integer); 5: (_p5: array[1..10] of byte; _w7_10word: word);
      6: (_p6: array[1..12] of byte; _w7_12integer: integer); 7: (_p7: array[1..12] of byte;
      _w7_12word: word); 8: (_p8: array[1..14] of byte; _w7_14word: word); 9: (_p9: array[1..16] of byte;
      _w7_16word: word); 10: (_p10: array[1..18] of byte; _w7_18word: word); 11: (_p11: array[1..20] of byte;
      _w7_20word: word); 12: (_p12: array[1..22] of byte; _w7_22byte: byte); 13: (_p13: array[1..23] of byte;
      _w7_23byte: byte) end;
  X3 = array[0..2] of byte;
  PR0_shortint = ^R0_shortint;
  PR0_word = ^R0_word;
  PRB7_50_byte = ^RB7_50_byte;
  PW0_7_0247 = ^W0_7_0247;
var
  a3DAE_9455: array[0..10919, 0..2] of byte absolute d3DAE;
  a3EAC_ff2a: array[0..32759] of shortint absolute d3EAC;
  a3EB5_ff2a: array[0..32759] of shortint absolute d3EB5;
  a3EBB_2a50: array[0..8189] of E4_byte absolute d3EBB;
  a9EF1_2fb8: array[0..8189] of E4_shortint absolute d9EF1;
  a9EF2_2fb8: array[0..8189] of E4_shortint absolute d9EF2;
  a9EF4_2a50: array[0..8189] of E4_byte absolute d9EF4;
  aA6E2_89af: array[0..10919] of X3 absolute dA6E2;
  aA6E2_fd21: array[0..10919] of E3_byte absolute dA6E2;
  aA6E3_fd21: array[0..10919] of E3_byte absolute dA6E3;
  aA6E4_fd21: array[0..10919] of E3_byte absolute dA6E4;
  b9EF4: byte absolute d9EF4;
  bA6E4: byte absolute dA6E4;
  pA6E0: pointer absolute dA6E0;

procedure pO130_002E; far; forward;

{ 0000 }
function pO130_0000(a0: integer): word;
begin
  {@0006-0013}
  if a0 < 0 then
  begin
    {@000C-0011}
    pO130_0000 := 65535;
    {@0011-0013}
    Exit;
  end;
  {@0013-0020}
  if a0 > 0 then
  begin
    {@0019-001E}
    pO130_0000 := 1;
    {@001E-0020}
    Exit;
  end;
  {@0020-0025}
  pO130_0000 := 0;
end;

{ 002E }
procedure pO130_002E;
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  _f1: array[1..2] of byte;
  _v7: byte;
  v7a: X3 absolute _v7;
begin
  {@0034-003E}
  if bA6E4 <= 1 then
    Exit;
  {@003E-019C}
  for v1b := 1 to bA6E4 - 1 do
    for v2b := v1b + 1 to bA6E4 do
    begin
      {@0075-0089}
      v4b := aA6E4_fd21[v1b].f;
      {@0089-009D}
      v3b := aA6E4_fd21[v2b].f;
if (aA6E3_fd21[v2b].f < aA6E3_fd21[v1b].f) or (aA6E3_fd21[v2b].f = aA6E3_fd21[v1b].f) and (v3b < v4b)
          and ((v3b mod 2) <= (v4b mod 2)) then
      begin
        {@0115-0136}
        v7a := aA6E2_89af[v1b];
        {@0136-0165}
        aA6E2_89af[v1b] := aA6E2_89af[v2b];
        {@0165-0186}
        aA6E2_89af[v2b] := v7a;
      end;
    end;
end;

{ 01A0 }
procedure pO130_01A0(a0: pointer);
var loc: array[1..4] of byte;
begin
  asm
    db 196,126,6,137,126,252,140,70,254,196,126,252,38,139,5,196,126,252,38,137,69,14,196,126,252,38,139,69
    db 2,196,126,252,38,137,69,16,196,126,252,38,139,69,4,196,126,252,38,43,5,153,49,208,41,208,196,126
    db 252,38,137,69,10,196,126,252,38,139,69,6,196,126,252,38,43,69,2,153,49,208,41,208,196,126,252,38
    db 137,69,12,196,126,252,38,139,69,4,196,126,252,38,43,5,80
    push cs
    call near ptr pO130_0000
    db 196,126,252,38,137,69,18,196,126,252,38,139,69,6,196,126,252,38,43,69,2,80
    push cs
    call near ptr pO130_0000
    db 196,126,252,38,137,69,20,196,126,252,49,192,38,137,69,8,196,126,252,38,198,69,22,0
  end;
end;

{ 0247 }
function pO130_0247(a0: pointer): byte;
var
  v2b: byte;
  v3b: byte;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
begin
  {@024D-0251}
  pO130_0247 := 0;
  {@0251-0255}
  v2b := 1;
  {@0255-0259}
  v3b := 1;
  with PW0_7_0247(a0)^ do
  begin
    if _w7_10integer >= _w7_12integer then
    begin
      {@0275-031B}
      if _w7_14word <> _w7_4word then
      begin
        {@0288-0296}
        Inc(_w7_14word, _w7_18word);
        {@0296-02A1}
        v2b := _w7_18word + 1;
        {@02A1-02AF}
        Inc(_w7_8word, _w7_12word);
        {@02AF-02BD}
        Inc(_w7_8word, _w7_12word);
        {@02BD-02C4}
        Inc(_w7_22byte);
        {@02C4-02CB}
        Inc(_w7_22byte);
        if _w7_8integer >= _w7_10integer then
        begin
          {@02DB-02E9}
          Dec(_w7_8word, _w7_10word);
          {@02E9-02F7}
          Dec(_w7_8word, _w7_10word);
          {@02F7-0305}
          Inc(_w7_16word, _w7_20word);
          {@0305-0310}
          v3b := _w7_20word + 1;
          {@0310-0317}
          Inc(_w7_22byte);
        end;
        {@0317-031B}
        pO130_0247 := 1;
      end;
    end
    else
    begin
      {@031E-03C4}
      if _w7_16word <> _w7_6word then
      begin
        {@0331-033F}
        Inc(_w7_16word, _w7_20word);
        {@033F-034A}
        v3b := _w7_20word + 1;
        {@034A-0358}
        Inc(_w7_8word, _w7_10word);
        {@0358-0366}
        Inc(_w7_8word, _w7_10word);
        {@0366-036D}
        Inc(_w7_22byte);
        {@036D-0374}
        Inc(_w7_22byte);
        if _w7_8integer >= _w7_12integer then
        begin
          {@0384-0392}
          Dec(_w7_8word, _w7_12word);
          {@0392-03A0}
          Dec(_w7_8word, _w7_12word);
          {@03A0-03AE}
          Inc(_w7_14word, _w7_18word);
          {@03AE-03B9}
          v2b := _w7_18word + 1;
          {@03B9-03C0}
          Inc(_w7_22byte);
        end;
        {@03C0-03C4}
        pO130_0247 := 1;
      end;
    end;
    {@03C4-03E3}
    _w7_23byte := a3DAE_9455[v3sb, v2sb];
  end;
end;

{ 03EC }
function pO130_03EC(a0: shortint; a1: shortint; a2: pointer; a3: pointer; a4: pointer): byte;
var
  _f1: array[1..1] of byte;
  v3b: byte;
  _f2: array[1..8] of byte;
  v13i: integer;
  v15i: integer;
  _f3: array[1..2] of byte;
  v19w: word;
  v21w: word;
  v23w: word;
  v25w: word;
  _f4: array[1..16] of byte;
  v43w: word;
  v45w: word;
  v47w: word;
  v49w: word;
  v50b: byte;
  v51b: byte;
  v53w: word;
  _f5: array[1..1] of byte;
  v49b: byte absolute v49w;
  v25b: byte absolute v25w;
  v15w: word absolute v15i;
  v13w: word absolute v13i;
begin
  {@03F2-03FE}
  v53w := PR0_word(a4)^.v * 2 + 1;
  {@03FE-0405}
  v25w := a0;
  {@0405-040C}
  v23w := a1;
  {@040C-0416}
  v21w := PR0_shortint(a2)^.v;
  {@0416-0420}
  v19w := PR0_shortint(a3)^.v;
  {@0420-0429}
  pO130_01A0(@v25b);
  {@0429-042E}
  v49w := 0;
  {@042E-045A}
  v47w := a3EBB_2a50[PRB7_50_byte(pA6E0)^.a[a1, a0]].f;
  if v15i > v13i then
    v45w := v15w
  else
    v45w := v13w;
  {@0470-049C}
  v43w := a3EBB_2a50[PRB7_50_byte(pA6E0)^.a[a1, a0]].f;
  {@049C-04A5}
  pO130_01A0(@v49b);
  {@04A5-04A9}
  v50b := 0;
  {@04A9-0531}
  repeat
    asm
  db 196,62,224,166,38,128,125,6,0,117,40,139,78,245,184,50,0,247,102,247,196,62,224,166,3,248,3,249
  db 38,138,69,7,48,228,139,248,209,231,209,231,138,133,188,62,48,228,59,70,223,127,10,138,70,253,48,228
  db 59,70,203,118,35,138,70,245,196,126,14,38,136,5,138,70,247,196,126,10,38,136,5,138,70,253,48,228
  db 196,126,6,38,137,5,198,70,255,0,235,55
    end;
    {@0509-0515}
    v51b := pO130_0247(@v49b);
    {@0515-0528}
    v50b := Ord(pO130_0247(@v25b) = 0);
  until v50b <> 0;
  {@0531-053C}
  PR0_word(a4)^.v := v3b;
  {@053C-0540}
  pO130_03EC := 1;
end;

{ 0549 }
function pO130_0549(a0: shortint; a1: shortint; a2: shortint; a3: shortint; a4: byte): byte;
var
  v2b: byte;
  v3b: byte;
  _f1: array[1..1] of byte;
  v3sb: shortint absolute v3b;
  v2sb: shortint absolute v2b;
begin
  {@054F-0586}
  if (a0 < 0) or (a0 > 49) or (a1 < 0) or (a1 > 24) or (a2 < 0) or (a2 > 49) or (a3 < 0) or (a3 > 24) then
  begin
    {@057F-0583}
    pO130_0549 := 0;
    {@0583-0586}
    Exit;
  end;
  {@0586-0590}
  if a4 = 255 then
    a4 := 8;
  {@0590-05A7}
  v2b := a0 + a3EAC_ff2a[a4];
  {@05A7-05BE}
  v3b := a1 + a3EB5_ff2a[a4];
  if (byte(a0) = byte(a2)) and (byte(a1) = byte(a3)) or (v2b = byte(a2)) and (v3b = byte(a3)) then
  begin
    {@05DE-05E2}
    pO130_0549 := 1;
    {@05E2-05E5}
    Exit;
  end;
  {@05E5-08CE}
  case a4 of
0: pO130_0549 := Ord((a2 >= v2sb) and (a3 <= (Integer(v2sb - a2) + v3sb)) or (a2 <= v2sb)
        and (a3 <= (Integer(a2 - v2sb) + v3sb)));
1: pO130_0549 := Ord((a2 >= v2sb) and (a3 <= (Integer(v2sb - a2) + v3sb)) or (a2 >= (Integer(v2sb
        + v3sb) - a3)) and (a3 <= v3sb));
2: pO130_0549 := Ord((a2 >= (Integer(v2sb + v3sb) - a3)) and (a3 <= v3sb) or (a2 >= (Integer(v2sb
        + a3) - v3sb)) and (a3 >= v3sb));
3: pO130_0549 := Ord((a2 >= (Integer(v2sb + a3) - v3sb)) and (a3 >= v3sb) or (a2 >= v2sb)
        and (a3 >= (Integer(a2 - v2sb) + v3sb)));
4: pO130_0549 := Ord((a2 >= v2sb) and (a3 >= (Integer(a2 - v2sb) + v3sb)) or (a2 <= v2sb)
        and (a3 >= (Integer(v2sb - a2) + v3sb)));
5: pO130_0549 := Ord((a2 <= v2sb) and (a3 >= (Integer(v2sb - a2) + v3sb)) or (a2 <= (Integer(v2sb
        + v3sb) - a3)) and (a3 >= v3sb));
6: pO130_0549 := Ord((a2 <= (Integer(v2sb + v3sb) - a3)) and (a3 >= v3sb) or (a2 <= (Integer(v2sb
        + a3) - v3sb)) and (a3 <= v3sb));
7: pO130_0549 := Ord((a2 <= (Integer(v2sb + a3) - v3sb)) and (a3 <= v3sb) or (a2 <= v2sb)
        and (a3 <= (Integer(a2 - v2sb) + v3sb)));
    8: pO130_0549 := 1;
  end;
end;

{ 08D7 }
procedure pO130_08D7(a0: shortint; a1: shortint; a2: word; a3: byte; a4: byte);
var
  v1b: byte;
  v2b: byte;
  v3b: byte;
  v4b: byte;
  v5b: byte;
  v6b: byte;
  v7b: byte;
  v8b: byte;
  v9b: byte;
  v10b: byte;
  v11b: byte;
  v17a: array[0..5] of byte;
  v23a: array[0..5] of byte;
  v29a: array[0..5] of byte;
  v35a: array[0..5] of byte;
  v37w: word;
  v39w: word;
  v39b: byte absolute v39w;
  v37b: byte absolute v37w;
  v29a2: array[0..5] of shortint absolute v29a;
  v17a2: array[0..5] of shortint absolute v17a;
  v11sb: shortint absolute v11b;
  v10sb: shortint absolute v10b;
begin
  {@08DD-0944}
  for v3b := 0 to 5 do
  begin
    {@08E6-093E}
    if pO135_0000(a4, v3b, @v10b, @v11b) <> 0 then
    begin
      {@0901-0919}
      v17a[v3b] := a0 + v10sb;
      {@0919-0931}
      v23a[v3b] := a1 + v11sb;
    end
    else
      v17a[v3b] := 255;
  end;
  {@0944-0949}
  bA6E4 := 0;
  for v1b := 1 to b9EF4 do
  begin
    {@0961-0B8C}
    if a9EF4_2a50[v1b].f > 0 then
    begin
      {@0976-097A}
      v7b := 0;
      {@097A-097F}
      v39w := 255;
      for v4b := 0 to 5 do
      begin
        {@0988-0A04}
        if pO135_0000(a9EF4_2a50[v1b].f, v4b, @v10b, @v11b) <> 0 then
        begin
          {@09AF-09D3}
          v29a[v4b] := a9EF1_2fb8[v1b].f + v10sb;
          {@09D3-09F7}
          v35a[v4b] := a9EF2_2fb8[v1b].f + v11sb;
        end
        else
          v29a[v4b] := 255;
      end;
      {@0A0D-0AF4}
      for v4b := 0 to 5 do
      begin
        {@0A16-0AEB}
        if v29a2[v4b] >= 0 then
          for v3b := 0 to 5 do
          begin
            {@0A2F-0AE2}
            if (v17a2[v3b] >= 0) and (pO130_0549(v17a[v3b], v23a[v3b], v29a[v4b], v35a[v4b], a3) <> 0) then
            begin
              {@0A77-0A84}
              v8b := v29a[v4b];
              {@0A84-0A91}
              v9b := v35a[v4b];
              {@0A91-0A97}
              v37w := a2;
              if pO130_03EC(v17a[v3b], v23a[v3b], @v8b, @v9b, @v37b) <> 0 then
              begin
                {@0AC4-0AC8}
                v7b := 1;
                if v37w < v39w then
                begin
                  {@0AD0-0AD6}
                  v39w := v37w;
                  {@0AD6-0ADC}
                  v5b := v3b;
                  {@0ADC-0AE2}
                  v6b := v4b;
                end;
              end;
            end;
          end;
      end;
      {@0AF4-0B8C}
      if v7b <> 0 then
      begin
        {@0AFD-0B01}
        Inc(bA6E4);
        {@0B01-0B15}
        aA6E2_fd21[bA6E4].f := v1b;
        {@0B15-0B29}
        aA6E3_fd21[bA6E4].f := v39b;
        {@0B29-0B2D}
        v2b := 0;
        if a3 < 8 then
          v2b := a3
        else
          while pO130_0549(v17a[v5b], v23a[v5b], v29a[v6b], v35a[v6b], v2b) = 0 do
            Inc(v2b);
        {@0B78-0B8C}
        aA6E4_fd21[bA6E4].f := v2b;
      end;
    end;
  end;
  {@0B97-0B9B}
  pO130_002E;
end;

{ 0BA1 }
begin
end.

