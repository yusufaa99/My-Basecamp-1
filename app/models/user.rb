class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true

  has_many :user_projects
  has_many :projects, through: :user_projects
  
def admin?
  self.admin
end
        
end
