{ R1C3: generated skeleton (original bytes in BASM) }
{$A-,B-,D+,E-,F+,G-,I-,L-,N-,O-,R-,S-,V-,X-}
unit R1C3;

interface

uses GAMEDATA;

procedure pR1C3_0000;
procedure pR1C3_000F;
function pR1C3_001E(a0: byte; a1: B8): byte;
procedure pR1C3_007C(a0: byte);
procedure pR1C3_00AC;
procedure pR1C3_00B9(a0: pointer; a1: byte; a2: byte; a3: byte; a4: word; a5: pointer);
procedure pR1C3_0352(a0: string; a1: byte; a2: byte; a3: byte; a4: pointer);
procedure pR1C3_03FF(a0: pointer; a1: pointer; a2: byte; a3: byte; a4: pointer);
procedure pR1C3_07C4(a0: word; a1: word; a2: byte; a3: byte; a4: pointer; a5: longint);
procedure pR1C3_08C0(a0: word; a1: word; a2: byte; a3: byte; a4: pointer; a5: longint);
function pR1C3_0956(a0: byte): byte;
function pR1C3_09DB(a0: byte): byte;
procedure pR1C3_0A0C(a0: pointer; a1: pointer);
procedure pR1C3_0CC4(a0: word; a1: word; a2: pointer);
procedure pR1C3_0EEB(a0: word; a1: word; a2: pointer);
procedure pR1C3_10FD;
procedure pR1C3_1421(a0: B16; a1: B16; a2: integer; a3: byte; a4: pointer);
procedure pR1C3_19A4(a0: word; a1: word; a2: word; a3: byte; a4: pointer);
procedure pR1C3_1A83(a0: pointer);
procedure pR1C3_1AF7(a0: integer; a1: integer; a2: word; a3: word; a4: byte; a5: B8; a6: pointer);
procedure pR1C3_1E9D(a0: byte; a1: word; a2: pointer);
procedure pR1C3_1EE1(a0: byte; a1: word; a2: pointer; a3: pointer);
procedure pR1C3_1F24(a0: word; a1: word; a2: B768);
procedure pR1C3_1F72(a0: byte; a1: byte; a2: byte; a3: byte);
procedure pR1C3_2120(a0: byte);

implementation

uses LIT, Dos, R5C0, R5C3, R670, R6DD;

type
  PV2_0_byte = record v: byte; _r: array[1..1] of byte end;
  R0_byte = record v: byte end;
  R0_pointer = record v: pointer end;
  R0_word = record v: word end;
  X8 = array[0..7] of byte;
  R10_X8 = record _p: array[1..10] of byte; v: X8 end;
  R10_byte = record _p: array[1..10] of byte; v: byte end;
  R18_word = record _p: array[1..18] of byte; v: word end;
  R1_byte = record _p: array[1..1] of byte; v: byte end;
  R20_word = record _p: array[1..20] of byte; v: word end;
  R22_byte = record _p: array[1..22] of byte; v: byte end;
  R23_longint = record _p: array[1..23] of byte; v: longint end;
  R23_pointer = record _p: array[1..23] of byte; v: pointer end;
  R27_byte = record _p: array[1..27] of byte; v: byte end;
  R2_byte = record _p: array[1..2] of byte; v: byte end;
  R2_word = record _p: array[1..2] of byte; v: word end;
  R4_byte = record _p: array[1..4] of byte; v: byte end;
  R6_byte = record _p: array[1..6] of byte; v: byte end;
  R8_byte = record _p: array[1..8] of byte; v: byte end;
  R8_word = record _p: array[1..8] of byte; v: word end;
  R9_byte = record _p: array[1..9] of byte; v: byte end;
  RA0_byte = record a: array[0..32000] of byte end;
  RA27_byte = record _p: array[1..27] of byte; a: array[0..32000] of byte end;
W14_62_1421 = record case byte of 0: (_w62_0word: word); 1: (_p1: array[1..2] of byte; _w62_2word: word);
      2: (_p2: array[1..22] of byte; _w62_22byte: byte); 3: (_p3: array[1..27] of byte;
      _w62_27abyte: array[0..32000] of byte) end;
W16_62_1421 = record case byte of 0: (_p0: array[1..8] of byte; _w62_8byte: byte);
      1: (_p1: array[1..18] of byte; _w62_18word: word) end;
W18_62_1421 = record case byte of 0: (_w62_0word: word); 1: (_p1: array[1..2] of byte; _w62_2word: word);
      2: (_p2: array[1..22] of byte; _w62_22byte: byte); 3: (_p3: array[1..27] of byte;
      _w62_27abyte: array[0..32000] of byte) end;
W22_62_1421 = record case byte of 0: (_p0: array[1..8] of byte; _w62_8byte: byte);
      1: (_p1: array[1..18] of byte; _w62_18word: word) end;
W24_62_1421 = record case byte of 0: (_w62_0word: word); 1: (_p1: array[1..2] of byte; _w62_2word: word);
      2: (_p2: array[1..22] of byte; _w62_22byte: byte); 3: (_p3: array[1..27] of byte;
      _w62_27abyte: array[0..32000] of byte) end;
W26_62_1421 = record case byte of 0: (_p0: array[1..8] of byte; _w62_8byte: byte);
      1: (_p1: array[1..18] of byte; _w62_18word: word) end;
W28_62_1421 = record case byte of 0: (_w62_0word: word); 1: (_p1: array[1..2] of byte; _w62_2word: word);
      2: (_p2: array[1..22] of byte; _w62_22byte: byte); 3: (_p3: array[1..27] of byte;
      _w62_27abyte: array[0..32000] of byte) end;
  W2_21_0EEB = record end;
  W2_23_0CC4 = record case byte of 0: (_w23_0word: word); 1: (_p1: array[1..2] of byte; _w23_2word: word) end;
W2_4_1A83 = record case byte of 0: (_p0: array[1..8] of byte; _w4_8word: word);
      1: (_p1: array[1..18] of byte; _w4_18word: word); 2: (_p2: array[1..20] of byte; _w4_20word: word);
      3: (_p3: array[1..23] of byte; _w4_23pointer: pointer) end;
W30_62_1421 = record case byte of 0: (_p0: array[1..18] of byte; _w62_18word: word);
      1: (_p1: array[1..27] of byte; _w62_27abyte: array[0..32000] of byte) end;
W33_550_00B9 = record case byte of 0: (_p0: array[1..4] of byte; _w550_4word: word);
      1: (_p1: array[1..6] of byte; _w550_6word: word); 2: (_p2: array[1..10] of byte; _w550_10X8: X8);
      3: (_p3: array[1..22] of byte; _w550_22byte: byte) end;
W4_797_03FF = record case byte of 0: (_w797_0word: word); 1: (_p1: array[1..2] of byte; _w797_2word: word);
      2: (_p2: array[1..8] of byte; _w797_8word: word); 3: (_p3: array[1..18] of byte; _w797_18word: word);
      4: (_p4: array[1..23] of byte; _w797_23pointer: pointer); 5: (_p5: array[1..27] of byte;
      _w797_27abyte: array[0..32000] of byte) end;
