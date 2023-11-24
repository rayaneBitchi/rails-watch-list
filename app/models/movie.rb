class Movie < ApplicationRecord
  has_many :bookmarks
  
  validates :overview, presence: true, allow_blank: false
  validates :title, presence: true, uniqueness: true, allow_blank: false
end
