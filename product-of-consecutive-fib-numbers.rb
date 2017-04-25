# The Fibonacci numbers are the numbers in the following integer sequence (Fn):

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...
# such as

# F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.
# Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying

# F(n) * F(n+1) = prod.
# Your function productFib takes an integer (prod) and returns an array:

def productFib(prod)

  num = 0
  fib = [0,1]

  until num >= prod
    fib << (fib[-1] + fib[-2])
    last_two = [fib[-1], fib[-2]]
    num = last_two.inject(:*)
  end
  
  return [fib[-2], fib[-1], num == prod]
  
end