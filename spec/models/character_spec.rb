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

require "spec_helper"

describe Character do

  before do 
    @char = Character.new(first_name: "Example", last_name: "Character", dies: true, gender: "Male")
  end

  subject { @char }

  it { should respond_to(:first_name,:last_name, :dies, :ever_married, :ruler, :aka, :gender ) }

  it { should be_valid }

  describe "when first_name is not present" do
    before { @char.first_name = "" }

    it { should_not be_valid }

  end

  describe "when gender is not present" do
    before { @char.gender = "" }

    it { should_not be_valid }

  end

  describe "when name is too long" do

    before { @char.first_name = "A" * 51 }
    it { should_not be_valid }

  end



end
