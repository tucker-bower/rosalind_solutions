#!/usr/bin/ruby

nk_file = 'rosalind_fib.txt'
nk = File.readlines(nk_file)[0]
nandk = nk.split
# could split on whitespace to one liner get these values
nk_re = nk.match /([0-9]+)\s([0-9]+)/

n = nk_re.captures[0].to_i
k = nk_re.captures[1].to_i

print 'n = ', n, '(generations)'
puts ''
print 'k = ', k, '(offspring per generation)'
puts ''

rabbits_seq = [1, 1]

for i in 2..n-1
    rabbits_seq.append (rabbits_seq[i-2]*k + rabbits_seq[i-1])
end

print 'rabbits after n generations = ', rabbits_seq[rabbits_seq.length-1]
puts ''
