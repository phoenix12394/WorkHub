class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => [:destroy, :edit, :update]
  autocomplete :tag, :name


    
 # query = Micropost.order("created_at DESC")
 # query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank?
 # query = query.where("category_id = ?", params[:category_id]) unless params[:category_id].blank?
 # @microposts = query.all

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

  def tags
    @micropost = Micropost.find(params[:id])
    @tags = @micropost.tags
  end

  def tag_add
    @micropost = Micropost.find(params[:id])
    @tag = Tag.find(params[:tag])
    
    unless @micropost.has_tag?(@tag)
      @micropost.tags << @tag
      flash[:notice] = 'Tag was successfully added'
    else
      flash[:error] = 'User already has tag.'
    end
    redirect_to :action => :tags, :id => @micropost
  end
  
  def tag_remove
    @micropost = Micropost.find(params[:id])
    tag_ids = params[:tags]
    unless tag_ids.blank?
      tag_ids.each do |tag_id|
        tag = Tag.find(tag_id)
        if @micropost.has_tag?(tag)
          logger.info "Removing tag #{tag.id} from user."
          @micropost.tags.delete(tag)
          flash[:notice] = 'Tag was successfully deleted'
        end
      end
    end
    redirect_to :action => :tags, :id => @micropost
  end

  
  private
    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user?(@micropost.user)
    end
end