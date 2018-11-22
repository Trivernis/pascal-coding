program faculty;

function faculty_it(num: integer) : longint;
var
  val: longint = 1;
  i: integer;

begin
  for i := 2 to num do
    begin
      val := val * i;
    end;
  faculty_it := val;
end;

function faculty_rec(num: integer): longint;
begin
  if num = 1 then
    faculty_rec := num
  else
    faculty_rec := num * faculty_rec(num-1);
end;

var
  input : integer;

begin
  Writeln('Number: ');
  Read(input);
  Writeln;
  Writeln('Faculty IT: ', faculty_it(input));
  Writeln('Faculty REC: ', faculty_rec(input));

end.