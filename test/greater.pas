program greater;

function greatest(num1, num2:integer) : integer;
{ Returns the greater of two values. }
begin
  if (num1 > num2) then
    greatest := num1
  else
    greatest := num2;
end;

var
  num1, num2, ret : integer;

begin
  Writeln('Number 1: ');
  Read(num1);
  Writeln('Number 2: ');
  Read(num2);
  Writeln;
  Writeln(greatest(num1, num2));
end.