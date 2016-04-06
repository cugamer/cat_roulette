class CatPagesController < ApplicationController
	def index
		@metadata = get_image_metadata_conf_pic

		render 'index'
	end
end
