class Character
  attr_reader :id,
              :name,
              :description,
              :series_count,
              :events_count,
              :more_info

  def initialize(raw_data)
    @id = raw_data[:id]
    @name = raw_data[:name]
    @description = raw_data[:description] || "No Description"
    @thumbnail = raw_data[:thumbnail]
    @series_count = raw_data[:series][:available]
    @events_count = raw_data[:events][:available]
    @more_info = raw_data[:urls][0][:url] if raw_data[:urls]
  end

  def thumbnail
    @thumbnail[:path] + '/standard_xlarge.' + @thumbnail[:extension]
  end

  def thumbnail_large
    @thumbnail[:path] + '/landscape_incredible.' + @thumbnail[:extension]
  end

  def thumbnail_small
    @thumbnail[:path] + '/portrait_medium.' + @thumbnail[:extension]
  end

end
