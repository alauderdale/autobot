class DriversController < ApplicationController
  def index
    @drivers = Driver.order()
  end

  def show
    @driver = Driver.find(params[:id])
    @car = Car.new
    @cars = Car.order()
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
    #If save succeeds return to list action
      flash[:notice] = "Page created."
      redirect_to(:action => 'show', :id => @driver.id)
    #if form fails, redisplay form so user can fix problems
    else
      render('new')
    end
  end

  def add_driver_car
    @car = Car.new(params[:car])
    if @car.save
    #If save succeeds return to list action
      flash[:notice] = "Car added."
      redirect_to :back
    #if form fails, redisplay form so user can fix problems
    else
      redirect_to(:action => 'show')
    end
  end


  def edit
    @driver = Driver.find(params[:id])
  end
  
  def update
    # Find object using form parameters
    @driver = Driver.find(params[:id])
    # Update the object
    if @driver.update_attributes(params[:driver])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Driver updated."
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end


  def delete
    @driver = Driver.find(params[:id])
  end

  def destroy
    Driver.find(params[:id]).destroy
    flash[:notice] = "Driver destroyed."
    redirect_to(:action => 'index')
  end

end
