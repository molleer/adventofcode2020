input = File.read("input.txt").split "\n\n"

def has_fields(passport)
  required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  passport.gsub! "\n", " "
  fields = passport.split(" ").map{|i| i.split(":")[0]}
  for f in required_fields do
    if !fields.include? f
      return false
    end
  end
  return true
end

def four_digits(value, from, to)
  return value.to_i >= from && value.to_i <= to 
end

def valid_height(value)
  l = value.length()
  postfix = value[l-2..l-1]
  prefix = value[0..l-3].to_i
  return (postfix == "in" && prefix >= 59 && prefix <= 76) ||
    (postfix == "cm" && prefix >= 150 && prefix <= 193)
end

def valid_values(passport)
  passport.gsub! "\n", " "
  values = passport.split(" ")
  for i in values do
    val = i.split ":"
    case val[0]
    when "byr" #ok
      if !four_digits val[1], 1920, 2002
        return false
      end
    when "iyr" #ok
      if !four_digits val[1], 2010, 2020
        return false
      end
    when "eyr" #ok
      if !four_digits val[1], 2020, 2030
        return false
      end
    when "hgt" #ok
      if !valid_height val[1]
        return false
      end
    when "hcl" #ok
      if !val[1].match(/#[a-fA-F0-9]{6}/)
        return false
      end
    when "ecl" #ok
      if !["amb","blu", "brn", "gry", "grn", "hzl", "oth"].include? val[1]
        return false
      end
    when "pid" #ok
      if !val[1].match(/[0-9]{9}/) || val[1].length() != 9
        return false
      end
    end
  end
  return true
end

count = 0
for i in input do
  if has_fields(i) && valid_values(i)
    count += 1
  end
end

puts count
