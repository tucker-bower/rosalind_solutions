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

FASTA_HASH = fasta_hash_inator('rosalind_gc.txt')

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

GC_HASH = gc_content(FASTA_HASH)

def largest_hash_key(hash)
  hash.max_by{|k,v| v}
end

max_gc_header, max_gc = largest_hash_key(GC_HASH)

puts max_gc_header
puts max_gc
