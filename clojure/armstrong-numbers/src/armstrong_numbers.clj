(ns armstrong-numbers)
(require '[clojure.string :as str])

(defn armstrong? [num]
  (let [power (count (str num))
      digits (map
               (fn [s] (.pow (BigInteger. s) power))
               (str/split (str num) #""))
      sum (reduce + digits)]
  (= sum num))
)
