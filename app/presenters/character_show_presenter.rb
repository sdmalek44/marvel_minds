class CharacterShowPresenter
  def initialize(character_id)
    @character_id = character_id
  end

  def title
    "CHARACTER PROFILE"
  end

  def character
    Character.new(character_data)
  end

  def relation_1
    "CHARACTER SERIES"
  end

  def relation_2
    "CHARACTER EVENTS"
  end

  def character_events
    character_events_data.map do |raw_events|
      Event.new(raw_events)
    end
  end

  def character_series
    character_series_data.map do |raw_series|
      Series.new(raw_series)
    end
  end

  def character_data
    data = get_json("/v1/public/characters/#{@character_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_data ||= data[:data][:results][0] if data[:code] == 200
  end

  def character_series_data
    data = get_json("/v1/public/characters/#{@character_id}/series?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_series ||= data[:data][:results] if data[:code] == 200
  end

  def character_events_data
    data = get_json("/v1/public/characters/#{@character_id}/events?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_events ||= data[:data][:results] if data[:code] == 200
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
