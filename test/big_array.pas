program big_array;

uses dateutils, sysutils;

type
  tup = record
    num : integer;
    sq : integer;
  end;

var
  a : array[0..10000] of tup;

procedure fill_array;
var
  i: integer;
begin
  for i := 0 to 10000 do
  begin
    a[i].num := i;
    a[i].sq := i*i;
  end;
end;

procedure do_something(arr: array of tup);
begin
  arr[0].num := 1;
end;

procedure do_something_ref(var arr: array of tup);
begin
  arr[2].num := 1;
end;

procedure measurement;
var
  i : integer;
  time : TdateTime;
begin
  time := Timeof(NOW);
  for i := 1 to 10000 do
    do_something(a);
  WriteLn('By Value', MilliSecondSpan(time, Timeof(now)):4);
  time := Timeof(NOW);
  for i := 1 to 10000 do
    do_something_ref(a);
  WriteLn('By Reference: ', MilliSecondSpan(time, Timeof(now)):4);
end;

begin
  Writeln;
  fill_array;
  measurement;
end.