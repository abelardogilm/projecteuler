require 'prime'

def find_result(list)
  start, *others = list
  others.each do |value|
    if others.include? value + value - start
      p [start, value, value + value - start].join
    end
  end
end

results = []
primes = Prime.take_while{|prim| prim < 9999}
              .select{|x| x>1000}
primes.each do |prime|
  permutations = prime.to_s.split('').permutation.to_a.map{|x| x.join.to_i}.sort.uniq
  permutations.keep_if{|x| Prime.prime? x }.keep_if{|x| x > 1000 }
  next if permutations.count < 3
  results << permutations
end
results.uniq.each do |permutations|
  aux = permutations
  while aux.count >= 3 do
    find_result(aux)
    aux = aux[1..-1]
  end
end
