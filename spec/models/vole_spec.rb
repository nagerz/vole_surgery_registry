require "rails_helper"

RSpec.describe Vole, type: :model do

  describe "relationships" do
    it {should belong_to :cage}
    it {should have_many :experiment_voles}
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it {should validate_presence_of :animal_id}
      it {should validate_uniqueness_of :animal_id}
      it {should validate_presence_of :sex}
      it {should validate_presence_of :dob}
    end
  end

  describe 'Class Methods' do
    before :each do
    end
  end

end
