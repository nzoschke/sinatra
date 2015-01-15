require "redis"
require "sequel"

RedisClient = Redis.new(:url => ENV["REDIS_URL"])
QueueTable = Sequel.connect(ENV["POSTGRES_URL"])[:queue]

loop do
  list, text = RedisClient.blpop("queue", :timeout => 5)

  if list == "queue"
    p [:text, text]
    QueueTable.insert :text => text, :created_at => DateTime.now
  end
end
