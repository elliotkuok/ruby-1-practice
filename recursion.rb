# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
    return 0 if n == 0
    return 1 if n == 1
    1 + fibs_sum(n-1) + fibs_sum(n-2)
  end
  
  # Write a recursive method that returns the sum of the first n even numbers
  # recursively. Assume n > 0.
  
  def first_even_numbers_sum(n)
    return 2 if n == 1
    2 * n + first_even_numbers_sum(n-1)
  
  end
  
  # Write a recursive method `string_include_key?(string, key)` that takes in a 
  # string to search and a key string.  Return true if the string contains all of 
  # the characters in the key in the same order that they appear in the key.
  
  # example_1: string_include_key?("cadbpc", "abc") => true
  # example_2: string_include_key("cba", "abc") => false
  
  def string_include_key?(string, key)
    return true if key.empty?
    return false if string.empty?
    
    if string[0] == key[0]
      string_include_key?(string[1..-1], key[1..-1])
    else
      string_include_key?(string[1..-1], key)
    end
  end
  
  # Write a method that returns b^n recursively. Your solution should accept 
  # negative values for n.
  
  def exponent(b, n)
    return 1 if n == 0
    n > 0 ? b * exponent(b, n-1) : 1.0 / b * exponent(b, n+1)
  end
  
  # Write a recursive method that returns the first "num" factorial numbers in
  # ascending order. Note that the 1st factorial number is 0!, which equals 1.  
  # The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
  
  def factorials_rec(num)
    return [1] if num == 1
  
    facts = factorials_rec(num-1)
    facts << facts.last * (num-1)
    
  end
  
  # Using recursion and the `is_a?` method, write an `Array#deep_dup` method that 
  # will perform a "deep" duplication of the interior arrays.
  
  def deep_dup(arr)
    arr.map {|ele| ele.is_a?(Array) ? deep_dup(ele) : ele}
  end
  
  # Define a method `rec_sum(nums)` that returns the sum of all elements in an 
  # array recursively
  
  def rec_sum(nums)
    return 0 if nums.empty?
  
    nums[0] + rec_sum(nums[1..-1])
  end
  
  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
  # the resulting number. Keep repeating until there is only one digit in the 
  # result, called the "digital root". **Do NOT use the built in `Integer#to_s`
  # or `Integer#digits` methods in your implementation.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.
  
  def digital_root(num)
    num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
  end
  
  