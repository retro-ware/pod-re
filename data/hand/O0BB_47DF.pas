type
  RX1F0 = record _p: array[1..$1F0] of byte; v: byte end;
var
  vSel: byte;
  vPad: byte;
  vDone: boolean;
  q9CEE: pointer absolute d9CEE;
  l9CEE: longint absolute d9CEE;
  s2807: S40 absolute d2807;
  s2CAC: S40 absolute d2CAC;
  s14D1: S40 absolute d14D1;
  s4025: string[10] absolute d4025;
  s405C: string absolute d405C;
  q5362: byte absolute d5362;
{BODY}
  vDone := false;
  repeat
    if RX1F0(q9CEE^).v <> 0 then
      vSel := pO0E2_1374(1, 2) - 1
    else
    begin
      pO108_00CB(1);
      vSel := pO108_1009(s2807, s2CAC, 0, 0);
    end;
    case vSel of
      0:
        begin
          pO0E2_2039(l9CEE, $32, pO0BB_0E1D($55), 0, 0, 0, 0, s4025 + s405C);
          pO0E2_2039(l9CEE, $70, pO0BB_0E1D($55), 0, 0, 0, 0, '');
          vDone := true;
        end;
      1:
        begin
          pO0E2_2039(l9CEE, $36, pO0BB_0E1D($55), 0, 0, 0, 0, s4025 + s405C);
          pO0E2_2039(l9CEE, $70, pO0BB_0E1D($55), 0, 0, 0, 0, '');
          vDone := true;
        end;
    else
      vDone := pO108_2254(s14D1, q5362) = q5362;
    end;
  until vDone;
