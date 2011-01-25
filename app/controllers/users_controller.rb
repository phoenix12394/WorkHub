class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  
  def new
    @title = "sign up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'You have succesfully signed up.'
      redirect_to @user
    else
      @title = "sign up"
      render 'new'  
      
    end
  end
  
  def edit
    @title = "Edit user"
    @user = User.find(params[:id])
    @tags = @user.tags
  end

  def update
    @tags = @user.tags
    if @user.update_attributes(params[:user])
      flash[:success] = "profile updated."
      redirect_to @user
    else
      @title = "edit user"
      render 'edit'
    end
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user destroyed"
    redirect_to users_path
  end
  
  def tags
    @user = User.find(params[:id])
    @tags = @user.tags
  end

  def tag_add
    @user = User.find(params[:id])
    @tag = Tag.find(params[:tag])
    
    unless @user.has_tag?(@tag)
      @user.tags << @tag
      flash[:notice] = 'Tag was successfully added'
    else
      flash[:error] = 'User already has tag.'
    end
    redirect_to :action => :edit, :id => @user
  end
  
  def tag_remove
    @user = User.find(params[:id])
    tag_ids = params[:tags]
    unless tag_ids.blank?
      tag_ids.each do |tag_id|
        tag = Tag.find(tag_id)
        if @user.has_tag?(tag)
          logger.info "Removing tag #{tag.id} from user."
          @user.tags.delete(tag)
          flash[:notice] = 'Tag was successfully deleted'
        end
      end
    end
    redirect_to :action => :edit, :id => @user
  end
  
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
