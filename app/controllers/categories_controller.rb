class CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update]
  def index
    @category = Category.new
    @categories = Category.all
  end

  def edit;end

  def update
    if @category.update(categories_params)
      render turbo_stream: turbo_stream.replace("category_#{@category.id}", partial: 'categories/category', locals: { category: @category })
    else
      turbo_error_message(@category)
    end
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      streams = []
      streams << turbo_stream.append('categories', partial: 'categories/category', locals: { category: @category })
      streams << turbo_stream.replace('category_form', partial: 'categories/form', locals: { category: Category.new })
      render turbo_stream: streams
    else
      turbo_error_message(@category)
    end

  end



  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:name)
  end

end
