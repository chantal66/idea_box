class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy]


  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created succesfully'
      redirect_to admin_category_path(@category)
    else
      flash.now[:danger] = @category.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def destroy
    @category.destroy
    flash[:succes] = "#{@category.name} successfully deleted"
    redirect_to admin_categories_path

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end