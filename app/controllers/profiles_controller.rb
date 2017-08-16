class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]
  before_action :set_skills, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @profiles = Profile.all
    # @profiles_search = Profile.search(params[:search])
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
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


  def set_skills
    @skills_names = []
    Skill.all.each do |skill|
    @skills_names << skill.name
    end
  end

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
