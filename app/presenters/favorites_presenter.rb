class FavoritesPresenter

  def initialize(user)
    @user = user
  end

  def favorite_characters
    @user.favorites
  end
end
