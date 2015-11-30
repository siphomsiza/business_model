FactoryGirl.define do
  factory :employee do
    email {Faker::Internet.email()}
    username {Faker::Internet.email()}

    before(:create) do |user|
      pass = Faker::Lorem.words(8)
      user.password = pass
      user.password_confirmation = pass
    end
    association(:company)
  end
end
