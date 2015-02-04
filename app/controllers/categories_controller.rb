class CategoriesController < ApplicationController
  before_action :get_categoty, only: [:show,:edit,:update,:destroy]
  def index
    @categories = Category.order("position ASC")
  end

  def new
    @category = Category.new
  end

  def create
   @category = Category.new(set_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end 
  end

  def show
  end

  def edit
  end

  def update 
    respond_to do |format|
      if @category.update(set_params)
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_categoty
    @category = Category.find(params[:id])
  end
  def set_params
    params.require(:category).permit(:categoryname,:position)
  end
end
