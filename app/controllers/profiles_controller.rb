class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def index
    @profiles = Profile.search(params[:search])
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profiles_path
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  # def user
  #   @user = User.find(@profile.user_id)
  # end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:price, :url, :description, :phone, :address)
  end
end
