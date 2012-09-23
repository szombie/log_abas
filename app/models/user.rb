class User < ActiveRecord::Base
  rolify
  has_and_belongs_to_many :roles , :join_table => :users_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me , :role_ids
  # attr_accessible :title, :body
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
 end
end
