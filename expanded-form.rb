# You will be given a number and you will need to return it as a string in Expanded Form.

def expanded_form(num)
  num.to_s.chars.map(&:to_i)
  .reverse.map.each_with_index{ |e, i| e * 10 ** i}
  .reverse.reject{|i| i == 0}.join(" + ")
end
