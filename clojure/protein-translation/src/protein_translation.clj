(ns protein-translation)
(require '[clojure.string :as str])

(defn translate-codon [codon]
  ({:AUG "Methionine"
    :UUU "Phenylalanine"
    :UUC "Phenylalanine"
    :UUA "Leucine"
    :UUG "Leucine"
    :UCU "Serine"
    :UCC "Serine"
    :UCA "Serine"
    :UCG "Serine"
    :UAU "Tyrosine"
    :UAC "Tyrosine"
    :UGU "Cysteine"
    :UGC "Cysteine"
    :UGG "Tryptophan"
    :UAA "STOP"
    :UAG "STOP"
    :UGA "STOP"} (keyword codon) "STOP"))

(defn convert-proteins [result nucleotides]
  (let [protein (translate-codon (str/join (take 3 nucleotides)))]
    (if (= "STOP" protein)
      result
      (convert-proteins (conj result protein) (drop 3 nucleotides)))))

(defn translate-rna [rna-sequence]
  (convert-proteins [] (str/split rna-sequence #"")))
