#!/usr/bin/ruby

seq_file = 'rosalind_revc.txt'
read = File.readlines(seq_file)
seq = read[0]

chars = seq.split('')

chars_num = chars.length

for i in 0..chars_num
    base = chars[chars_num - i]

    if base == 'A'
        print 'T'
    end
    if base == 'T'
        print 'A'
    end
    if base == 'G'
        print 'C'
    end
        if base == 'C'
        print 'G'
    end
end

