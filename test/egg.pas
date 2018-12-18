program egg;

uses
  crt,
  Graph;

var
  gdriver,
  gmode,
  xsize,
  ysize, x, y, i : Integer;

begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  SetColor(White);
  xsize := GetMaxX;
  ysize := GetMaxY;
  MoveTo(Round(xsize/2), Round(ysize/2));
  Ellipse(Round(xsize/2), Round(ysize/2), 0, 360, 100, 160);
  SetColor(Black);
  Ellipse(Round(xsize/2), Round(ysize/2), 0, 180, 100, 160);
  SetColor(White);
  Ellipse(Round(xsize/2), Round(ysize/2), 0, 180, 100, 110);
  SetFillStyle(1, White);
  FloodFill(Round(xsize/2), Round(ysize/2), White);
  ReadKey;
  CloseGraph;
end.