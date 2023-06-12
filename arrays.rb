#Arrays

def is_prime?(num)
    return false if num < 2
    (2...num).none? {|n| num % n == 0}
  end
  
  def primes(num)
    primes = []
    i = 0
  
    while primes.length < num
      primes << i if is_prime?(i)
      i+=1
    end
  
    primes
  end
  
  # Write a method that returns the factors of a number in ascending order.
  
  def factors(num)
    return nil if num < 0
    (1..num).select {|n| num % n == 0}
  end
  
  class Array
    # Define a method `Array#my_zip(*arrays)` that merges elements from the 
    # receiver with the corresponding elements from each provided argument. You 
    # CANNOT use Ruby's built-in `Array#zip` method
  
    # example => [1,2,3].my_zip([4,5,6], [7,8,9]) 
    # should return => [[1,4,7], [2,5,8], [3,6,9]]
  
    def my_zip(*arrays)
      zipped = []
  
      (0...self.length).each do |i|
        subzipped = [self[i]]
        arrays.each do |array|
          subzipped << array[i]
        end
        zipped << subzipped
      end
  
      zipped
    end
  end
  
  class Array
    # Write an `Array#my_flatten` method that akes a multi-dimentional array and 
    # returns a single array of all the elements.
    #
    # Example: `[1,[2,3], [4,[5]]].my_flatten` => [1,2,3,4,5]
    
    def my_flatten
      flattened = []
  
      self.each do |ele|
        ele.is_a?(Array) ? flattened += ele.my_flatten : flattened << ele
                      # why is it += and not <<
      end
  
      flattened
    end
  
    # Write an `Array#my_controlled_flatten(n)` method that only flattens n levels 
    # of an array. For example, if you have an array with 3 levels of nested 
    # arrays, and run `arr.my_flatten(1)`, you should return an array with 1 
    # level of nested arrays flattened.
    #
    # Example: `[1,[2,3], [4,[5]]].my_controlled_flatten(1)` => [1,2,3,4,[5]]
  
    def my_controlled_flatten(n = nil)
      flattened = []
      
      self.each do |ele|
        if ele.is_a?(Array) && n != 0
          flattened += (n.nil? ? ele.my_controlled_flatten : ele.my_controlled_flatten(n-1))
        else
          flattened << ele
        end
      end
      
      flattened
    end
  end
  
  class Hash
    # Write a `Hash#my_merge(other_hash)` method. This should NOT modify the 
    # original hash and return a combined version of both hashes.
    # **Do NOT use the built-in `Hash#merge` method in your implementation.**
    
    def my_merge(other_hash)
      new_hash = self
      other_hash.each {|k,v| new_hash[k] = v}
      new_hash
    end
  end
  
  class Array
    # Write an `Array#median` method that returns the median element in an array.
    # If the length is even, return the average of the middle two elements.
  
    def median
      return nil if self.empty?
      sorted = self.sort
      idx = length / 2
  
      if length.even?
        (sorted[idx] + sorted[idx-1]) / 2.0
      else
        sorted[idx]
      end
    end
  end
  
  class Array
    # Write an `Array#dups` method that will return a hash containing the indices 
    # of all duplicate elements. The keys are the duplicate elements; the values 
    # are arrays of their indices in ascending order.
    # e.g. [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }
  
    def dups
      dup_idx = Hash.new{|h,k|h[k]=[]}
      self.each_with_index do |ele, i|
        dup_idx[ele] << i if self.count(ele) > 1
      end
      dup_idx
    end
  end
  
  class Array
    # Define a method `Array#my_rotate(positions)` that rotates the elements 
    # correctly based on the argument provided.  The work for positive and 
    # negative integer arguments.  You CANNOT use Ruby's `Array#rotate` or 
    # `Array#rotate!`.
  
    def my_rotate(positions=1)
      rotated = self
      if positions > 0
        (positions).times do
          rotated = rotated.push(rotated.shift)
        end
      else
        (-positions).times do
          rotated = rotated.unshift(rotated.pop)
        end
      end
  
      rotated
    end  
  end
  
  class Array
    # Write an `Array#my_reverse` method that reverses the order in which elements
    # appear within the array. **Do NOT use the built-in `Array#reverse` method
    # in your implementation.**
    
    def my_reverse
      reversed = []
      self.each {|ele| reversed.unshift(ele)}
      reversed
    end
  end
  
  # Write a method that doubles each element in an array. Assume all elements of
  # the array are integers.
  
  def doubler(array)
    array.map {|ele| ele * 2} 
  end
  
  class Array
    # Define a method `Array#two_sum`, that finds all pairs of positions where the 
    # elements at those positions sum to zero. The method should return a nested 
    # array of positions.
  
    # Ordering matters. We want each of the pairs to be sorted smaller index 
    # before bigger index. We want the array of pairs to be sorted "dictionary-wise":
    #   [0, 2] before [1, 2] (smaller first elements come first)
    #   [0, 1] before [0, 2] (then smaller second elements come first)
  
    def two_sum
      pairs = []
      self.each_with_index do |ele1, i1|
        self.each_with_index do |ele2, i2|
          if ele1 + ele2 == 0 && i1 < i2
            pairs << [i1, i2]
          end
        end
      end
      pairs
    end
  end
  
  class Array
    # Write an `Array#my_join` method. If my_join receives no argument, then use
    # an empty string to join the array together.
    # **Do NOT use the built-in `Array#join` method in your implementation.**
    #
    # Examples.
    # `[1,2,3].my_join` => '123'
    # `[1,2,3].my_join('$')` => '1$2$3'
  
    def my_join(separator = "")
      str = ""
      self.each_with_index do |ele,i| 
        string += ele
        string += separator unless i == self.length - 1
      end
      str
    end
  end
  
