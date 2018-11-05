class CharacterShowPresenter
  def initialize(character_id)
    @character_id = character_id
  end

  def character
    Character.new(character_data)
  end

  def character_data
    return [] unless get_json("/v1/public/characters/#{@character_id}?ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
    @character_data ||= get_json("na")[:data][:results][0]
  end

  private

  def get_json(url)
    @json ||= JSON.parse(conn.get(url).body, symbolize_names: true)
    return false if @json[:code] != 200
    @json
  end

  def conn
    @conn ||= Faraday.new('https://gateway.marvel.com:443') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
