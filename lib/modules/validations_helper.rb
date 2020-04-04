module LineValidations
  def self.check_is_comment?(line)
    if !line.match(%r{^/*.}).nil?
      line.match(%r{^/*.})[0] == '/*'
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

  def self.comment_white_space_inside_before(line)
    if line.match(%r{^/*..})[0].scan(/./).last==''
      true      
    else
      false
    end
  end
end
