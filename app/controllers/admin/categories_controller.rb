class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  before_filter :authenticate

    def index
    @category = Category.order(is: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

##TODO check seeds to see table structure
##TODO