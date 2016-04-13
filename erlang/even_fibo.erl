-module(even_fibo).
-export([start/0, even_fibo/1]).

even_fibo_acc({Acc, _A, B, N}) when B >= N -> Acc;
even_fibo_acc({Acc,  A, B, N}) when (B rem 2) =:= 1 -> even_fibo_acc({Acc, B, A + B, N});
even_fibo_acc({Acc,  A, B, N}) when (B rem 2) =:= 0 -> even_fibo_acc({Acc + B, B, A + B, N}).

%% API
even_fibo(N) when N > 0 ->
    even_fibo_acc({0,1,1,N});
even_fibo(_N) ->
    exit('Please provide a positive integer').

start() ->
    io:format("Working on version with accumulator and tail recursion"),
    {Time, Result} = timer:tc(fun () -> even_fibo(4000000) end),
    io:format("Result: ~w in ~p microsecs~n", [Result, Time]).
