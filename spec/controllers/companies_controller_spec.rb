require 'spec_helper'
require 'shared/rest_controller'


describe CompaniesController do
  include Devise::TestHelpers
  context "CRUD actions" do
    before(:each) do
      @subject = create(:company)
      user = create(:employee)
      role = create(:admin_role)
      user.roles << role
      sign_in(user)
      @params = {:format => :json}
      @built_subject = build(:company)
      @invalid_subject = build(:invalid_company)
      @index = Company.all
      @attributes = @subject.attributes
      @attributes["name"] =
      @object_title_method = "company_name"
    end
    it_behaves_like "REST controller"
  end
end
