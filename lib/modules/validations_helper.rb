require_relative '../../lib/errors'
require_relative '../../lib/list_errors'
require_relative '../../lib/modules/util'
require_relative '../../lib/modules/variables_helper'
module LineValidations
  @linters = Linters.new
  def self.check_is_comment?(line)
    if !line.match(%r{^/\*}).nil?
      line.match(%r{^/\*})[0] == '/*'
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

  def self.check_if_have_new_line?(line)
    if line.match(/\\n$/).nil?
      false
    else
      line.match(/\\n$/)[0] == '\n'
    end
  end

  def self.comment_white_space_inside_after(line, row)
    if line.nil?
      nil
    elsif line == "\n"
      nil
    elsif line.match(%r{^/\*.}).nil?
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
    if line.nil?
      nil
    elsif line == "\n"
      nil
    elsif line.match(%r{\*/}).nil?
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
    # rubocop:disable Layout/LineLength
    line.match(/\n/).nil? ? Error.new(Variables::NO_MISSING_END_OF_SOURCE_NEWLINE, Variables.unexpected_missing_end_of_source_newline, Variables::LINTER, row, column) : nil
    # rubocop:enable Layout/LineLength
  end

  def self.expected_empty_line_before_comment(arr)
    new_arr = []
    arr.each { |x| new_arr << x }

    new_arr.each_with_index do |line, idx|
      next unless check_is_comment_close?(line)
      next unless idx != 0

      next if new_arr.fetch(idx - 1) == "\n"

      @linters.add_errors_list(Error.new(Variables::COMMENT_EMPTY_LINE_BEFORE,
                                         Variables.expected_empty_line_before_comment,
                                         Variables::LINTER, idx + 1, 1))
		end		
    @linters
  end

	def self.expected_indentation_of_zero_spaces(arr)
		@linters = Linters.new
    arr.each_with_index do |line, idx|
      if !line.match(%r{/\*}).nil?
        next unless line[0] == ' '

        column = Util.index_white_space_string(line)
        @linters.add_errors_list(Error.new(Variables::INDENTATION,
                                           Variables.expected_indentation_of_zero_spaces,
                                           Variables::LINTER, idx + 1, column))
      elsif !line.match(/\./).nil?
        next unless line[0] == ' '

        column = Util.index_white_space_string(line)
        @linters.add_errors_list(Error.new(Variables::INDENTATION,
                                           Variables.expected_indentation_of_zero_spaces,
                                           Variables::LINTER, idx + 1, column))
      elsif !line.match(/\#/).nil?
        next unless line[0] == ' '

        column = Util.index_white_space_string(line)
        @linters.add_errors_list(Error.new(Variables::INDENTATION,
                                           Variables.expected_indentation_of_zero_spaces,
                                           Variables::LINTER, idx + 1, column))
      else
        next
      end
    end
    @linters
	end
	
	def self.expected_indentation_of_2_spaces(arr)		
		@linters=Linters.new
		arr.each_with_index do |line, idx|			
			if line.match(%r{/\*}).nil? && line.match(/\./).nil? && line.match(/\#/).nil?								
				next if line.match(%r{\}}) 
				next if line.match(%r{\\n}) 								
				next if line.match(/^\s\s/) 								
				next if (line =~ /\n/)== 0 

        column = Util.index_white_space_string(line)
        @linters.add_errors_list(Error.new(Variables::INDENTATION,
                                           Variables.expected_indentation_of_2_spaces,
                                           Variables::LINTER, idx + 1, column))
      else
        next
      end
    end
    @linters
  end
end
