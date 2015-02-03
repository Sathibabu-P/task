class ProfilesController < ApplicationController
	before_action :get_userid, only: [:new,:create]
	before_action :set_userid, only: [:edit,:update]
	
  def index
    @profiles = Profile.all
  end

  def new
  	 @profile = Profile.new
  end

  def create  
  	 @profile = Profile.new(profile_params)
  	 #@post = Profile.save(params.require(:profile).permit(:upload),@profile)
  	 respond_to do |format|
      if @profile.save
      	@user.profile = @profile 
        format.html { redirect_to @user, notice: 'Profile was successfully created.' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
  end

   def update   	
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
   end

  private
  
  def get_userid
  	@user = User.find(params[:uid])
  end
  def set_userid
  	@user = User.find(params[:id])
   	@profile = @user.profile
  end
  def profile_params
      params.require(:profile).permit(:fname,:lname,:email,:dob,:phoneno,:address,:gender,:likes,:password,:password_confirmation,:uname,:pic)
  end
end
