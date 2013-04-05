class Character < ActiveRecord::Base
  attr_accessible :aka, :dies, :ever_married, :first_name, :gender, :last_name, :murderer, :ruler
end
