require 'spec_helper'
require 'shared/rest_controller'

describe AppointmentsController do
  include Devise::TestHelpers
  context "CRUD actions" do
    before(:each) do
      company = create(:company)
      user = create(:employee)
      user.company = company
      role = create(:admin_role)
      user.roles << role
      sign_in(user)

      @params = {:format => :json, :company_id => company.id }
      @subject = create(:appointment, :company_id => company.id)
      @built_subject = build(:appointment, :company => company)
      @invalid_subject = build(:invalid_appointment, :company => company)
      @index = user.appointments
      @attributes = @subject.attributes
      @attributes["description"] = nil
      @object_title_method = "description"
    end
    it_behaves_like "REST controller"
  end
end