W8_19_0A0C = record case byte of 0: (_w19_0word: word); 1: (_p1: array[1..2] of byte; _w19_2word: word);
      2: (_p2: array[1..10] of byte; _w19_10byte: byte); 3: (_p3: array[1..23] of byte;
      _w19_23pointer: pointer); 4: (_p4: array[1..27] of byte; _w19_27abyte: array[0..32000] of byte) end;
  PR0_byte = ^R0_byte;
  PR0_pointer = ^R0_pointer;
  PR0_word = ^R0_word;
  PR10_X8 = ^R10_X8;
  PR10_byte = ^R10_byte;
  PR18_word = ^R18_word;
  PR1_byte = ^R1_byte;
  PR20_word = ^R20_word;
  PR22_byte = ^R22_byte;
  PR23_longint = ^R23_longint;
  PR23_pointer = ^R23_pointer;
  PR27_byte = ^R27_byte;
  PR2_byte = ^R2_byte;
  PR2_word = ^R2_word;
  PR4_byte = ^R4_byte;
  PR6_byte = ^R6_byte;
  PR8_byte = ^R8_byte;
  PR8_word = ^R8_word;
  PR9_byte = ^R9_byte;
  PRA0_byte = ^RA0_byte;
  PRA27_byte = ^RA27_byte;
  PW14_62_1421 = ^W14_62_1421;
  PW16_62_1421 = ^W16_62_1421;
  PW18_62_1421 = ^W18_62_1421;
  PW22_62_1421 = ^W22_62_1421;
  PW24_62_1421 = ^W24_62_1421;
  PW26_62_1421 = ^W26_62_1421;
  PW28_62_1421 = ^W28_62_1421;
  PW2_21_0EEB = ^W2_21_0EEB;
  PW2_23_0CC4 = ^W2_23_0CC4;
  PW2_4_1A83 = ^W2_4_1A83;
  PW30_62_1421 = ^W30_62_1421;
  PW33_550_00B9 = ^W33_550_00B9;
  PW4_797_03FF = ^W4_797_03FF;
  PW8_19_0A0C = ^W8_19_0A0C;
var
  a3DBC_ec3f: array[0..32759] of byte absolute d3DBC;
  a7D7C_ec3f: array[0..32759] of byte absolute d7D7C;
  a884E_ec3f: array[0..32759] of byte absolute d884E;
  a88F6_2fc5: array[0..16379] of word absolute d88F6;
  a8A46_2fc5: array[0..16379] of word absolute d8A46;
  a8B96_2fc5: array[0..16379] of word absolute d8B96;
  a8F86_2fc5: array[0..16379] of word absolute d8F86;
  a9116_2fc5: array[0..16379] of word absolute d9116;
  a9DC4_9f5c: array[0..4094, 0..1] of longint absolute d9DC4;
  a9DC4_b6a1: array[0..4094, 0..1] of pointer absolute d9DC4;
  aD51E_eec0: array[0..10919] of array[0..2] of byte absolute dD51E;
  aD81E_ec3f: array[0..32759] of byte absolute dD81E;
  b3DBC: byte absolute d3DBC;
  b3DBD: byte absolute d3DBD;
  b3DBE: byte absolute d3DBE;
  b3DBF: byte absolute d3DBF;
  b8818: byte absolute d8818;
  b8819: byte absolute d8819;
  b8832: byte absolute d8832;
  b8833: byte absolute d8833;
  b8834: byte absolute d8834;
  b884E: byte absolute d884E;
  b8A46: byte absolute d8A46;
  b8B96: byte absolute d8B96;
  g8818_6095: Registers absolute d8818;
  p8836: pointer absolute d8836;
  pAEE0: pointer absolute dAEE0;
  sbB16D: shortint absolute dB16D;
  w8F96: word absolute d8F96;

{$L R1C3A.OBJ}
procedure XR1C3_2170(a0,a1,a2: word; a3,a4: pointer); near; external;
procedure XR1C3_21FF(a0,a1,a2: word; a3,a4: pointer); near; external;
procedure XR1C3_229C(a0,a1,a2,a3,a4,a5: word; a6,a7: pointer); near; external;
procedure XR1C3_2417(a0,a1,a2: word; a3,a4: pointer); near; external;
procedure XR1C3_24AC(a0,a1,a2: word; a3,a4: pointer); near; external;
procedure XR1C3_254E(a0,a1,a2,a3,a4,a5: word; a6,a7: pointer); near; external;
procedure XR1C3_27B8(a0,a1,a2: word; a3,a4: pointer); near; external;
procedure XR1C3_285B(a0,a1,a2,a3: word; a4,a5: pointer); near; external;
procedure XR1C3_2911(a0,a1,a2,a3,a4,a5,a6: word; a7,a8: pointer); near; external;
procedure XR1C3_2B8D(a0: pointer; a1,a2: word); near; external;


{ 0000 }
procedure pR1C3_0000;
begin
  {@0003-000D}
  repeat
  until (Port[986] and 8) > 0;
end;

{ 000F }
procedure pR1C3_000F;
begin
  {@0012-001C}
  repeat
  until (Port[986] and 8) = 0;
end;

{ 001E }
function pR1C3_001E(a0: byte; a1: B8): byte;
var
  v10b: byte;
  _f1: array[1..1] of byte;
  v12b: byte;
  v13b: byte;
  _f2: array[1..1] of byte;
begin
  {@0037-003B}
  v10b := 0;
  {@003B-003F}
  v12b := 128;
  for v13b := 0 to 7 do
  begin
    {@0048-005D}
    if a1[v13b] = a0 then
      Inc(v10b, v12b);
    {@005D-0067}
    v12b := v12b shr 1;
  end;
  {@006D-0073}
  pR1C3_001E := v10b;
end;

{ 007C }
procedure pR1C3_007C(a0: byte);
var
  _f1: array[1..2] of byte;
begin
  {@0082-0088}
  b8832 := b8833;
  {@0088-008D}
  b8819 := 0;
  {@008D-0093}
  b8818 := a0;
  {@0093-00A0}
  Intr(16, g8818_6095);
  {@00A0-00A6}
  b8833 := a0;
end;

{ 00AC }
procedure pR1C3_00AC;
begin
  {@00AF-00B7}
  pR1C3_007C(b8832);
end;

{ 00B9 }
procedure pR1C3_00B9(a0: pointer; a1: byte; a2: byte; a3: byte; a4: word; a5: pointer);
var
  v1b: byte;
  _f1: array[1..1] of byte;
  v3b: byte;
  v4b: byte;
  v6w: word;
  v8w: word;
  v10w: word;
  v11b: byte;
  v13w: word;
  _f2: array[1..7] of byte;
  _v21: byte;
  v23w: word;
  _f3: array[1..513] of byte;
  v538w: word;
  _f4: array[1..8] of byte;
  v23b: byte absolute v23w;
  v13b: byte absolute v13w;
  v8b: byte absolute v8w;
  v6b: byte absolute v6w;
  v21a: X8 absolute _v21;
