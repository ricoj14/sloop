require 'rails_helper'

RSpec.describe TopPick, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:venue) }

    it { should belong_to(:user) }

    it { should belong_to(:dish) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
