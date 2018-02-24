class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1 if self.empty?
    return 2 if self == [[]]
    hash_array = self.dup

    hash_array.each_with_index do |el, i|
      hash_array[i] = i ^ el
    end

    hash_array.reduce(:*)
  end
end

class String
  def hash
    sum = 0

    self.each_char.with_index do |el, i|
      a = el.ord
      sum += a ^ i
    end

    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0

    self.each do |key, v|
      sum += (key.to_s.ord + v.ord).hash
    end

    sum
  end
end
