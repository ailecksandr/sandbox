RailsAdmin.config do |config|
  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.parent_controller = 'ApplicationController'
  config.authorize_with do
    raise Pundit::NotAuthorizedError unless current_user.try(:admin?)
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  ADMIN_VISIBLE_SCOPE = %i[User].freeze

  config.actions do
    dashboard # mandatory
    show

    index do
      only ADMIN_VISIBLE_SCOPE
    end # mandatory

    new do
      only ADMIN_VISIBLE_SCOPE
    end

    export do
      only ADMIN_VISIBLE_SCOPE
    end

    bulk_delete do
      only ADMIN_VISIBLE_SCOPE
    end

    edit do
      only ADMIN_VISIBLE_SCOPE
    end

    delete do
      only ADMIN_VISIBLE_SCOPE
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = %w[User Profile]
end
