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
    if @company.save
      params[:company][:offices_attributes].each do |indexk, val|
        val[:offices].each do |floor|
         
          if floor != ""
          Office.create(company_id: @company.id, building_id: val[:id], floor: floor)
          end
          end 
       end 
    end 
    redirect_to company_path(@company)
  end

  def edit

  end

  def update

  end

  private

  def company_params
    params.require(:company).permit(:name)
  end 

  def get_company
    @company = Company.find(params[:id])
  end

end