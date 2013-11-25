class UsersController < ApplicationController
  def index
    @page_num = 1
    @is_first_page = true
    @last_page_num = (User.count / 50.0).ceil
    @is_last_page = (@page_num == @last_page_num)

    @users = User.by_karma.limit(50)
  end

  def page_num
    if params[:page_num].nil? || (params[:page_num].to_i == 1)
      @page_num = 1
      @is_first_page = true
    else
      @page_num = params[:page_num].to_i
      @is_first_page = false
    end

    @last_page_num = (User.count / 50.0).ceil

    @is_last_page = (@page_num == @last_page_num)

    @users = User.page(params[:page_num].to_i)
    render :index
  end
end