begin
  {@00C0-00D6}
  Move(PR0_byte(PR0_pointer(a0)^.v)^.v, v3b, 1);
  {@00D6-00F0}
  Move(PR1_byte(PR0_pointer(a0)^.v)^.v, v4b, 1);
  {@00F0-010A}
  Move(PR2_byte(PR0_pointer(a0)^.v)^.v, v6b, 2);
  {@010A-0124}
  Move(PR4_byte(PR0_pointer(a0)^.v)^.v, v8b, 2);
  {@0124-013E}
  Move(PR6_byte(PR0_pointer(a0)^.v)^.v, v13b, 2);
  {@013E-0158}
  Move(PR8_byte(PR0_pointer(a0)^.v)^.v, v11b, 1);
  {@0158-0168}
  v10w := PR9_byte(PR0_pointer(a0)^.v)^.v + 1;
  {@0168-0196}
  Move(PR10_byte(PR0_pointer(a0)^.v)^.v, aD51E_eec0[v11b], v10w * 3);
  {@0196-01A5}
  v23w := v10w * 3 + 10;
  for v1b := 0 to v10w shr 1 - 1 do
  begin
    {@01BF-01EC}
    aD81E_ec3f[v11b + v1b * 2] := PRA0_byte(PR0_pointer(a0)^.v)^.a[v23w] shr 4;
    {@01EC-0215}
    aD81E_ec3f[v11b + v1b * 2 + 1] := PRA0_byte(PR0_pointer(a0)^.v)^.a[v23w] and 15;
    {@0215-0218}
    Inc(v23w);
  end;
  {@0221-0237}
  if (v11b = 32) and (v10w = 112) then
    Inc(v23w, 32)
  else
    Inc(v23w, 4);
  {@0237-02DB}
  if a3 <> 0 then
    pR1C3_19A4(v3b, v4b, v13w, a1, @PR0_byte(a5)^.v)
  else
  begin
    {@025C-0272}
    v538w := v3b * v4b * 8;
    {@0272-0286}
    PR0_pointer(a5)^.v := PR0_pointer(a0)^.v;
    {@0286-0294}
    PR0_word(PR0_pointer(a5)^.v)^.v := v3b;
    {@0294-02A3}
    PR2_word(PR0_pointer(a5)^.v)^.v := v4b;
    {@02A3-02B1}
    PR18_word(PR0_pointer(a5)^.v)^.v := v538w;
    {@02B1-02BE}
    PR8_word(PR0_pointer(a5)^.v)^.v := v13w;
    {@02BE-02CE}
    PR23_longint(PR0_pointer(a5)^.v)^.v := 0;
    {@02CE-02DB}
    PR20_word(PR0_pointer(a5)^.v)^.v := a4;
  end;
  {@02DB-0347}
  with PW33_550_00B9(PR0_pointer(a5)^.v)^ do
  begin
    _w550_4word := v6w;
    _w550_6word := v8w;
    _w550_22byte := a2;
    _w550_10X8 := v21a;
  end;
  pR1C3_03FF(pointer(PR0_pointer(a0)^.v), @v23b, a1, a2, pointer(PR0_pointer(a5)^.v));
end;

{ 0352 }
procedure pR1C3_0352(a0: string; a1: byte; a2: byte; a3: byte; a4: pointer);
var loc: array[1..12] of byte;
begin
  if false then begin
    if LV = '.dax' then;
  end;
  asm
    db 196,126,6,38,139,5,38,11,69,2,116,9,196,126,6,6,87
    push cs
    call near ptr pR1C3_1A83
    db 141,190,0,255,22,87,141,190,245,254,22,87,191,77,3,14,87,154,111,10,37,8,138,70,14,80,141,190
    db 254,254,22,87,141,190,250,254,22,87
    call pR5C3_0915
    db 131,190,254,254,0,117,2,235,67,141,190,250,254,22,87,138,70,12,80,138,70,10,80,128,62,52,136,2
    db 176,0,116,1,64,80,255,182,254,254,196,126,6,6,87
    push cs
    call near ptr pR1C3_00B9
    db 128,62,52,136,2,116,17,255,182,252,254,255,182,250,254,255,182,254,254
    call pR5C0_0000
    call pR670_0311
  end;
end;

{ 03FF }
procedure pR1C3_03FF(a0: pointer; a1: pointer; a2: byte; a3: byte; a4: pointer);
var
  v8a2: array[0..7] of byte;
  v10w: word;
  v12w: word;
  v14w: word;
  v16w: word;
  v18w: word;
  _f1: array[1..1] of byte;
  v20b: byte;
  _f2: array[1..1] of byte;
  v22b: byte;
  v23b: byte;
  v24b: byte;
  _f3: array[1..769] of byte;
  v8b: byte absolute v8a2;
  v8a: B8 absolute v8a2;
begin
  asm
  db 139,70,6,11,70,8,117,3,233,173,3
  end;
  {@0411-07BE}
  with PW4_797_03FF(a4)^ do
  begin
    v16w := 0;
    v18w := 0;
    case b8834 of
      0: for v10w := 1 to _w797_8word do
          for v14w := 0 to _w797_0word - 1 do
            for v12w := 0 to _w797_2word - 1 do
            begin
              {@048F-04AA}
              Move(PRA0_byte(a0)^.a[PR0_word(a1)^.v], v8b, 8);
              if _w797_23pointer <> nil then
                FillChar(PRA0_byte(_w797_23pointer)^.a[v16w], 4, pR1C3_001E(a3, v8a));
              {@04DE-04E2}
              v22b := 128;
              for v20b := 0 to 7 do
              begin
                {@04EB-0500}
                v24b := aD81E_ec3f[v8a2[v20b]];
                for v23b := 0 to 3 do
                begin
                  {@0509-0544}
                  if (a3DBC_ec3f[v23b] and v24b) > 0 then
                    _w797_27abyte[v23b + v16w] := _w797_27abyte[v23b + v16w] or v22b;
                end;
                {@054A-0554}
                v22b := v22b shr 1;
              end;
              {@055A-05B3}
              if _w797_23pointer <> nil then
                for v23b := 0 to 3 do
_w797_27abyte[v23b + v16w] := _w797_27abyte[v23b + v16w]
                      and not PRA0_byte(_w797_23pointer)^.a[v16w];
              {@05B3-05B7}
              Inc(v16w, 4);
              {@05B7-05BE}
              Inc(PR0_word(a1)^.v, 8);
            end;
      1: for v10w := 1 to _w797_8word do
        begin
          {@060C-0685}
          for v12w := 0 to _w797_18word - 1 do
          begin
            {@0629-0672}
_w797_27abyte[v16w] := aD81E_ec3f[PRA0_byte(a0)^.a[PR0_word(a1)^.v]] shl 4
                + aD81E_ec3f[PRA0_byte(a0)^.a[PR0_word(a1)^.v + 1]];
            {@0672-0675}
            Inc(v16w);
            {@0675-067C}
            Inc(PR0_word(a1)^.v, 2);
          end;
          {@0685-0744}
          if _w797_23pointer <> nil then
            for v12w := 0 to v16w - 1 do
            begin
              {@06B1-06E1}
              if (_w797_27abyte[v12w] shr 4) = a3 then
                PRA0_byte(_w797_23pointer)^.a[v12w] := 240;
              {@06E1-0706}
              if (_w797_27abyte[v12w] and 15) = a3 then
                Inc(PRA0_byte(_w797_23pointer)^.a[v12w], 15);
              {@0706-0738}
              _w797_27abyte[v12w] := _w797_27abyte[v12w] and not PRA0_byte(_w797_23pointer)^.a[v12w];
            end;
        end;
      2: for v10w := 1 to _w797_8word do
        begin
          {@0773-079C}
          Move(PRA0_byte(a0)^.a[PR0_word(a1)^.v], _w797_27abyte[v16w], _w797_18word);
          {@079C-07A7}
          Inc(v16w, _w797_18word);
          {@07A7-07B5}
          Inc(PR0_word(a1)^.v, _w797_18word);
        end;
    end;
  end;
