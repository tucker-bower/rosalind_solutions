#!/usr/bin/ruby

seq = File.readlines('rosalind_prot.txt').join('').strip

def get_codons(rna_seq)
    codons_list = []
    for codon_index in 0..(rna_seq.length / 3 - 1) 
        codon = ''
        index_counter = 0
        for i in 1..3
            codon += rna_seq[(codon_index * 3 + index_counter)]
            index_counter += 1
        end
        codons_list.append(codon)
    end
    return codons_list
end

CODONS_LIST =   get_codons(seq)

if CODONS_LIST.length !=  seq.length / 3 || seq.length & 3 != 0
    p "error, incorrect number of codons"
end

def translate_codons(codons_list)
    amino_acids = []
    for codon in codons_list
        case codon
        when "UUU", "UUC"
            print "F"
        when "UUA", "UUG", "CUU", "CUC", "CUA", "CUG"
            print "L"
        when "UCU", "UCC", "UCA", "UCG" 
            print "S"
        when "UAU", "UAC"
            print "Y"
        when "UAA", "UAG", "UGA"
            exit #stop codon
        when "UGU", "UGC"
            print "C"
        when "UGG"
            print "W"
        when "CCU", "CCC", "CCA", "CCG"
            print "P"
        when "CAU", "CAC"
            print "H"
        when "CAA", "CAG"
            print "Q"
        when "CGU", "CGC", "CGA", "CGG", "AGA", "AGG"
            print "R"
        when "AUU", "AUC", "AUA"
            print "I"
        when "AUG"
            print "M"
        when "ACU", "ACC", "ACA", "ACG"
            print "T"
        when "AAU", "AAC"
            print "N"
        when "AAA", "AAG"
            print "K"
        when "AGU", "AGC"
            print "S"
        when "GUU", "GUC", "GUA", "GUG"
            print "V"
        when "GCU", "GCC", "GCA", "GCG"
            print "A"
        when "GAU", "GAC"
            print "D"
        when "GAA", "GAG"
            print "E"
        when "GGU", "GGC", "GGA", "GGG"
            print "G"        
        end
    end
end

translate_codons(CODONS_LIST)

