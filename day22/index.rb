input = File.read("input.txt").split("\n")
p1 = []
p2 = []

i = 1
while input[i] != ""
  p1.push(input[i].to_i)
  i += 1
end

p2 = input[i+2..-1].map{|n| n.to_i}

while p1.length() > 0 && p2.length() > 0
  c1 = p1.delete_at(0)
  c2 = p2.delete_at(0)
  if c1 > c2
    p1.push(c1)
    p1.push(c2)
  else
    p2.push(c2)
    p2.push(c1)
  end
end

win = p1.length() != 0 ? p1 : p2
len = win.length()
sum = 0
for w in win
  sum += w * len
  len -= 1
end

puts sum