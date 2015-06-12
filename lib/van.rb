require_relative 'bike_container'
require_relative 'bike'

class Van
  include BikeContainer

  def initialize capacity = DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
    @location = :garage
  end

  attr_accessor :location

  def load bike
    add_bike bike
  end

  def drive_to_garage
    @location = :garage
  end

  def drive_to_dock
    @location = :dock
  end

  def put_bike_in_dock
    unload
  end

  def unload_working_bike
    fail 'No working bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def unload_broken_bike
    fail 'No broken bikes available' if broken_bikes.empty?
    bikes.delete working_bikes.pop
  end

  private

  def working_bikes
    bikes.reject {|bike| bike.broken?}
  end

  def broken_bikes
    bikes.reject {|bike| bike.working?}
  end

end