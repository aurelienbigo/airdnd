class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_skills, only: [:index]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @city = params[:search][:city].gsub(/,.*/,"")
    @price = params[:search][:price].to_i
    @skill = params[:search][:skill].to_i
    @profiles = Profile.all
    unless @skill == 0 || nil
      @profiles = Profile.joins(:skills).where(skills: {id: @skill})
    end
    if @city != ''
      @profiles = @profiles.all.where(city: @city.capitalize)
    end
    if @price > 0
      @profiles = @profiles.where(price: @price)
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

    @profile = Profile.new(profile_params)

    @profile.user = current_user
     if @profile.save
          params[:profile][:skills].each do |id|
        SkillLvl.create(skill_id: id.to_i, profile_id: @profile.id, lvl: (1..5).to_a.sample) if id != ''
      end
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    @profile.skill_lvls.destroy_all
    params[:profile][:skills].each do |id|
      SkillLvl.create(skill_id: id.to_i, profile_id: @profile.id, lvl: (1..5).to_a.sample) if id != ''
    end
    redirect_to profile_path
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
    params.require(:profile).permit(:price, :url, :description, :phone, :address, :postcode, :city)
  end
end
