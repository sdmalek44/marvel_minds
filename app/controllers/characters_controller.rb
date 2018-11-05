class CharactersController < ApplicationController

  def index
    if params[:character]
      @presenter = CharacterPresenter.new(search_params[:query])
    end
  end

  private

  def search_params
    params.require(:character).permit(:query)
  end

end
