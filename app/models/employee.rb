class Employee < ActiveRecord::Base

  #default order by company_name for companies
  default_scope -> { order("first_name asc") }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company,
  class_name: "Company",
  foreign_key: "company_id"

  has_many :appointments,
  class_name: "Appointment",
  dependent: :destroy

  has_one :contact_info,
  class_name: "ContactInfo",
  dependent: :destroy

  has_and_belongs_to_many :roles

  def fullname
    "#{self.first_name} #{self.surname}"
  end

  validates_presence_of :username
  validates_uniqueness_of :username

  def has_role?(role_name)
    return true if self.roles.first && self.roles.first.role == role_name
    return false
  end
end
