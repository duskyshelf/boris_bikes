require_relative 'bike_container'

class Van
  include BikeContainer

  def initialize capacity = DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
    @location = :garage
  end

  attr_accessor :location

  def unload bike
    remove_bike
  end

  def load bike
    add_bike bike
  end

  def drive_to_garage
    @location = :garage
  end

  def drive_to_dock
    @location = :dock
  end

end