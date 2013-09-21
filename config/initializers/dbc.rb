env_config = YAML.load_file(Rails.root.join('config', 'dbc.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end