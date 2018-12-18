unit linkedlist;

interface
type
  link = ^node;
  node = record
    prev : link;
    next : link;
    value : pointer;
  end;
  list_obj = record
    alement : link;
    zlement : link;
  end;

function list_init : list_obj;
function list_get(li : list_obj; i : Integer) : pointer;
procedure list_push(li : list_obj; p : pointer);
function list_pop(li : list_obj) : pointer;
function list_length(li : list_obj) : Integer;
function list_first(li : list_obj) : pointer;
function list_empty(li : list_obj) : Boolean;

implementation

function list_init: list_obj;
begin
  list_init.alement := GetMem(SizeOf(node));
  list_init.zlement := GetMem(SizeOf(node));
  list_init.zlement^.prev := list_init.alement;
  list_init.zlement^.next := list_init.zlement;
  list_init.alement^.next := list_init.zlement;
  list_init.alement^.prev := list_init.alement;
end;

function list_get(li: list_obj; i: Integer) : pointer;
var
  j : Integer;
  r : link;
begin
  list_get := nil;
  if list_length(li) > i then
  begin
    r := li.alement;
    for j := 0 to i do
    begin
      r := r^.next;
    end;
    list_get := r^.value;
  end;
end;

procedure list_push(li: list_obj; p: pointer);
var
  t : link;
begin
  t := GetMem(SizeOf(node));
  t^.next := li.zlement;
  t^.value := p;
  t^.prev := li.zlement^.prev;
  li.zlement^.prev^.next := t;
  li.zlement^.prev := t;
end;

function list_pop(li : list_obj) : pointer;
var
  t : link;
begin
  t := li.zlement^.prev;
  li.zlement^.prev := t^.prev;
  li.zlement^.prev^.next := li.zlement;
  list_pop := t^.value;
  FreeMem(t);
end;

function list_length(li : list_obj) : Integer;
var
  i : Integer;
  t : link;
begin
  i := 0;
  t := li.alement;
  while t^.next <> li.zlement do
  begin
    t := t^.next;
    i := i + 1;
  end;
  list_length := i;
end;

function list_first(li : list_obj) : pointer;
var
  t : link;
begin
  t := li.alement^.next;
  li.alement^.next := t^.next;
  t^.next^.prev := li.alement;
  list_first := t^.value;
  FreeMem(t);
end;

function list_empty(li : list_obj) : Boolean;
begin
  if li.alement^.next = li.zlement then
    list_empty := True
  else
    list_empty := False;
end;

begin
  { Main Body }
end.