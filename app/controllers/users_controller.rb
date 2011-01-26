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
    query = Micropost.order("created_at desc")
    @posts = []
    Micropost.all.each do |post|
      passed = true
      post.tags.each do |tag|
        passed = false unless @user.tags.include?(tag)
      end
      if passed
        @posts << post
      end
    end
    
  end

  def qualifications
    @user = User.find(params[:id])
    @title = "Qualifications"
    @posts = []
    Micropost.order("created_at desc").each do |post|
      passed = true
      post.tags.each do |tag|
        passed = false unless @user.tags.include?(tag)
      end
      if passed
        @posts << post
      end
    end
    
    @feed_items = @posts.paginate(:page => params[:page])    
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

    unless params[:tag] == nil
      tags = Tag.all
     params[:tag].each do |tag|
      @tag = Tag.find(tag)
      @user.tags << @tag
    end
   
    flash[:notice] = 'Skills were successfully added.'
    else
      
      flash[:notice] = 'You didn\'t select a skill to add.'
    end
    redirect_back_or edit_user_path
  end
  
  def tag_remove
    
    @user = User.find(params[:id])
    unless params[:tag] == nil
    tags = Tag.all
    params[:tag].each do |tag|
      @tag = Tag.find(tag)
      @user.tags.delete(@tag)
    end
   
    flash[:notice] = 'Skills were successfully removed'
else
  flash[:notice] = 'You didn\'t select a skill to remove.'
end
    redirect_back_or edit_user_path
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
