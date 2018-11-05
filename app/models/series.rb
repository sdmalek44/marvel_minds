class Series
  attr_reader :id,
              :title,
              :description,
              :thumbnail,
              :characters_count,
              :events_count
              
  def initialize(raw_data)
    @id = raw_data[:id]
    @title = raw_data[:title]
    @description = raw_data[:description]
    @thumbnail = raw_data[:thumbnail][:path] + '/standard_xlarge.' + raw_data[:thumbnail][:extension]
    @characters_count = raw_data[:characters][:available]
    @events_count = raw_data[:events][:available]
  end
end
