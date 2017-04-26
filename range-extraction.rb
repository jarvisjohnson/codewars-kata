# A format for expressing an ordered list of integers is to use a comma separated list of either

# individual integers
# or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'. The range includes all integers in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example ("12, 13, 15-17")
# Complete the solution so that it takes a list of integers in increasing order and returns a correctly formatted string in the range format.

def solution(array)
  array = array.compact.uniq.sort
  ranges = []
  if !array.empty?
    left, right = array.first, nil
    array.each do |obj|
      if right && obj != right.succ
        ranges << Range.new(left,right)
        left = obj
      end
      right = obj
    end
    ranges << Range.new(left,right)
  end
  final = []
  ranges.each do |range|
    count = range.map.count
    if count == 1
      range = range.first.to_s
    elsif count == 2
      range = range.first.to_s + ',' + range.last.to_s
    else
      range = range.first.to_s + '-' + range.last.to_s 
    end
    final << range
  end
  final.join(",")
end