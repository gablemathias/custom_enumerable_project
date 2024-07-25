module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    if block_given?
      index = 0
      self.my_each do |v|
        block.call(v, index)
        index += 1
      end
    end
    return self
  end

  def my_select
    if block_given?
      new_obj = []
      self.my_each do |v|
        new_obj << v if yield(v)
      end
      return new_obj
    end
  end

  def my_all?
    if block_given?
      self.my_each { |v| return false unless yield(v) }
        
      return true
    end
  end

  def my_any?
    if block_given?
      self.my_each { |v| return true if yield(v) }
    
      return false
    end
  end

  def my_none?
    if block_given?
      self.my_each { |v| return false if yield(v)}

      return true
    end
  end

  def my_count(target = nil)
    counter = 0
    if block_given?
      self.my_each { |v| counter += 1 if yield(v) }
      return counter 
    end
    
    unless target.nil?
      self.my_each { |v| counter += 1 if v == target }
      return counter 
    end
    
    self.length
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each 
    if block_given?
      for value in self
        yield(value)
      end

      return self
    end
  end
end
