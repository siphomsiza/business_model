FactoryGirl.define do
  factory :appointment do
    association(:company)
    association(:employee)
    start_time {Faker::Time.backward(14, :evening)}
    end_time {Faker::Time.forward(23, :morning)}
    description {Faker::Company.bs}
    info {Faker::Lorem.sentence(3)}

    factory :invalid_appointment do
      description nil
    end
  end

end
