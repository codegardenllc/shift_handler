module Admin
  class EmployeesController < AdminController
    expose(:employees) { organization.employees }

    expose(:employee)

    def index
    end

    def show
    end

    def new
    end

    def create
      employee.attributes = employee_params

      if employee.save
        redirect_to admin_employee_path(employee), notice: 'Employee added'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if employee.update_without_password(employee_params)
        redirect_to admin_employees_path, notice: 'Employee updated'
      else
        render :edit
      end
    end

    def destroy
      employee.destroy
      redirect_to admin_employees_path, notice: 'Employee deleted'
    end

    private

    def employee_params
      params.require(:employee).permit(:name, :email, :password, :admin)
    end
  end
end