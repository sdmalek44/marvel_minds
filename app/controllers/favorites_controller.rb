class FavoritesController < ApplicationController
  before_action :require_registered_user, only: [:index, :create]

  def index
    @presenter = FavoritesPresenter.new(current_user)
  end

  def create
    favorite = current_user.favorites.create(favorite_params)
    flash[:notice] = "Successfully Added to Favorites!" if favorite.save
    redirect_to params[:redirect]
  end

  private

  def favorite_params
    params.permit(:character_id, :description, :name, :thumbnail)
  end
end
