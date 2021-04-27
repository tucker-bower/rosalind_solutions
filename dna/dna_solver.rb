#!/usr/bin/ruby

seq_file = 'rosalind_dna.txt'
read = File.readlines(seq_file)
seq = read[0]

chars = seq.split('')

a_count = 0
c_count = 0
g_count = 0
t_count = 0

for base in chars
    if base == 'A'
        a_count += 1
    end
    if base == 'C'
        c_count += 1
    end
    if base == 'G'
        g_count += 1
    end
    if base == 'T'
        t_count += 1 
    end
end

puts 'A C G T'
print a_count 
print ' '
print c_count
print ' '
print g_count
print ' '
print t_count
puts ''