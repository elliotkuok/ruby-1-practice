#String


class String
    # Define a method `String#real_words_in_string(dictionary)` that returns an 
    # array of all the subwords of the string that appear in the dictionary 
    # argument. The method should NOT return any duplicates.
  
    def real_words_in_string(dictionary)
      dictionary.select {|word| self.include?(word)}
    end
  end
  
  # Write a function `anagrams(str1, str2)` that takes in two words and returns a 
  # boolean indicating whether or not the words are anagrams. Anagrams are words 
  # that contain the same characters but not necessarily in the same order. Solve 
  # this without using `Array#sort` or `Array#sort_by`.
  
  def anagrams(str1, str2)
    ana_count(str1) == ana_count(str2)
  end
  
  def ana_count(str)
    counter = Hash.new{0}
    str.each_char {|char| counter[char] += 1}
    counter
  end
  
  # A palindrome is a word or sequence of words that reads the same backwards as
  # forwards. Write a method that returns the length of the longest palindrome in
  # a given string. If there is no palindrome longer than two letters, return false.
  
  def longest_palindrome(string)
    palindromes = []
    (0...string.length).each do |start_idx|
      (0...string.length).each do |end_idx|
        palindrome = string[start_idx..end_idx]
        palindromes << palindrome if palindrome.reverse == palindrome && palindrome.length > 2
      end
    end
    return false if palindromes.empty?
    palindromes.sort_by(&:length).last.length
  end
  
  class String
    # Define a method `String#symmetric_substrings` that returns an array of 
    # substrings that are palindromes.  Only include substrings of length > 1.
  
    # example: "cool".symmetric_substrings => ["oo"]
  
    def symmetric_substrings
      palindromes = []
      (0...self.length).each do |start_idx|
        (0...self.length).each do |end_idx|
          palindrome = self[start_idx..end_idx]
          palindromes << palindrome if palindrome == palindrome.reverse && palindrome.length > 1
        end
      end
      palindromes
    end
  end
  
  # Define a method `titleize(title)` that capitalizes each word in a string like 
  # a book title.  First word in a title should always be capitalized.  Do not 
  # capitalize words like 'a', 'and', 'of', 'over' or 'the'.
  
  def titleize(title)
    words = title.split
    preps = ['a', 'and', 'of', 'over', 'the'] 
    new_title = []
  
    words.each_with_index do |word, i|
      !preps.include?(word) || i == 0 ? new_title << word.capitalize : new_title << word
    end
  
    new_title.join(" ")
  end
  
  