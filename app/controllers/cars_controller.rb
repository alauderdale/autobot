class CarsController < ApplicationController
  def index
    @cars = Car.order()
  end


  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
    #If save succeeds return to list action
      flash[:notice] = "Car created."
      redirect_to(:action => 'index')
    #if form fails, redisplay form so user can fix problems
    else
      render('new')
    end
  end


  def delete
    @car = Car.find(params[:id])
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:notice] = "Car destroyed."
    redirect_to(:action => 'index')
  end

end
