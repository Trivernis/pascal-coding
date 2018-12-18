program housegraphics;

uses
  crt,
  Graph;

var
  gdriver, gmode, xsize, ysize, scale : Integer;

begin
  scale := 5;
  DetectGraph(gdriver, gmode);
  InitGraph(gdriver, gmode, '');
  SetColor(green);
  xsize := GetMaxX;
  ysize := GetMaxY;
  MoveTo(Round(xsize/2), Round(ysize/2));
  MoveRel(20*scale, 0);
  LineRel(0, -40*scale);
  LineRel(-20*scale, -20*scale);
  LineRel(-20*scale, 20*scale);
  LineRel(0, 40*scale);
  LineRel(40*scale, -40*scale);
  LineRel(-40*scale, 0);
  LineRel(40*scale, 40*scale);
  LineRel(-40*scale, 0);
  ReadKey();
  CloseGraph();
end.