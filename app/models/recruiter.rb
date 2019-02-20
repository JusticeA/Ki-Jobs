class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :jobs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end