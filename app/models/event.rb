class Event < ApplicationRecord
  belongs_to :user
  has_many :ticket_comments, dependent: :destroy
  has_many :event_comments, dependent: :destroy

  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 100 }, presence: true
  validates :introduction, length: { maximum: 2000 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_end_check
  validate :start_check

  def start_end_check
    errors.add(:end_at, "は開始時刻より遅い時間を選択してください") if start_at > end_at
  end

  def start_check
    errors.add(:start_at, "は現在の日時より遅い時間を選択してください") if start_at < Time.now
  end

  def self.search_for(content) #検索機能
    Event.where('name LIKE ?', '%' + content + '%')
  end
end
