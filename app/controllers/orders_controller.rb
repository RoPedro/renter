class OrdersController < ApplicationController
  def index
    @orders = Order.joins(rental_car: { car: :manufacturer }, client: []) # Joins multiple tables using hashes
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    
    if @order.save
      @rental_car = @order.rental_car
      @rental_car.rented!
      @rental_car.save # We need to alter the rental status before saving the order

      flash[:success] = "Order successfully created"
      redirect_to @order
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:success] = 'Order was successfully deleted.'
      redirect_to orders_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to orders_path 
    end
  end
  
  def return
    @order = Order.find(params[:id])
    if @order.status == "returned"
      flash[:error] = "Order already returned"
    else
      @order.status = "returned"
      @order.returned_at = Time.now
    end

    if @order.save
      @rental_car = @order.rental_car
      @rental_car.available!
      flash[:success] = "Order successfully returned"
      @rental_car.save
      
      redirect_to orders_path and return
    else
      flash[:error] = "Something went wrong"
      render 'show'
    end
  end 

  private

  def order_params
    params.require(:order).permit(:rental_car_id, :client_id, :status, :return_until)
  end
end
