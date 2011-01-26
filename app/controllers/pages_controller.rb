class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end
  
  def browse
    @title = "Browse"
    query = Micropost.order("created_at desc")


 #   unless params[:tag_id].blank?
 #     tags = Tag.where(:id => params[:tag_id]).all
 #     query = tags.map(&:microposts).flatten.uniq
 
 #     params["tag_id"].each do |tag|
 #       query = Tag.all[Integer(tag) - 1].microposts & query.all
 ##     end
  #    @feed_items = query.paginate(:page => params[:page])
  #  else
  #    @feed_items = query.all.paginate(:page => params[:page])      
  #  end
    
    
     query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank? or params[:location_id] == "Select a location"
    query = query.where("category_id = ?", params[:category_id]) unless params[:category_id].blank? or params[:category_id] == "Select a category"
    unless params[:tag_id].blank?
      posts = []
      query.each do |post|
        passed = true
        params[:tag_id].each do |tag|
          passed = false unless post.tags.include?(Tag.all[Integer(tag)- 1])
        end
        if passed
          posts << post
        end
      end
    else
      posts = query
    end    
      @feed_items = posts.paginate(:page => params[:page])      

      #query = query.contains("tag_id = ?", params[:tag_id]) unless params[:tag_id].blank? or params[:category_id] == "Select a tag"
      
      #if params[:tag_id] == "Select a tag"
     # else
     #   @feed_items = @micropost.with_tags(params[:tag_id]).paginate(:page => params[:page])  
        
      #end
      #@feed_items = Micropost.all.paginate(:page => params[:page])

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
