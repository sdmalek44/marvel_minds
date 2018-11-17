class SeriesPresenter

  def initialize(search_query = "")
    @query = search_query
  end

  def title
    "MARVEL SERIES"
  end

  def search_title
    "SEARCH BY TITLE"
  end

  def search_path
    "/series"
  end

  def search_results_title
    "SERIES SEARCH RESULTS"
  end


  def search_placeholder
    "SERIES TITLE"
  end

  def search_results
    @results ||= service.search_series(@query).map { |data| Series.new(data) }
  end

  def service
    @service ||= MarvelService.new
  end
end
