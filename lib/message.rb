class Message
  attr_accessor :content, :type, :row, :column
  def initialize(content, type, row, column)
    @content = content
    @type = type
    @row = row
    @column = column
  end
end
