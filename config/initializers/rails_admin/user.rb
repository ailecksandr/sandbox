RailsAdmin.config do |config|
  config.model 'User' do
    navigation_icon 'icon-user'

    object_label_method do
      :nickname
    end

    show do
      field :nickname do
        formatted_value do
          bindings[:object].decorate.nickname
        end
      end

      field :first_name do
        formatted_value do
          bindings[:object].decorate.first_name
        end
      end

      field :last_name do
        formatted_value do
          bindings[:object].decorate.last_name
        end
      end

      field :phone do
        formatted_value do
          bindings[:object].decorate.phone
        end
      end

      include_all_fields
      exclude_fields :profile
    end

    edit do
      field :email do
        required true
      end
      field :password do
        required true
      end
      field :confirmed_at
      field :role do
        required true
      end
      field :profile do
        required true
      end
    end

    list do
      field :id

      field :nickname do
        formatted_value do
          bindings[:object].decorate.nickname
        end
      end

      field :first_name do
        formatted_value do
          bindings[:object].decorate.first_name
        end
      end

      field :last_name do
        formatted_value do
          bindings[:object].decorate.last_name
        end
      end

      field :phone do
        formatted_value do
          bindings[:object].decorate.phone
        end
      end

      field :profile do
        eager_load true
        visible    false
      end

      field :email
      field :role
    end
  end
end