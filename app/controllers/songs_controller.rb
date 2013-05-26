class SongsController < ApplicationController
  before_filter :authenticate_user!

  def create
    song = current_user.songs.create params[:song]

    if song.errors.present?
      flash["error"] = song.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  def destroy
    song = current_user.songs.find params[:id]
    song.destroy

    redirect_to root_path
  end
end
