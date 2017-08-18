class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]
  before_action :set_skills, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    lat = params[:lat]
    lng = params[:lng]
    if lat.blank? || lng.blank?
      @profiles = Profile.where.not(lat: nil, lng: nil)
    else
      @profiles = Profile.near([lat, lng], 20)
    end

    @hash = Gmaps4rails.build_markers(@profiles) do |profile, marker|
      marker.lat profile.lat
      marker.lng profile.lng
      marker.infowindow render_to_string(partial: "/profiles/map_box", locals: { profile: profile })
    end
  end

  def show

    @skills = @profile.skills
    @profile_coordinates = { lat: @profile.lat, lng: @profile.lng }
  end

  def new
    @profile = Profile.new
  end

  def create
    @skills = SkillLvl.new
    @profile = Profile.new(profile_params)
    @profile.user = current_user
     if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
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
    params.require(:profile).permit(:price, :url, :description, :phone, :address, :postcode, :city, :skill_id)
  end
end
