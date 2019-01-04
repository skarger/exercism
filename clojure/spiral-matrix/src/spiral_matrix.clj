(ns spiral-matrix)


;; (defn max-digits [n] (.intValue (Math/log10 n)))

(defn n-numbers [n] (* n n))

(defn build [n have remaining]
  (if (= 0 (count remaining))
    have
    (build n (conj have (reverse (take n remaining))) (drop n remaining))))

(defn spiral [n]
  (let [numbers (range (n-numbers n) 0 -1)] (build n '() numbers)))


