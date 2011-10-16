# Represents the system's users
#
# Required attributes:
# * Email
# * Role
# * Name
#
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  role                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  invitation_token       :string(60)
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name

  validates_presence_of :email, :role, :name

  # Constant that defines the name-value pairs for the role select options when inviting a user
  ROLES = {"Admin" => "admin", "Project Manager" => "manager", "Developer" => "developer"}

  # Constant that defines the reduced name-value pairs for the reduced role select options when a manager invites a user
  REDUCED_ROLES = {"Project Manager" => "manager", "Developer" => "developer"}

  # Validates if the role for the user is the same as the string parameter being passed.
  # == Parameters
  # * role: A string parameter that represents the role that is being queried.
  #
  # == Return Values
  # Returns true if the user has a role that matches the 'role' parameter, false otherwise.
  def role?(role)
    if self.role.nil?
      return false
    else
      return self.role.downcase == role.downcase
    end
  end
end