end;

{ 07C4 }
procedure pR1C3_07C4(a0: word; a1: word; a2: byte; a3: byte; a4: pointer; a5: longint);
var
  _f1: array[1..13] of byte;
  v14b: byte;
  _f2: array[1..2] of byte;
begin
  asm
  db 138,70,14,36,1,8,192,116,20,196,126,10,38,139,69,23,38,11,69,25,117,11,128,62,52,136,2,116
  db 4,176,0,235,2,176,1,136,70,242
  end;
  case b8834 of
    0: asm
  db 128,126,242,0,116,27,255,118,20,255,118,18,138,70,16,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_21FF
  db 235,25,255,118,20,255,118,18,138,70,16,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_2170
      end;
    1: asm
  db 128,126,242,0,116,27,255,118,20,255,118,18,138,70,16,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_24AC
  db 235,25,255,118,20,255,118,18,138,70,16,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_2417
      end;
    2: begin
      {@0878-08A1}
      if v14b <> 0 then
        asm
  db 255,118,20,255,118,18,196,126,10,38,138,69,22,80,138,70,16,80,255,118,12,255,118,10,255,118,8,255
  db 118,6
  call near ptr XR1C3_285B
  db 235,25
        end;
      asm
  db 255,118,20,255,118,18,138,70,16,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_27B8
      end;
    end;
  end;
end;

{ 08C0 }
procedure pR1C3_08C0(a0: word; a1: word; a2: byte; a3: byte; a4: pointer; a5: longint);
var
  _f1: array[1..26] of byte;
begin
  asm
  db 160,52,136,60,0,117,39,255,54,60,136,255,54,58,136,255,118,20,255,118,18,138,70,16,80,138,70,14
  db 80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_229C
  db 235,92
  end;
  asm
  db 60,1,117,39,255,54,60,136,255,54,58,136,255,118,20,255,118,18,138,70,16,80,138,70,14,80,255,118
  db 12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_254E
  db 235,49
  end;
  asm
  db 60,2,117,45
  end;
  asm
  db 255,54,60,136,255,54,58,136,255,118,20,255,118,18,196,126,10,38,138,69,22,80,138,70,16,80,138,70
  db 14,80,255,118,12,255,118,10,255,118,8,255,118,6
  call near ptr XR1C3_2911
  end;
end;

{ 0956 }
function pR1C3_0956(a0: byte): byte;
var
  v2b: byte;
begin
  {@095C-0969}
  v2b := a0 shl 7;
  {@0969-0978}
  Inc(v2b, a0 and 2 shl 5);
  {@0978-0987}
  Inc(v2b, a0 and 4 shl 3);
  {@0987-0993}
  Inc(v2b, a0 and 8 * 2);
  {@0993-099F}
  Inc(v2b, a0 and 16 shr 1);
  {@099F-09AE}
  Inc(v2b, a0 and 32 shr 3);
  {@09AE-09BD}
  Inc(v2b, a0 and 64 shr 5);
  {@09BD-09CC}
  Inc(v2b, a0 and 128 shr 7);
  {@09CC-09D2}
  pR1C3_0956 := v2b;
end;

{ 09DB }
function pR1C3_09DB(a0: byte): byte;
var
  v2b: byte;
begin
  {@09E1-09EE}
  v2b := a0 shl 4;
  {@09EE-09FD}
  Inc(v2b, a0 and 240 shr 4);
  {@09FD-0A03}
  pR1C3_09DB := v2b;
end;

{ 0A0C }
procedure pR1C3_0A0C(a0: pointer; a1: pointer);
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  v10w: word;
  v12w: word;
  v13b: byte;
  _f1: array[1..2] of byte;
begin
  asm
  db 139,70,10,11,70,12,116,8,139,70,6,11,70,8,117,3,233,153,2
  end;
  {@0A25-0CBE}
  with PW8_19_0A0C(a0)^ do
  begin
    Move(_w19_10byte, PR10_byte(a1)^.v, 8);
    case b8834 of
      0: begin
        {@0A53-0A61}
        v8w := _w19_2word * 4;
        {@0A61-0A6A}
        v4w := v8w - 4;
        {@0A6A-0A6F}
        v2w := 0;
        for v12w := 1 to _w19_0word do
        begin
          {@0A8B-0A91}
          v6w := v2w;
          for v10w := 1 to _w19_2word do
          begin
            {@0AAE-0B39}
            for v13b := 0 to 3 do
            begin
              {@0AB7-0AEA}
              PRA27_byte(a1)^.a[v13b + v2w] := pR1C3_0956(_w19_27abyte[v4w - v2w + v6w + v13b]);
              if _w19_23pointer <> nil then
PRA0_byte(PR23_pointer(a1)^.v)^.a[v13b
                    + v2w] := pR1C3_0956(PRA0_byte(_w19_23pointer)^.a[v4w - v2w + v6w + v13b]);
            end;
            {@0B39-0B3D}
            Inc(v2w, 4);
          end;
          {@0B48-0B4E}
          Inc(v4w, v8w);
        end;
      end;
      1: begin
        {@0B63-0B71}
        v8w := _w19_2word * 4;
        {@0B71-0B78}
        v4w := v8w - 1;
        {@0B78-0B7D}
        v2w := 0;
        for v12w := 1 to _w19_0word do
        begin
          {@0B99-0B9F}
          v6w := v2w;
          for v10w := 1 to v8w do
          begin
            {@0BB5-0BDA}
            PRA27_byte(a1)^.a[v2w] := pR1C3_09DB(_w19_27abyte[v4w - v2w + v6w]);
            if _w19_23pointer <> nil then
PRA0_byte(PR23_pointer(a1)^.v)^.a[v2w] := pR1C3_09DB(PRA0_byte(_w19_23pointer)^.a[v4w - v2w
                  + v6w]);
            {@0C12-0C15}
            Inc(v2w);
          end;
          {@0C1D-0C23}
          Inc(v4w, v8w);
        end;
      end;
      2: begin
        {@0C38-0C46}
        v8w := _w19_2word * 8;
        {@0C46-0C4D}
        v4w := v8w - 1;
        {@0C4D-0C52}
        v2w := 0;
        for v12w := 1 to _w19_0word do
        begin
          {@0C6B-0C71}
          v6w := v2w;
          for v10w := 1 to v8w do
          begin
            {@0C87-0CA5}
            PRA27_byte(a1)^.a[v2w] := _w19_27abyte[v4w - v2w + v6w];
            {@0CA5-0CA8}
            Inc(v2w);
          end;
          {@0CB0-0CB6}
          Inc(v4w, v8w);
        end;
      end;
    end;
  end;
