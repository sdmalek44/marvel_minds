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
    Series.new(service.series_data(@series_id))
  end

  def series_characters
    @chars ||= service.series_char_data(@series_id).map { |data| Character.new(data) }
  end

  def series_events
    @series ||= service.series_events_data(@series_id).map { |data| Event.new(data) }
  end

  private

  def service
    @service ||= MarvelService.new
  end
end
