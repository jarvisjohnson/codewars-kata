# Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

def persistence(n)

  counter = 1
  
  return 0 if n.to_s.length < 2

  multiplied = n.to_s.chars.map(&:to_i).inject(:*)
  
  until multiplied.to_s.length < 2
    multiplied = multiplied.to_s.chars.map(&:to_i).inject(:*)
    counter += 1
  end
  
  return counter
  
end