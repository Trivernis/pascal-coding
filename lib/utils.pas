unit utils;

interface
procedure calc_time(disttot : integer);
procedure graph_init;
procedure draw_hotel(x, y, scale : integer; hlabel: String);
function getXSize : Integer;
function getYSize : Integer;
procedure draw_way(xs, ys, xt, yt, scale : Integer);

implementation

uses
  crt,
  Graph;

procedure calc_time(disttot : integer);
{ Calculate the time needed for the way and print it. }
var
  velocity : integer;
  time : extended;
begin
      Write('Velocity (km/h): ');
      ReadLn(velocity);
      time := (disttot / velocity);
      WriteLn('Estimated Time: ', time: 10: 2, ' hours');
end;

procedure draw_hotel(x, y, scale : integer; hlabel: String);
begin
  MoveTo(x, y);
  OutTextXY((2*scale+x-20*scale), (y-20*scale), hlabel);
  MoveRel(20*scale, 0);
  LineRel(0, -40*scale);
  LineRel(-20*scale, -20*scale);
  LineRel(-20*scale, 20*scale);
  LineRel(0, 40*scale);
  LineRel(40*scale, 0);
  MoveTo(x, y);
end;

procedure draw_way(xs, ys, xt, yt, scale : Integer);
begin
  Line(xs, ys, xt, yt);
end;

procedure graph_init;
var
  gdriver, gmode : Integer;
begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
end;

function getXSize : Integer;
begin
  getXSize := GetMaxX;
end;

function getYSize : Integer;
begin
  getYSize := GetMaxY;
end;

begin
end.