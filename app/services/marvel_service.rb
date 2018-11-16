class MarvelService

  def search_characters(query)
    @characters ||= get_json("/v1/public/characters?nameStartsWith=#{query}&ts=1&apikey=1d68fdb48109bd44fd202dd9c0df3866&hash=108c35713f83d455e1a871dd3858751d")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)[:data][:results]
  end

  def conn
    @conn ||= Faraday.new('http://gateway.marvel.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
