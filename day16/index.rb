input = File.read("input.txt").split("\n")
class Field
    def initialize(line)
        @name = line.split(":")[0]
        @ranges = line.split(":")[1].split(" or ").map{|i|[i.split("-")[0].to_i,i.split("-")[1].to_i] }
    end

    def is_valid(n)
        for i in @ranges
            if i[0] <= n && n <= i[1]
                return true
            end
        end
        return false
    end

    def get_ranges()
        return @ranges
    end

    def get_name()
        return @name
    end
end

def is_valid(fs, n)
    for f in fs
        if f.is_valid(n)
            return true
        end
    end
    return false
end

fields = []

i = 0
while input[i] != ""
    fields.push(Field.new(input[i]))
    i += 1
end

nearby_tickets = input[i+5..input.length()-1].map{|i| i.split(",").map(&:to_i)}.reject{|ns| ns.reject{|i| is_valid(fields, i)} != []}
my_ticket = input[i+2].split(",").map(&:to_i)
maxI = nearby_tickets[0].length()-1

validFields = []

for k in 0..maxI
    fs = fields.map{|i| i}
    for ns in nearby_tickets
        #for f in names
        #    if f.is_valid(ns[k])
        #        names.push(f.get_name())
        #    end
        #end
        fs = fs.reject{|f| !f.is_valid(ns[k])}
    end
    validFields.push(fs.map(&:get_name))
end

def filter_fields(valid_fields)
    return [] if valid_fields.length() == 0
    name = ""
    for f in valid_fields
        if f.length() == 1
            name = f[0]
            break
        end
    end

    valid_fields = valid_fields.map{|fs| fs.reject{|n| n == name}}.reject{|i| i.length()==0}
    names = filter_fields(valid_fields)
    names.push(name)
    return names
end

puts my_ticket.to_s

mul = 1
fs = filter_fields(validFields).reverse
for k in 0..fs.length()-1
    if fs[k].include? "departure"
        puts k.to_s + ": " + fs[k] + "=" + my_ticket[k].to_s
        mul *= my_ticket[k]
    end
end

puts mul
