sum = 0
for value in File.read("input.txt").split do
  sum += value.to_i
end

print sum.to_s + "\n"