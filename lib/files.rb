class Files
	attr_reader :path, :file_name, :file_type
	attr_writer :input_string
	attr_reader :input_string
	
	def initialize(input_string)
		@input_string=input_string
	end

end