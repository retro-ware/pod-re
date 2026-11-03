type
  PB = ^byte;
var
  v2w: word;
  v4w: word;
  v6w: word;
  v8w: word;
  _f1: array[1..258] of byte;
  a884E_ec3f: array[0..32759] of byte absolute d884E;
  a88F6_2fc5: array[0..16379] of word absolute d88F6;
  a8A46_2fc5: array[0..16379] of word absolute d8A46;
  a8B96_2fc5: array[0..16379] of word absolute d8B96;
  a8F86_2fc5: array[0..16379] of word absolute d8F86;
  a9116_2fc5: array[0..16379] of word absolute d9116;
  b3DBC: byte absolute d3DBC;
  b3DBD: byte absolute d3DBD;
  b3DBE: byte absolute d3DBE;
  b3DBF: byte absolute d3DBF;
  p8836: pointer absolute d8836;
  w8F96: word absolute d8F96;
  b884E: byte absolute d884E;
  b8A46: byte absolute d8A46;
  b8B96: byte absolute d8B96;
{BODY}
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
          Move(PRA27_byte(p8836)^.a[a8A46_2fc5[v2w]], PB((v2w + 8) * 320 + $A0000000 + a88F6_2fc5[v2w] + 8)^,
            a8B96_2fc5[v2w] - a8A46_2fc5[v2w] + 1);
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
