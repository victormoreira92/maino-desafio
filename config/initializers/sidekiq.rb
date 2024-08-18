Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.strict_args!(false)

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end
