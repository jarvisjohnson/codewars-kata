# You get an array of arrays.
# If you sort the arrays by their length, you will see, that their length-values are consecutive.
# But one array is missing!


# You have to write a method, that return the length of the missing array.


def getLengthOfMissingArray(array_of_arrays)
  return 0 if array_of_arrays.nil? || array_of_arrays.empty?
  array_of_arrays.each {|i| return 0 if i.nil? || i.empty? }
  l = array_of_arrays.map{ |i| i.size }.sort
  c = (l.min..l.max).to_a
  (c - l).pop
end