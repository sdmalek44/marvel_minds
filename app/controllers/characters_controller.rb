class CharactersController < ApplicationController

  def index
    if params[:query]
      @presenter = CharacterPresenter.new(search_params[:query])
    end
  end

  private

  def search_params
    params.permit(:query)
  end

end
