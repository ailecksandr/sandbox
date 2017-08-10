User.delete_all

AVATARS = loaded_images

##### ADMIN #####

create_user!(
  email:  'admin@sandbox.com',
  role:   :admin,
  avatar: AVATARS.sample,
  color:  :yellow
)

####################

##### USER #####

create_user!(
  nickname: 'Typical User',
  email:    'user@sandbox.com',
  avatar:   AVATARS.sample,
  color:    :light_blue
)

####################

##### BLOCKED #####

create_user!(
  nickname: 'Typical Banned',
  email:    'banned@sandbox.com',
  role:     :blocked,
  avatar:   AVATARS.sample,
  color:    :orange
)

####################

##### COMMON USERS #####

(1..10).each do |index|
  create_user!(
    email:    "user_#{index}@sandbox.com",
    avatar:   AVATARS.sample
  )
end

####################
