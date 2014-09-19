class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  validates :name, :address, :email_id, :contact_no, :date_time, presence: true, uniqueness: true
  
  attr_accessible :email, :password, :password_confirmation , :remember_me
  attr_accessible :name, :address, :email_id, :contact_no, :date_time
  has_many :appointments
  has_many :doctors, through: :appointments
end
