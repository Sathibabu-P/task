class ListingsController < ApplicationController
  before_action :get_listing, only: [:show,:edit,:update,:destroy]
  before_action :set_area, only:[:create,:update]
  before_action :get_area
  def index
    @listings = Listing.all
  end

  def new
   
    @listing = Listing.new
  end
  def create
    @listing = Listing.new(set_params)
    respond_to do |format|
      if @listing.save 
      if @area.present?               
        format.html { redirect_to @area, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else       
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :index, status: :created, location: @listing }
      end
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
    respond_to do |format|
      if @listing.update(set_params)
      if @area.present?        
        format.html { redirect_to @area, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else   
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :index, status: :created, location: @listing }
      end
      else       
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }  
      end
    end
  end

  def destroy
  end

  private
  def set_params
    params.require(:listing).permit(:listingname,:area_id,:category_id,:contactinfo,:price,:hidden_area_id)
  end
  def get_listing
    @listing = Listing.find(params[:id])
  end
  def set_area
    @area = Area.find(params[:listing][:hidden_area_id]) if params[:listing][:hidden_area_id].present?   
  end
  def get_area
    @area = Area.find(params[:aid]) if params[:aid]
  end
end
