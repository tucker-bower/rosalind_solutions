#!/usr/bin/ruby

nk_file = 'rosalind_lia.txt'
nk = File.readlines(nk_file)[0].split(' ')
k = nk[0].to_i
n = nk[1].to_i

individuals = 2**k

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

prob = 0

for i in n..individuals
    prob += binomial(individuals, i) * 0.25 ** i * 0.75 ** (individuals - i)
end

## Find all unique values within individuals
