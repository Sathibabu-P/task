class ListingsController < ApplicationController
  before_action :get_listing, only: [:show,:edit,:update,:destroy]
  before_action :set_area,:set_category, only:[:create,:update]
  before_action :get_area, :get_category
  def index
     @area = Area.search(params[:search]) 
     @listings = Listing.search(@area)
     @listings = [] if @area.blank? && params[:search]
     @listings = Listing.all if params[:search].blank?
  end

  def new   
    @listing = Listing.new
  end
  def create
    @listing = Listing.new(set_params)
    rediredcturl = @listing if @listing
    rediredcturl = @area if @area
    rediredcturl = @category if @category
    respond_to do |format|
      if @listing.save            
        format.html { redirect_to rediredcturl, notice: 'Listing was successfully created.' }
        format.json { render :index, status: :created, location: rediredcturl }     
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit    
  end

  def update
     rediredcturl = @listing if @listing
     rediredcturl = @area if @area
     rediredcturl = @category if @category
    respond_to do |format|
      if @listing.update(set_params)      
        format.html { redirect_to rediredcturl, notice: 'Listing was successfully updated.' }
        format.json { render :index, status: :created, location: rediredcturl }    
      else       
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }  
      end
    end
  end

  def destroy   
    reurl = listings_url 
    reurl = @area if @area 
    reurl = @category if @category
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to reurl, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
  end
  end

  private
  def set_params
    params.require(:listing).permit(:listingname,:area_id,:category_id,:contactinfo,:price,:hidden_area_id,:hidden_category_id)
  end
  def get_listing
    @listing = Listing.find(params[:id])
  end
  def set_area
    @area = Area.find(params[:listing][:hidden_area_id]) if params[:listing][:hidden_area_id].present?   
  end
  def set_category
    @category = Category.find(params[:listing][:hidden_category_id]) if params[:listing][:hidden_category_id].present?   
  end
  def get_area
    @area = Area.find(params[:aid]) if params[:aid]
  end
  def get_category
    @category = Category.find(params[:cid]) if params[:cid]
  end
end
