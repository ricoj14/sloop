require 'rails_helper'

RSpec.describe Name, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:venues) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