end;

{ 0CC4 }
procedure pR1C3_0CC4(a0: word; a1: word; a2: pointer);
var
  v2i: integer;
  v4i: integer;
  v6w: word;
  v8w: word;
  v10w: word;
  v12w: word;
  _f1: array[1..2] of byte;
  v16w: word;
  v18w: word;
  _f2: array[1..1] of byte;
  v4w: word absolute v4i;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  {@0CCA-0CD5}
  if a2 = nil then
    Exit;
  {@0CD5-0EE5}
  with PW2_23_0CC4(a2)^ do
  begin
    case b8834 of
      0: begin
        {@0CE8-0CED}
        v18w := 0;
        {@0CED-0CF7}
        v8w := a1 * 8;
        {@0CF7-0D04}
        v12w := v8w + _w23_0word - 1;
        {@0D04-0D0A}
        v6w := a0;
        {@0D0A-0D18}
        v10w := v6w + _w23_2word - 1;
        {@0D18-0D1E}
        Port[974] := 5;
        {@0D1E-0D24}
        Port[975] := 0;
        {@0D24-0D2A}
        Port[974] := 4;
        for v4i := v8w to v12w do
          for v2i := v6w to v10w do
            asm
  db 198,70,237,0,235,3,254,70,237,138,70,237,186,207,3,238,184,0,160,80,139,70,254,153,139,200,139,218
  db 139,126,252,209,231,139,133,134,143,49,210,3,193,19,211,139,248,7,38,138,21,139,70,238,196,126,6,3
  db 248,38,136,85,27,255,70,238,128,126,237,3,117,192
            end;
        {@0DAC-0DB2}
        Port[975] := 0;
        {@0DB2-0DB8}
        Port[974] := 5;
        {@0DB8-0DBE}
        Port[975] := 0;
      end;
      2: asm
  db 139,70,12,177,3,211,224,139,216,139,70,10,177,3,211,224,186,64,1,247,226,3,195,137,70,242,49,192
  db 137,70,238,196,126,233,38,139,69,2,177,3,211,224,137,70,240,139,70,10,177,3,211,224,137,70,248,139
  db 70,248,196,126,233,38,3,5,72,137,70,244,139,70,244,137,70,231,139,70,248,59,70,231,127,67,137,70
  db 252,235,3,255,70,252,139,70,242,49,210,5,0,0,129,210,0,160,137,199,142,194,6,87,139,70,238,196
  db 126,6,3,248,129,199,27,0,6,87,255,118,240,154,92,26,37,8,139,70,240,1,70,238,129,70,242,64
  db 1,139,70,252,59,70,231,117,194
        end;
      1: begin
        {@0E67-0E75}
        v16w := _w23_2word * 4;
        {@0E75-0E7A}
        v18w := 0;
        {@0E7A-0E84}
        v8w := a1 * 8;
        {@0E84-0E91}
        v12w := v8w + _w23_0word - 1;
        {@0E91-0E9B}
        v6w := a0 * 4;
        for v4i := v8w to v12w do
        begin
          {@0EB1-0ED7}
          Move(Mem[a9116_2fc5[v4w]:v6w], PRA27_byte(a2)^.a[v18w], v16w);
          {@0ED7-0EDD}
          Inc(v18w, v16w);
        end;
      end;
    end;
  end;
end;

{ 0EEB }
procedure pR1C3_0EEB(a0: word; a1: word; a2: pointer);
var
  _f1: array[1..2] of byte;
  v4i: integer;
  v6w: word;
  v8w: word;
  _f2: array[1..2] of byte;
  v12w: word;
  v14w: word;
  v16w: word;
  _f3: array[1..1] of byte;
  v4w: word absolute v4i;
  _fb: byte absolute a0;
  _fw: word absolute a0;
begin
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  asm
  db 139,70,6,11,70,8,117,3,233,251,1
  end;
  {@0EFC-10F7}
  with PW2_21_0EEB(a2)^ do
  begin
    case b8834 of
      0: begin
        asm
  db 49,192,137,70,240
        end;
        asm
  db 139,70,10,177,3,211,224,137,70,248
        end;
        asm
  db 139,70,248,196,126,235,38,3,5,72,137,70,244
        end;
        asm
  db 139,70,12,137,70,250
        end;
        asm
  db 139,70,250,196,126,235,38,3,69,2,72,137,70,246
        end;
        asm
  db 176,2,186,196,3,238
        end;
        for v4i := v8w to v12w do
          asm
  db 139,70,246,137,70,231,139,70,250,59,70,231,127,96,137,70,254,235,3,255,70,254,198,70,239,0,235,3
  db 254,70,239,138,70,239,48,228,139,248,138,133,188,61,186,197,3,238,139,70,240,196,126,6,3,248,38,138
  db 69,27,80,184,0,160,80,139,70,254,153,139,200,139,218,139,126,252,209,231,139,133,134,143,49,210,3,193
  db 19,211,139,248,7,88,38,136,5,255,70,240,128,126,239,3,117,182,139,70,254,59,70,231,117,165
          end;
        asm
  db 176,15,186,197,3,238
        end;
      end;
      1: begin
        asm
  db 196,126,235,38,139,69,2,209,224,209,224,137,70,242
        end;
        asm
  db 49,192,137,70,240
        end;
        asm
  db 139,70,10,177,3,211,224,137,70,248
        end;
        asm
  db 139,70,248,196,126,235,38,3,5,72,137,70,244
        end;
        asm
  db 139,70,12,209,224,209,224,137,70,250
        end;
        for v4i := v8w to v12w do
        begin
          {@102E-1054}
          Move(PRA27_byte(a2)^.a[v16w], Mem[a9116_2fc5[v4w]:v6w], v14w);
          asm
  db 139,70,242,1,70,240
          end;
        end;
      end;
      2: begin
        asm
  db 196,126,235,38,139,69,2,177,3,211,224,137,70,242
        end;
        asm
  db 49,192,137,70,240
        end;
        asm
  db 139,70,10,177,3,211,224,137,70,248
        end;
        asm
  db 139,70,248,196,126,235,38,3,5,72,137,70,244
        end;
        asm
  db 139,70,12,177,3,211,224,137,70,250
        end;
        for v4i := v8w to v12w do
        begin
          {@10B6-10E9}
          Move(PRA27_byte(a2)^.a[v16w], Mem[$A000:Word(LongInt(v6w) + LongInt(320 * v4i))], v14w);
          asm
  db 139,70,242,1,70,240
          end;
        end;
      end;
    end;
  end;
end;

