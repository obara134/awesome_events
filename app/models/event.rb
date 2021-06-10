class Event < ApplicationRecord
  belongs_to :user
  has_many :ticket_comments, dependent: :destroy
  has_many :event_comments, dependent: :destroy

  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 100 }, presence: true
  validates :introduction, length: { maximum: 2000 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  def self.search_for(content) #検索機能
    Event.where('name LIKE ?', '%' + content + '%')
  end
end
