class CharactersController < ApplicationController

  def index
    @presenter = index_presenter
  end

  def show
    @presenter = show_presenter
  end

  private

  def search_params
    params.permit(:query)
  end

  def show_params
    params.permit(:id)
  end

  def index_presenter
    return CharacterPresenter.new unless params[:query]
    CharacterPresenter.new(search_params[:query])
  end

  def show_presenter
    CharacterShowPresenter.new(show_params[:id])
  end
end
