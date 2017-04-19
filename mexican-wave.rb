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