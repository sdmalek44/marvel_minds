class CharacterShowPresenter
  include CharacterShowText

  def initialize(character_id)
    @char_id = character_id
  end

  def character
    @character ||= Character.new(service.char_data(@char_id))
  end

  def character_events
    @events ||= service.char_events_data(@char_id).map { |data| Event.new(data) }
  end

  def character_series
    @series ||= service.char_series_data(@char_id).map { |data| Series.new(data) }
  end

  private

  def service
    @service ||= MarvelService.new
  end
  
end
