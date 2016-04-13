#!/usr/bin/env escript

main([String]) ->
  try
  	N = list_to_integer(String),
  	statistics(runtime),
  	Result = original(N),
  	{_, Time} = statistics(runtime),
  	io:format("Result: ~w in ~p microsecs~n", [Result, Time])
  catch
  	_:_ ->
  	  usage()
  end;

main(_) ->
  usage().

usage() ->
  io:format("usage: 1_multiple_3_5 1000"),
  halt(1).

% Functional code
original(Number) ->
  L = [X || X <- lists:seq(1, Number - 1), (X rem 3 =:= 0) or (X rem 5 =:= 0)],
  lists:sum(L).
