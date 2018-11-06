class SeriesShowPresenter

  def initialize(series_id)
    @series_id = series_id
  end


  def title
    "SERIES PROFILE"
  end

  def relation_1
    "SERIES CHARACTERS"
  end

  def relation_2
    "SERIES EVENTS"
  end

  def series
    Series.new(series_data)
  end

  def series_data
    data = get_json("/v1/public/series/#{@series_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @series_data ||= data[:data][:results][0] if data[:code] == 200
  end

  def series_characters
    series_characters_data.map do |raw_characters|
      Character.new(raw_characters)
    end
  end

  def series_events
    series_events_data.map do |raw_events|
      Event.new(raw_events)
    end
  end

  def series_events_data
    data = get_json("/v1/public/series/#{@series_id}/events?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @series_events ||= data[:data][:results] if data[:code] == 200
  end

  def series_characters_data
    data = get_json("/v1/public/series/#{@series_id}/characters?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @series_series ||= data[:data][:results] if data[:code] == 200
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    @conn ||= Faraday.new('https://gateway.marvel.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
