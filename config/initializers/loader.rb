Rails.application.config.autoload_paths += Dir[Rails.root.join('app', 'queries', '**/')]
Rails.application.config.autoload_paths += [Rails.root.join('lib', 'seeds_helper.rb')]
