require_relative '../lib/modules/variables_helper'
require_relative '../lib/message'

class Error < Message
  attr_writer :detail
  attr_reader :detail

  extend Variables

  def initialize(detail, content, type, row, column)
    super(content, type, row, column)
    @detail = detail
  end

  def show_message
    "Error :  #{content} | #{type} #{detail} [#{row}, #{column}]"
  end
end
