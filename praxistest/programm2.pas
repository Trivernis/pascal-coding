{ Julius Riegel, 20.12.18 }

program programm2;

uses
  utils in './lib/utils.pas';

const
fname = './persons/Name';

function reading_file_int(fnum: integer): integer;
var
  curr_fname: string;
  temp_entry: person;

begin
  curr_fname := fname + int_to_str(fnum) + '.prs';
  temp_entry := read_file(curr_fname);
  graphictext(10, 20 * fnum, 80, 'file' + int_to_str(fnum) + ': ' + curr_fname);
  reading_file_int := temp_entry.number;
end;

var
  i: integer;
  numsum, num: integer;
  nums: array [0..3] of integer;

begin
  WriteLn;
  numsum := 0;
  init_graphics();
  for i := 1 to 4 do
  begin
    num := reading_file_int(i);
    nums[i - 1] := num;
    numsum := numsum + num;
  end;
  graphictext(10, 100, 80, ('sum: ' + int_to_str(numsum)));
  drawrectnums(nums, 80);
  ReadLn;
end.