class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      ## Database authenticatable
      t.string :first_name
      t.string :surname
      t.string :username,              :null => false, :default => ""
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      #relationship for company
      t.references :company, index: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps null: false
    end

    add_index :employees, :username,:unique => true
    add_index :employees, :reset_password_token, :unique => true
  end
end
