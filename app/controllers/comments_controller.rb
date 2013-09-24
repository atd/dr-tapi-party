# encoding: utf-8
class CommentsController < ApplicationController
  
  def create
    
    @song    = Song.find(params[:comment][:commentable_id])
    @comment = Comment.build_from(@song, current_user.id, params[:comment][:body])
    @comment.parent_id = params[:comment][:parent_id] if params[:comment][:parent_id].present?
    @comment.save!
    
    redirect_to root_path, :notice => 'komentario añadido'   
    
  end
  
end