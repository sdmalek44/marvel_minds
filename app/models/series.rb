class Series
  attr_reader :id,
              :title,
              :thumbnail,
              :characters_count,
              :events_count,
              :start_year,
              :end_year,
              :type

  def initialize(raw_data)
    @id = raw_data[:id]
    @title = raw_data[:title]
    @start_year = raw_data[:startYear]
    @end_year = raw_data[:endYear]
    @type = raw_data[:type]
    @thumbnail = raw_data[:thumbnail][:path] + '/standard_xlarge.' + raw_data[:thumbnail][:extension]
    @characters_count = raw_data[:characters][:available]
    @events_count = raw_data[:events][:available]
  end
end
