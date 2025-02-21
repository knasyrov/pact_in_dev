class User < ApplicationRecord
  has_many :user_skills
  has_many :user_interests

  has_many :skills, through: :user_skills
  has_many :interests, through: :user_interests

  validates :email, uniqueness: true
end
