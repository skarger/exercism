def to_rna(dna_strand):
    dna_nucleotides = "GCTA"
    rna_nucleotides = "CGAU"
    if set(dna_strand).issubset(set(dna_nucleotides)):
        return dna_strand.translate(
            str.maketrans(dna_nucleotides, rna_nucleotides)
        )
    else:
        return ""
