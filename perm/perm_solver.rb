#!/usr/bin/ruby

n = File.readlines('rosalind_perm.txt')[0].strip.to_i


ints_list = []
for i in 1..n
    ints_list.append i
end

permutations = ints_list.permutation.to_a

puts permutations.length

for permu in permutations
    puts permu.join(' ')
end