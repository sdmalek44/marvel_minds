class FavoritesController < ApplicationController
  before_action :require_registered_user, only: [:index, :create]

  def index
    @presenter = FavoritesPresenter.new(current_user)
  end

  def create
    fc = FavoritesCreator.new(params, current_user)
    fc.create_favorite
    flash[:notice] = fc.result
    redirect_to fc.redirect
  end

end
