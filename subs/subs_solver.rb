#!/usr/bin/ruby

st_file = 'rosalind_subs.txt'
string = File.readlines(st_file)[0].strip # sequence
substring = File.readlines(st_file)[1].strip # motif

p string
p substring
# string = 'GATATATGCATATACTT'
# substring = 'ATAT'

class String
    def indices e
      start, result = -1, []
      result << start while start = (self.index e, start + 1)
      result
    end
  end


indices = string.indices /#{substring}/

indices.map! { |n| n + 1}

indices.each { |index| print index.to_s + ' '}
puts ''
