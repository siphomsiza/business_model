FactoryGirl.define do
  factory :role do
    role "Normal User"
    factory :admin_role do
      role "Admin User"
    end
  end

end
