program baloon;

uses
  crt,
  Graph;

procedure draw_ba(x, y : Integer; color : word);
begin
  SetColor(color);
  SetFillStyle(1, color);
  Circle(x, y, 100);
  FloodFill(x, y, color);
end;

var
  gdriver,
  gmode,
  xsize,
  ysize : Integer;

begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  xsize := GetMaxX;
  ysize := GetMaxY;
  MoveTo(Round(xsize/2), Round(ysize/2));
  draw_ba(Round(xsize/2), Round(ysize/2), green);
  draw_ba(Round(xsize/2)-60, Round(ysize/2)+60, red);
  draw_ba(Round(xsize/2)+40, Round(ysize/2), blue);
  draw_ba(Round(xsize/2), Round(ysize/2)-100, yellow);
  draw_ba(Round(xsize/2)-100, Round(ysize/2)-80, green);
  ReadKey;
  CloseGraph;
end.