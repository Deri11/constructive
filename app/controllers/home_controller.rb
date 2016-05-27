class HomeController < ApplicationController

  def index
    @shots = Shot.all
    @users = User.all
    @comments = Comment.all
    if params[:search].blank?
        puts "Oh snap, there aren't any images by that description."
    else params[:search]
      @shots = Shot.search(params[:search]).order("created_at DESC")
      # @shots = Shot.all.order('created_at DESC')
    end
  end

end
