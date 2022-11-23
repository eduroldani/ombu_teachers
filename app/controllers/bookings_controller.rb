class BookingsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @booking = Booking.new
    authorize @booking

  end

  def create

    @booking = Booking.new(booking_params)
    @project = Project.find(params[:project_id])
    @booking.project = @project
    authorize @booking

    if @booking.save!
      redirect_to profile_path(current_user)
    else
      redirect_to new_project_booking_path(@project)
    end
  end



  def booking_params
    params.require(:booking).permit(:comment, :user_id)
  end
end
