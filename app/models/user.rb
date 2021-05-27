class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :ticket_comments, dependent: :destroy
  attachment :profile_image

  has_many :messages, dependent: :destroy
  has_many :user_rooms, dependent: :destroy

  has_many :event_comments, dependent: :destroy

  validates :name, length: { in: 2..20 }, presence: true, uniqueness: true
  

end
