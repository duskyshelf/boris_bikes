require_relative 'bike'
require_relative 'bike_container'


class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No bikes available' if bikes[-1].broken?
    bikes.pop
  end

  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end
end
