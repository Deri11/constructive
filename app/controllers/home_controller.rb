class HomeController < ApplicationController

  def index
    @shots = Shot.all
    @users = User.all
    @comments = Comment.all
  end

end
