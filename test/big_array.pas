program big_array;

uses dateutils, sysutils;

type
  tup = record
    num : longint;
    sq : longint;
  end;

var
  a : array[0..20000] of tup;

procedure fill_array;
{ Fills the array with ints and their squares. }
var
  i: longint;
begin
  for i := 0 to 20000 do
  begin
    a[i].num := i;
    a[i].sq := i*i;
  end;
end;

procedure do_something(arr: array of tup);
{ Alters one element of the array passed by value }
begin
  arr[0].num := 1;
end;

procedure do_something_ref(var arr: array of tup);
{ Alters one element of the array passed by reference. }
begin
  arr[0].num := 1;
end;

procedure measurement;
{ Measures the time it takes for calling a function with
  an big array as argument by reference vs by value a million
  times. }
var
  i : longint;
  time : TdateTime;
begin
  time := Timeof(NOW);
  for i := 1 to 1000000 do
    do_something(a);
  WriteLn('By Value', MilliSecondSpan(time, Timeof(now)):4);
  time := Timeof(NOW);
  for i := 1 to 1000000 do
    do_something_ref(a);
  WriteLn('By Reference: ', MilliSecondSpan(time, Timeof(now)):4);
end;

begin
  Writeln;
  fill_array;
  measurement;
end.