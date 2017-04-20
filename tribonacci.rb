# You need to create a fibonacci function that given a signature array/list, returns the first n elements - signature included of the so seeded sequence.

def tribonacci(signature,n)
  # Init empty array
  final = []
  # for 0..n do
  # push initial values into array
  signature.each do |i|
    break if n < 1
    final << i;
    n -= 1
  end
  
  while n > 0
    final << (final[-1] + final[-2] + final[-3])
    n -=1
  end
  
  return final
  
end