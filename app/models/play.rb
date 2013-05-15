# encoding: utf-8

class Play < ActiveRecord::Base
  Instruments = %w{ Voz Guitarra Bajo Batería }

  belongs_to :user
  belongs_to :song
end
