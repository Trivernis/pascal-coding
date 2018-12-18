program utilstest;

uses
  crt,
  Graph,
  utils in '../lib/utils.pas';

begin
  graph_init;
  draw_hotel(getXSize >> 1, getYSize >> 1, 1, 'H1');
  draw_way(60, 60, 200, 200, 1);
  ReadKey;
end.