class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee was successfully created."
    else
      flash.now[:alert] = "Please fill all required fields correctly."
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee was successfully updated."
    else
       flash.now[:alert] = "Please correct the errors and try again."
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: "Employee was successfully deleted."
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :full_name, :father_name, :employee_number, :national_id, :dob, :gender,
      :grade, :phone, :email, :address, :personal_number, :company_number,
      :assets_details, :department, :job_title, :employment_type, :hire_date,
      :work_location, :manager, :job_status, :blood_group, :employees_service,
      :salary_structure, :payment_method, :bank_name, :bank_account_number, :erp_role
    )
  end
end
