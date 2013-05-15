class SongsController < ApplicationController
  before_filter :authenticate_user!

  def create
    song = Song.create params[:song]

    if song.errors.present?
      flash["error"] = song.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end
end
