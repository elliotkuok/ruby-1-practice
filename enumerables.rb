class Array
    # Write an `Array#my_all?(&prc)` method. This method should return true if
    # every element in the array satisfies the block, otherwise return false.
    # **Do NOT use `Array#all?` in your implementation.**
    
    # Examples: 
    # `[1,2,3].my_all? { |n| n.even? }` => false
    # `[2,4,6].my_all? { |n| n.even? }` => true
  
    def my_all?(&prc)
      self.each {|ele| return false if !prc.call(ele)}
      true
    end
  end
  
  class Array
    # Define a method `Array#my_select(&prc)` that correctly returns an array of 
    # selected elements according to the block. **Do NOT use the built-in 
    # `Array#select` or `Array#reject` in your implementation.**
  
    def my_select(&prc)
      arr = []
      self.each {|ele| arr << ele if prc.call(ele)}
      arr
    end  
  end
  
  class Array
    # Write an `Array#my_each(&prc)` method that calls a proc on each element.
    # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
    # `Array#map` methods in your implementation.**
  
    def my_each(&prc)
      i = 0
  
      while i < self.length
        prc.call(self[i])
        i+=1
      end
      self
    end
  end
  
  class Hash
    # Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair.
    # **Do NOT use the built-in `Hash#each`, `Hash#map`, `Hash#each_with_index` 
    # methods in your implementation.**
  
    def my_each(&prc)
      i = 0
  
      while i < self.length
        prc.call(keys[i], self[keys[i]])
        i+=1
      end
      self
    end
  end
  
  class Array
    # Write an `Array#my_any?(&prc)` method. This method should return true if any
    # of the Array elements satisfy the block, otherwise it should return false.
  
    # Examples: 
    # `[1,2,3].my_any? { |n| n.even? }` => true
    # `[1,3,5].my_any? { |n| n.even? }` => false
  
    def my_any?(&prc)
      self.each {|ele| return true if prc.call(ele)}
      false
    end
  end
  
  class Array
    # Write an `Array#my_reject(&prc)` method. This method should return a new 
    # array excluding all the elements in the original array that satisfy the proc.
    # **Do NOT use the built-in `Array#reject` or `Array#select` methods in your 
    # implementation.**
    
    # Example: `[1,2,3].my_reject {|n| n.even?}` => [1,3]
  
    def my_reject(&prc)
      arr = []
      self.each {|ele| arr << ele if !prc.call(ele)}
      arr
    end
  end
  
  class Array
    # Write an `Array#my_inject` method. If my_inject receives no argument, then
    # use the first element of the array as the default accumulator.
    # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
    # implementation.**
  
    def my_inject(accumulator = nil, &prc)
      if accumulator.nil?
        accumulator = self.first
        self[1..-1].each do |ele|
          accumulator = prc.call(accumulator, ele)
        end
      else
        self.each do |ele|
          accumulator = prc.call(accumulator, ele)
        end
      end
      accumulator
    end
  end
  
  class Array
    # Write an `Array#my_each_with_index(&prc)` method that calls a proc on each 
    # element with its index. **Do NOT use the built-in `Array#each`, `Array#map` 
    # or `Array#each_with_index` methods in your implementation.**
  
    def my_each_with_index(&prc)
      i = 0
  
      while i < self.length
        prc.call(self[i], i)
        i+=1
      end
      self
    end
  end
  
  