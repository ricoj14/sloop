require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:top_picks) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
