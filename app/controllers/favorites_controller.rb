class FavoritesController < ApplicationController
  before_action :require_registered_user, only: [:index]

  def index

  end
end
