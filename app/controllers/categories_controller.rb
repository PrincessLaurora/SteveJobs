class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
		@listings = @category.listings
  end


end
