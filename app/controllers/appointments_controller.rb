class AppointmentsController < ApplicationController

 def index
    @appointments = Appointment.all
   respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointments }
    end
  end

  def new
  	@appointment = Appointment.new
  end

  def show
   @appointment = Appointment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to action: "index", notice: 'Record was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  
 

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

end
