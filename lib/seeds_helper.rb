def loaded_images
  Dir.glob("#{Rails.root}/public/seeds/*.{jpg, png, gif}").map { |photo| File.open(photo) }
end

def create_user!(params)
  user = User.new(
    email:    params.fetch(:email, Faker::Internet.email),
    password: params.fetch(:password, '12345678'),
    role:     params.fetch(:role, :user),
    profile_attributes: {
      nickname:   Faker::Internet.user_name(4..16),
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      phone:      Faker::PhoneNumber.cell_phone,
      avatar:     params[:avatar]
    }
  )
  user.skip_confirmation!

  return puts "#{user.role.capitalize} #{user.email} is loaded!".colorize(params.fetch(:color, :green)) if user.save

  puts "#{user.role.capitalize} #{user.email} is not loaded!".colorize(:red)
end
