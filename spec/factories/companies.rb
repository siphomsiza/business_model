FactoryGirl.define do
  factory :company do
    company_name {Faker::Lorem.sentence(3)}

    factory :invalid_company do
      company_name nil
    end
  end
end
