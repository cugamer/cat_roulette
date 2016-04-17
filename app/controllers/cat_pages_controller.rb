class CatPagesController < ApplicationController
	def index
		@metadata = []
		3.times do
			@metadata << get_image_metadata_conf_pic
		end

		render 'index'
	end

	def serveSingleImage
		metadata = get_image_metadata_conf_pic

		render :json => {"blog_name": get_post_blog_name(metadata),
				"post_url": get_post_url(metadata),
				"image_url": get_post_image_url(metadata)}
	end
end
