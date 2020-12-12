input = File.read("input.txt").split("\n").map{|i| [i[0], i[1..i.length()-1].to_i]}

def r(deg)
  return deg*Math::PI/180
end

def add(a,b)
  for i in 0..a.length()-1
    a[i] += b[i]
  end
  return a
end

def sub(a,b)
  for i in 0..a.length()-1
    a[i] -= b[i]
  end
  return a
end

def turn(dir, deg, lr)
  case deg
  when 0
    return dir
  when 90
    return [-dir[1]*lr, dir[0]*lr]
  when 180
    return [-dir[0], -dir[1]]
  when 270
    return [dir[1]*lr, -dir[0]*lr]
  end
  puts "Direction unknown: " + deg
  return dir
end

def travel(input)
  wp = [10,1]
  pos = [0,0]
  for i in input do
    case i[0]
    when "N"
      wp[1] += i[1]
    when "S"
      wp[1] -= i[1]
    when "W"
      wp[0] -= i[1]
    when "E"
      wp[0] += i[1]
    when "L"
      wp = turn(wp, i[1], 1)
    when "R"
      wp = turn(wp, i[1], -1)
    when "F"
      pos[0] += wp[0] * i[1]
      pos[1] += wp[1] * i[1]
    end
  end
  return pos
end

#puts travel([["F", 10], ["N", 3], ["F", 7], ["R", 90], ["F", 11]]) == [17, -8]
#puts travel([["F", 10], ["N", 3], ["F", 7], ["R", 90], ["F", 11], ["L", 180], ["F", 8]]) == [17, 0]
#puts travel([["W", 10], ["N", 10], ["E", 10], ["S", 10]]) == [0, 0]
#puts travel([["R", 90], ["F", 10], ["R", 90], ["F", 10], ["R", 90], ["F", 10], ["R", 90], ["F", 10]]) == [0,0]

pos = travel(input)
puts pos[0].abs + pos[1].abs
#pos = travel(input)
#puts pos[0].abs + pos[1].abs