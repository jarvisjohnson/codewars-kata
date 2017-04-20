# You have to build a Xbonacci function that takes a signature of X elements - and remember each next element is the sum of the last X elements - and returns the first n elements of the so seeded sequence.

def Xbonacci(s,n)
  
  #init empty array
  final = []

  # Insert initial 's' numbers
  s.each do |i|
    break if n < 1
    final << i;
    n -= 1
  end
  
  # Add last s.count numbers to next
  while n > 0
    next_int = final[-1]
    for i in ((-s.count)..-2)
      next_int += final[i]
    end
    #each s.count
    final << next_int
    n -=1
  end
  
  return final
  
end