module BikeContainer

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
  end

end
