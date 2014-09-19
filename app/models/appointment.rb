class Appointment < ActiveRecord::Base
  attr_accessible :doctor_id, :customer_id, :customer_date_time
  belongs_to :customer
  belongs_to :doctor


end
