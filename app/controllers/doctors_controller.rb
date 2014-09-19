class DoctorsController < ApplicationController

  # GET /orders
  # GET /orders.json
  def index
    @doctors = Doctor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctors  }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doctor }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @doctor = Doctor.new

  end

  # GET /orders/1/edit
  def edit
    @doctor = Doctor.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create

    params[:doctor][:specialisation]= params[:doctor][:specialisation].join(",")
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Appointment was successfully created.' }
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      if @doctor.update_attributes(params[:order])
        format.html { redirect_to @doctor, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :no_content }
    end
  end
end
