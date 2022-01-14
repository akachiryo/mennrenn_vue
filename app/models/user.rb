class User < ApplicationRecord
  has_many :user_rooms   , dependent: :destroy
  has_many :room_messages, dependent: :destroy
  has_many :rooms        , dependent: :destroy

  has_secure_password
end
