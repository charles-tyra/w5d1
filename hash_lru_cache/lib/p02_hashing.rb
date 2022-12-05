class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_int = 0
    (0...length).each do |i|
      hash_int += self[i].hash * i+1
    end
    hash_int
  end
end

class String
  def hash
    alpha_index = ('a'..'z').to_a + ('A'..'Z').to_a

    hash_int = 0
    (0...length).each do |i|
      hash_int += alpha_index.index(self[i]) / (i+1)
    end
    hash_int
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_int = 0
    self.each do |k, v|
      hash_int += (v.hash * k.hash)
    end
    hash_int
  end
end
