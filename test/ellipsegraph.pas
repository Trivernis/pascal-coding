program ellipsegraph;

uses
  crt,
  Graph;

var
  gdriver,
  gmode,
  xsize,
  ysize : Integer;

begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  SetColor(green);
  xsize := GetMaxX;
  ysize := GetMaxY;
  FillEllipse(Round(xsize/2), Round(ysize/2), 500, 100);
  ReadKey;
  CloseGraph;
end.