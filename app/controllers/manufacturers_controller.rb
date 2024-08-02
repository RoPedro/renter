class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    @manufacturer.name = params[:manufacturer][:name]
    @manufacturer.email = params[:manufacturer][:email]
    @manufacturer.is_archived = "false" 

    if @manufacturer.save
      redirect_to manufacturers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :email, :is_archived)
    end
end
