class LinksController < ApplicationController
	def create
		puts params
		@original_link = params[:link][:original_link]
		@shortened_link = generate_shortlink
		link = Link.new(original_link: @original_link, shortened_link: @shortened_link, counter: 0)
		link.save
		if session[:id]
			User.find(session[:id]).links << link
		end
	end

	def show
		 @link = Link.find_by(shortened_link: params[:id])
		 @link.counter += 1
		 @link.save
		 redirect_to @link.original_link
	end






	def generate_shortlink(length=6)
	  chars = 'abcdefghijklmnopqrstuvwxyzabABCDEFGHIJKLMNOPQRSTUVWXYZ123456789'
	  shortlink = ''
	  length.times { |char| shortlink << chars[rand(chars.length)] }
	  return shortlink
	end 

end