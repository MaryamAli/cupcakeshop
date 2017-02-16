# for 6.12 RAils implementation: setting Redis store to an object
if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new(:host => 'localhost', :port => 6370)
end
