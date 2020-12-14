require 'enumerator'
input = File.read("input.txt").split("\n")

class Mask1
  def initialize(line)
    line = line[7..7+43]
    @or =  line.chars.map{|i| i == "1" ? "1" : "0"}.join("").to_i(2)
    @and = line.chars.map{|i| i == "0" ? "0" : "1"}.join("").to_i(2)
    @x = line.chars.map{|x,i| x == "X" ? i : -1}.reject{|i| i != -1}
  end

  def apply_to_value(num)
    return (num | @or) & @and
  end

  def apply_to_address(address)
    ans = []
    
  end
end

def silver(input)
  mask = nil
  mem = []
  
  for i in input do
    if i.include? "mask"
      mask = Mask1.new(i)
    else
      index = i.split("]")[0].split("[")[1].to_i
      value = i.split("= ")[1].to_i
      mem[index] = mask.apply_to_value(value)
    end
  end
  
  sum = 0
  for i in mem
    next if i == nil
    sum += i
  end
  return sum
end

class Mask

  def initialize(line)
    line = line[7..44]
    @or =  line.chars.map{|i| i == "1" ? "1" : "0"}.join("").to_i(2)
    @x = line.chars.enum_for(:each_with_index).map{|x,i| x == "X" ? 35 - i : -1}.reject{|i| i == -1}
  end

  def apply(addr, xes)
    return [addr] if xes.length() <= 0
    addrs = self.apply(addr, xes[1..xes.length()-1])
    ans =  []
    for a in addrs 
      ans.push(a | 1 << xes[0])
      ans.push(a & (0xFFFFFFFFF ^ (1 << xes[0])))
    end
    return ans.uniq
  end

  def apply_to_address(address)
    return self.apply(address | @or, @x)
  end
end

def gold(input)
  mask = nil
  mem = Hash.new
  
  for i in input do
    if i.include? "mask"
      mask = Mask.new(i)
    else
      indexes = mask.apply_to_address(i.split("]")[0].split("[")[1].to_i)
      value = i.split("= ")[1].to_i
      for index in indexes do
        mem[index] = value
      end
    end
  end
  
  sum = 0
  mem.each do |_, v|
    sum += v
  end
  return sum
end

puts gold input