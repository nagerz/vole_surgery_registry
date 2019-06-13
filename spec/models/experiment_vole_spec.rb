require "rails_helper"

RSpec.describe ExperimentVole, type: :model do

  describe "relationships" do
    it {should belong_to :vole}
    it {should belong_to :experiment}
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
    end
  end

  describe 'Class Methods' do
    before :each do
    end
  end

end
