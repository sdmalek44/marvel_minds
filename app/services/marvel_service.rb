class MarvelService

  def search_characters(query)
    @characters ||= get_json("/v1/public/characters?nameStartsWith=#{query}&ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def character_data(character_id)
    data = get_json("/v1/public/characters/#{character_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")[0]
    @character_data ||= data
  end

  def character_series_data(character_id)
    data = get_json("/v1/public/characters/#{character_id}/series?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_series ||= data
  end

  def character_events_data(character_id)
    data = get_json("/v1/public/characters/#{character_id}/events?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_events ||= data
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
