class EmployeesRoles < ActiveRecord::Migration
  def change
    create_table :employees_roles, id: false do |t|
      # reletionship for role
      t.belongs_to :role, index: true
      #relationship for employee
      t.belongs_to :employee, index: true
      t.timestamps
    end
  end
end
