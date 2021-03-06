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

def bsearch(arr, target)
  sorted_arr = arr.sort
  mid = sorted_arr.length / 2
  count = 0

  return mid if sorted_arr[mid] == target
  if sorted_arr[mid] > target
    bsearch(arr.take(mid), target)
  else
    sub_ans = bsearch(arr.drop(mid + 1), target)
    if sub_ans.nil?
      nil
    else
      sub_ans + (mid + 1)
    end
  end
end

class Array
  def merge_sort
    return self if count < 2
    sorted = self.sort
    mid = self.length / 2

    left, right = sorted.take(mid), sorted.drop(mid)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []

    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end

def permutations(array)
  return [array] if array.length <= 1
  first = array.shift
  perms = permutations(array)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_perms
end
