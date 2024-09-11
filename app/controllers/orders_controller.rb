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
    @rental_car = @order.rental_car
    @rental_car.status = "rented"

    if @order.save && @rental_car.save
      flash[:success] = "Order successfully created"
      redirect_to @order
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def return
    @order = Order.find(params[:id])
    @order.status = "returned"
    @order.returned_at = Time.now

    if @order.save
      flash[:success] = "Order successfully returned"
      redirect_to @order
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
