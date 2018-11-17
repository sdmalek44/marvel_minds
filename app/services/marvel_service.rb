class MarvelService

  def search_series(query)
    @series ||= get_json("/v1/public/series?titleStartsWith=#{query}&orderBy=startYear&ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def search_characters(query)
    @chars ||= get_json("/v1/public/characters?nameStartsWith=#{query}&ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def char_data(character_id)
    @char_data ||= get_json("/v1/public/characters/#{character_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")[0]
  end

  def series_data(series_id)
    @series_data ||= get_json("/v1/public/series/#{series_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")[0]
  end

  def series_events_data(series_id)
    @series_events ||= get_json("/v1/public/series/#{series_id}/events?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def series_char_data(series_id)
    @series_series ||= get_json("/v1/public/series/#{series_id}/characters?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def char_series_data(character_id)
    @char_series ||= get_json("/v1/public/characters/#{character_id}/series?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def char_events_data(character_id)
    @char_events ||= get_json("/v1/public/characters/#{character_id}/events?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def get_json(url)
    data = JSON.parse(conn.get(url).body, symbolize_names: true)
    data[:code] == 200 ? data[:data][:results] : []
  end

  def conn
    @conn ||= Faraday.new('http://gateway.marvel.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
