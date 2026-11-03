type
  X17 = array[0..16] of byte;
var
  a000C_ec3f: array[0..32759] of byte absolute d000C;
  a0017_ec3f: array[0..32759] of byte absolute d0017;
  _f1: array[1..16] of byte;
  v17b: byte;
  v18b: byte;
  v19b: byte;
  _f2: array[1..9] of byte;
  v29b: byte;
  _f3: array[1..6] of byte;
  v36b: byte;
  v40l: longint;
  v41b: byte;
  _f4: array[1..40] of byte;
  _v82: byte;
  v86p: pointer;
  v88w: word;
  v90w: word;
  v91b: byte;
  v90b: byte absolute v90w;
  v88b: byte absolute v88w;
  v17a: X17 absolute v17b;
  v82a: X63 absolute _v82;
  a0001: array[1..11] of byte absolute d0002;
type PA17 = ^TA17; TA17 = array[1..1000] of X17;
{BODY}
  {@2525-252D}
  pO055_0000(1);
  {@252D-2532}
  pO0EC_3E0E;
  {@2532-253D}
  v18b := pO055_0136(1);
  if (v18b > 11) or (v18b < 1) then
    v18b := 1;
  v88w := a0001[v18b];
  {@255D-256D}
  v90w := a000C_ec3f[v18b];
  for v91b := v88b to v90b do
  begin
    {@2586-2594}
    v19b := a0017_ec3f[v91b];
    if v19b = 255 then
      pO055_1ABE(@v17b)
    else
      v17a := PA17(p9CFF)^[v19b];
    {@25CA-266C}
    if v17b <> 255 then
    begin
      {@25D3-25E6}
      Move(v17b, v36b, 17);
      {@25E6-25EE}
      v29b := v29b and 248;
      {@25EE-25F6}
      v40l := 0;
      {@25F6-25FA}
      v41b := 0;
      if pA7CA = nil then
      begin
        {@2603-2613}
        GetMem(pA7CA, 63);
        {@2613-2627}
        PR0_X63(pA7CA)^.v := v82a;
      end
      else
      begin
        {@2629-2636}
        v86p := pA7CA;
        {@2636-2646}
        GetMem(pA7CA, 63);
        {@2646-265A}
        PR0_X63(pA7CA)^.v := v82a;
        {@265A-266C}
        PR42_pointer(pA7CA)^.v := v86p;
      end;
    end;
  end;
  {@2677-267C}
  pO052_071E;
  {@267C-2681}
  pO0EC_3E0E;
