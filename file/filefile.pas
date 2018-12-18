program hellofile;

const
  dir = 'C:/Users/dev/Documents/Pascal/file_test/';

procedure write_txt;
var
  txtfile: TextFile;
  i: Integer;
begin
  Assign(txtfile, dir+'Hello');
  Rewrite(txtfile);
  for i := 0 to 9 do
    WriteLn(txtfile, 'Hello');
  Close(txtfile);
end;

procedure write_int;
var
  intfile: File of Integer;
  i: Integer;
begin
  Assign(intfile, dir+'intense');
  Rewrite(intfile);
  for i := 0 to 9 do
    Write(intfile, i);
  Close(intfile);
end;

procedure read_int;
var
  intfile: File of Integer;
  i, res: Integer;
begin
  Assign(intfile, dir+'intense');
  Reset(intfile);
  for i := 0 to 9 do
  begin
    Read(intfile, res);
    WriteLn(res);
  end;
  Close(intfile);
end;

procedure write_bool;
var
  boolfile: File of Boolean;
  i: Integer;
begin
  Assign(boolfile, dir+'bool');
  Rewrite(boolfile);
  for i := 0 to 4 do
    Write(boolfile, true);
    Write(boolfile, false);
  Close(boolfile);
end;

procedure write_int64;
var
  intfile: File of int64;
  i: Integer;
begin
  Assign(intfile, dir+'more_intense');
  Rewrite(intfile);
  for i := 0 to 9 do
    Write(intfile, i);
  Close(intfile);
end;

procedure write_real;
var
  f: File of real;
  i: Integer;
begin
  Assign(f, dir+'reallife');
  Rewrite(f);
  for i := 0 to 9 do
    Write(f, real(i/2));
  Close(f);
end;

procedure write_very_int;
var
  f: File of Integer;
  i: Integer;
begin
  Assign(f, dir+'veryint');
  Rewrite(f);
  for i := -256 to 255 do
    Write(f, i);
  Close(f);
end;

procedure read_very_int;
var
  f: File of Integer;
  i, res: Integer;
begin
  Assign(f, dir+'veryint');
  Reset(f);
  for i := -256 to 255 do
  begin
    Read(f, res);
    WriteLn(res);
  end;
  Close(f);
end;

procedure write_string;
var
  f: File of String[10];
  i: Integer;
begin
  Assign(f, dir+'tstring');
  Rewrite(f);
  for i := 0 to 9 do
    Write(f, 'tkdiekdhdk');
  Close(f);
end;

begin
  write_txt;
  write_int;
  write_bool;
  write_int64;
  write_real;
  write_very_int;
  write_string;
  read_int;
  read_very_int;
end.