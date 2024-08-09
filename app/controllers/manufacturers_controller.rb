class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.where(is_archived: false)
  end

  def archived
    @manufacturers = Manufacturer.where(is_archived: true)
  end
  
  def show
    @manufacturer = Manufacturer.find_by(id: params[:id], is_archived: params[:show_archived] == 'true')
  
    if @manufacturer
      @cars = @manufacturer.cars
    else
      flash[:alert] = "Manufacturer not found."
      redirect_to manufacturers_path
    end
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
  
  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def archive
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(is_archived: true)
      flash[:notice] = 'Manufacturer archived successfully'
    else
      flash[:alert] = 'Error archiving manufacturer'
    end
    redirect_to manufacturers_path
  end

  def unarchive
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer.is_archived
      @manufacturer.update(is_archived: false)
      redirect_to manufacturers_path, notice: 'Manufacturer has been unarchived'
    else
      redirect_to manufacturers_path, alert: 'Manufacturer is not archived, nothing to do'
    end
  end
  
  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :email, :is_archived)
    end
end