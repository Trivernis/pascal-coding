program casetest;

var
  input: integer;

begin
ReadLn(input);
case (input) of
  0..49 : WriteLn('kleiner 49');
  50..52 : WriteLn('50 - 52');
  else
    if (input < 0) then
      Writeln('kleiner 49')
    else 
      WriteLn('groesser 52');
end;
end.