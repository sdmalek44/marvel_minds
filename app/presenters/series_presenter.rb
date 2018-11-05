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

  def search_results
    return [] if @query.empty?
    search_series.map do |raw_character|
      Series.new(raw_character)
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)[:data][:results]
  end

  def search_series
    @characters ||= get_json("/v1/public/series?titleStartsWith=#{@query}&orderBy=startYear&ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def conn
    @conn ||= Faraday.new('http://gateway.marvel.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
