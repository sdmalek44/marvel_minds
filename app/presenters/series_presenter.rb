class SeriesPresenter
  include SeriesSearchText

  def initialize(search_query = "")
    @query = search_query
  end

  def search_results
    @results ||= service.search_series(@query).map { |data| Series.new(data) }
  end

  private

  def service
    @service ||= MarvelService.new
  end
  
end
