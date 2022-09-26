class Event < ApplicationRecord
  belongs_to :enclosure
  has_many :reservation, dependent: :delete_all
  validates :name, presence: true
  validates :end_time, comparison: {greater_than: :start_time}

  def is_active
    start_time < Date.today && end_time > Date.today
  end
  def is_incoming
    start_time > Date.today
  end 
end
