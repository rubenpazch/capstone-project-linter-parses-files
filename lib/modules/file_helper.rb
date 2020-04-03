module FileValidation
  def self.validate_path?(path)
    if path.nil?
      false
    elsif path.empty?
      false
    else
      true
    end
  end

  def self.file_is_sass_file?(path)
    type_file = File.extname(path)
    type_file == '.scss'
  end

  def self.file_is_readable?(path)
    File.readable?(path)
  end

  def self.file_exists?(path)
    File.exist?(path)
  end

  def self.file_have_zero_lines?(path)
    File.zero?(path)
  end
end
