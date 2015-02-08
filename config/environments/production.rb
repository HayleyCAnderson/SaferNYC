Rails.application.configure do
  client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                             username: ENV["MEMCACHIER_USERNAME"],
                             password: ENV["MEMCACHIER_PASSWORD"],
                             failover: true,
                             socket_timeout: 1.5,
                             socket_failure_delay: 0.2,
                             value_max_bytes: 10485760)
  config.action_dispatch.rack_cache = {
    metastore: client,
    entitystore: client
  }

  config.action_controller.asset_host = "d3173k17p29e1o.cloudfront.net"
  config.action_controller.perform_caching = true
  config.active_record.dump_schema_after_migration = false
  config.active_support.deprecation = :notify
  config.assets.compile = true
  config.assets.compress = true
  config.assets.css_compressor = :sass
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :info
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=2592000"
end
