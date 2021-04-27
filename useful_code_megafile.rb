#####   READING IN FILES   ######

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


#####   GENERALLY HELPFUL CODE   ######

def factorial(num)
    n = 1
    for i in 1..num
        n *= i
    end
    return n
end

def binomial(n, k)
    # If I flip a coin n times, how many of the total possible outcomes feature k heads?
    outcomes = factorial(n) / (factorial(k) * factorial(n - k))
end

#####   SEQUENCE STATISTICS   ######


COMPLEMENTS = { "A" => "T", "T" => "A", "G" => "C", "C" => "G" }

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

def revc(seq)
    # returns the reverse complement of a DNA sequence
    reverse = seq.reverse.split('')
    revc = ''
    for char in reverse
        revc += COMPLEMENTS[char]
    end
    return revc
end

#Hash of Amino-Acid masses
MASSES = {
'A' => 71.03711,
'C' => 103.00919,
'D' => 115.02694,
'E' => 129.04259,
'F' => 147.06841,
'G' => 57.02146,
'H' => 137.05891,
'I' => 113.08406,
'K' => 128.09496,
'L' => 113.08406,
'M' => 131.04049,
'N' => 114.04293,
'P' => 97.05276,
'Q' => 128.05858,
'R' => 156.10111,
'S' => 87.03203,
'T' => 101.04768,
'V' => 99.06841,
'W' => 186.07931,
'Y' => 163.06333
}

def dna_bases_counter(chars)
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
end

def get_codons(rna_seq)
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
    return codons_list
end

def translate_codons(codons_list)
    amino_acids = []
    for codon in codons_list
        case codon
        when "UUU", "UUC"
            print "F"
        when "UUA", "UUG", "CUU", "CUC", "CUA", "CUG"
            print "L"
        when "UCU", "UCC", "UCA", "UCG" 
            print "S"
        when "UAU", "UAC"
            print "Y"
        when "UAA", "UAG", "UGA"
            exit #stop codon
        when "UGU", "UGC"
            print "C"
        when "UGG"
            print "W"
        when "CCU", "CCC", "CCA", "CCG"
            print "P"
        when "CAU", "CAC"
            print "H"
        when "CAA", "CAG"
            print "Q"
        when "CGU", "CGC", "CGA", "CGG", "AGA", "AGG"
            print "R"
        when "AUU", "AUC", "AUA"
            print "I"
        when "AUG"
            print "M"
        when "ACU", "ACC", "ACA", "ACG"
            print "T"
        when "AAU", "AAC"
            print "N"
        when "AAA", "AAG"
            print "K"
        when "AGU", "AGC"
            print "S"
        when "GUU", "GUC", "GUA", "GUG"
            print "V"
        when "GCU", "GCC", "GCA", "GCG"
            print "A"
        when "GAU", "GAC"
            print "D"
        when "GAA", "GAG"
            print "E"
        when "GGU", "GGC", "GGA", "GGG"
            print "G"        
        end
    end
end

def gc_content(fasta_hash)
    gc_hash = {}
    for header in fasta_hash.keys
        gc_counter = 0
        char_counter = 0
        for char in fasta_hash[header].split('')
            char_counter += 1.0
            if char == "G" || char == "C"
                gc_counter += 1.0
            end
        end
        gc_hash[header] = (gc_counter / char_counter) * 100
    end
    return gc_hash
end

def largest_hash_key(hash)
  hash.max_by{|k,v| v}
end

def count_possible_mrna_seqs(prot_seq)
    codons = []
    for acid in prot_seq
        case acid
        when "F", "Y", "C", "H", "Q", "N", "K", "D", "E"
            codons.append 2
        when "I"
            codons.append 3
        when "P", "T", "V", "A", "G"
            codons.append 4
        when "L", "R", "S"
            codons.append 6
        end
    end

    possibilities = 3
    #possibilities begins at 3 because there are 3 stop codons
    for codon in codons
        possibilities *= codon
    end
    return possibilities
end
