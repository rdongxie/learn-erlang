-module(area_server_final).
-export([start/0, area/1]).

loop() ->
	receive
		{From, {rectangle, Width, Ht}} -> From ! {self(), Width * Ht}, loop();
		{From, {circle, R}} -> From ! {self(), 3.1415926 * R * R}, loop();
		{From, Other} -> From ! {self(), {error, Other}}, loop()
	end.

start() -> Pid = spawn(loop()), register(server, Pid), Pid.

area(What) ->
	Pid = whereis(server),
	Pid ! {self(), What},
	receive
		{Pid, Response} -> Response		
	end.

