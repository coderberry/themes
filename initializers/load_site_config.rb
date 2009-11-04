raw_config = File.read(RAILS_ROOT + "/config/site_config.yml")
SITE_CONFIG = YAML.load(raw_config).symbolize_keys
