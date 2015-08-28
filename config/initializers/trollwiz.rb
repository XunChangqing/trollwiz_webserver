Rails.application.config.trollwiz = YAML.load_file(Rails.root.join('config', 'trollwiz.yml'))[Rails.env]
