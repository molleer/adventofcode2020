spokenNums = []
lastIndex = []
startNumbers = [7,14,0,17,11,1,2]

for i in 0..startNumbers.length()-2
  spokenNums[i] = startNumbers[i]
  lastIndex[startNumbers[i]] = i
end

spokenNums[startNumbers.length()-1] = startNumbers[startNumbers.length()-1]

for i in spokenNums.length()..30000000
  if lastIndex[spokenNums[i-1]] == nil
    spokenNums[i] = 0
  else
    spokenNums[i] = i - 1 - lastIndex[spokenNums[i-1]]
  end
  lastIndex[spokenNums[i-1]] = i-1
end

#puts spokenNums.to_s
puts spokenNums[spokenNums.length()-2]