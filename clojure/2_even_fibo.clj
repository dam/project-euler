; We need to use loop to not explose the stack
(defn even-fibo [limit]
  "Using loop and recur construct with accumulator to avoid stack overflow error"
  (loop [a 0 
  	     b 1
  	     acc 0]
  	(if (>= b limit)
  		acc ; Breaking the loop and return accumulator
  		(let [next-fibo (+ a b)]
  			(if (even? next-fibo)
  		  		(recur b next-fibo (+ acc next-fibo))
  		  		(recur b next-fibo acc))))))

(println (even-fibo 4000000))
(time (even-fibo 4000000))