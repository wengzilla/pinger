class Destination < ActiveRecord::Base
  def ping
    Rails.logger.info "NOW PINGING: #{url}"
    begin
      response = HTTParty.get(url)
      if response.success?
        update_attributes(:last_ping => Time.now)
      end
    rescue Errno::ECONNREFUSED => e
      Rails.logger.info "ERROR: #{e} - #{url}"
    end
  end
end