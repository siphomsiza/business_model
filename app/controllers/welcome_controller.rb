class WelcomeController < ApplicationController
  def index
    params[:q]||={:s => "firstname asc"}
    if current_employee.has_role?("Admin User")
      @appointments = current_employee.company.appointments
    else
      @appointments = current_employee.appointments
      redirect_to company_my_appointments_path(current_employee.company)
    end
    @q =  @appointments.search(params[:q])
    @appointments = @q.result.page(params[:page]).limit(params[:per_page]||10)
  end
end
