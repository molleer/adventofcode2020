values = File.read("input.txt").split
width = values[0].length()

oneOne = 0
threeOne = 0
fiveOne = 0
sevenOne = 0
oneTwo = 0

0.upto(values.length()-1) do |i|
  if values[i][i % width] == "#"
    oneOne += 1
  end
  if values[i][(i*3) % width] == "#"
    threeOne += 1
  end
  if values[i][(i*5) % width] == "#"
    fiveOne += 1
  end
  if values[i][(i*7) % width] == "#"
    sevenOne += 1
  end
end

0.upto(values.length()/2) do |i|
  if values[i*2][i % width] == "#"
    oneTwo += 1
  end
end

puts oneOne*threeOne*fiveOne*sevenOne*oneTwo