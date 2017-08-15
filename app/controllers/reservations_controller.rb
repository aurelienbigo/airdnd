class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.find(params[:profile_id])
    @reservation = Reservation.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.profile = @profile

    if @reservation.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to profile_path(reservation.profile)
  end
end

