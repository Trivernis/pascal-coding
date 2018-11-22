program squares;

procedure squares_for;
var
  i : integer;
begin
  for i := 0 to 20 do
    Write(i*i, ' ');
  Writeln;
end;

procedure squares_while;
var
  i : integer = 0;
begin
  while i <= 20 do
  begin
    Write(i*i, ' ');
    i := i+1;
  end;
  Writeln;
end;

procedure squares_repeat;
var
  i : integer = 0;
begin
  repeat
  begin
    Write(i*i, ' ');
    i := i+1;
  end;
  until i > 20;
end;

begin;
  squares_for;
  squares_while;
  squares_repeat;
end.