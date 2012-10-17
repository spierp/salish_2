Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://redistogo:d40f9a0d470957623b7afa2ffce42fce@drum.redistogo.com:9998/', :namespace => 'radiant-tundra-7432.herokuapp.com', :size => 7 }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://redistogo:d40f9a0d470957623b7afa2ffce42fce@drum.redistogo.com:9998/', :namespace => 'radiant-tundra-7432.herokuapp.com', :size => 1 }
end