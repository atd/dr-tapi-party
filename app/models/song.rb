class Song < ActiveRecord::Base
  attr_accessible :title, :youtube

  validates :title, presence: true
end
