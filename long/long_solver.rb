#!/usr/bin/ruby
# rubocop:disable IndentationWidth

def fasta_hash_inator(filename)
    #Returns a hash where the headers are the keys and the sequences are the values
    fasta_lines = File.readlines(filename).map {|seq| seq.strip}
    fasta_hash = {}
    for line in fasta_lines
        if line[0] == ">"
            header = line[1..]
            fasta_hash[header] = ''
        else
            fasta_hash[header] += line
        end
    end
    return fasta_hash
end

fasta_hash = fasta_hash_inator('rosalind_long.txt')

print fasta_hash.values.