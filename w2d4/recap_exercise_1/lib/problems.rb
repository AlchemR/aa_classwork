require "byebug"
# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(wordsarr)
vowels = "aeiou"
output = []
wordsarr.each_with_index do |word1, idx1|
tempvowels = vowels.split("")
#remove vowels, subtract through tempvowels
    word1.each_char do |letter|
        if tempvowels.include?(letter)
            idx0 = tempvowels.index(letter)
            tempvowels.delete_at(idx0)
        end
    end
#iterate through next word
    wordsarr.each_with_index do |word2, idx2|
        if idx2 > idx1 == true
        tempvowels2 = tempvowels.map {|map| map}
                word2.each_char do |letter2|
                    #remove vowels, subtract from tempvowels
                    if tempvowels2.include?(letter2)
                    idx00 = tempvowels2.index(letter2)
                    tempvowels2.delete_at(idx00)
                    end
                end
                    if tempvowels2 == []
                        output << (word1 + " " + word2)
                    end
        end
    end
end
return output
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |indi|
        
        if num % indi == 0
            return true
        end
    end
return false
end



# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
bigrams2 = bigrams.select {|pair| str.include?(pair)}
end


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= (prc = Proc.new{|k,v| v == k })
        
        neww = {}
       self.each_pair do  |k1, v1| 
            if prc.call(k1,v1) == true
                neww[k1] = v1
            end
        end
    return neww    
    end
end

#   hash_1 = {x: 7, y: 1, z: 8}
# p hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    
# hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
# p hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
# p hash_2.my_select                            # => {4=>4}


class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]

    def substrings(length = nil)
    substr = []
    self.each_char.each_with_index do |letter1, idx1|
        substr << self[idx1]
        self.each_char.each_with_index do |letter2, idx2|
            if idx2 > idx1
            substr << self[idx1..idx2]
            end                
        end
     end
if length != nil
return substr.select! {|ele| ele.length == length.to_i}     
else
    return substr 
end

    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
alpha = "abcdefghijklmnopqrstuvwxyz"
neww = ""
self.each_char do |letter|
    
shift = alpha.index(letter) + 1
shift = (shift + num - 1) % 26
neww += alpha[shift]
end
return neww
end

end
