class PagesController < ApplicationController
  def home
    @title = "home"
    if signed_in?
      @micropost = Micropost.new 
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def help
    @title = "help"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
end
