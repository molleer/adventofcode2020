input = File.read("input.txt").split("\n")
p1 = []
p2 = []

i = 1
while input[i] != ""
  p1.push(input[i].to_i)
  i += 1
end

p2 = input[i+2..-1].map{|n| n.to_i}

class ListPair
  def initialize()
    @left = nil
    @right = nil
  end
end

def game(p1 , p2)
  rounds = []
  while p1.length() > 0 && p2.length() > 0
    if rounds.include? [p1, p2]
      c1 = p1.delete_at(0)
      c2 = p2.delete_at(0)

      if c1 > c2
        p1.push(c1)
        p1.push(c2)
      else
        p1.push(c2)
        p1.push(c1)
      end
      next
    end
    rounds.push([p1[0..-1], p2[0..-1]])
    c1 = p1.delete_at(0)
    c2 = p2.delete_at(0)

    if c1 <= p1.length() && c2 <= p2.length()
      res = game(p1[0..c1-1], p2[0..c2-1])
      if res[1] == []
        p1.push(c1)
        p1.push(c2)
      else
        p2.push(c2)
        p2.push(c1)
      end
      next
    end

    if c1 > c2
      p1.push(c1)
      p1.push(c2)
    else
      p2.push(c2)
      p2.push(c1)
    end
  end
  return [p1, p2]
end

res = game(p1, p2)
win = res[0].length() != 0 ? res[0] : res[1]
len = win.length()
sum = 0
for w in win
  sum += w * len
  len -= 1
end

puts sum