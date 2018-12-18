program ellipsegraph;

uses
  crt,
  Graph;

var
  gdriver,
  gmode,
  xsize,
  ysize, x, y, i : Integer;

procedure draw_spiral(color: word; rotation: Integer);
var
  i : Integer;
begin
for i := 0 to 1500 do
    begin
      x := Round(xsize/2)+Round(i*sin(2*i+rotation)/2);
      y := Round(ysize/2)+Round(i*cos(2*i+rotation)/2);
      PutPixel(x, y, color);
    end;
end;

begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  SetColor(green);
  xsize := GetMaxX;
  ysize := GetMaxY;
  MoveTo(Round(xsize/2), Round(ysize/2));
  while True do
  begin
    for i := 0 to 360 do
      draw_spiral(i, Round(i/2));
  end;
  ReadKey;
  CloseGraph;
end.