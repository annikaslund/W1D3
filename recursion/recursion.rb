def range(start, end_n)
  if end_n <= start
    []
  else
    range(start, end_n-1) << end_n-1
  end
end

def array_sum(arr)
  return 0 if arr.empty?
  arr.shift + array_sum(arr)
end

def array_sum_it(arr)
  arr.reduce(:+)
end

def expo_one(b, n)
  return 1 if n == 0
  b * expo_one(b, n-1)
end

def expo_two(b, n)
  return 1 if n == 0
  if n.even?
    expo_two(b, n / 2) ** 2
  else
    b * (expo_two(b, (n - 1) / 2) ** 2)
  end
end

class Array
  def deep_dup
    new_arr = []

    self.each do |el|
      new_arr << (el.is_a?(Array) ? el.deep_dup : el)
    end

    new_arr
  end
end

def fibonacci(n)
  return [] if n == 0
  return [1] if n == 1
  return [1, 1] if n == 2
  fibs = fibonacci(n - 1)
  fibs << fibs[-2] + fibs[-1]
end

def fibonacci_it(n)
  return [] if n == 0
  return [0] if n == 1

  fibs = [0, 1]

  while fibs.count < n
    fibs << fibs[-2] + fibs[-1]
  end

  fibs
end
