require_relative 'Bikes'

class DockingStation
  attr_reader :bike
  def initialize()
    @station = []
  end
  def release_bike
    fail "Oops, there are no bikes here" if @station.empty?
    @station[0]
    @station.pop
  end
  def dock(bike)
    fail "Station full" if full?
    @station << bike
    bike
  end

  private
  def full?
    true if @station.count > 19
  end
end
