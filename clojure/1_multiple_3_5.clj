; Run with `lein exec 1_multiple_3_5.clj` 
; This is the faster version
(defn original [limit]
	(apply + (for [x (range limit) :when (or (= 0 (mod x 3)) (= 0 (mod x 5)))] x)))

(defn threading [limit]
	(->> (for [x (range limit) :when (or (= 0 (mod x 3)) (= 0 (mod x 5)))] x)
	      (apply +)))

(def result (original 1000))

(print (str "Result: " result "\n"))
(time (original 1000))
(time (threading 1000))