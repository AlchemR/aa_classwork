arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

def sluggish(arr)

  arr.each_with_index do |ele1,idx1|
    longest = ""
    arr.each_with_index do |ele2,idx2|
      if idx2 > idx1
        if ele2.length > ele1.length && ele2 > longest
          longest = ele2
        elsif ele1.length > ele2.length && ele1.length > longest 
          longest = ele1
        end
      end
    end
  end
  return longest
end

def better
max = ""
arr.each_with_index |ele, idx|
ele = max if ele.length > max.length
end
return max
end

def merge_sort
return arr if arr.length <= 1
mid = arr.length / 2
left = [0...mid].merge_sort
right = [mid..-1].merge_sort
Array.merge(left,right)
end

def merge
  output = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      output << left.shift
    else
      output << right.shift
    end
  end
  return output
end


