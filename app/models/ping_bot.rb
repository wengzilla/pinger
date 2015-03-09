class PingBot < ActiveRecord::Base
  def self.run
    Destination.all.each { |destination| destination.ping }
  end
end