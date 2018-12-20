{ Julius Riegel, 20.12.18 }

unit utils;

interface

uses
  crt,
  Graph;

type
  person = record
    pname: string[10];
    psurname: string[10];
    number: integer;
  end;

function int_to_str(i: integer): string;
procedure write_file(fname: string; data: person);
function read_file(fname: string): person;
procedure drawrectnums(nums: array of integer; size: integer);
procedure init_graphics;
procedure graphictext(x, y, size: integer; text: string);

implementation

function int_to_str(i: integer): string;
begin
  Str(i, int_to_str);
end;

procedure write_file(fname: string; data: person);
var
  outfile: file of person;

begin
  Assign(outfile, fname);
  Rewrite(outfile);
  Write(outfile, data);
  Close(outfile);
end;

function read_file(fname: string): person;
var
  infile: file of person;
begin
  Assign(infile, fname);
  Reset(infile);
  Read(infile, read_file);
  Close(infile);
end;

function format_num(num: integer): string;
var
  tempstr: string;
begin
  tempstr := int_to_str(num);
  if (tempstr = '0') then
    tempstr := '*';
  format_num := tempstr;
end;

procedure init_graphics;
var
  gdriver,
  gmode: integer;
begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
end;

procedure graphictext(x, y, size: integer; text: string);
begin
  SetTextStyle(0, 0, round(size / 40));
  OutTextXY(x, y, text);
end;

procedure drawrectnums(nums: array of integer; size: integer);
var
  xsize,
  ysize,
  xstart,
  ystart: integer;

begin
  xsize := GetMaxX;
  ysize := GetMaxY;
  xstart := Round(xsize / 2) - round(size / 2);
  ystart := Round(ysize / 2) - round(size / 2);
  SetTextStyle(0, 0, round(size / 40));
  OutTextXY(xstart + size, ystart, format_num(nums[0]));
  OutTextXY(xstart + size, ystart + size, format_num(nums[1]));
  OutTextXY(xstart, ystart + size, format_num(nums[2]));
  OutTextXY(xstart, ystart, format_num(nums[3]));
end;

procedure draw_lines(xstart, ystart, size: integer);
begin
  Line(xstart, ystart, xstart + size, ystart);
  Line(xstart + size, ystart, xstart + size, ystart + size);
  Line(xstart + size, ystart + size, xstart, ystart + size);
  Line(xstart, ystart + size, xstart, ystart);
end;

begin
  { Main Body }
end.