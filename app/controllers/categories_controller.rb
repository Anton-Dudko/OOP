class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :admin, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private def set_category
    @category = Category.find(params[:id])
  end

  private def admin
    if !current_user.admin
      redirect_to campaigns_path
    end
  end

  private def category_params
    params.require(:category).permit(:name)
  end
end
