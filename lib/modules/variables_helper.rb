module Variables
  LINTER = 'Linter'.freeze
  SASS = 'Sass'.freeze

  COMMENT_WHITE_SPACE_INSIDE_AFTER = "Expected whitespace after '/*'".freeze
  COMMENT_WHITE_SPACE_INSIDE_BEFORE = "Expected whitespace before '*/'".freeze
  COMMENT_WHITESPACE_INSIDE = '(comment-whitespace-inside)'.freeze

  UNEXPECTED_MISSING_END_OF_SOURCE_NEWLINE = 'Unexpected missing end-of-source newline'.freeze
  NO_MISSING_END_OF_SOURCE_NEWLINE = '(no-missing-end-of-source-newline)'.freeze

  EXPECTED_EMPTY_LINE_BEFORE_COMMENT = 'Expected empty line before comment'.freeze
  COMMENT_EMPTY_LINE_BEFORE = '(comment-empty-line-before)'.freeze

  EXPECTED_INDENTATION_OF_0_SPACES = 'Expected indentation of 0 spaces'.freeze
  INDENTATION = '(indentation)'.freeze

  EXPECTED_INDENTATION_OF_2_SPACES = 'Expected indentation of 2 spaces'.freeze

  def self.comment_white_space_inside_after
    COMMENT_WHITE_SPACE_INSIDE_AFTER + ' ' + COMMENT_WHITESPACE_INSIDE
  end

  def self.comment_white_space_inside_before
    COMMENT_WHITE_SPACE_INSIDE_BEFORE + ' ' + COMMENT_WHITESPACE_INSIDE
  end

  def self.unexpected_missing_end_of_source_newline
    UNEXPECTED_MISSING_END_OF_SOURCE_NEWLINE + ' ' + NO_MISSING_END_OF_SOURCE_NEWLINE
  end

  def self.expected_empty_line_before_comment
    EXPECTED_EMPTY_LINE_BEFORE_COMMENT + ' ' + COMMENT_EMPTY_LINE_BEFORE
  end

  def self.expected_indentation_of_zero_spaces
    EXPECTED_INDENTATION_OF_0_SPACES + ' ' + INDENTATION
  end

  def self.expected_indentation_of_2_spaces
    EXPECTED_INDENTATION_OF_2_SPACES + ' ' + INDENTATION
  end
end
