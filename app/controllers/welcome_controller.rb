class WelcomeController < ApplicationController
  def index
    params[:q]||={:s => "firstname asc"}
    if current_employee.has_role?("Admin User")
      @appointments = current_employee.company.appointments
    else
      @appointments = current_employee.appointments
    end
    @q =  @appointments.search(params[:q])
    @appointments = @q.result.page(params[:page]).limit(params[:per_page]||10)

  end
end
