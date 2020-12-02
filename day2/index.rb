
def isValid(line)
  count = 0
  parts = line.split(" ")
  bound = parts[0].split("-")
  parts[1].chomp! ":"

  parts[2].each_char{ |c|
    if c == parts[1]
      count+=1
    end
  }

  return count >= bound[0].to_i && count <= bound[1].to_i
end

def isValid2(line)
  parts = line.split(" ")
  indexes = parts[0].split("-")
  parts[1].chomp! ":"

  return (parts[2][indexes[0].to_i-1] == parts[1]) ^ (parts[2][indexes[1].to_i-1] == parts[1])
end

count = 0
for line in File.read("input.txt").split("\n") do
  if isValid2 line
    count+=1
  end
end

puts count