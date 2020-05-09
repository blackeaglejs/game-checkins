class ChapterMembersController < ApplicationController
	before_action :load_user
	before_action :load_chapter_member, except: [:index]

	def new
		@chapter_member = ChapterMember.new
	end

	def create
		@passcode = "none"
		@chapter_member = Profile.new(profile_params)
		@chapter_member.user = @user
		@passcode = params[:passcode]
		if params[:role].to_i == 3 and params[:passcode] == "septocaine"
			@chapter_member.save
		elsif params[:role].to_i != 3
			@chapter_member.save
		end
		if @chapter_member.save
			redirect_to dental_index_path
		else
			redirect_to new_profile_path
		end
	end

	private

	def load_user
		@user = current_user
	end

	def load_chapter_member
		if @user.chapter_member
			@chapter_member = ChapterMember.find(params[:id])
		end
	end
end