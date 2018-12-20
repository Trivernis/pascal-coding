{ Julius Riegel, 20.12.18 }

program programm1;

uses
  utils in './lib/utils.pas';

const
  fname = './persons/Name';

procedure gen_entry(fnum: Integer);
var
  temp_person: person;
  curr_fname : String;
begin
  curr_fname := fname + int_to_str(fnum) + '.prs';
  Write('  Name: ');
  ReadLn(temp_person.pname);
  Write('  Surname: ');
  ReadLn(temp_person.psurname);
  temp_person.number := Random(101);
  WriteLn('  Number is: ', temp_person.number);
  WriteLn;
  write_file(curr_fname, temp_person);
end;

var
  i : Integer;

begin
  Randomize;
  WriteLn;
  for i := 1 to 4 do
  begin
    gen_entry(i);
  end;
  WriteLn('[+] All names saved.');
end.