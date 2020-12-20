#arr = ["a", "b", "c"]
#while arr.length() != 0
#  tmp = arr.pop
#  arr.unshift tmp if "b" != tmp
#  puts tmp
#end
#return 

class Tile
private
  def eq(a, b)
    for i in 0..a.length()-1
      return false if a[i] != b[i]
    end
    return true
  end

  def oneWayEq(a, b)
    return false if a == nil || b == nil
    return false if a.length() != b.length()

    return eq(a, b) || eq(a, b.reverse)
  end

  def matchAny(tile)
    pxs = tile.getPixels()
    for myEdge in [@pixels[0], @pixels[-1], @pixels.map{|p| p[0]}, @pixels.map{|p| p[-1]}] do
      for yourEdge in [pxs[0], pxs[-1], pxs.map{|p| p[0]}, pxs.map{|p| p[-1]}] do
        return true if oneWayEq(myEdge, yourEdge)
      end
    end
    return false
  end
protected
  def getPixels()
    return @pixels
  end
  
  def addNeighbour(newNeighbour)
    @neighbours.push(newNeighbour)
  end
public
  def initialize(tileInput)
    inp = tileInput.split("\n")
    @id = inp[0].split(" ")[1][0..-2].to_i
    @pixels = inp[1..-1].map{|i| i.split("")}
    @neighbours = []
    @lastKnownTile = nil
    @cornerCall = false
  end

  def insertNeighbour(tile)
    return false if tile.getId() == @lastKnownTile
    @lastKnownTile = tile.getId()
    found = false
    for n in  @neighbours
      found = true if n.insertNeighbour(tile)
    end
    if matchAny(tile)
      #puts tile.getId()
      tile.addNeighbour(self)
      @neighbours.push(tile)
      return true
    end
    return found
  end

  def reset()
    return if @lastKnownTile == nil
    @lastKnownTile = nil
    @neighbours.each{|n| n.reset()}
  end

  def getId()
    return @id
  end

  def getCorners()
    return [] if @cornerCall == true
    @cornerCall = true
    corners = []
    for i in @neighbours
      tmp = i.getCorners()
      tmp.each{|c| corners.push(c)}
    end
    corners.push(self) if @neighbours.length() == 2
    return corners
  end
end

input = File.read("input.txt").split("\n\n")
tiles = []
for i in input do
  tiles.push(Tile.new(i))
end

tile = tiles.pop
while tiles.length() != 0
  tmp = tiles.pop
  tiles.unshift tmp if !tile.insertNeighbour(tmp)
  tile.reset()
end

mul = 1
tile.getCorners().each{|t| mul *= t.getId()}
puts mul