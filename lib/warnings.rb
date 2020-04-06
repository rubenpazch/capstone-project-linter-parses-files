require_relative '../lib/modules/variables_helper'
require_relative '../lib/message'

class Warning
  attr_writer :detail
  attr_reader :detail

  extend Variables

  def initialize(detail, content, description, row, column)
    super(content, description, row, column)
    @detail = detail
  end
end
