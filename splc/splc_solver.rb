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

seqs_list.map!{|seq| transcribe(seq)}

RNA_TRANSCRIPT = seqs_list[0]
INTRONS = seqs_list[1..]

def splice_rna(transcript, introns)
    #remove array of intron strings from transcript string. Spit out spliced transcript comprised of all exons
    introns_hash = {} #Keys = start position index of intron, values = length of that intron
    for intron in introns
        introns_hash[transcript.indices /#{intron}/] = intron.length
    end
    
    exons = []
    position = 0

    for index in introns_hash.keys.sort
        exons.append transcript[position..index[0] - 1]
        position = introns_hash[index] + index[0]
    end

    exons.append RNA_TRANSCRIPT[position..]

    spliced_transcript = exons.join('')
end

SPLICED_TRANSCRIPT = splice_rna(RNA_TRANSCRIPT, INTRONS)

def translate(rna_seq)
    codons_list = []
    for codon_index in 0..(rna_seq.length / 3 - 1) 
        codon = ''
        index_counter = 0
        for i in 1..3
            codon += rna_seq[(codon_index * 3 + index_counter)]
            index_counter += 1
        end
        codons_list.append(codon)
    end

    amino_acids = []
    for codon in codons_list
        case codon
        when "UUU", "UUC"
            amino_acids.append "F"
        when "UUA", "UUG", "CUU", "CUC", "CUA", "CUG"
            amino_acids.append "L"
        when "UCU", "UCC", "UCA", "UCG" 
            amino_acids.append "S"
        when "UAU", "UAC"
            amino_acids.append "Y"
        when "UAA", "UAG", "UGA"
            break #stop codon
        when "UGU", "UGC"
            amino_acids.append "C"
        when "UGG"
            amino_acids.append "W"
        when "CCU", "CCC", "CCA", "CCG"
            amino_acids.append "P"
        when "CAU", "CAC"
            amino_acids.append "H"
        when "CAA", "CAG"
            amino_acids.append "Q"
        when "CGU", "CGC", "CGA", "CGG", "AGA", "AGG"
            amino_acids.append "R"
        when "AUU", "AUC", "AUA"
            amino_acids.append "I"
        when "AUG"
            amino_acids.append "M"
        when "ACU", "ACC", "ACA", "ACG"
            amino_acids.append "T"
        when "AAU", "AAC"
            amino_acids.append "N"
        when "AAA", "AAG"
            amino_acids.append "K"
        when "AGU", "AGC"
            amino_acids.append "S"
        when "GUU", "GUC", "GUA", "GUG"
            amino_acids.append "V"
        when "GCU", "GCC", "GCA", "GCG"
            amino_acids.append "A"
        when "GAU", "GAC"
            amino_acids.append "D"
        when "GAA", "GAG"
            amino_acids.append "E"
        when "GGU", "GGC", "GGA", "GGG"
            amino_acids.append "G"        
        end
    end
    return amino_acids.join('')
end

PROTEIN_STRING = translate(SPLICED_TRANSCRIPT)
print PROTEIN_STRING
