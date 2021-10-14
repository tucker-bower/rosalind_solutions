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

fasta_hash = fasta_hash_inator('example_data.txt')

suffix_prefix_hash = {}

fasta_hash.keys.each{|key| suffix_prefix_hash[key] = [fasta_hash[key][0..2], fasta_hash[key][fasta_hash[key].length - 3..fasta_hash[key].length]]}
# makes second hash with the values being an array containing the 3 character suffix and prefix of that sequence

for suffix_key in suffix_prefix_hash.keys
    for prefix_key in suffix_prefix_hash.keys
        if suffix_prefix_hash[suffix_key][1] == suffix_prefix_hash[prefix_key][0] && suffix_key != prefix_key
            puts suffix_key + ' ' + prefix_key
        end
    end
end


