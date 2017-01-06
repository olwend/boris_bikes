class Bike
  #def working?
  #  true
  #end
  attr_reader :working
  
  def initialize
    @working = true
  end
  
  def report_broken
    @working = false
  end
end
