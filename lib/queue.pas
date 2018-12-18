unit queue;

interface
type
  fixed_string = String[20];
  link = ^node;
  node = record
    data : fixed_string;
    next : link;
    prev : link
  end;
  queue_obj = record
    alement : link;
    zlement : link;
  end;
procedure enqueue(q : queue_obj; v: fixed_string);
function dequeue(q : queue_obj) : fixed_string;
function is_empty(q : queue_obj) : Boolean;
function init_queue: queue_obj;

implementation

procedure enqueue(q : queue_obj; v: fixed_string);
var
  t : link;
begin
  t := GetMem(SizeOf(node));
  t^.data := v;
  t^.prev := q.zlement^.prev;
  t^.prev^.next := t;
  q.zlement^.prev := t;
  t^.next := q.zlement;
end;

function dequeue(q : queue_obj): fixed_string;
var
  t: link;
begin
  if is_empty(q) = false then
  begin
    t := q.alement^.next;
    dequeue := t^.data;
    q.alement^.next := t^.next;
    FreeMem(t);
  end;
end;

function is_empty(q : queue_obj): Boolean;
begin
  if q.zlement^.prev = q.alement then
    is_empty := true
  else
    is_empty := false;
  if q.alement^.next = q.zlement then
    is_empty := true;
end;

function init_queue: queue_obj;

var
  q : queue_obj;

begin
  q.alement := GetMem(SizeOf(node));
  q.zlement := GetMem(SizeOf(node));
  q.alement^.next := q.zlement;
  q.alement^.prev := q.alement;
  q.zlement^.next := q.zlement;
  q.zlement^.prev := q.alement;
  init_queue := q;
end;

begin
{ Main Body }
end.