require "rails_helper"

RSpec.describe Cage, type: :model do

  describe "relationships" do
    it {should have_many :voles}
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it {should validate_presence_of :card_id}
      it {should validate_uniqueness_of :card_id}
      it {should validate_presence_of :cage_id}
      it {should validate_uniqueness_of :cage_id}
      it {should validate_presence_of :species}
      it {should validate_presence_of :type}
    end
  end

  describe 'Class Methods' do
    before :each do
    end
  end

end
