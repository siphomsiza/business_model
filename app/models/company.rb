class Company < ActiveRecord::Base
  #default order by company_name for companies
  default_scope -> { order("company_name asc") }

  #Relationships of company
  has_many :employees,
  foreign_key: 'company_id',
  dependent: :destroy

  has_many :appointments,
  foreign_key: 'company_id',
  dependent: :destroy

  validates :company_name,presence: true

  def to_s
    company_name
  end
end
