# encoding: utf-8

class Play < ActiveRecord::Base
  Instruments = %w{ Voz Guitarra Bajo Batería }

  serialize :instruments

  attr_accessible :song_id, :instruments

  belongs_to :user
  belongs_to :song

  validates :user_id, :song_id, presence: true
  validates_uniqueness_of :user_id, scope: :song_id
  validates_uniqueness_of :song_id, scope: :user_id
end
