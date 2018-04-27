class PostulantsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@postulants = Postulant.all
	end
end