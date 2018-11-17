class FavoritesCreator
  attr_reader :result

  def initialize(params, user)
    @params = params
    @user = user
  end

  def create_favorite
    if @params[:character_id]
      item = @user.favorite_characters.find_or_create_by(character_params)
    elsif @params[:series_id]
      item = @user.favorite_series.find_or_create_by(series_params)
    end
    @result = "This card is now in your Favorites!" if item.save
  end

  def redirect
    @params[:redirect]
  end

  private

  def character_params
    @params.permit(:character_id, :description, :name, :thumbnail)
  end

  def series_params
    @params.permit(:series_id, :title, :start_year, :end_year, :thumbnail)
  end
end
