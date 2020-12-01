values = File.read("input.txt").split
found = false

for i in  0..(values.length()-1)
  for j in (i+1)..(values.length()-1)
    for k in (j+1)..(values.length()-1)
      if values[i].to_i + values[j].to_i + values[k].to_i == 2020
        puts (values[i].to_i * values[j].to_i * values[k].to_i).to_s
        return
      end
    end
  end
end
