class PingBot < ActiveRecord::Base
  def self.run
    Destination.all.each do |destination|
      response = HTTParty.get(destination.url)
      if response.success?
        destination.update_attributes(:last_ping => Time.now)
      end
    end
  end
end