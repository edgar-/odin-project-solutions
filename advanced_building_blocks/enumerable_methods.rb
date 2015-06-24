module Enumerable
  def my_each
    arr = self    
    arr = *arr if arr.is_a? Range
    arr = arr.to_a if arr.is_a? Hash
    i = 0
    while i < arr.length
        yield(arr[i])
        i += 1
    end
    arr
  end

  def my_each_with_index
    i = 0
    self.each {|e| yield(e, i); i+= 1}
    self
  end

  def my_select
    arr = []
    self.my_each {|e| arr << e if yield(e) }
    arr
  end

  def my_all?
    if block_given?
      self.my_each { |e| return false unless yield(e) }
    else
      self.my_each { |e| return false if e.nil? || e == false }
    end
    true
  end  

  def my_any?
    if block_given?
      self.my_each { |e| return true if yield(e) }
    else
      self.my_each { |e| return true unless e.nil? || e == false }
    end
    false
  end

  def my_none?
    if block_given?
      self.my_each { |e| return false if yield(e) }
    else
      self.my_each { |e| return false unless e.nil? || e == false }
    end
    true
  end

  def my_count(el = nil)
    count = 0
    if block_given?
      self.my_each { |e| count += 1 if yield(e) }
    elsif el.nil? 
      self.my_each { count += 1 }
    else
      self.my_each { |e| count += 1 if e == el }
    end
    count
  end

  def my_map
    arr = []
    self.my_each {|e| arr << yield(e) }
    arr
  end

  def my_inject(accumulator = 0)
    self.my_each {|e| accumulator = yield(accumulator, e)}
    accumulator
  end
  
  #Modified my_map method which takes a proc instead of implicit block
  def my_map1(prc)
    arr = []
    self.my_each {|e| arr << prc.call(e) }
    arr
  end

  #Modified my_map method which takes a proc and/or implicit block
  def my_map(prc=nil)
    return if prc.nil?
    arr = []
    if block_given?
      self.my_each {|e| arr << yield(prc.call(e))}
    else
      self.my_each {|e| arr << prc.call(e) }
    end
    arr
  end
end

def multiply_els(arr)
  arr.my_inject(1) {|product, e| product * e}
end