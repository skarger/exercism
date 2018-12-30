(ns collatz-conjecture)

(defn collatz [num]
  (if (= num 1)
    0
    (let [current-step 1
          next-number (if (even? num) (/ num 2) (+ 1 (* 3 num)))]
      (+ current-step (collatz next-number)))))
