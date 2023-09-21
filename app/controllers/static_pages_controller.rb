class StaticPagesController < ApplicationController
  #the purpose of these actions is to render 
  #html web pages, even if they don't return anything
  def home
    if logged_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about 
  end

  def contact
  end
end
