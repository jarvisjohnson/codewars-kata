# We have a square matrix M of dimension n x n that has positive and negative numbers in the ranges [-9,-1] and [0,9],( the value 0 is excluded).

# We want to add up all the products of the elements of the diagonals UP-LEFT to DOWN-BOTTOM, that is the value ofsum1; and the elements of the diagonals UP-RIGHT to LEFT-DOWN and that is sum2. Then, as a final result, the value of sum1 - sum2.

def sum_prod_diags(matrix)

    # turn the input into a Ruby matrix
    require 'matrix'
    m = Matrix[*matrix]
    
    # get the width / height of matrix
    n = m.column(0).count
    
    # create arrays to store values diagonal sums
    d_sum = []
    a_sum = []
    
    ## GET LEFT - RIGHT DIAGONALS
      # get the diagonal and all lower diagonals
      d = m
      i = n
      while i > 0 do
        # multiply the values of the diagonal
        d_sum << d.each(:diagonal).inject(:*)
        d = d.first_minor(0,(i-1))
        i -= 1
      end
      
      # get the upper diagonals
      trans = m.transpose
      y = n - 1
      while y > 0 do
        # multiply the values of the diagonal
        trans = trans.first_minor(0,(y))
        d_sum << trans.each(:diagonal).inject(:*)
        y -= 1
      end
    
    ## GET RIGHT - LEFT DIAGONALS
      # rotate the original nested array 90 degrees
      def rotate(matrix)
        newMatrix, finalMatrix, i = [], [], 0
        (matrix.length > matrix[0].length ? matrix.length : matrix[0].length).times do
            matrix.map { |row| row[i] != nil ? newMatrix << row[i] : nil }
            i+=1
        end
        newMatrix.each_slice(matrix.length).to_a.reverse
      end
      
      l = Matrix[*rotate(matrix)]
      # get the diagonal and all lower diagonals
      d = l
      i = n
      while i > 0 do
        # multiply the values of the diagonal
        a_sum << d.each(:diagonal).inject(:*)
        d = d.first_minor(0,(i-1))
        i -= 1
      end
      
      # get the upper diagonals
      trans = l.transpose
      y = n - 1
      while y > 0 do
        # multiply the values of the diagonal
        trans = trans.first_minor(0,(y))
        a_sum << trans.each(:diagonal).inject(:*)
        y -= 1
      end    


      return d_sum.inject(:+) - a_sum.inject(:+)
      
end