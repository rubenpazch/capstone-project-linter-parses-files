class Linters
  attr_accessor :list_errors
  def initialize
    @list_errors = []
  end

  def add_errors_list(err)
    if err.nil?
      false
    else
      @list_errors << err
      true
    end
  end

  def show_list_errors
    @list_errors
  end
end
