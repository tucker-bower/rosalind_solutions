#!/usr/bin/ruby

st_file = 'rosalind_hamm.txt'
string1 = File.readlines(st_file)[0].strip #sequence
string2 = File.readlines(st_file)[1].strip #motif

hamming_distance = 0
for i in 0..string1.length
    if string1[i] != string2[i]
        hamming_distance += 1
    end
end

p hamming_distance