class User < ApplicationRecord
  has_many :user_rooms   , dependent: :destroy
  has_many :room_messages, dependent: :destroy
  has_many :rooms        , dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, uniqueness: { case_sensitive: true }
  validates :password_digest, presence: true

  has_secure_password
  has_one_base64_attached :avatar
end
