RailsAdmin.config do |config|
  config.model 'Profile' do
    object_label_method do
      :nickname
    end

    edit do
      field :nickname do
        required true
      end

      field :first_name
      field :last_name
      field :phone
      field :avatar
    end
  end
end
