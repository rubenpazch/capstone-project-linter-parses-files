#!/usr/bin/env ruby
require_relative '../lib/modules/file_helper'

if ARGV.empty?
	puts "Usage: #{ __FILE__ } <name>"
	exit(2)
end
puts "Hello #{ARGV[0].capitalize}"



=begin
input_array = ARGV



if (FileValidation.validate_path(input_array))		
	File.open('C:\wamp64\www\capstone-conference-page\scss\_aboutcover.scss').each do |x| 
		p x
	end

else 
	p 'empty'
end


=end