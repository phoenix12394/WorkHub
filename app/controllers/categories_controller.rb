class CategoriesController < ApplicationController
  def new
    @title = "new category"
    @category = Category.new
  end

  def index
    @title = "all categories"
    @categories = Category.paginate(:page => params[:page])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = 'category created!'
      redirect_to @category
    else
      @title = "new category"
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.name
    query = @category.microposts
    query = query.order("created_at DESC")
    query = query.where("location_id = ?", params[:location_id]) unless params[:location_id].blank?
    @microposts = query.all.paginate(:page => params[:page])

  end
end
