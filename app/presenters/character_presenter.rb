class CharacterPresenter
  include CharacterSearchText

  def initialize(search_query = "")
    @query = search_query
  end

  def search_results
    return [] if @query.empty?
    service.search_characters(@query).map { |data| Character.new(data) }
  end

  private

  def service
    @service ||= MarvelService.new
  end

end
