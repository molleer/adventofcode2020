input = File.read("input.txt")
def number_of_yes(group)
  yes = group.gsub("\n","").chars.uniq
  return yes.length()
end

def all_yes(group)
  group = group.split("\n").map{|i| i.chars}
  yes = group[0]
  for i in 1..group.length()-1 do
    yes = yes.reject{|c| !group[i].include? c}
  end
  return yes.length()
end

sum = 0
for i in input.split("\n\n") do
  #sum += number_of_yes(i)
  sum += all_yes i
end

puts sum
