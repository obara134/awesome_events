class Event < ApplicationRecord
 belongs_to :user

 validates :name, length: { maximum: 50 }, presence: true
 validates :place, length: { maximum: 100 }, presence: true
 validates :introduction, length: {maximum: 2000 }, presence:true
 validates :start_at, presence: true
 validates :end_at, presence: true

end