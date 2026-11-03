type
  PB = ^byte;
  W2_23_0CC4 = record case byte of 0: (_w23_0word: word); 1: (_p1: array[1..2] of byte; _w23_2word: word) end;
  PW2_23_0CC4 = ^W2_23_0CC4;
var
  v2i: integer;
  v4i: integer;
  v6w: word;
  v8w: word;
  v10w: word;
  v12w: word;
  v14w: word;
  v16w: word;
  v18w: word;
  _f2: array[1..1] of byte;
  v4w: word absolute v4i;
  _fb: byte absolute a0;
{BODY}
  if false then begin
    with LPR^ do with LPR^ do for _fb := _fb to _fb do ;
  end;
  if a2 = nil then
    Exit;
  with PW2_23_0CC4(a2)^ do
  begin
    case b8834 of
      0: begin
        v18w := 0;
        v8w := a1 * 8;
        v12w := v8w + _w23_0word - 1;
        v6w := a0;
        v10w := v6w + _w23_2word - 1;
        Port[974] := 5;
        Port[975] := 0;
        Port[974] := 4;
        for v4i := v8w to v12w do
          for v2i := v6w to v10w do
            asm
  db 198,70,237,0,235,3,254,70,237,138,70,237,186,207,3,238,184,0,160,80,139,70,254,153,139,200,139,218
  db 139,126,252,209,231,139,133,134,143,49,210,3,193,19,211,139,248,7,38,138,21,139,70,238,196,126,6,3
  db 248,38,136,85,27,255,70,238,128,126,237,3,117,192
            end;
        Port[975] := 0;
        Port[974] := 5;
        Port[975] := 0;
      end;
      2: begin
        v14w := a1 * 8 * 320 + a0 * 8;
        v18w := 0;
        v16w := _w23_2word * 8;
        v8w := a1 * 8;
        v12w := v8w + _w23_0word - 1;
        for v4i := v8w to v12w do
        begin
          Move(PB(v14w + $A0000000)^, PRA27_byte(a2)^.a[v18w], v16w);
          Inc(v18w, v16w);
          Inc(v14w, 320);
        end;
      end;
      1: begin
        v16w := _w23_2word * 4;
        v18w := 0;
        v8w := a1 * 8;
        v12w := v8w + _w23_0word - 1;
        v6w := a0 * 4;
        for v4i := v8w to v12w do
        begin
          Move(Mem[a9116_2fc5[v4w]:v6w], PRA27_byte(a2)^.a[v18w], v16w);
          Inc(v18w, v16w);
        end;
      end;
    end;
  end;
