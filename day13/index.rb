input = File.read("input.txt").split("\n")
time = input[0].to_i
ids = input[1].split(",").map{|i| i == "x" ? nil : i.to_i}

def soonest_departure(time, id)
  mod = time % id
  return mod != 0 ? id - mod : mod
end

def departs_in_line(time, ids)
  for i in 0..ids.length()-1
    next if ids[i] == nil
    if soonest_departure(time, ids[i]) != i
      return false
    end
  end
  return true
end

time = time + soonest_departure(time, ids[0])

while !departs_in_line(time, ids)
  time += ids[0]
  puts time
end

puts time

#puts soonest_departure(1068781, 7)
#puts departs_in_line(3417, [17,13,19])
#puts departs_in_line(1068781, [7,13,59,31,19])