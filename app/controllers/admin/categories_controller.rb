class Admin::CategoriesController < ApplicationController
  def show
    @category = Category.all
    @products = @category.products.order(created_at: :desc)
  end
end