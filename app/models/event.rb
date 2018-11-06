class Event

  attr_reader :id,
              :title,
              :description,
              :more_info

  def initialize(raw_data)
    @id = raw_data[:id]
    @title = raw_data[:title]
    @description = raw_data[:description] || ""
    @thumbnail = raw_data[:thumbnail]
    @more_info = raw_data[:urls][0][:url]
  end

  def thumbnail_small
    @thumbnail[:path] + '/portrait_medium.' + @thumbnail[:extension]
  end

  def description
    return "None" if @description.empty?
    @description
  end

end
