require_relative 'Bikes'

class DockingStation
  attr_reader :bike
  def initialize()
    @station = []
  end
  def release_bike
    if @station.empty?
      raise "Oops, there are no bikes here"
    else
      @station[0]
      @station.pop
    end
  end
  def dock(bike)
    if @station.count < 20
       @station.push(bike)
      "Bike docked"
    else
      raise "Station full"
    end
  end
end
