program squares;

var
  i : integer;

begin;
  for i := 0 to 20 do
    Write(i*i, ' ');
  Writeln;

  i := 0;
  while i <= 20 do
  begin
    Write(i*i, ' ');
    i := i+1;
  end;
  Writeln;

  i := 0;
  repeat
  begin
    Write(i*i, ' ');
    i := i+1;
  end;
  until i > 20;
end.