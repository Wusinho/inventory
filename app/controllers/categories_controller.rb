class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]
  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit;end

  def update
    if @category.update(categories_params)
      redirect_to categories_path
    end
  end

  def create
    @category = Category.new(categories_params)

    if @category.save

    end

  end



  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:name)
  end

end
