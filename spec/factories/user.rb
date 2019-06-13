FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user_#{n}@email.com" }
    sequence(:password) { "test" }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:location) { |n| "Location #{n}" }
    sequence(:state) { |n| "State #{n}" }
    role { 0 }
    active { true }
  end
  factory :inactive_user, parent: :user do
    sequence(:name) { |n| "Inactive User Name #{n}" }
    sequence(:email) { |n| "inactive_user_#{n}@email.com" }
    active { false }
  end
  factory :admin, parent: :user do
    sequence(:email) { |n| "admin_#{n}@gmail.com" }
    sequence(:name) { |n| "Admin Name #{n}" }
    role { 1 }
    active { true }
  end
end
