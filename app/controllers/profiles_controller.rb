class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]
  before_action :set_skills, only: [:index]

  def index
    @profile = Profile.all
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

  def set_skills
    @skills_names = []
    Skill.all.each do |skill|
    @skills_names << skill.name
    end
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:price, :url, :description, :phone, :address)
  end
end
