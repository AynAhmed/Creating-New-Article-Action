class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_category, only: [:show, :destroy]
  def index
    @categories = Category.all
  end
  def show
    # Display category details and associated articles
    @articles = @category.articles
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(categories_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @category = Category.find(params[:id])
    redirect_to root_path, status: :see_other
     @category.destroy
  end
  # def destroy
  #   @category.destroy
  #   redirect_to category_articles_path(@category), notice: 'Category was successfully destroyed.'
  # end
  private
  def set_category
    @category = Category.find(params[:id])
  end
  def categories_params
    params.require(:category).permit(:name, :description)
  end
end