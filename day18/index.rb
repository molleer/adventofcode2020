input = File.read("input.txt").split("\n")
OPERATORS = ["+", "*"]

def apply(op, n1, n2)
  case op
    when "+"
      return n1 + n2
    when "*"
      return n1 * n2
  end
  puts "Failed to evaluate: " + op
  return -1
end

def infixToPostfix(infix)
  opStack = []
  postFix = []
  for i in infix do
    if i.is_number?
      postFix.unshift i
    elsif i == ")"
      while opStack.length() != 0 && opStack[0] != "("
        postFix.unshift opStack.pop
      end
      opStack.pop
    else

    end
  end
end

