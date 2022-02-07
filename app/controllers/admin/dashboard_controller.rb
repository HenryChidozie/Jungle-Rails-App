class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  before_filter :authenticate

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
