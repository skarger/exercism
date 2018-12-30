(ns beer-song)

(defn verse
  "Returns the nth verse of the song."
  [num]
  (cond
    (= num 0) "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    (= num 1) "1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
    (= num 2) "2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.\n"
    :else (str num " bottles of beer on the wall, " num " bottles of beer.
Take one down and pass it around, " (- num 1) " bottles of beer on the wall.\n")))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end]
   (cond
     (= start end) (verse end)
     :else (clojure.string/join "\n" [(verse start) (sing (- start 1) end)]))))
