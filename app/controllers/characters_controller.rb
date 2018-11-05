class CharactersController < ApplicationController

  def index
    @presenter = presenter
  end

  private

  def search_params
    params.permit(:query)
  end

  def presenter
    return CharacterPresenter.new unless params[:query]
    CharacterPresenter.new(search_params[:query])
  end

end
