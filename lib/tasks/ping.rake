desc "pings URLs in database"
task :ping_all  => :environment do
  PingBot.run
end
