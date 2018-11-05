class Character
  attr_reader :id,
              :name,
              :description,
              :thumbnail,
              :series_count,
              :events_count
              
  def initialize(raw_data)
    @id = raw_data[:id]
    @name = raw_data[:name]
    @description = raw_data[:description] || "No Description"
    @thumbnail = raw_data[:thumbnail][:path] + '/standard_xlarge.' + raw_data[:thumbnail][:extension]
    @series_count = raw_data[:series][:available]
    @events_count = raw_data[:events][:available]
  end
end
