Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

Rails.application.config.assets.precompile << %w[*.png *.jpg *.jpeg *.gif]
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

CONTROLLER_NAMES = %w[
  devise/sessions
  registrations
  home
].freeze

CONTROLLER_NAMES.each do |controller_name|
  %i[css sass scss js coffee].each do |format|
    Rails.application.config.assets.precompile << "controllers/#{controller_name}.#{format}"
  end
end

### ACTION-BASED ASSETS

# STYLESHEETS

Rails.application.config.assets.precompile << %w[
  dialogs/index.sass
]

# SCRIPTS

Rails.application.config.assets.precompile << %w[
  dialogs/index.js
]
