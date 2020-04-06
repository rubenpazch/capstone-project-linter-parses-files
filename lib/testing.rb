require_relative '../lib/message'
require_relative '../lib/errors'
require_relative '../lib/modules/variables_helper'

err = Error.new(Variables::COMMENT_WHITESPACE_INSIDE,
                Variables.comment_white_space_inside_before,
                Variables::LINTER, 1, 1)

puts err.show_message
