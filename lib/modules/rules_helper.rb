module RulesValidation
  def self.comment_whitespace_inside(line)
    if %r{/*}.match(line)
      true
    else
      false
    end
  end
end
