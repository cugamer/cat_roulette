class CatPagesController < ApplicationController
	def index
		@metadata = []
		5.times do
			@metadata << get_image_metadata_conf_pic
		end

		render 'index'
	end
end
