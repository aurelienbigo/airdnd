class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.where(user: current_user)
    @user = current_user
  end

  def show
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @reservation = Reservation.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.profile = @profile
    @reservation.user = current_user
    @reservation.status = "En Attente"
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to profile_path(reservation.profile)
  end

  private

    def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date, :description)
  end

end

