class ProfilesController < ApplicationController
  def show
    @profile = current_user
    authorize @profile
  end
end
