input = File.read("input.txt").split("\n").map{|i| i.to_i}
preemble = 25

def can_sum_to(nums, n)
  nums = nums.sort
  i = 0
  j = nums.length()-1
  while(i < j)
    if nums[i] + nums[j] == n
      return true
    elsif nums[i] + nums[j] < n
      i+=1
    else
      j-= 1
    end
  end
  return false
end

def find_range(nums, n)
  i = 0;
  j = 1;
  sum = nums[0] + nums[1]
  while(j < nums.length() && i < j)
    if sum == n
      return [i ,j]
    elsif sum > n
      sum -= nums[i]
      i += 1
    else
      j += 1
      sum += nums[j]
    end
  end
  return []
end

for i in 0..input.length()-preemble
  if !can_sum_to input[i..i+preemble-1], input[i + preemble]
    low, hig = find_range input[0..i+preemble-1], input[i + preemble]
    r = input[low..hig]
    puts r.min + r.max
    return
  end
end
