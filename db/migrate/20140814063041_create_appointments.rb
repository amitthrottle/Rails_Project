class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
    	t.references :doctor
    	t.references :customer
    	t.string  :customer_date_time    	
      t.timestamps
    end
  end
end
