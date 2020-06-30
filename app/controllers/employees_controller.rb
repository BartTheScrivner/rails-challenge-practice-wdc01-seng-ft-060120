class EmployeesController < ApplicationController

    def edit 
        @employee = Employee.find(params[:id])
    end
    
    def update
        @employee = Employee.find(params[:id])
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
    end

    
end
