#!/usr/bin/ruby

fasta_lines = File.readlines('rosalind_revp.txt')
.map{|line| line.strip}

sequence = fasta_lines[1..].join('')
#removes header line (0) and joins all seq lines into one string

COMPLEMENTS = { "A" => "T", "T" => "A", "G" => "C", "C" => "G" }

def revc(seq)
    # returns the reverse complement of a DNA sequence
    reverse = seq.reverse.split('')
    revc = ''
    for char in reverse
        revc += COMPLEMENTS[char]
    end
    return revc
end

test_seq = 'ATGACGCATGCATAATT'

def kmer_ize_and_conquer(seq)
    seq_array = seq.split('')
    for pos in 0..seq.length
        for kmer_length in 4..12
            kmer = ''
            for k_pos in 0..kmer_length - 1
                    kmer += seq_array[k_pos + pos]
                end
                puts kmer
            end
                if kmer.length == kmer_length && kmer == revc(kmer)
                puts "#{pos+1} #{kmer_length}"
            end
        end
    end
end

kmer_ize_and_conquer(sequence)

