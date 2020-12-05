input = File.read("input.txt").split

def binary_boarding(str, separator, max, i, low, high)
  if i >= max - 1
    return str[i] == separator ? low : high
  end
  mid = (low + high)/2
  if str[i] == separator
    return binary_boarding(str, separator, max, i+1, low, mid)
  else
    return binary_boarding(str, separator, max, i+1, mid+1, high)
  end
end

def get_row(str)
  return binary_boarding str, "F", 127, 0, 0, 127
end

def get_col(str)
  return binary_boarding str, "L", 7, 0, 0, 7
end

ids = []
for i in 0..input.length()-1
  id = (get_row input[i][0..6]) * 8 + (get_col input[i][7..9])
  ids.push(id)
end

ids = ids.sort
for i in 1..ids.length()-1
  if ids[i-1] + 2 == ids[i]
    puts ids[i-1]
    puts ids[i]
    return
  end
end
