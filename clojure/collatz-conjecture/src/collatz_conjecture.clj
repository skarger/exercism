(ns collatz-conjecture)

(defn collatz [num]
  (if (= num 1)
    0
    (let [current_step 1
          next_number (if (even? num) (/ num 2) (+ 1 (* 3 num)))]
      (+ current_step (collatz next_number)))))
