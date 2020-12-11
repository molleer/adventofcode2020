input = File.read("input.txt").split("\n").map{|i| i.chars}
newInput = input.map(&:dup)
change = false

def neighbour_in_dir(input, i, j, dirI, dirJ)
  if i >= input.length() || i < 0 || j >= input[0].length() || j < 0
    return false
  end

  if input[i][j] == "."
    return neighbour_in_dir input, i+dirI, j+dirJ, dirI, dirJ
  else
    return input[i][j] == "#"
  end
end

def count_negibours(input, i, j)
  count = 0
  for ii in -1..1 do
    for jj in -1..1 do
      next if ii == 0 && jj == 0
      count += (neighbour_in_dir(input, i+ii, j+jj, ii, jj) ? 1 : 0)
    end
  end
  return count
end

loop do
  change = false
  for i in 0..input.length()-1
    for j in 0..input[i].length()-1
      neighbours = count_negibours input, i, j
      if input[i][j] == "L" && neighbours == 0
        change = true
        newInput[i][j] = "#"
      elsif input[i][j] == "#" && neighbours >= 5
        change = true
        newInput[i][j] = "L"
      end
    end
  end
  input = newInput.map(&:dup)
  break if !change
end

count = 0
for i in 0..input.length()-1
  for j in 0..input[i].length()-1
    if input[i][j] == "#"
      count += 1
    end
  end
end

puts count