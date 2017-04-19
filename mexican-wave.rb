# In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.

def wave(str)

  arr = []
  (str.length).times do
    arr.push(str)
  end
  
  final = []
  arr.each_with_index do |value, index|
    this = value.split('')
    next if this[index] == ' '
    this[index].upcase!
    final << this.join
  end
  
  final
  
end