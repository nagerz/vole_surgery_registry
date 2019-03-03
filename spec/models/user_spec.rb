require "rails_helper"

RSpec.describe User, type: :model do

  before :each do
  end

  describe "relationships" do
    it {should have_many :experiments}
  end

  describe 'Validations' do
    describe 'Required Field(s)' do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:email)}
      it {should validate_uniqueness_of(:email)}
      it {should validate_presence_of(:password)}
    end
  end

  describe 'Roles' do
    it "can be created as an admin" do
      user = User.create(name: "admin",
                         password: "test",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
      expect(user.researcher?).to eq(false)
    end

    it "can be created as a researcher" do
      user = User.create(name: "protter",
                         password: "test",
                         role: 0)

      expect(user.role).to eq("researcher")
      expect(user.researcher?).to be_truthy
      expect(user.admin?).to eq(false)
    end
  end


  describe 'Class Methods' do
    before :each do
    end
  end

end
