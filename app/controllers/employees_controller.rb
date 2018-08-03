class EmployeesController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @company.employees.build(employee_params)
    @company.save
    redirect_to company_path(@company)
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to company_path(params[:company_id])
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
    end
end
