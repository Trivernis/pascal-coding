program stacktest;

uses
  stack in '../lib/stack.pas';

var
  st, st1 : stack_obj;

begin
  st := init_stack;
  st1 := init_stack;
  push(st, 'Hello');
  push(st1, 'New stack');
  push(st, 'World');
  push(st1, 'With new values');
  push(st, 'How');
  push(st, 'Are');
  push(st, 'You');
  push(st, '?');
  while is_empty(st) = false do
  begin
    WriteLn(pop(st));
  end;
  WriteLn(pop(st1));
end.