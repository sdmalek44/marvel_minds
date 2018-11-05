class CharactersController < ApplicationController

  def index
    @presenter = index_presenter
  end

  def show
    
  end

  private

  def search_params
    params.permit(:query)
  end

  def index_presenter
    return CharacterPresenter.new unless params[:query]
    CharacterPresenter.new(search_params[:query])
  end

end
