program fib;

procedure fibit;
var
  a, b, c: QWord;
  i : Integer;

begin
  a := 1;
  b := 1;
  c := 1;
  for i := 0 to 90 do
  begin
    c := b;
    b := a + b;
    a := c;
    WriteLn(b);
  end;
end;

begin
  fibit;
end.