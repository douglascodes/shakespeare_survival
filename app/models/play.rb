# == Schema Information
#
# Table name: plays
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  subtitle    :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Play < ActiveRecord::Base
  attr_accessible :description, :name, :subtitle
end
