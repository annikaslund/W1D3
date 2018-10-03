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
