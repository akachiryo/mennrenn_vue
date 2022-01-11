class User < ApplicationRecord
  has_many :user_room   , dependent: :destroy
  has_many :room_message, dependent: :destroy
  has_many :room        , dependent: :destroy

  has_secure_password
end
