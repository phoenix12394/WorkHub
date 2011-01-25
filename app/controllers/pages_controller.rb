class PagesController < ApplicationController
  
  def home
    @title = "home"
    if signed_in?
    query = Micropost.order("created_at desc")

    query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank? or params[:location_id] == "Select a location"
    query = query.where("category_id = ?", params[:category_id]) unless params[:category_id].blank? or params[:category_id] == "Select a category"
    unless params[:tag_id].blank?
      params["tag_id"].each do |tag|
        query = Tag.all[Integer(tag) - 1].microposts & query.all
      end
      @feed_items = query.paginate(:page => params[:page])
    else
      @feed_items = query.all.paginate(:page => params[:page])      
    end


      #query = query.contains("tag_id = ?", params[:tag_id]) unless params[:tag_id].blank? or params[:category_id] == "Select a tag"
      
      #if params[:tag_id] == "Select a tag"
     # else
     #   @feed_items = @micropost.with_tags(params[:tag_id]).paginate(:page => params[:page])  
        
      #end
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
