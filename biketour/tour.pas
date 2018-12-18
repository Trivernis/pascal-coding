program login;

uses
  md5, crt,
  utils in '../lib/utils.pas';

type
  CONNECTION = record
    hotel : string[10];
    distance : integer;
  end;

  HOTEL = record
    name : string[10];
    conn : CONNECTION;
  end;

  USER = record
    un: string;
    pw: string;
    l: boolean;
  end;

const
  users: array [0..4] of USER = (
    (un: 'user1'; pw: '16d7a4fca7442dda3ad93c9a726597e4'; l: false),
    (un: 'user2'; pw: 'ccd2fc33d2d423d7209035dbfff82b29'; l: false),
    (un: 'user3'; pw: '57c2877c1d84c4b49f3289657deca65c'; l: false),
    (un: 'user4'; pw: '4101bef8794fed986e95dfb54850c68b'; l: false),
    (un: 'root';  pw: '63a9f0ea7bb98050796b649e85481845'; l: false)
    );

var
  readinput: string;
  j, hnum1, hnum2: integer;
  correct: boolean;
  usersuccess: boolean = false;
  time: real;
  hotels_f: File of HOTEL;


function get_hotel_by_name(hname: String) : HOTEL;
{ Read the hotels from the  file and find the one with the right name }
var
  htemp : HOTEL;
begin
  Reset(hotels_f);
  while not EOF(hotels_f) do
  begin
    Read(hotels_f, htemp);
    if htemp.name = hname then
    begin
      get_hotel_by_name := htemp;
      Break;
    end;
  end;
end;


function get_total_length : integer;
{ Calculates the total lenght between two hotels }
var
  htemp: HOTEL;
begin
  Reset(hotels_f);
  get_total_length := 0;
  while not EOF(hotels_f) do
  begin
    Read(hotels_f, htemp);
    get_total_length := get_total_length + htemp.conn.distance;
  end;
end;


function get_path_length (hotel1, hotel2 : String) : Integer;
var
  htemp: HOTEL;
  next_name: String;
  i : integer;
begin
  htemp := get_hotel_by_name(hotel1);
  next_name := htemp.conn.hotel;
  get_path_length := 0;
  get_path_length := get_path_length + htemp.conn.distance;
  i := 0;
  Writeln(next_name, ' ',hotel2);
  while not (next_name = hotel2) do
  begin
    i += 1;
    htemp := get_hotel_by_name(next_name);
    next_name := htemp.conn.hotel;
    get_path_length := get_path_length + htemp.conn.distance;
    if i > 1000 then
    begin
      get_path_length := -1;
      Break;
    end;
  end;
end;


procedure calcway;
{ Calculate the sum of all distances and call functions
  that use this value. }
var
  i, distance_total : integer;
  h1, h2: HOTEL;
  rin : String;
begin
  distance_total := get_total_length;
  Writeln('Total tour length: ', distance_total, ' km');
  Write('First Hotel Name: ');
  ReadLn(rin);
  h1 := get_hotel_by_name(rin);
  Writeln;
  Write('Second Hotel Number: ');
  ReadLn(rin);
  h2 := get_hotel_by_name(rin);
  Writeln(get_path_length(h1.name, h2.name));
end;

procedure hotelmain;
{ Calculates the total distance between hotels based on the hotel number input.
  (Only numbers accepted!). After printing the total distance a velocity can be
  input to calculate the estimated time. }
var
  i : integer;
  exit : boolean = false;
begin
  while exit = false do
  begin
    calcway;
    Write('Exit? (y/n)');
    ReadLn(readinput);

    if readinput = 'y' then
      exit := true
    else
      exit := false;
  end;
end;

procedure login;
var
  i : integer;
begin
  Write('User: ');
    ReadLn(readinput);
    usersuccess := false;
    correct := false;

    { Iterate over all 5 user entries to find the one
      that fits the input. set usersuccess to true if found
      else it remains false and an user not found error
      is printed to the console. }

    for i := 0 to 4 do
      if readinput = users[i].un then
      begin
        usersuccess := true;
        if (users[i].l) then
        begin
          TextColor(Red);
          Writeln('This user is locked.');
          TextColor(White);
          Break;
        end;

        { 3 tries for password input. Return to the username
          input after failure. correct is set to true if
          the loggin was a success. }

        for j := 0 to 2 do
        begin
          WriteLn('Password: ');
          ReadLn(readinput);

          if MD5Print(MD5String(readinput)) = users[i].pw then
          begin
            WriteLn('Login Successful!');
            correct := true;
            Break;
          end
          else
            WriteLn('Wrong password! ', 2 - j, ' trys left.');
        end;
        { @section userfunctions }
        if correct = true then
          hotelmain()
        else
          users[i].l := true;
      end;
    if usersuccess = false then
      WriteLn('User not found');
end;

begin
  TextColor(8);
  Writeln('Tourplanner');
  Writeln('Written by J.Riegel.');
  TextColor(White);
  Assign(hotels_f, 'hotels.bin');

  { endless loop/main loop of the program. Exit with CTRL-C }
  while true do
    login; { Login starts all the other functions }
end.
