ENV["REDISTOGO_URL"] = 'redis://redistogo:d40f9a0d470957623b7afa2ffce42fce@drum.redistogo.com:9998/'

uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)