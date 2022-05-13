require "byebug"

class Array

  def my_uniq
    output = []
    self.each do |ele|
    output << ele if !output.include?(ele)
    end
    return output
  end



def two_sum
  result = []
  (0...self.length).each do |i|
    (0...self.length).each do |j|
      if j > i && self[i] + self[j] == 0
      result << [i,j]
      end
    end
  end
  result
end

def my_transpose
output = []

(0...self.length).map do |i|
  self.map {|sub| sub[i]}
end
end

def stock_picker
  max_val = 0
  max_idx = []
  (0...self.length).each do |i|
    (0...self.length).each do |j|
      if j > i && (self[j] - self[i]) > max_val
        max_val, max_idx = self[j] - self[i], [i, j]
      end

    end
  end
  max_idx
end
end #arrayend