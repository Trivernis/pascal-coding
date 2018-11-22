program producttable;

var
  table: array [0..20, 0..20] of integer;

procedure fill_table_y(x, sizel, sizeh: integer);
var
  j: integer;
begin
  for j := sizel to sizeh do 
    begin
      table[x, j] := x*j;
    end;
end;

procedure fill_table(sizel, sizeh : integer);
var
  i: integer;
begin
  for i := sizel to sizeh do
    fill_table_y(i, sizel, sizeh);
end;

procedure print_table_y(x, sizel, sizeh: integer);
var
  j: integer;
begin
  for j := sizel to sizeh do
    Write(table[x, j]:4);
  Writeln;
end;

procedure print_table(sizel, sizeh :integer);
var i : integer;
begin
  for i := sizel to sizeh do
    print_table_y(i, sizel, sizeh);
end;

begin
  fill_table(0, 20);
  print_table(3, 7);
end.