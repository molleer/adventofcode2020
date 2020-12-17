input = [[File.read("input.txt").split("\n").map{|i| i.chars.map{|j| j == "#" }}]]
# input[z][y][x]

def is_active(pocket, x,y,z,w)
    return false if w >= pocket.length() || w < 0
    return false if z >= pocket[w].length() || z < 0
    return false if y >= pocket[w][z].length() || y < 0
    return false if x >= pocket[w][z][y].length() || x < 0  
    return false if pocket[w][z][y][x] == nil
    return pocket[w][z][y][x]
end

def set_value(pocket, value, x,y,z,w)
    pocket[w] = [] if pocket[w] == nil
    pocket[w][z] = [] if pocket[w][z] == nil
    pocket[w][z][y] = [] if pocket[w][z][y] == nil
    pocket[w][z][y][x] = value
end

def count_neighbours(pocket,x,y,z,w)
    count = 0
    for i in -1..1
        for j in -1..1
            for k in -1..1
                for l in -1..1
                    next if i == 0 && j == 0 && k == 0 && l == 0
                    count += 1 if is_active(pocket, x + i, y + j, z + k, w + l)
                end
            end
        end
    end
    return count
end

def new_cycle(pocket)
    newPocket = []
    wLen = pocket.length()
    zLen = pocket[0].length()
    yLen = pocket[0][0].length()
    xLen = pocket[0][0][0].length()

    for w in 0..wLen+1
        for x in 0..xLen+1
            for y in 0..yLen+1
                for z in 0..zLen+1
                    n = count_neighbours(pocket, x - 1, y-1, z - 1, w-1)
                    if is_active(pocket, x - 1, y-1, z - 1, w-1)
                        set_value(newPocket, n == 2 || n == 3 ,x,y,z,w)
                    else
                        set_value(newPocket, n == 3 ,x,y,z,w)
                    end
                end
            end
        end
    end
    return newPocket
end

def print_state4D(pocket)
    wIndex = -pocket.length()/2
    for w in 0..pocket.length()-1
        wIndex += 1
        puts "w=" + wIndex.to_s
        print_state3D pocket[w]
    end
end

def print_state3D(pocket)
    zIndex = -pocket.length()/2
    for z in pocket
        zIndex += 1
        puts "z=" + zIndex.to_s
        
        for y in z
            for x in y
                print "# " if x
                print ". " if !x
            end
            puts ""
        end
        puts ""
    end
end

def count_cubes(pocket)
    count = 0
    for a in pocket
        for b in a
            for c in b
                for d in c  
                  count += 1 if d
                end
            end
        end
    end
    return count
end

for i in 1..6
    input = new_cycle(input)
end

puts count_cubes input