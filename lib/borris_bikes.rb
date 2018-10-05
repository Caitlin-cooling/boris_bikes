require 'pry'
require_relative 'Bikes'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @station = []
    @capacity = capacity
  end
  def release_bike
    bike = Bike.new
    fail "Oops, there are no bikes here" if empty?
    fail "This bike is broken" unless @station.last.working?
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
    @station.count >= capacity
  end
  def empty?
    @station.empty?
  end
end
