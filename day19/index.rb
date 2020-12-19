input = File.read("input.txt").split("\n")
rules = []
messages = []

rulesI = 0
while input[rulesI] != "" && rulesI < input.length()
  rulesI += 1
end

rawRules = input[0..rulesI-1]
messages = input[rulesI+1..-1]
rawRules = rawRules.sort_by{|r| r.split(":")[0].to_i }

for r in rawRules
  col = r =~ /:/
  par = r =~ /"/

  if par
    rules[r.split(":")[0].to_i] = r[par+1]
    next
  end

  rules[r.split(":")[0].to_i] = r[col+1..-1].split(" | ").map{|k| k.split(" ").map(&:to_i)}
end

#rules[8] = [[42],[42,8]]
#rules[11] = [[42,31], [42,11,31]]
c = 0
for r in rules
  puts c.to_s + ": " + r.to_s
  c += 1
end
puts "---"

#def validSegment(segment,rules, message)
#  for n in segment
#    return nil if message == nil || message == ""
#    message = validate(rules[n], rules, message)
#  end
#  return message
#end
#
#def validate(rule, rules, message)
#  return nil if message == nil
#  if rule.is_a? String
#    return message[0] == rule ? message[1..-1] : nil
#  end
#
#  for r in rule do
#    tmp = validSegment(r, rules, message)
#    return tmp if tmp != nil
#  end
#
#  return nil
#end

def validSegment(segment,rules, message)
  ans = []
  msgs = [message]
  for n in segment
    msgs = msgs.reject{|i| i == nil || i == ""}
    return nil if msgs.length() == 0
    tmp = validate(rules[n], rules, msgs.pop())
    next if tmp == nil
    tmp.each{|i| msgs.push(i)}
  end
  return msgs.length() == 0? nil : msgs
end

def validate(rule, rules, message)
  return nil if message == nil
  if rule.is_a? String
    return message[0] == rule ? [message[1..-1]] : nil
  end

  ans = []
  for r in rule do
    tmp = validSegment(r, rules, message)
    next if tmp == nil
    return [""] if tmp.include? ""
    tmp.each{|i| ans.push(i)} if tmp != nil
  end

  return ans
end

#for r in rules
#  puts r.to_s
#end

def rootValidation(rootRule, rules, message)
  msgs = [message]
  while msgs.length() != 0
    tmp = validate(rootRule, rules, msgs.pop())
    next if tmp == nil
    return true if tmp.include? ""
    tmp.each{|i| msgs.push(i)}
  end
  return false
end

count = 0
for m in messages
  count += 1 if rootValidation(rules[0], rules, m)
end

puts count