require "byebug"
class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**
  
  # NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
  # We will not give you points if you visit every element in the array every 
  # time you search.

  # For example, given the array [1, 2, 3, 4], you should NOT be checking
  # 1 first, then 2, then 3, then 4.
  def my_bsearch(target)
    return nil if self.empty?
    mid = self.length / 2
    if self[mid] == target
      return mid  
    elsif self[mid] < target
      i = self[mid + 1..-1].my_bsearch(target)
      i.nil? ? nil : mid + 1 + i
    else
      self[0...mid].my_bsearch(target)
    end
  end
end

class Array
  # Define a method `Array#quick_sort` that implements the quick sort method. 
  # The method should be able to accept a block. **Do NOT use the built-in
  # `Array#sort` or `Array#sort_by` methods in your implementation.**

  def my_quick_sort(&prc)
    prc ||= proc {|a, b| a<=>b}
    return self if size < 2

    pivot = first
    left = self[1..-1].select{|el| prc.call(el, pivot) == -1}
    right = self[1..-1].select{|el| prc.call(el, pivot) != -1}
    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end  
end

# Write a method that takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).
# **Do NOT use `Array#sort` or `Array#sort_by`.**

# Example:
# `jumble_sort("hello")` => "ehllo"
# `jumble_sort("hello", ['o', 'l', 'h', 'e'])` => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet = ("a".."z").to_a if alphabet.nil?
  new_str = ""
    
  alphabet.each do |char|
      if str.include?(char)
        new_str << char * str.count(char)
      end
  end
  new_str
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use `Array#sort` or `Array#sort_by` in your implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if self.length <= 1
    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    while left.length > 0 && right.length > 0
      if prc.call(left.first, right.first) >= 0
        merged << right.shift
      else 
        merged << left.shift
      end
    end
    merged + left + right
  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in `Array#sort` or `Array#sort_by` methods in 
  # your implementation. 
  
  def bubble_sort(&prc)
    sorted_arr = self.dup # Create a duplicate of the array to avoid modifying the original array
    prc ||= proc { |a, b| a <=> b } # Use the provided block or a default comparison block

    sorted = false
    while !sorted
      sorted = true
      (0...sorted_arr.length - 1).each do |i|
        if prc.call(sorted_arr[i], sorted_arr[i + 1]) > 0
          sorted_arr[i], sorted_arr[i + 1] = sorted_arr[i + 1], sorted_arr[i]
          sorted = false
        end
      end
    end

    sorted_arr
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    prc ||= proc { |a, b| a <=> b } # Use the provided block or a default comparison block

    sorted = false
    while !sorted
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) > 0
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end
end

