class CategoriesController < ApplicationController
  # before_action :set_category, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    if @category
      @articles = @category.articles
    else
      # Handle the case when the category is not found
      redirect_to root_path, alert: 'Category not found'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

#use the method to get rid of reapeated code.
  def set_category
    @category = Category.find(params[:id])
  end
end
