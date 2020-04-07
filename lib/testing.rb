require_relative '../lib/message'
require_relative '../lib/errors'
require_relative '../lib/modules/variables_helper'
require_relative '../lib/modules/validations_helper'
require_relative '../lib/modules/util'

# err = Error.new(Variables::COMMENT_WHITESPACE_INSIDE,
#                Variables.comment_white_space_inside_before,
#                Variables::LINTER, 1, 1)

# puts err.show_message

# puts LineValidations.check_if_have_new_line?('')
# puts LineValidations.check_if_have_new_line?('/*comment*/\n')

# puts LineValidations.comment_white_space_inside_after('\n', 1)
# puts LineValidations.comment_white_space_inside_after('', 1)
# puts LineValidations.comment_white_space_inside_after(nil, 1)
# puts LineValidations.comment_white_space_inside_after(' ', 1)
# puts LineValidations.comment_white_space_inside_after('/*comment*/\n', 1)
# puts LineValidations.comment_white_space_inside_after('/* comment*/\n', 1)
# puts LineValidations.comment_white_space_inside_after('/*', 1)

# puts LineValidations.unexpected_missing_end_of_source_newline("/*comment*/\n", 1)
# puts LineValidations.expected_indentation_of_zero_spaces([" /*comment*/\n","\n"])

p Util.index_white_space_string('    /* comment */')
