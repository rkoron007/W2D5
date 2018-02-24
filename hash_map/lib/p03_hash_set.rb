require_relative 'p02_hashing'
# require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    key = key.hash

    unless include?(key)
      resize! if @count == num_buckets

      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    key = key.hash
    self[key].include?(key)
  end

  def remove(key)
    key = key.hash
    self[key].delete(key)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |el|
        new_array[el % new_array.length] << el
      end
    end

    @store = new_array
  end
end
