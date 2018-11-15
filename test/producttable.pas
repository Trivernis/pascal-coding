program producttable;

var
  table: array [0..20, 0..20] of integer;
  i, j: integer;

begin
  for i := 0 to 20 do
    begin
      for j := 0 to 20 do 
      begin
        table[i, j] := i*j;
        Write(table[i, j] : 3, ' ');
      end;
    Writeln;
    end;
end.