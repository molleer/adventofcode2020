class Instruction
  def initialize(line)
      split = line.split(" ")
      @code = split[0]
      @value = split[1].to_i
      @visited = false
  end

  def code
      @code
  end

  def value
      @value
  end

  def visited
      @visited
  end

  def set_visited(val)
      @visited = val
  end
end