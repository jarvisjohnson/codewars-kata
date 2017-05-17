# We have a square matrix M of dimension n x n that has positive and negative numbers in the ranges [-9,-1] and [0,9],( the value 0 is excluded).

# We want to add up all the products of the elements of the diagonals UP-LEFT to DOWN-BOTTOM, that is the value ofsum1; and the elements of the diagonals UP-RIGHT to LEFT-DOWN and that is sum2. Then, as a final result, the value of sum1 - sum2.

def sum_prod_diags(matrix)

    require 'matrix'
    
    # ability to rotate nested array 90 degrees (for right - to left calc)
    def rotate(matrix)
      newMatrix, finalMatrix, i = [], [], 0
      (matrix.length > matrix[0].length ? matrix.length : matrix[0].length).times do
          matrix.map { |row| row[i] != nil ? newMatrix << row[i] : nil }
          i+=1
      end
      newMatrix.each_slice(matrix.length).to_a.reverse
    end
    
    # get the diagonal and all lower diagonals
    def diags_sum_array(matrix)
      sum = []
      length = matrix.column(0).count
      
      d = matrix
      i = length
      while i > 0 do
        # multiply the values of the diagonal
        sum << d.each(:diagonal).inject(:*)
        d = d.first_minor(0,(i-1))
        i -= 1
      end
      
      # get the upper diagonals
      trans = matrix.transpose
      y = length - 1
      while y > 0 do
        # multiply the values of the diagonal
        trans = trans.first_minor(0,(y))
        sum << trans.each(:diagonal).inject(:*)
        y -= 1
      end
      
      return sum
      
    end

    # run for left to right calc
    d_sum = diags_sum_array(Matrix[*matrix])
    
    # run for right to left calc (using rotate array method)
    a_sum = diags_sum_array(Matrix[*rotate(matrix)])

    # add each result, return the difference in the two
    return d_sum.inject(:+) - a_sum.inject(:+)
    
end