-module(area_server_final).
-export([start/0, area/2]).

start() -> spawn(fun loop/0).

area(Pid, What) -> rpc(Pid, What).

rpc(Pid, Request) ->
	Pid ! {self(), Request};
	recive
		{Pid, Response} -> Response;
end.

loop() -> 
	recive 
	{From, {rectangle, Width, Ht}} -> From ! {self(), Width * Ht}, loop();
	{From, {circle, R}} -> From ! {self(), R * R}, loop();
	{From, Other} -> From ! {self(), {errro, Other}}, loop()
end.