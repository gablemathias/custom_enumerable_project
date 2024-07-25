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
