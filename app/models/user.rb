class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name

  validates_presence_of :email, :role, :name

  ROLES = {"Admin" => "admin", "Project Manager" => "manager", "Developer" => "developer"}

  def role?(role)
    if self.role.nil?
      return false
    else
      return self.role.downcase == role.downcase
    end
  end
end
