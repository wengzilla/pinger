class PingBot < ActiveRecord::Base
  def self.run
    Destination.all.each do |destination|
      Rails.logger.info "NOW PINGING: #{destination.url}"
      begin
        response = HTTParty.get(destination.url)
        if response.success?
          destination.update_attributes(:last_ping => Time.now)
        end
      rescue Errno::ECONNREFUSED => e
        Rails.logger.info "ERROR: #{e} - #{destination.url}"
      end
    end
  end
end