# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
require "faker"
Company.delete_all
Employee.delete_all
Role.delete_all
Appointment.delete_all

company_1 = Company.create!(company_name: "Business Modelling Company")
company_2 = Company.create!(company_name: "Sample Company")

#create roles Admin and normal User
admin_role = Role.create!(role: "Admin User")
user_role = Role.create!(role: "Normal User")


#create Admin for first company_1
admin1 = Employee.new(first_name: "admin" ,surname: "business",username: "admin@businessmodelling.com",email: "admin@businessmodelling.com")
admin1.password = "password"
admin1.password_confirmation = "password"
# admin1.skip_confirmation!
admin1.company = company_1
admin1.save!
admin1.roles << admin_role


#create normal user or employee for first company_1
user1 = Employee.new(first_name: "Normal" ,surname: "Usermodell ",username: "normaluser@businessmodelling.com",email: "normaluser@businessmodelling.com")
user1.password = "password"
user1.password_confirmation = "password"
# user1.skip_confirmation!
user1.company = company_1
user1.save!
user1.roles << user_role


#create Admin for second company_2
admin2 = Employee.new(first_name: "Admin2" ,surname: "Admin2model",username: "admin2@businessmodelling.com",email: "admin2@businessmodelling.com")
admin2.password = "password"
admin2.password_confirmation = "password"

# admin2.skip_confirmation!
admin2.company = company_2
admin2.save!
admin2.roles << admin_role

#create normal user or employee for second company_2
user2 = Employee.new(first_name: "Normaluser2" ,surname: "Model",username: "normaluser2@businessmodelling.com",email: "normaluser2@businessmodelling.com")
user2.password = "password"
user2.password_confirmation = "password"
# user2.skip_confirmation!
user2.company = company_2
user2.save!
user2.roles << user_role

#creates appointments for  Admin1
counter = 0
10.times do
  counter =+ 2
  start_time = Faker::Time.forward(23, :morning)#Faker::Time.between(counter.days.ago, Time.now, :morning)
  end_time =  Faker::Time.backward(14, :evening)

  Appointment.create!(employee: admin1 ,company: admin1.company,description: Faker::Commerce.department ,info:  Faker::Lorem.sentence(20),start_time: start_time,end_time: end_time)
  Appointment.create!(employee: user1 ,company: user1.company,description: Faker::Commerce.department ,info:  Faker::Lorem.sentence(20),start_time: start_time,end_time: end_time)
  Appointment.create!(employee: admin2 ,company: admin2.company,description: Faker::Commerce.department ,info:  Faker::Lorem.sentence(20),start_time: start_time,end_time: end_time)
  Appointment.create!(employee: user2 ,company: user2.company,description: Faker::Commerce.department ,info:  Faker::Lorem.sentence(20),start_time: start_time,end_time: end_time)
end
