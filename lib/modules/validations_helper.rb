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
    if line == "\n"
      nil
    elsif line.match(%r{^/\*.}).nil?
      nil
    elsif line.match(%r{^/\*.})[0].scan(/./).nil?
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
    if line == "\n"
      nil
    elsif line.match(%r{\*/}).nil?
      nil
    elsif line.match(%r{\*/})[0].nil?
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

  def self.expected_empty_line_before_comment(arr)
    new_arr = []
    arr.each { |x| new_arr << x }

    new_arr.each_with_index do |line, idx|
      next unless check_is_comment_close?(line)
      next unless idx != 0

      next if new_arr.fetch(idx - 1) == "\n"

      @list_errors << Error.new(Variables::COMMENT_EMPTY_LINE_BEFORE,
                                Variables.expected_empty_line_before_comment,
                                Variables::LINTER, idx + 1, 1)
    end
  end

  def self.show_list_errors
    @list_errors
  end

  def self.comment_white_space_inside_validations(line, row)
    @list_errors << LineValidations.comment_white_space_inside_after(line, row)
    @list_errors << LineValidations.comment_white_space_inside_before(line, row)
  end

  def self.expected_indentation_of_zero_spaces(arr)
    new_arr = []
    arr.each { |x| new_arr << x }

    new_arr.each_with_index do |line, idx|
      next unless line[0] == ' '

      @list_errors << Error.new(Variables::INDENTATION,
                                Variables.expected_indentation_of_zero_spaces,
                                Variables::LINTER, idx + 1, 1)
    end
  end

  def self.order_array_by_row(arr)
    newarr = []
    ordered_array = []
    arr.each { |x| newarr << x unless x.nil? }
    len = newarr.length

    current = newarr[0]
    i = 1
    while i < len
      if current.row > newarr[i].row
        ordered_array << newarr[i]
      else
        ordered_array << current
        current = newarr[i]
      end
      ordered_array << newarr[i] if i == len - 1
      i += 1
    end
    ordered_array
  end

  def self.order_array_by_column(arr)
    newarr = []
    ordered_array = []
    arr.each { |x| newarr << x unless x.nil? }
    len = newarr.length

    current = newarr[0]
    i = 1
    while i < len
      if current.row == newarr[i].row && current.column > newarr[i].column
        ordered_array << newarr[i]
        ordered_array << current if i == len - 1
      else
        ordered_array << current
        current = newarr[i]
        ordered_array << current if i == len - 1
      end

      i += 1
    end
    ordered_array
  end

  def self.index_of_last_empty_char(line)
    arr = line.chars
    puts arr.inspect
  end
end
