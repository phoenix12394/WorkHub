class PagesController < ApplicationController
  
  def home
    @title = "home"
    if signed_in?
      @micropost = Micropost.new 
      query = Micropost.order("created_at desc")
      query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank? or params[:location_id] == "Select a location"
      query = query.where("category_id = ?", params[:category_id]) unless params[:category_id].blank? or params[:category_id] == "Select a category"
      #query = query.contains("tag_id = ?", params[:tag_id]) unless params[:tag_id].blank? or params[:category_id] == "Select a tag"
      @feed_items = query.all.paginate(:page => params[:page])
      #@feed_items = Micropost.all.paginate(:page => params[:page])

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
