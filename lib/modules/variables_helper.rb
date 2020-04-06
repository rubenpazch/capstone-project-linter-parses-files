module Variables
  LINTER = 'Linter'.freeze
  SASS = 'Sass'.freeze

  COMMENT_WHITE_SPACE_INSIDE_AFTER = "Expected whitespace after '/*'".freeze
  COMMENT_WHITE_SPACE_INSIDE_BEFORE = "Expected whitespace before '*/'".freeze
  UNEXPECTED_MISSING_END_OF_SOURCE_NEWLINE = 'Unexpected missing end-of-source newline'.freeze

  COMMENT_WHITESPACE_INSIDE = '(comment-whitespace-inside)'.freeze
  NO_MISSING_END_OF_SOURCE_NEWLINE = '(no-missing-end-of-source-newline)'.freeze

  def self.comment_white_space_inside_after
    COMMENT_WHITE_SPACE_INSIDE_AFTER + ' ' + COMMENT_WHITESPACE_INSIDE
  end

  def self.comment_white_space_inside_before
    COMMENT_WHITE_SPACE_INSIDE_BEFORE + ' ' + COMMENT_WHITESPACE_INSIDE
  end

  def self.unexpected_missing_end_of_source_newline
    UNEXPECTED_MISSING_END_OF_SOURCE_NEWLINE + ' ' + NO_MISSING_END_OF_SOURCE_NEWLINE
  end
end
