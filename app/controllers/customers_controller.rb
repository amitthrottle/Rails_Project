require 'date'
require 'time'
class CustomersController < ApplicationController
before_filter :time_check
  
  def time_check    
     @current_time = Time.now
  end 
  
  def index
    @customers = Customer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  def new
    @customer =Customer.new

 end
    
  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json


  # GET /customers/1/edit
   def edit
      @customer = Customer.find(params[:id])       
   end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])
    respond_to do |format|
      if @customer.save
        format.html { redirect_to action: "index", notice: 'Record was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = current_user.customers.find(params[:id])
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end
