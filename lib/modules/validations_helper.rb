require_relative '../../lib/errors'

module LineValidations
  @list_errors = []

  def self.check_is_comment?(line)
    if !line.match(%r{^/\*.}).nil?
      line.match(%r{^/\*.})[0] == '/*'
    else
      false
    end
  end

  def self.check_is_comment_close?(line)
    if !line.match(%r{\*/}).nil?
      line.match(%r{\*/})[0] == '*/'
    else
      false
    end
  end

  def self.check_if_have_new_line(line)
    if !line.match(/\n$/).nil?
      line.match(/\n$/)[0] == '\n'
    else
      false
    end
  end

  def self.comment_white_space_inside_after(line, row)
    if line.match(%r{^/\*.})[0].scan(/./).nil?
      nil
    elsif line.match(%r{^/\*.})[0].scan(/./).last == ' '
      nil
    else
      index = line =~ %r{^/\*}
      Error.new(Variables::COMMENT_WHITESPACE_INSIDE,
                Variables.comment_white_space_inside_after,
                Variables::LINTER, row, index + 3)

    end
  end

  def self.comment_white_space_inside_before(line, row)
    index = line =~ %r{\*/}
    if line.match(%r{\*/})[0].nil?
      nil
    elsif line[index - 1] == ' '
      nil
    else
      Error.new(Variables::COMMENT_WHITESPACE_INSIDE,
                Variables.comment_white_space_inside_before,
                Variables::LINTER, row, index)

    end
  end

  def self.unexpected_missing_end_of_source_newline(line, row)
    column = line.length
    index = line =~ /\n/
    if line.match(/\n/).nil?
      @list_errors << Error.new(Variables::NO_MISSING_END_OF_SOURCE_NEWLINE,
                                Variables.unexpected_missing_end_of_source_newline,
                                Variables::LINTER, row, column)
    elsif line[index] == '\n'
      nil
    end
  end

  def self.show_list_errors
    @list_errors
  end

  def self.comment_white_space_inside_validations(line, row)
    @list_errors << LineValidations.comment_white_space_inside_after(line, row)
    @list_errors << LineValidations.comment_white_space_inside_before(line, row)
  end
end
