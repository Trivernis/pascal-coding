{ Julius Riegel, 20.12.18 }

unit utils;

interface
uses
  crt,
  Graph;
type
  person = record
    pname : String[10];
    psurname : String[10];
    number: Integer;
  end;

function int_to_str(i: Integer): String;
procedure write_file(fname: String; data: person);
function read_file(fname: String): person;
procedure drawrectnums(nums: Array of Integer; size: Integer);
procedure init_graphics;
procedure graphictext(x, y, size: Integer; text: String);

implementation

function int_to_str(i: Integer): String;
begin
  Str(i, int_to_str);
end;

procedure write_file(fname: String; data: person);
var
  outfile: File of person;

begin
  Assign(outfile, fname);
  Rewrite(outfile);
  Write(outfile, data);
  Close(outfile);
end;

function read_file(fname: String): person;
var
  infile: File of person;
begin
  Assign(infile, fname);
  Reset(infile);
  Read(infile, read_file);
  Close(infile);
end;

function format_num(num: Integer) : String;
var
  tempstr: String;
begin
  tempstr := int_to_str(num);
  if (tempstr = '0') then
    tempstr := '*';
  format_num := tempstr;
end;

procedure init_graphics;
var
  gdriver,
  gmode : Integer;
begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
end;

procedure graphictext(x, y, size : Integer; text: String);
begin
  SetTextStyle(0, 0, round(size/40));
  OutTextXY(x, y, text);
end;

procedure drawrectnums(nums: Array of Integer; size: Integer);
var
  xsize,
  ysize,
  xstart,
  ystart: Integer;

begin
  xsize := GetMaxX;
  ysize := GetMaxY;
  xstart := Round(xsize/2) - round(size/2);
  ystart := Round(ysize/2) - round(size/2);
  SetTextStyle(0, 0, round(size/40));
  OutTextXY(xstart+size, ystart, format_num(nums[0]));
  OutTextXY(xstart+size, ystart+size, format_num(nums[1]));
  OutTextXY(xstart, ystart+size, format_num(nums[2]));
  OutTextXY(xstart, ystart, format_num(nums[3]));
end;

procedure draw_lines(xstart, ystart, size: Integer);
begin
  Line(xstart, ystart, xstart+size, ystart);
  Line(xstart+size, ystart, xstart+size, ystart+size);
  Line(xstart+size, ystart+size, xstart, ystart+size);
  Line(xstart, ystart+size, xstart, ystart);
end;

begin
 { Main Body }
end.