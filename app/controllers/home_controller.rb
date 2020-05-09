class HomeController < ApplicationController
	def index
		if current_user.present?
			@chapter_member = current_user.chapter_member
		end
	end
end