class DriversController < ApplicationController
  def index
    @drivers = Driver.order()
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
    #If save succeeds return to list action
      flash[:notice] = "Page created."
      redirect_to(:action => 'index')
    #if form fails, redisplay form so user can fix problems
    else
      render('new')
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
