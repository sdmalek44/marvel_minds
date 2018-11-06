class FavoritesPresenter

  def initialize(user)
    @user = user
  end

  def favorite_characters
    @user.favorite_characters
  end

  def favorite_series
    @user.favorite_series
  end
  
end
