class Reviw < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reviw_comments, dependent: :destroy
  validates :title, presence: true
  validates :castle, presence: true
  validates :store, presence: true
  validates :introduction, presence: true, length: { maximum: 140 }
  validates :address, presence: true

  #geocoded_by :address
  #after_validation :geocode
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } 
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } 
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } 
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } 
  
  def self.looks(search, word)
    if search == "perfect_match"
      @reviw = Reviw.where("title LIKE ? OR castle LIKE ? OR store LIKE ?","%#{word}%","%#{word}%","#{word}")
    elsif search == "forward_match"
      @reviw = Reviw.where("title LIKE ? OR castle LIKE ? OR store LIKE ?","%#{word}%","%#{word}%","#{word}")
    elsif search == "backward_match"
      @reviw = Reviw.where("title LIKE ? OR castle LIKE ? OR store LIKE ?","%#{word}%","%#{word}%","#{word}")
    elsif search == "partial_match"
      @reviw = Reviw.where("title LIKE ? OR castle LIKE ? OR store LIKE ?","%#{word}%","%#{word}%","#{word}")
    else
      @reviw = Reviw.all
    end
  end
end