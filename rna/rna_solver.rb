#!/usr/bin/ruby

seq_file = 'rosalind_rna.txt'
read = File.readlines(seq_file)
seq = read[0]

chars = seq.split('')

for base in chars
    if base == 'T'
        print 'U'
    else
        print base
    end
end