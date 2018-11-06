class Series
  attr_reader :id,
              :title,
              :thumbnail,
              :characters_count,
              :events_count,
              :start_year,
              :end_year,
              :type,
              :more_info

  def initialize(raw_data)
    @id = raw_data[:id]
    @title = raw_data[:title]
    @start_year = raw_data[:startYear]
    @end_year = raw_data[:endYear]
    @type = raw_data[:type]
    @thumbnail = raw_data[:thumbnail]
    @characters_count = raw_data[:characters][:available]
    @events_count = raw_data[:events][:available]
    @more_info = raw_data[:urls][0][:url]
  end

  def thumbnail
    @thumbnail[:path] + '/standard_xlarge.' + @thumbnail[:extension]
  end


  def thumbnail_small
    @thumbnail[:path] + '/portrait_medium.' + @thumbnail[:extension]
  end

  def thumbnail_large
    @thumbnail[:path] + '/portrait_uncanny.' + @thumbnail[:extension]
  end
end
