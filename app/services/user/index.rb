class User
  class Index < ::ApplicationService::Base
    def initialize(params = {})
      @current_user = params[:current_user]
      @query        = params[:query]
    end

    def call
      users.map do |user|
        {
          id:               user.id,
          nickname:         user.nickname,
          name:             user.name,
          phone:            user.phone,
          email:            user.email,
          avatar_file_name: user.avatar_file_name,
          avatar_url:       user.avatar_url
        }
      end
    end

    private

    SEARCH_COLUMNS = %i[nickname first_name last_name email].freeze
    SEARCH_COUNT   = 10

    attr_reader :current_user, :query

    def users
      UserDecorator.decorate_collection(User.search(query, current_user, SEARCH_COLUMNS).limit(SEARCH_COUNT))
    end
  end
end