{ 10FD }
procedure pR1C3_10FD;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  _f1: array[1..258] of byte;
begin
  {@1104-1109}
  pR6DD_0051;
  case b8834 of
    0: begin
      {@1113-1119}
      Port[964] := 2;
      for v2w := 0 to 167 do
      begin
        {@1123-1269}
        if a884E_ec3f[v2w] <> 0 then
        begin
          {@1130-114B}
          v8w := a8F86_2fc5[v2w + 8] + a88F6_2fc5[v2w] + 1;
          {@114B-1152}
          Port[965] := b3DBC;
          {@1152-115E}
          v4w := a8A46_2fc5[v2w];
          {@115E-1164}
          v6w := v8w;
          {@1164-1191}
          repeat
            asm
  db 139,70,252,196,62,54,136,3,248,38,138,85,27,184,0,162,80,139,126,250,7,38,136,21
            end;
            {@117C-1180}
            Inc(v4w, 4);
            {@1180-1183}
            Inc(v6w);
          until v4w > a8B96_2fc5[v2w];
          {@1191-1198}
          Port[965] := b3DBD;
          {@1198-11A5}
          v4w := a8A46_2fc5[v2w] + 1;
          {@11A5-11AB}
          v6w := v8w;
          {@11AB-11D8}
          repeat
            asm
  db 139,70,252,196,62,54,136,3,248,38,138,85,27,184,0,162,80,139,126,250,7,38,136,21
            end;
            {@11C3-11C7}
            Inc(v4w, 4);
            {@11C7-11CA}
            Inc(v6w);
          until v4w > a8B96_2fc5[v2w];
          {@11D8-11DF}
          Port[965] := b3DBE;
          {@11DF-11ED}
          v4w := a8A46_2fc5[v2w] + 2;
          {@11ED-11F3}
          v6w := v8w;
          {@11F3-1220}
          repeat
            asm
  db 139,70,252,196,62,54,136,3,248,38,138,85,27,184,0,162,80,139,126,250,7,38,136,21
            end;
            {@120B-120F}
            Inc(v4w, 4);
            {@120F-1212}
            Inc(v6w);
          until v4w > a8B96_2fc5[v2w];
          {@1220-1227}
          Port[965] := b3DBF;
          {@1227-1236}
          v4w := a8A46_2fc5[v2w] + 3;
          {@1236-123C}
          v6w := v8w;
          {@123C-1269}
          repeat
            asm
  db 139,70,252,196,62,54,136,3,248,38,138,85,27,184,0,162,80,139,126,250,7,38,136,21
            end;
            {@1254-1258}
            Inc(v4w, 4);
            {@1258-125B}
            Inc(v6w);
          until v4w > a8B96_2fc5[v2w];
        end;
      end;
      {@1273-1279}
      Port[965] := 15;
      {@1279-1280}
      v6w := w8F96 + 1;
      {@1280-1286}
      Port[974] := 5;
      {@1286-128C}
      Port[975] := 1;
      for v2w := 0 to 167 do
      begin
        {@1296-12E7}
        if a884E_ec3f[v2w] <> 0 then
Move(Mem[$A200:v6w + a88F6_2fc5[v2w]], Mem[$A000:v6w + a88F6_2fc5[v2w]],
              (a8B96_2fc5[v2w] - a8A46_2fc5[v2w]) shr 1 shr 1 + 1);
        {@12E7-12EB}
        Inc(v6w, 40);
      end;
      {@12F2-12F8}
      Port[975] := 0;
    end;
    1: for v2w := 0 to 167 do
      begin
        {@1309-1361}
        if a884E_ec3f[v2w] <> 0 then
Move(PRA27_byte(p8836)^.a[a8A46_2fc5[v2w]], Mem[a9116_2fc5[v2w + 8]:a88F6_2fc5[v2w] + 4],
              a8B96_2fc5[v2w] - a8A46_2fc5[v2w] + 1);
      end;
    2: for v2w := 0 to 167 do
      begin
        {@1379-13E4}
        if a884E_ec3f[v2w] <> 0 then
          asm
  db 139,126,254,209,231,139,133,70,138,196,62,54,136,3,248,129,199,27,0,6,87,139,126,254,209,231,139,133
  db 246,136,49,210,139,200,139,218,139,70,254,5,8,0,186,64,1,247,226,49,210,5,0,0,129,210,0,160
  db 3,193,19,211,5,8,0,131,210,0,137,199,142,194,6,87,139,126,254,209,231,139,133,150,139,139,126,254
  db 209,231,43,133,70,138,64,80,154,92,26,37,8
          end;
      end;
  end;
  {@13EB-13F9}
  XR670_046E(@b884E, 168);
  {@13F9-140A}
  FillChar(b8A46, 336, 255);
  {@140A-1418}
  XR670_046E(@b8B96, 336);
  {@1418-141D}
  pR6DD_0030;
end;

{ 1421 }
procedure pR1C3_1421(a0: B16; a1: B16; a2: integer; a3: byte; a4: pointer);
var
  v34w: word;
  v36w: word;
  v37b: byte;
  v39w: word;
  v41w: word;
  v42b: byte;
  v46a: array[0..3] of byte;
  v47b: byte;
  _f1: array[1..2] of byte;
  v51w: word;
  v52b: byte;
  v53b: byte;
  v54b: byte;
  v58p: pointer;
  v58b: byte absolute v58p;
begin
  asm
  db 139,70,6,11,70,8,117,3,233,70,5
  end;
  {@1458-147C}
  with PW22_62_1421(a4)^ do
  begin
    if a2 < 0 then
    begin
      {@1467-146C}
      word(a2) := 0;
      {@146C-1476}
      v37b := _w62_8byte;
    end
    else
      v37b := 1;
    {@147C-1495}
    v34w := LongInt(a2) * LongInt(_w62_18word);
  end;
  {@1495-149A}
  v36w := 0;
  {@149A-14B9}
  pR1C3_19A4(PR0_word(a4)^.v, PR2_word(a4)^.v, v37b, 0, @v58b);
  {@14B9-14D4}
  PR10_X8(v58p)^.v := PR10_X8(a4)^.v;
  {@14D4-1504}
  Move(PRA27_byte(a4)^.a[v34w], PRA27_byte(v58p)^.a[v36w], PR18_word(v58p)^.v * PR8_word(v58p)^.v);
  for v54b := 0 to 15 do
  begin
    {@150D-1531}
    with PW26_62_1421(a4)^ do
    begin
      if a2 < 0 then
      begin
        {@151C-1521}
        word(a2) := 0;
        {@1521-152B}
        v37b := _w62_8byte;
      end
      else
        v37b := 1;
      {@1531-154A}
      v34w := LongInt(a2) * LongInt(_w62_18word);
    end;
    {@154A-154F}
    v36w := 0;
    if a0[v54b] <> a1[v54b] then
    begin
      {@156A-1947}
      with PW28_62_1421(v58p)^ do
      begin
        case b8834 of
          0: begin
            {@157D-15BF}
            for v47b := 0 to 3 do
            begin
              {@1586-15B9}
              if (a0[v54b] and a3DBC_ec3f[v47b]) > 0 then
                v46a[v47b] := 0
              else
                v46a[v47b] := 255;
            end;
            {@15BF-1718}
            for sbB16D := PV2_0_byte(a2).v to v37b + word(a2) - 1 do
              for v41w := 1 to _w62_0word do
                for v39w := 1 to _w62_2word do
                begin
                  {@1618-163D}
                  if a3 <> 0 then
                    v42b := Random(256) and Random(256)
                  else
                    v42b := 255;
                  {@163D-166F}
                  for v47b := 0 to 3 do
                    v42b := (PRA27_byte(a4)^.a[v47b + v34w] xor v46a[v47b]) and v42b;
                  {@166F-16EF}
                  for v47b := 0 to 3 do
                  begin
                    {@1678-16E9}
                    if (a1[v54b] and a3DBC_ec3f[v47b]) > 0 then
                      _w62_27abyte[v47b + v36w] := _w62_27abyte[v47b + v36w] or v42b
                    else
                      _w62_27abyte[v47b + v36w] := _w62_27abyte[v47b + v36w] and not v42b;
                  end;
                  {@16EF-16F3}
                  Inc(v34w, 4);
                  {@16F3-16F7}
                  Inc(v36w, 4);
                end;
          end;
          1: begin
            {@1722-1730}
            v51w := _w62_2word * 4;
            {@1730-1744}
            v52b := a0[v54b] shl 4;
            {@1744-1758}
            v53b := a1[v54b] shl 4;
            for sbB16D := PV2_0_byte(a2).v to v37b + word(a2) - 1 do
              for v41w := 1 to _w62_0word do
                for v39w := 1 to v51w do
                begin
                  {@17AD-17F8}
