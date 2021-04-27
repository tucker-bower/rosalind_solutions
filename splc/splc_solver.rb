#!/usr/bin/ruby

def transcribe(dna)
    rna = []
    for char in dna.chars
        if char == 'T'
            rna.append('U')
        else
            rna.append(char)
        end
    end
    rna_seq = rna.join('')
end

class String
  def indices e
    start, result = -1, []
    result << start while start = (self.index e, start + 1)
    result
  end
end

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

FASTA_HASH = fasta_hash_inator('rosalind_splc.txt')

seqs_list = FASTA_HASH.values


for i in 1..seqs_list.length
    if seqs_list[0].indices /