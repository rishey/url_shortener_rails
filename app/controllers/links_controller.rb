class LinksController < ApplicationController
	def create
		puts params
		@original_link = params[:link][:original_link]
		@shortened_link = generate_shortlink
	end

	def generate_shortlink(length=6)
	  chars = 'abcdefghijklmnopqrstuvwxyzabABCDEFGHIJKLMNOPQRSTUVWXYZ123456789'
	  shortlink = ''
	  length.times { |char| shortlink << chars[rand(chars.length)] }
	  return "http://localhost/" + shortlink
	end 

end