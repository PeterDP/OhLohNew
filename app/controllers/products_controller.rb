class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.new
  end
end