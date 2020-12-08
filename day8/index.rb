require_relative 'instruction'
input = File.read("input.txt").split("\n")

def next_execution(ins, i, acc, has_switched)
  if i >= ins.length()
    return true, acc
  elsif ins[i].visited
    return false, acc
  end
  return execute(ins, i, acc, has_switched)
end

def execute(ins, i, acc, has_switched)
  ins[i].set_visited(true)
  case ins[i].code
    when "nop"
      exited, newAcc = next_execution(ins, i+1, acc, has_switched)
      if exited || has_switched
        return exited, newAcc
      else
        return next_execution(ins, i+ins[i].value, acc, true)
      end
    when "jmp"
      exited, newAcc = next_execution(ins, i+ins[i].value, acc, has_switched)
      if exited || has_switched
        return exited, newAcc
      else
        return next_execution(ins, i+1, acc, true)
      end
    when "acc"
      acc += ins[i].value
      return next_execution(ins, i+1, acc, has_switched)
  end
end

instructions = input.map{|i| Instruction.new(i)}
puts execute instructions, 0, 0, false
