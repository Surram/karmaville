class UsersController < ApplicationController
  def index
    @users = User.by_karma.limit(50)
  end

  def page_num
    @users = User.page(params[:page_num].to_i)
    render :index
  end
end