if ((PRA27_byte(a4)^.a[v34w] and 240) = v52b) and ((a3 = 0) or (a3 <> 0)
                      and (Random(4) = 0)) then
                    _w62_27abyte[v36w] := _w62_27abyte[v36w] and 15 or v53b;
                  {@17F8-1855}
if ((PRA27_byte(a4)^.a[v34w] and 15) = a0[v54b]) and ((a3 = 0) or (a3 <> 0)
                      and (Random(4) = 0)) then
                    _w62_27abyte[v36w] := _w62_27abyte[v36w] and 240 or a1[v54b];
                  {@1855-1858}
                  Inc(v34w);
                  {@1858-185B}
                  Inc(v36w);
                end;
          end;
          2: begin
            {@1886-1894}
            v51w := _w62_2word * 8;
            for sbB16D := PV2_0_byte(a2).v to v37b + word(a2) - 1 do
              for v41w := 1 to _w62_0word do
                for v39w := 1 to v51w do
                begin
                  {@18E3-1926}
                  if (PRA27_byte(a4)^.a[v34w] = a0[v54b]) and (a0[v54b] <> _w62_22byte) then
                    _w62_27abyte[v36w] := a1[v54b];
                  {@1926-1929}
                  Inc(v34w);
                  {@1929-192C}
                  Inc(v36w);
                end;
          end;
        end;
      end;
    end;
  end;
  {@1950-199E}
  with PW30_62_1421(a4)^ do
  begin
    Move(PR27_byte(v58p)^.v, _w62_27abyte[Word(LongInt(a2) * LongInt(_w62_18word))], v37b * _w62_18word);
  end;
  pR1C3_1A83(@v58b);
end;

{ 19A4 }
procedure pR1C3_19A4(a0: word; a1: word; a2: word; a3: byte; a4: pointer);
var
  v2w: word;
  v4w: word;
  v5b: byte;
  _f1: array[1..1] of byte;
begin
  asm
  db 160,52,136,60,2,117,6,198,70,251,8,235,4,198,70,251,4
  end;
  {@19BB-19CD}
  v2w := a0 * a1 * v5b;
  {@19CD-19D6}
  v4w := v2w * a2;
  {@19D6-19EC}
  GetMem(PR0_pointer(a4)^.v, v4w + 27);
  {@19EC-1A00}
  XR670_046E(@PR0_byte(PR0_pointer(a4)^.v)^.v, v4w + 27);
  {@1A00-1A0C}
  PR0_word(PR0_pointer(a4)^.v)^.v := a0;
  {@1A0C-1A19}
  PR2_word(PR0_pointer(a4)^.v)^.v := a1;
  {@1A19-1A26}
  PR18_word(PR0_pointer(a4)^.v)^.v := v2w;
  {@1A26-1A33}
  PR8_word(PR0_pointer(a4)^.v)^.v := a2;
  {@1A33-1A43}
  PR20_word(PR0_pointer(a4)^.v)^.v := v4w + 27;
  if ((a3 and 1) > 0) and (b8834 <> 2) then
  begin
    {@1A53-1A69}
    GetMem(PR23_pointer(PR0_pointer(a4)^.v)^.v, v4w);
    {@1A69-1A7D}
    XR670_046E(@PR0_byte(PR23_pointer(PR0_pointer(a4)^.v)^.v)^.v, v4w);
  end;
end;

{ 1A83 }
procedure pR1C3_1A83(a0: pointer);
begin
  {@1A89-1A97}
  if PR0_pointer(a0)^.v = nil then
    Exit;
  {@1A97-1ACF}
  with PW2_4_1A83(PR0_pointer(a0)^.v)^ do
  begin
    if _w4_23pointer <> nil then
      pR5C0_0000(pointer(_w4_23pointer), _w4_18word * _w4_8word);
    {@1ACF-1AE5}
    pR5C0_0000(pointer(PR0_pointer(a0)^.v), _w4_20word);
  end;
  {@1AE5-1AF1}
  PR0_pointer(a0)^.v := nil;
end;

{ 1AF7 }
procedure pR1C3_1AF7(a0: integer; a1: integer; a2: word; a3: word; a4: byte; a5: B8; a6: pointer);
var
  v10w: word;
  v12w: word;
  v14w: word;
  v16w: word;
  v18w: word;
  v20w: word;
  v22w: word;
  v24w: word;
  v26w: word;
  v30a: array[0..3] of byte;
  v32w: word;
  v34w: word;
  v35b: byte;
  v30b: byte absolute v30a;
  v20b: byte absolute v20w;
