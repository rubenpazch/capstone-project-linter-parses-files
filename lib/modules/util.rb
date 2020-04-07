module Util
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
end
