class SeriesController < ApplicationController

  def index
    @presenter = index_presenter
  end

  def show

  end

  private

  def index_presenter
    return SeriesPresenter.new unless params[:query]
    SeriesPresenter.new(search_params[:query])
  end

  def search_params
    params.permit(:query)
  end

end
