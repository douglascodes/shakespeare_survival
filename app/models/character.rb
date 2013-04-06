# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  gender       :string(255)
#  ever_married :boolean
#  dies         :boolean
#  murderer     :boolean
#  ruler        :boolean
#  aka          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Character < ActiveRecord::Base
  attr_accessible :aka, :dies, :ever_married, :first_name, :gender, :last_name, :murderer, :ruler

  validates(:first_name, presence: true, length: {maximum: 50})
  validates(:gender, presence: true)
end
