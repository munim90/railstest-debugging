class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :roles, dependent: :destroy
  has_many :projects, through: :roles

  def can_view?(project)
  return true if admin || project.public?
  project.in?(projects)
end

end
