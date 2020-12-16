input = File.read("input.txt").split("\n")
ids = input[1].split(",").map{|i| i == "x" ? nil : i.to_i}

n = 1
a = []
b = []
x = 0

for i in 0..ids.length()-1
    next if ids[i] == nil
    n*= ids[i]
end

for i in 0..ids.length()-1
    next if ids[i] == nil
    x += (ids[i]-i)*(((n/ids[i]) ** (ids[i]-2)) % ids[i])*(n/ids[i])
end


puts x % n