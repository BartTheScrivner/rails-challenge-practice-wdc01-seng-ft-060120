class CompaniesController < ApplicationController

  before_action :get_company, only: [:show, :edit, :update]

  def index
    @companies = Company.all
  end

  def show

  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.offices.build(company_params)
  end

  def edit

  end

  def update

  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      offices_attributes: [
        :building_id,
        :company_id,
        :floor
      ]
    )
  end 

  def get_company
    @company = Company.find(params[:id])
  end

end