begin
  {@1B10-1B1B}
  if a6 = nil then
    Exit;
  {@1B1B-1B3E}
  if a0 < 0 then
  begin
    asm
  db 139,70,22,153,49,208,41,208,137,70,244
    end;
    {@1B2C-1B31}
    v16w := 0;
  end
  else
  begin
    {@1B33-1B38}
    v12w := 0;
    {@1B38-1B3E}
    v16w := word(a0);
  end;
  {@1B3E-1BBC}
  if PR2_word(a6)^.v < (LongInt(a0) + LongInt(a2)) then
  begin
    {@1B66-1B8B}
    v14w := LongInt(a0) + LongInt(a2) - LongInt(PR2_word(a6)^.v);
    {@1B8B-1B90}
    v18w := 0;
  end
  else
  begin
    {@1B92-1B97}
    v14w := 0;
    {@1B97-1BBC}
    v18w := LongInt(PR2_word(a6)^.v) - (LongInt(a0) + LongInt(a2));
  end;
  {@1BBC-1C49}
  if a1 < 0 then
  begin
    {@1BC2-1BC7}
    v24w := 0;
    {@1BC7-1BCC}
    v32w := 0;
    asm
  db 139,70,20,153,49,208,41,208,153,139,200,139,218,139,70,16,49,210,43,193,27,211,137,70,234
    end;
  end
  else
  begin
    {@1BE7-1BED}
    v32w := word(a1);
    {@1BED-1BFA}
    v24w := v32w * PR2_word(a6)^.v;
    {@1BFA-1C01}
    v22w := a3 - 1;
    if PR0_word(a6)^.v < (LongInt(a1) + LongInt(a3)) then
      v22w := LongInt(PR0_word(a6)^.v - 1) - LongInt(a1)
    else
      v22w := a3 - 1;
  end;
  {@1C49-1E97}
  case b8834 of
    1, 2: begin
      {@1C57-1C6E}
      case b8834 of
        1: v10w := 4;
        2: v10w := 8;
      end;
      {@1C6E-1C7D}
      v20w := (a2 - v12w - v14w) * v10w;
      {@1C7D-1C86}
      v16w := v16w * v10w;
      {@1C86-1C8F}
      v18w := v18w * v10w;
      {@1C8F-1C98}
      v24w := v24w * v10w;
      {@1C98-1C9E}
      v34w := v16w;
      for v26w := 0 to v22w do
      begin
        {@1CB6-1CBE}
        a884E_ec3f[v32w] := 1;
        {@1CBE-1CC4}
        Inc(v24w, v16w);
        if a8A46_2fc5[v32w] > v24w then
        begin
          {@1CD2-1CDE}
          a88F6_2fc5[v32w] := v34w;
          {@1CDE-1CEA}
          a8A46_2fc5[v32w] := v24w;
        end;
        {@1CEA-1D33}
        case b8834 of
          1: FillChar(PRA27_byte(a6)^.a[v24w], v20w, a7D7C_ec3f[a4]);
          2: FillChar(PRA27_byte(a6)^.a[v24w], v20w, a4);
        end;
        {@1D33-1D39}
        Inc(v24w, v20w);
        if (v24w - 1) > a8B96_2fc5[v32w] then
          a8B96_2fc5[v32w] := v24w - 1;
        {@1D55-1D5B}
        Inc(v24w, v18w);
        {@1D5B-1D5E}
        Inc(v32w);
      end;
    end;
    0: begin
      {@1D73-1D79}
      v34w := v16w;
      {@1D79-1D85}
      v20w := a2 - v12w - v14w;
      {@1D85-1D8F}
      v16w := v16w * 4;
      {@1D8F-1D99}
      v18w := v18w * 4;
      {@1D99-1DA3}
      v24w := v24w * 4;
      {@1DA3-1DB1}
      XR670_046E(@v30b, 4);
      for v35b := 0 to 3 do
      begin
        {@1DBA-1DD7}
        if (a3DBC_ec3f[v35b] and a4) > 0 then
          v30a[v35b] := 255;
      end;
      {@1DDD-1E97}
      for v26w := 0 to v22w do
      begin
        {@1DF5-1DFD}
        a884E_ec3f[v32w] := 1;
        {@1DFD-1E03}
        Inc(v24w, v16w);
        if a8A46_2fc5[v32w] > v24w then
        begin
          {@1E11-1E1D}
          a88F6_2fc5[v32w] := v34w;
          {@1E1D-1E29}
          a8A46_2fc5[v32w] := v24w;
        end;
        {@1E29-1E67}
        for sbB16D := 1 to v20b do
        begin
          {@1E3F-1E5B}
          Move(v30b, PRA27_byte(a6)^.a[v24w], 4);
          {@1E5B-1E5F}
          Inc(v24w, 4);
        end;
        {@1E67-1E83}
        if (v24w - 1) > a8B96_2fc5[v32w] then
          a8B96_2fc5[v32w] := v24w - 1;
        {@1E83-1E89}
        Inc(v24w, v18w);
        {@1E89-1E8C}
        Inc(v32w);
      end;
    end;
  end;
end;

{ 1E9D }
procedure pR1C3_1E9D(a0: byte; a1: word; a2: pointer);
begin
  {@1EA0-1EA9}
  if b8834 <> 2 then
    Exit;
  {@1EA9-1EDD}
  Move(aD51E_eec0[a0], PRA0_byte(a2)^.a[a0 * 3], a1 * 3);
end;

{ 1EE1 }
procedure pR1C3_1EE1(a0: byte; a1: word; a2: pointer; a3: pointer);
begin
  {@1EE4-1EED}
  if b8834 <> 2 then
    Exit;
  {@1EED-1F20}
  Move(PRA0_byte(a2)^.a[a0 * 3], PRA0_byte(a3)^.a[a0 * 3], a1 * 3);
end;

{ 1F24 }
procedure pR1C3_1F24(a0: word; a1: word; a2: B768);
var
  _f1: array[1..26] of byte;
begin
  {@1F3F-1F5E}
  if b8834 = 2 then
    asm
  db 139,126,12,139,247,209,231,1,247,141,187,0,253,22,87,255,118,12,255,118,10
  call near ptr XR1C3_2B8D
    end;
  asm
  db 140,208,137,134,232,252,141,134,0,253,137,134,230,252
  end;
end;

{ 1F72 }
procedure pR1C3_1F72(a0: byte; a1: byte; a2: byte; a3: byte);
var
  v4p: pointer;
  v6w: word;
  v8w: word;
  v4b: byte absolute v4p;
begin
  {@1F78-1F83}
  v6w := PR18_word(pAEE0)^.v;
  {@1F83-1F8E}
  v8w := a2 * v6w;
  if a3 <> 0 then
  begin
    asm
  db 184,24,0,80,184,3,0,80,184,1,0,80,176,1,80,141,126,252,22,87
  push cs
  call near ptr pR1C3_19A4
    end;
    {@1FAF-1FD9}
    pR1C3_0A0C(pointer(a9DC4_9f5c[a0, a1]), v4p);
    {@1FD9-1FF9}
    Move(PR27_byte(v4p)^.v, PRA27_byte(pAEE0)^.a[v8w], v6w);
    {@1FF9-2021}
    PR22_byte(pAEE0)^.v := PR22_byte(a9DC4_b6a1[a0, a1])^.v;
    if PR23_pointer(v4p)^.v <> nil then
      Move(PR0_byte(PR23_pointer(v4p)^.v)^.v, PRA0_byte(PR23_pointer(pAEE0)^.v)^.a[v8w], v6w);
    {@204E-2057}
    pR1C3_1A83(@v4b);
    {@2057-205A}
    Exit;
  end;
  {@205A-2093}
  Move(PR27_byte(a9DC4_b6a1[a0, a1])^.v, PRA27_byte(pAEE0)^.a[v8w], v6w);
  {@2093-20BB}
  PR22_byte(pAEE0)^.v := PR22_byte(a9DC4_b6a1[a0, a1])^.v;
  if PR23_pointer(a9DC4_b6a1[a0, a1])^.v <> nil then
    Move(PR0_byte(PR23_pointer(a9DC4_b6a1[a0, a1])^.v)^.v, PRA0_byte(PR23_pointer(pAEE0)^.v)^.a[v8w], v6w);
end;

{ 2120 }
procedure pR1C3_2120(a0: byte);
begin
  {@2123-2134}
  pR1C3_1F72(a0, 0, 0, 0);
  {@2134-2145}
  pR1C3_1F72(a0, 0, 1, 1);
  {@2145-2156}
  pR1C3_1F72(a0, 1, 2, 1);
  {@2156-2167}
  pR1C3_1F72(a0, 1, 3, 0);
end;

{ 216B }
begin
end.

