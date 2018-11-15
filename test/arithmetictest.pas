program arithmetictest;
const
  val1 = 3;
  val2 = 1.0;
var  res1 : EXTENDED;
  res2 : EXTENDED;
begin
  res1 := sqrt(3)*sqrt(3);
  WriteLn(val1, ' ', res1);
  if val1 = res1
  then
    WriteLn('val1 and res1 are the same')
  else
    WriteLn('val 1 and res1 are not the same');
  res2 := (1.0/49)*49;
  WriteLn(val2, ' ', res2);
  if val2 = res2
  then
    WriteLn('val2 and res2 are the same')
  else
    WriteLn('val2 and res2 are not the same');
  WriteLn(10e4933);
end.
