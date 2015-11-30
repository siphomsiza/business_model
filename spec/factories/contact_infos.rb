FactoryGirl.define do
  factory :contact_info do
    association(:employee)
    email {Faker::Internet.email}
    mobile_number {Faker::PhoneNumber.cell_phone}
    work_number {Faker::PhoneNumber.cell_phone}
  end

end
