program login;

uses
  md5, crt;

type
  CONNECTION = record
    hotel : string;
    distance : integer;
  end;

  HOTEL = record
    name : string;
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
hotels: array [0..4] of HOTEL = (
  (name: 'Hotel 1'; conn: (hotel: 'Hotel 2'; distance: 11)),
  (name: 'Hotel 2'; conn: (hotel: 'Hotel 3'; distance: 5)),
  (name: 'Hotel 3'; conn: (hotel: 'Hotel 4'; distance: 11)),
  (name: 'Hotel 4'; conn: (hotel: 'Hotel 5'; distance: 5)),
  (name: 'Hotel 5'; conn: (hotel: ''; distance: 0))
);

var
  readinput: string;
  j, hnum1, hnum2: integer;
  correct: boolean;
  usersuccess: boolean = false;
  time: real;

function distance_sum(hnum1, hnum2 :integer) : integer;
{ Calculate the total distance sum. }
var
  distance_total : integer = 0;
  i : integer;
begin
  if (hnum1 > hnum2) then
    for i := (hnum1-2) downto (hnum2-1) do
      distance_total := distance_total + hotels[i].conn.distance
  else
    for i := (hnum1-1) to (hnum2-2) do
      distance_total := distance_total + hotels[i].conn.distance;
  distance_sum := distance_total;
end;

procedure calc_time(disttot : integer);
{ Calculate the time needed for the way and print it. }
var
  velocity : integer;
begin
      Write('Velocity (km/h): ');
      ReadLn(velocity);
      time := (disttot / velocity);
      WriteLn('Estimated Time: ', time: 10: 2, ' hours');
end;

procedure printway(hnum1, hnum2 : integer);
{ Print the whole way to the console. }
var
  i : integer;
begin
  Writeln('Tour:');
  if hnum1 > hnum2 then
    for i := hnum1 downto hnum2 do
    begin
      if (i <> hnum1) then
        Write(' -> ');
      Write(hotels[i-1].name)
    end
  else
    for i := hnum1 to hnum2 do
    begin
      if (i <> hnum1) then
        Write(' -> ');
      Write(hotels[i-1].name)
    end; 
  Writeln;
end;

procedure calcway;
{ Calculate the sum of all distances and call functions
  that use this value. }
var
  i, distance_total : integer;
begin
  distance_total := 0;
    for i := 0 to 4 do
    begin
      distance_total += hotels[i].conn.distance
    end;
    Writeln('Total tour length: ', distance_total, ' km');
    Write('First Hotel Number: ');
    ReadLn(hnum1);
    Writeln;
    Write('Second Hotel Number: ');
    ReadLn(hnum2);
    printway(hnum1, hnum2);

    If ((hnum1 <= 5) and (hnum2 <= 5)) then
    begin
      distance_total := distance_sum(hnum1, hnum2);
      Writeln('Distance between hotels is ', distance_total, ' km');
      calc_time(distance_total);
    end;
end;

{ Calculates the total distance between hotels based on the hotel number input.
  (Only numbers accepted!). After printing the total distance a velocity can be
  input to calculate the estimated time. }
procedure hotelmain;
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

  { endless loop/main loop of the program. Exit with CTRL-C }
  while true do
    login; { Login starts all the other functions }
end.
