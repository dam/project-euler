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

(println "\nLoop/recur version")
(println (even-fibo 4000000))
(time (even-fibo 4000000))

; More functional version, the Clojure way
; Slower version using the infinite list of fibonnaci numbers, lazyness and list comprehension
(defn fibo []
	"Lazy infinite sequence of fibo numbers"
	(map first (iterate (fn [[a,b]] [b (+ a b)]) [0, 1])))

(defn euler2-functional [predicate limit]
	(apply + (for [x (fibo) :when (predicate x) :while (< x limit)] x))) 

; currying example
(def even2-fibo (partial euler2-functional even?))
(def odd-fibo (partial euler2-functional odd?))

(println "\nLaze-sequence version")
(println (even2-fibo 4000000))
(time (even2-fibo 4000000))
(println "\nLaze-sequence filtering odd numbers version")
(println (odd-fibo 4000000))
(time (odd-fibo 4000000))

