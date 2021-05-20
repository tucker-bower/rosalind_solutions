#!/usr/bin/ruby
# rubocop:disable IndentationWidth
nm_file = 'rosalind_fibd.txt'

nm_file = 'rosalind_fibd.txt'
nm = File.readlines(nm_file)[0]
nandm = nm.split
# could split on whitespace to one liner get these values
nm_re = nm.match /([0-9]+)\s([0-9]+)/

N = nm_re.captures[0].to_i # Number of months to simulate for
M = nm_re.captures[1].to_i # Rabbit life-expectancy (months)

# A rabbit does not reproduce on the first month it is alive
# Note that "Rabbit" in this code really refers to a pair of rabbits in the explanation of the problem from Rosalind

hare_hash ={}
for i in 0..M
    hare_hash[i] = 0
end

hare_hash[1] = 1

for month in 1..N-1
    new_hare_hash = {}
    babies = 0
    for age in 1..M
        new_hare_hash[age] = hare_hash [age - 1]
    end
    for age in 2..M
        babies += hare_hash[age]
    end
    new_hare_hash[1] = babies
    hare_hash = new_hare_hash
end

end_rabbits = 0
for n in 1 .. M
    end_rabbits += hare_hash[n]
end

print end_rabbits

######## PREVIOUS SOLUTION THAT WORKS BUT RAN IN EXPONENTIAL TIME #####
# puts "Simulating rabbit reproduction for #{N} months"
# puts "Month#    Rabbit#"
# rabbits = [1]
# for month in 2..N
#     new_rabbits =[]
#     rabbits.map! { |r| if r > 1; new_rabbits.append 1; end; r +=1 }
#     new_rabbits.map { |r| rabbits.append r}
#     rabbits.delete_if{|r| r > M}
#     puts "#{month}    #{rabbits.length}"
# end

# print rabbits.length
