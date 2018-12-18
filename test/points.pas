program points;

uses
  crt,
  Graph;

var
  gdriver,
  gmode,
  xsize,
  ysize,
  width,
  i, j, k : Integer;

begin
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  SetColor(green);
  xsize := GetMaxX;
  ysize := GetMaxY;
  width := Round(xsize/GetMaxColor());
  MoveTo(Round(xsize/2), Round(ysize/2));
  for i := 0 to Round(xsize/width) do
    for k := 0 to width do
      for j := 0 to ysize do
        begin
          PutPixel((i*width)+k, j, i);
        end;
  ReadKey();
  CloseGraph();
end.