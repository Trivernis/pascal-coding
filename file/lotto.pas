program lotto;

type
  Ziehung = record
    Datum: String;
    Nums: Array[0..6] of Integer;
  end;

var
  f: File of Ziehung;

procedure gen_data();
var
  dates: Array[0..3] of String = (
    '10.10.10',
    '11.11.11',
    '12.12.12',
    '13.12.13');
  i, j: Integer;
  z: Ziehung;

begin
  Randomize;
  Rewrite(f);
  Seek(f, FileSize(f));
  for i := 0 to 3 do
  begin
    for j := 0 to 6 do
    begin
      z.Nums[i] := Random(9);
    end;
    z.Datum := dates[i];
    Write(f, z);
  end;
end;

begin
  Assign(f, 'ziehung');
  gen_data;
end.