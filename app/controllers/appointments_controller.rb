class AppointmentsController < ApplicationController
  load_and_authorize_resource :company
  load_and_authorize_resource :appointment, :through => :company


  # GET /appointments
  # GET /appointments.json
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

  def my_appointments
    params[:q]||={:s => "firstname asc"}
    @appointments = current_employee.appointments
    @q =  @appointments.search(params[:q])
    @appointments = @q.result.page(params[:page]).limit(params[:per_page]||10)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = @company.appointments.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = @company.appointments.new(appointment_params)
    @appointment.employee = current_employee

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to company_appointment_path(@company,@appointment), notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: [@company,@appointment] }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to company_appointment_path(@company,@appointment), notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@company,@appointment]}
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to company_appointments_path(@company), notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:description, :start_time,:end_time, :info)
  end
end
