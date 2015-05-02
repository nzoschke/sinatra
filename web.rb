require "erubis"
require "redis"
require "sequel"
require "sinatra/base"
require "sinatra/reloader"

RedisClient = Redis.new(:url => ENV["REDIS_URL"])
QueueTable = Sequel.connect(ENV["POSTGRES_URL"])[:queue]

class Web < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  set :erb, :escape_html => true

  get "/" do
    erb :index, :locals => { :messages => QueueTable.order(:created_at).all }
  end

  post "/message" do
    RedisClient.lpush "queue", params["text"]
    redirect to("/")
  end

end
