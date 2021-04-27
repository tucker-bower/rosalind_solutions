#!/usr/bin/ruby

#See scratch paper and diagram for rough notes on 
#calculating probability trees

#hr = probability of distinct homo_recessive event

K = 26.0
M = 18.0
N = 16.0
#Yes, I just hard-coded the data instead of reading
#in the file. Sue me
n = K + M + N

hr1 = (M / n) * ((M - 1) / (n - 1)) * 0.25
hr2 = (M / n) * (N / (n - 1)) * 0.5
hr3 = (N / n) * (M / (n - 1)) * 0.5
hr4 = (N / n)* ((N - 1) / (n - 1)) * 1

prob_recessive_phenotype = (hr1 + hr2 + hr3 + hr4)
prob_dominant_phenotype = 1 - prob_recessive_phenotype

puts(prob_dominant_phenotype)
