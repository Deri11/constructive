class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    @shots = Shot.all
    @users = User.all
  end
end
