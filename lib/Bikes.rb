class Bike
  attr_reader :working
  def initialize
    @working = true
  end
  def report_as_broken
    @working = false
  end

  def working?
    @working
  end
end
