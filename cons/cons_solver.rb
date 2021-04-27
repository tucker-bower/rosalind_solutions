#!/usr/bin/ruby

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

FASTA_HASH = fasta_hash_inator('rosalind_cons.txt')

seqs_list = FASTA_HASH.values


consensus_hash = {"A: " => [], "C: " => [], "G: " => [], "T: " => []}
for i in 0..(seqs_list[0].length - 1)
    consensus_hash["A: "][i] = 0
    consensus_hash["C: "][i] = 0
    consensus_hash["G: "][i] = 0
    consensus_hash["T: "][i] = 0
    for seq in seqs_list
        consensus_hash[seq[i] + ": "][i] += 1
    end
end

consensus_seq = []
for i in 0..(seqs_list[0].length - 1)
    a_count = consensus_hash["A: "][i]
    c_count = consensus_hash["C: "][i]
    g_count = consensus_hash["G: "][i]
    t_count = consensus_hash["T: "][i]
    high_count = [a_count, c_count, g_count, t_count].max
    if a_count == high_count
        consensus_seq[i] = "A"
    end
    if c_count == high_count
        consensus_seq[i] = "C"
    end
    if g_count == high_count
        consensus_seq[i] = "G"
    end
    if t_count == high_count
        consensus_seq[i] = "T"
    end
end

consensus_string = consensus_seq.join('')

puts consensus_string

for key in consensus_hash.keys
    print key
    puts consensus_hash[key].join(' ')
end