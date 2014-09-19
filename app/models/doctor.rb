class Doctor < ActiveRecord::Base
  validates :name, :specialisation, :start_time, :end_time, presence: true
  attr_accessible  :name, :specialisation, :start_time, :end_time
  has_many :appointments
  has_many :customers, through: :appointments
end
