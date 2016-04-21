-module(higher_prime_factor).
-export([start/0, test/0]).

%% Building a List of primes factors until a limit, based on a 23 generator
primes(Limit) when Limit > 0 ->
    case Limit of
	1 -> [];
	2 -> [2];
	3 -> [2,3];
        4 -> [2,3]; 
        5 -> [2,3,5];
	_ -> primes([5,3,2], Limit, 5, 2)
    end.

primes(List, Limit, Previous, Step) ->
    NextValue = Previous + Step,
    if
        NextValue > Limit -> lists:reverse(List);
        true -> 
            NextStep = 6 - Step,
            if
		(NextValue =:= 7) or (((NextValue rem 5) =/= 0) and ((NextValue rem 7) =/= 0)) -> primes([NextValue| List], Limit, NextValue, NextStep);
		true -> primes(List, Limit, NextValue, NextStep)
            end
    end.

loop({Rest, _Iteration, Stop, _Primes}) when Rest < Stop -> Rest;
loop({Rest, Iteration, Stop, Primes}) -> 
    Prime = lists:nth(Iteration, Primes),
    if
        (Rest rem Prime) =:= 0 -> loop({Rest div Prime, Iteration + 1, Stop, Primes});
	true -> loop({Rest, Iteration + 1, Stop, Primes})
    end.
  
larger_prime_factor(N) when N > 0 ->
    Stop = trunc(math:sqrt(N)),
    Primes = primes(Stop),
    loop({N, 1, Stop, Primes});
larger_prime_factor(_N) ->
    exit("Please provide a positive integer").

%% API
test() ->
    io:format("Testing prime list generation~n"),
    [2] = primes(2),
    [2,3] = primes(3),
    [2,3,5] = primes(6),
    [2,3,5,7,11,13] = primes(14),
    [2,3,5,7,11,13,17,19,23,29] = primes(30),
    io:format("Testing large prime factor example~n"),
    29 = larger_prime_factor(13195),
    ok.

start() ->
    {Time, Result} = timer:tc( fun() -> larger_prime_factor(600851475143) end),
    io:format("Result: ~w in ~p microsecs~n", [Result, Time]).
