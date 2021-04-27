#!/usr/bin/ruby

mrna = File.readlines('rosalind_mrna.txt')[0].strip

codons = []
for acid in mrna.split('')
    case acid
    when "F", "Y", "C", "H", "Q", "N", "K", "D", "E"
        codons.append 2
    when "I"
        codons.append 3
    when "P", "T", "V", "A", "G"
        codons.append 4
    when "L", "R", "S"
        codons.append 6
    end
end

possibilities = 3
#possibilities begins at 3 because there are 3 stop codons
for codon in codons
    possibilities *= codon
end

p possibilities % 1_000_000