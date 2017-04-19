# Task

# You are the Head of the Department and your responsibilities include creating monthly schedules for your employees.

# Your employees work in shifts. Each shift is 24 hours. Employment policy prohibits employee from working more than 24 hours in a row, so one employee cannot have two consecutive shifts.

# There must be n people at work each day. Arrange employees over the schedule so that their workload is equal or differs from others minimally (i. e. difference between any two employees must not exceed one shift).

# If it is not possible to ensure one employee does not work two days in a row due to insufficient staff, return None/null/nil.

# Arguments

# Array of employee names as strings. Example: ['Smith", 'Jones', 'Gonzalez', 'White', 'Jackon', 'Taylor'].
# Month and year in 'MMYYYY' format.
# Number of employees per shift.
# Output

# Array of arrays, each representing a day in the given month. Each day array contains three employee names.

def schedule(employees, month, n)

  # Return nil if schedule can't be complete
  return nil if ((n*2) > employees.length)

  # Find days in the month
  m = month.slice(0..1)
  y = month.slice(2..5)
  d_in_m = Date.new(y.to_i, m.to_i, -1).day
  
  #Create Shifts
  i = 0
  shifts = []
  fresh = employees
  until i == d_in_m
    shift = fresh.take(n)
    shifts << shift
    fresh = fresh - shift
    if fresh.length < n
      fresh = employees
    end    
    i +=1
  end
  
  return shifts
  
end