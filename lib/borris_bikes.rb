require_relative 'Bikes'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike
  def initialize()
    @station = []
  end
  def release_bike
    fail "Oops, there are no bikes here" if empty?
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
    @station.count >= DEFAULT_CAPACITY
  end
  def empty?
    @station.empty?
  end
end
