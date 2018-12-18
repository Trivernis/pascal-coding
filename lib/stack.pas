unit stack;

interface
type
  link = ^node;
  fixed_string = String[20];
  node = record
    data : fixed_string;
    next : link
  end;
  stack_obj = record
    alement : link;
    zlement : link
  end;
procedure push(s: stack_obj;v: fixed_string);
function pop(s: stack_obj) : fixed_string;
function top(s: stack_obj) : fixed_string;
function is_empty(s: stack_obj) : Boolean;
function init_stack : stack_obj;

implementation

procedure push(s: stack_obj; v: fixed_string);
var
  t : link;
begin
  t := GetMem(SizeOf(node));
  t^.data := v;
  t^.next := s.alement^.next;
  s.alement^.next := t;
end;

function pop(s: stack_obj): fixed_string;
var
  t: link;
begin
  if is_empty(s) = false then
  begin
    t := s.alement^.next;
    s.alement^.next := t^.next;
    pop := t^.data;
    FreeMem(t);
  end;
end;

function top(s: stack_obj): fixed_string;
begin
  top := s.alement^.next^.data;
end;

function is_empty(s: stack_obj): Boolean;
begin
  if s.alement^.next = s.zlement then
    is_empty := true
  else
    is_empty := false;
end;

function init_stack: stack_obj;
var
  s : stack_obj;
begin
  s.alement := GetMem(SizeOf(node));
  s.zlement := GetMem(SizeOf(node));
  s.alement^.next := s.zlement;
  s.zlement^.next := s.zlement;
  init_stack := s;
end;

begin
{ Main Body }
end.