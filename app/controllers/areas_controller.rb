class AreasController < ApplicationController 
  before_action :set_area ,only: [:show,:update,:destroy,:edit]
  def index
    @areas = Area.order("position ASC")
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(set_params)
    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @area.update(set_params)
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_params
    params.require(:area).permit(:areaname, :position)
  end
  def set_area
      @area = Area.find(params[:id])
  end
end
