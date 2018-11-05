class SeriesController < ApplicationController

  def index
    @presenter = presenter
  end

  private

  def presenter
    return SeriesPresenter.new unless params[:query]
    SeriesPresenter.new(search_params[:query])
  end

  def search_params
    params.permit(:query)
  end

end
