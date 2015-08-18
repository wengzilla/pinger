class PingBot < ActiveRecord::Base
  def self.run
    # if after 9am EST and before 1am EST 
    if Time.now.hour > 13 || Time.now.hour < 5
      Destination.all.each { |destination| destination.ping }
    end
  end
end