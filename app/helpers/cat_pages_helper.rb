module CatPagesHelper
	def get_post_blog_name(metadata)
		return metadata[0]["blog_name"]
	end

	def get_post_url(metadata)
		return metadata[0]["post_url"]
	end

	def get_post_image_url(metadata)
		return metadata[0]["photos"][0]["original_size"]["url"]
	end
end
