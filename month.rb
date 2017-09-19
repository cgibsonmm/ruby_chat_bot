class Calender
  attr_reader :days

  def ititalize
    @time = Time.now
    @days =Time.days_in_month 
  end
end