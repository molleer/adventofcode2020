input = "389125467".chars.map(&:to_i)

def pick_up(cups, i)
  ans = []
  i += 1
  for j in 0..2
    i = i % cups.length()
    ans.push(cups.delete_at(i))
  end
  return ans
end

def insert_cups(cups, newCups, i)
  for j in 0..newCups.length()-1
    cups.insert(i + j + 1, newCups[j])
  end
end

def nextCup(cups, i, n, oldN)
  len = cups.length()
  max = cups.max
  n = (max + n - 1) % max + 1
  k = (len + i + 1) % len

  #return nextCup(cups, i, n-1, oldN) if n == oldN
  puts "k: " + k.to_s
  puts "n: " + n.to_s

  while k != i
    return k if cups[k] == n
    k = (k + 1) % len
  end
  return nextCup(cups, i, n-1, oldN)
end

i = 7
cup = nil
oldCup = nil
len = input.length()
for k in 1..2
  puts "Move: " + k.to_s 
  puts "I: " + i.to_s
  puts input.to_s
  puts "---"
  
  el = input[i]
  picked = pick_up(input, i)
  cup = nextCup(input, i - (i+3 >= len ? (i+3) % len -1 : 0), el-1, oldCup)
  oldCup = input[cup]
  insert_cups(input, picked, cup)

  while input[i] != el
    input.delete_at(0)
    input.unshift(input.pop)
  end

  i = (i+1) % len
end