class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => [:destroy, :edit, :update]

    
 # query = Micropost.order("created_at DESC")
 # query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank?
 # query = query.where("category_id = ?", params[:category_id]) unless params[:category_id].blank?
 # @microposts = query.all
def tag_name
  tag.name if tag
end

def tag_name=(name)
  self.tag = Tag.find_or_create_by_name(name) unless name.blank?
end
  def edit
    @title = "Edit Post"
    @micropost = Micropost.find(params[:id])
    @tags = @micropost.tags
  end

  def update
    if @micropost.update_attributes(params[:micropost])
      flash[:success] = "post updated."
      redirect_to @micropost
    else
      @title = "edit micropost"
      render 'edit'
    end
  end

  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    logger.debug "The object is #{params[:micropost]}"
    if @micropost.save
      flash[:success] = 'Job successfully filed!'
      redirect_to :action => :tags, :id => @micropost

    else
      @title = "New Post"
      render 'new'
    end
  end
  
  def new
    @title = "new post"
    @micropost = Micropost.new
    @tags = @micropost.tags
  end
  
  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end
  
  def show
    @micropost = Micropost.find(params[:id])
    @title = @micropost.title    
    
  end

  def qualified
    @micropost = Micropost.find(params[:id])
    @title = "Qualified candidates"
    @users = []
    User.all.each do |user|
      passed = true
      @micropost.tags.each do |tag|
        passed = false unless user.tags.include?(tag)
      end
      if passed
        @users << user
      end
    end
    
    @users= @users.paginate(:page => params[:page])    
  end

  def tags
    @micropost = Micropost.find(params[:id])
    @tags = @micropost.tags
  end


  def tag_add
    @micropost = Micropost.find(params[:id])
    tags = Tag.all
    params[:tag].each do |tag|
      @tag = Tag.find(tag)
      @micropost.tags << @tag
    end
   
    flash[:notice] = 'Tags were successfully added'

    redirect_to :action => :tags, :id => @micropost
  end
  
  def tag_remove
    @micropost = Micropost.find(params[:id])
    tags = Tag.all
    params[:tag].each do |tag|
      @tag = Tag.find(tag)
      @micropost.tags.delete(@tag)
    end
   
    flash[:notice] = 'Tags were successfully removed'

    redirect_to :action => :tags, :id => @micropost
  end


  
  private
    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end