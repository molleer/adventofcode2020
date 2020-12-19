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

def get_reg(rule, rules)
  if rule.is_a? String
    return "(#{rule}{1})"
  end
  return "(" + rule.map{|seg| seg.map{|id| get_reg(rules[id], rules)}.join("")}.join("|") + ")"
end

rules[8] = [[42],[42,8]]
rules[11] = [[42,31], [42,11,31]]
reg = "^" + get_reg(rules[0], rules) + "$"

count = 0
for m in messages
  count +=1 if m.match(reg)
end

puts count