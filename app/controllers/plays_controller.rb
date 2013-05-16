class PlaysController < ApplicationController
  before_filter :authenticate_user!

  respond_to :js

  def create
    @play = current_user.plays.build params[:play]
    @play.save
  end

  def update
    @play = current_user.plays.find params[:id]
    @play.update_attributes params[:play]
  end

  def destroy
    @play = current_user.plays.find params[:id]
    @play.destroy
  end
end
