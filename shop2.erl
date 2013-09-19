-module(shop2).
-export([total/1]).
-import(lists, [map/2,sum/1]).

%total(L) -> sum(map(fun({Whats,N}) -> shop:cost(Whats) * N end, L)).
total(L) -> sum([shop:cost(Whats) * Number || {Whats,Number} <- L]).