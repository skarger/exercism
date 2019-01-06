(ns spiral-matrix)

;; prepares coordinates of the "outer wall" of a spiral starting at some depth
(defn outer-coordinates [start-depth current-n]
  (let [upper-bound (+ start-depth current-n)
        right (list (take current-n (repeat start-depth))
                    (range start-depth upper-bound))
        down  (list (range (+ start-depth 1) upper-bound)
                    (take (- current-n 1) (repeat (- upper-bound 1))))
        left  (list (take (- current-n 1) (repeat (- upper-bound 1)))
                    (range (- upper-bound 2) (- start-depth 1) -1))
        up    (list (range (- upper-bound 2) start-depth -1)
                    (take (- current-n 2) (repeat start-depth)))
        pairs #(apply map vector %)]
    (mapcat pairs (list right down left up))))

;; ordered coordinates for entire spiral
(defn spiral-coordinates [coordinates-so-far start-depth current-n]
  (cond (= current-n 0) coordinates-so-far
        (= current-n 1) (conj coordinates-so-far (vector start-depth start-depth))
        :else
        (spiral-coordinates
          (into [] (concat coordinates-so-far (outer-coordinates start-depth current-n)))
          (+ start-depth 1) (- current-n 2))))

(defn preallocate-matrix [n]
  (letfn [(row [n] (into [] (take n (repeat -1))))]
    (into [] (take n (repeat (row n))))))

(defn set-row-col [matrix row col val] (let
                                         [new-row (assoc (get matrix row) col val)]
                                         (assoc matrix row new-row)))

(defn spiral [n]
  (let [spiral-matrix (preallocate-matrix n)
        all-coordinates (spiral-coordinates [] 0 n)
        all-numbers (range 1 (+ 1 (* n n)))
        coordinates-vals (map conj all-coordinates all-numbers)
        set-at-coordinate (fn [matrix coordinate-val] (apply set-row-col matrix coordinate-val))]
    (map seq (reduce set-at-coordinate spiral-matrix coordinates-vals))))