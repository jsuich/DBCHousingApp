env_config = YAML.load_file(Rails.root.join('config')) # for local development, re-include dbc.yaml after 'config' and put dbc.yaml back into rails directory

env_config.each do |key, value|
  ENV[key] = value
end