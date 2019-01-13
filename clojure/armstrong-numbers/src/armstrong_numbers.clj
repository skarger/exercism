(ns armstrong-numbers)
(require '[clojure.string :as str])

(defn armstrong? [num]
  (->> num
       str
       (#(str/split % #""))
       (map #(BigInteger. %))
       ((fn [digits] (map #(.pow % (count digits)) digits)))
       (reduce +)
       (= num)))
