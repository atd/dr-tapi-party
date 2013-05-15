class Song < ActiveRecord::Base
  attr_accessible :title, :youtube

  validates :title, presence: true

  has_many :plays, dependent: :destroy

  def players?(instrument)
    players(instrument).any?
  end

  def players(instrument)
    plays.
      select{ |p| p.instruments.include? instrument }.
      map(&:user)
  end
end
