module Littlenoah

class FeverSchedule
  attr_reader :periods
  
  def initialize(wday)
    @wday = wday
    @periods = FeverSchedule::schedules[wday]
  end

  def next_period_from_now()
    next_period_from(Time.now.hour)
  end

  def next_period_from(time)
    @periods.find {|n| time <= n}
  end

  def self.today
    self.new(Time.now.wday)
  end

  def self.sunday
    self.new(0)
  end
  def self.monday
    self.new(1)
  end
  def self.tuesday
    self.new(2)
  end
  def self.wednesday
    self.new(3)
  end
  def self.thursday
    self.new(4)
  end
  def self.friday
    self.new(5)
  end
  def self.saturday
    self.new(6)
  end

private
  def self.schedules
    pat1 = [8,16,21]
    pat2 = [13,18,22]
    pat3 = [12,20,23]
    pat4 = [10,18,22]
    [
      pat1, # sun
      pat2, # mon
      pat3, # tue
      pat2, # wed
      pat3, # thu
      pat2, # fri
      pat4  # sat
    ]
  end

end
end
