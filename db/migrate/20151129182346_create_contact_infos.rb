class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      #relationship for Employee
      t.references :employee, index: true
      t.string :email
      t.string :mobile_number
      t.string :work_number
      t.timestamps null: false
    end
  end
end
