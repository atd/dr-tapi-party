class SongsController < ApplicationController
  def create
    song = Song.create params[:song]

    if song.errors.present?
      flash["error"] = song.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end
end
