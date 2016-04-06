class CatPagesController < ApplicationController
	def get
		render plain: get_image_metadata_alg
	end
end
