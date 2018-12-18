program lotto2;

type
  Ziehung = record
    Datum: String;
    Nums: Array[0..6] of Integer;
  end;

var
  f: File of Ziehung;
  sin: String;

procedure get_for_date(date: String);
var
  z: Ziehung;
  i: Integer;
begin
    while not EOF(f) do
    begin
      Read(f, z);
      if (z.Datum = date) then
      begin
        Writeln('Results for ', date);
        for i := 0 to 6 do
          Write(z.Nums[i], ' ');
        Writeln;
      end;
    end;
end;

begin
  Assign(f, 'ziehung');
  Reset(f);
  Write('Date: ');
  ReadLn(sin);
  get_for_date(sin);
  Close(f);
end.