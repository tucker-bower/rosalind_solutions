#!/usr/bin/ruby

s = File.readlines("rosalind_prob.txt")[0].strip.split('')
A = File.readlines("rosalind_prob.txt")[1].strip.split(' ').to_a.map{|gc| gc.to_f}

probs = []
for i in 0..A.length - 1
    gc_content = A[i]
    probs[i] = 0
    for char in s
        if char == "C" or char == "G"
            probs[i] += Math.log10(gc_content / 2)
        elsif char == "T" or char == "A"
            probs[i] += Math.log10((1 - gc_content) / 2)
        else
            puts "error, non-standard DNA base in sequence"
        end
    end
end

puts probs.join(' ')





# for gc_content in A
#     char_probs = []
#     for char in s
#         if char in ["G", "C"]
#             prob = (gc_content / 2) 
#         elsif char in ["T", "A"]
#             prob = (1 - gc_content) / 2
#         end
#         char_probs.append prob
#     end
#     s_prob = 0
#     for char_prob in char_probs
#         s_prob += Math.log10(char_prob)
#     end
#     B.append s_prob
# end

# B.map!{|p| Math.log10(p)}

# puts B.join(' ')
