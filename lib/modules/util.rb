module Util
  def self.index_white_space_string(line)
    index = 0
    array = []
    line.each_char { |x| array << x }
    i = 0
    while array[i] == ' '
      index = i
      i += 1
    end

    index + 2
  end
end
