class BiosController < ApplicationController
	def index
		@bios = Bio.all
	end
	def show
		@bios = Bio.find_by_friend_id(params[:id])
	end
	def new
		@bio = Bio.new
	end
	def create
		@bio = Bio.new
		@bio.friend_id = Friend.last.id
		# modelname.last  mean that show last insert
		@bio.date_of_birth = params[:bio][:date_of_birth]
		@bio.place_of_birth = params[:bio][:place_of_birth]
		@bio.skills = params[:bio][:skills]
		@bio.favorite = params[:bio][:favorite]
		@bio.dream = params[:bio][:dream]

		@bio.save

		redirect_to friends_path 
	end
	def destroy
		bio = Bio.find_by_id(params[:id])
		bio.destroy
		redirect_to bios_path
		
	end

end
