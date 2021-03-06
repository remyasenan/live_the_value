class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
 
  # attr_accessible :title, :body
  
  has_many :employee_roles
  has_many :roles, :through => :employee_roles
  has_many :employee_histories
  has_one  :employee_detail
  has_many :employee_hierarchies
  has_many :evaluations
  has_one :evaluation_summary
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :employee_role_ids, :role_ids,
  								:employee_history_ids, :employee_detail_attributes, :evaluation_ids, :evaluation_summary_attributes
 
  accepts_nested_attributes_for :employee_detail, :evaluation_summary, :allow_destroy => true
end


