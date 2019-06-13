require "rails_helper"

RSpec.describe Experiment, type: :model do

  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :experiment_voles}
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it {should validate_presence_of :title}
      it {should validate_uniqueness_of :title}
    end
  end

  describe 'Class Methods' do
    before :each do
    end
  end

end
