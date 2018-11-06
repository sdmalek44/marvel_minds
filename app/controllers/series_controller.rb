class SeriesController < ApplicationController

  def index
    @presenter = index_presenter
  end

  def show
    @presenter = show_presenter
  end

  private

  def index_presenter
    return SeriesPresenter.new unless params[:query]
    SeriesPresenter.new(search_params[:query])
  end

  def show_presenter
    SeriesShowPresenter.new(show_params[:id])
  end

  def show_params
    params.permit(:id)
  end

  def search_params
    params.permit(:query)
  end

end
