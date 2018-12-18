program linkedtest;

uses
  linkedlist in '../lib/linkedlist.pas';

type
  fixedstr = String;
  strptr = ^fixedstr;

function val_gen(val : fixedstr) : strptr;
begin
  val_gen := GetMem(SizeOf(fixedstr));
  val_gen^ := val;
end;

function val_get(ptr : pointer) : fixedstr;
var
  t_ptr : strptr;
begin
  t_ptr := strptr(ptr);
  val_get := t_ptr^;
  FreeMem(t_ptr);
end;

var
  li : list_obj;
  i : Integer;

begin
  li := list_init;
  list_push(li, val_gen('Hello World'));
  list_push(li, val_gen('This is the pointers value'));
  list_push(li, val_gen('A third string'));
  list_push(li, val_gen('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'));
  list_push(li, val_gen('Stringent'));
  list_push(li, val_gen('Whatisthis'));
  list_push(li, val_gen('No fun anymore.'));
  list_push(li, val_gen('AA'));
  list_push(li, val_gen('Stackedey-Stack-Stack'));
  WriteLn();
  for i := 0 to list_length(li)-1 do
    WriteLn(strptr(list_get(li, i))^);
  WriteLn();
  WriteLn('list_length: ', list_length(li));
end.