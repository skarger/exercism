(ns armstrong-numbers)
(require '[clojure.string :as str])

(defn armstrong? [num]
  (let [power (count (str num))]
    (->> num
         str
         (#(str/split % #""))
         (map #(BigInteger. %))
         (map #(.pow % power))
         (reduce +)
         (= num))))
