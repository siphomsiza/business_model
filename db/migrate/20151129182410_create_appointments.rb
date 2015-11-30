class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      #relationship for company
      t.references :company, index: true
      #relationship for employees
      t.references :employee, index: true
      t.string :description
      t.text :info
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps null: false
    end
  end
end
