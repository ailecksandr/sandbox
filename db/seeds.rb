require 'seeds_helper'

Dir.glob("#{Rails.root}/db/seeds/*.rb") do |seed_file|
  load(seed_file)
end
