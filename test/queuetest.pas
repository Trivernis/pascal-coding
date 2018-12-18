program queuetest;

uses
  queue in '../lib/queue.pas';

var
  qu, qe : queue_obj;

begin
  qu := init_queue;
  qe := init_queue;
  enqueue(qu, 'Hello');
  enqueue(qu, 'World');
  enqueue(qu, 'How');
  enqueue(qe, 'Another queue');
  enqueue(qu, 'Are');
  enqueue(qu, 'You');
  enqueue(qu, '?');
  while is_empty(qu) = false do
  begin
    WriteLn(dequeue(qu));
  end;
  WriteLn(dequeue(qe));
end.