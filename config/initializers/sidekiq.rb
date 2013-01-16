Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://redistogo:7374996ddbb15ef97fd5f67ac87ad475@chubb.redistogo.com:9069/', :namespace => 'salish.herokuapp.com', :size => 7 }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://redistogo:7374996ddbb15ef97fd5f67ac87ad475@chubb.redistogo.com:9069/', :namespace => 'salish.herokuapp.com', :size => 1 }
end

