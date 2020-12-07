require 'ostruct'
input = File.read("input.txt").split("\n")

def push(arr, elements)
  for e in elements do
    arr.push(e)
  end
end

def silver(input)
  input = input.reject{|i| i[0..9] == "shiny gold"}
  bag_with_shiny_gold = []
  newBags = ["shiny gold"]
  upcomingBags = []
  
  while newBags.length() > 0 do
    for i in input do
      for b in newBags do
        if i.include? b
          upcomingBags.push i.split("bags")[0]
          break
        end
      end
    end
  
    input = input.reject{|i| upcomingBags.include? i.split("bags")[0]}
    push(bag_with_shiny_gold, newBags)
    newBags = upcomingBags
    upcomingBags = []
  end
  
  return bag_with_shiny_gold.length() - 1
end

def get_n_bags(input, name)
  line = input.find{|i| i.split(" bags")[0] == name}
  bags = line.split("contain")[1]
  if bags == " no other bags."
    return 0
  end

  nums = bags.split(",").map{|i| i.split(" ")[0].to_i}
  names = bags.split(",").map{|i| 
    words = i.split(" ")
    words[1..words.length()-2].join(" ")
  }
  sum = 0

  for i in 0..nums.length()-1 do
    sum += nums[i] + nums[i] * get_n_bags(input, names[i])
  end
  return sum
end

puts get_n_bags input, "shiny gold"