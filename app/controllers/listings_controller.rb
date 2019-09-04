class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      redirect_to new_listing_path
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end



private

 def listing_params
   params.require(:listing).permit(:title, :company, :location, :description, :employment_type, :requirements, :retribution, :category_title)
 end
end
