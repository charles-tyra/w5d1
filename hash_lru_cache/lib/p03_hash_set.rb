class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key] << key
      @count += 1
      resize! if count >= num_buckets
    end
  end

  def include?(key)
    self[key].any?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times { @store << Array.new }
    @store.each_with_index do |arr, i|
      arr.each do |ele|
        @store[i].delete(ele)
        self[ele] << ele
      end
    end
  end
end
