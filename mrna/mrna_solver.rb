#!/usr/bin/ruby

protein_string = File.readlines('rosalind_mrna.txt')[0].strip

codons = []
protein_string.chars.each { |acid|
    case acid
    when 'F', 'Y', 'C', 'H', 'Q', 'N', 'K', 'D', 'E'
        codons.append 2
    when 'I'
        codons.append 3
    when 'P', 'T', 'V', 'A', 'G'
        codons.append 4
    when 'L', 'R', 'S'
        codons.append 6
    end
}

possibilities = 3 # possibilities begins at 3 because there are 3 stop codons
codons.each { |codon| possibilities = (possibilities * codon) % 1_000_000}

p possibilities 
