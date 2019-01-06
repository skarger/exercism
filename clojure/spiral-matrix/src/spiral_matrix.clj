(ns spiral-matrix)
(clojure.core/refer-clojure)

(defn n-numbers [n] (* n n))

(defn total-numbers [n] (range 1 (+ 1 (n-numbers n))))

(defn row [n] (into [] (take n (repeat -1))))

(defn matrix [n] (into [] (take n (repeat (row n)))))

(defn set-row-col [matrix row col val] (let
                                         [new-row (assoc (get matrix row) col val)]
                                         (assoc matrix row new-row)))

(defn outer-inner [numbers outer-count]
  (list (take outer-count numbers) (drop outer-count numbers)))

;; prepares coordinates of the "outer wall" of a spiral: right, down, left, up
(defn build-coords [start-row start-col n]
  (let [max-row (+ n start-row)
        max-col (+ n start-col)]
    [(map vector (take n (repeat start-row)) (range start-col max-col))
     (map vector (range (+ 1 start-row) max-row) (take (- n 1) (repeat (- max-col 1))))
     (map vector (take (- n 1) (repeat (- max-row 1))) (range (- max-col 2) (- start-col 1) -1))
     (map vector (range (- max-row 2) start-row -1) (take (- n 2) (repeat start-col)))]))

(defn outer-coords [start-row start-col n] (filter not-empty
                                                   (mapcat identity
                                                           (build-coords start-row start-col n))))

(defn rec-spiral [matrix remaining-numbers current-n start-row start-col]
  (cond
    (<= current-n 0 ) matrix
    :else (let [coords (outer-coords start-row start-col current-n)
                [outer-numbers inner-numbers] (outer-inner remaining-numbers (count coords))
                coords-vals (map (fn [c v] (conj c v)) coords outer-numbers)
                new-matrix (reduce (fn [matrix coord-val] (apply set-row-col matrix coord-val)) matrix coords-vals)
                new-n (- current-n 2)
                new-start-row (+ 1 start-row)
                new-start-col (+ 1 start-col)]
            (rec-spiral new-matrix inner-numbers new-n new-start-row new-start-col))))

(defn spiral [n]
  (let [vector-mat (rec-spiral (matrix n) (total-numbers n) n 0 0)]
    (map (fn [row] (seq row)) vector-mat))
  )
