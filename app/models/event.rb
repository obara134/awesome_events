class Event < ApplicationRecord
 belongs_to :user
 has_many :tickets, dependent: :destroy

 validates :name, length: { maximum: 50 }, presence: true
 validates :place, length: { maximum: 100 }, presence: true
 validates :introduction, length: {maximum: 2000 }, presence:true
 validates :start_at, presence: true
 validates :end_at, presence: true

end