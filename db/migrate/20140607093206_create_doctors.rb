class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string   :name
   	  t.string   :specialisation
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
