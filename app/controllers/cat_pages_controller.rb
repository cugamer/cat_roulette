class CatPagesController < ApplicationController
	def index
		# render plain: get_image_metadata_alg
		metadata = get_image_metadata_conf_pic
		@image_url = metadata[0]["photos"][0]["original_size"]["url"]
		@blog_name = metadata[0]["blog_name"]
		@post_url = metadata[0]["post_url"]

		render 'index'
	end
end
