input = File.read("input.txt").split("\n").map{|i| i.to_i}
input.push(0)
input = input.sort
input.push(input[input.length()-1] + 3)

class Adapter
  def initialize(value)
    @value = value
    @variants = 0
  end

  def get_value()
    return @value
  end

  def get_variants()
    return @variants
  end

  def add_variants(var)
    @variants += var
  end
end

input = input.map{|i| Adapter.new(i)}

def silver(input)
  one = 0
  three = 0
  
  for i in 1..input.length()-1 do
    diff = input[i] - input[i-1]
    case diff
    when 1
      one += 1
    when 3
      three += 1
    end
  end
  return one * three
end

def variants(input, i)
  if i < 0
    return
  end
  for k in i+1..input.length()-1 do
    if input[k].get_value() - input[i].get_value() > 3
      break
    else
      input[i].add_variants(input[k].get_variants())
    end
  end

  variants(input, i-1)
end

input[input.length()-1].add_variants(1)
variants(input, input.length()-1)
puts input[0].get_variants()