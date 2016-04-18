module CatPagesHelper
	def get_post_blog_name(metadata)
		return metadata[0]["blog_name"]
	end

	def get_post_url(metadata)
		return metadata[0]["post_url"]
	end

	def get_post_image_url(metadata)
		# ["original_size"]["url"]
		# return metadata[0]["photos"][0]["alt_sizes"][0]["url"]
		return get_cat_image_in_range(metadata, 1, 300)["url"]
	end

	def get_cat_image_in_range(metadata, lower, upper)
		images = metadata[0]["photos"][0]["alt_sizes"]
		best_fit = {"width" => 1}

		images.each do |img|
			if Integer(img["width"]) > best_fit["width"] && Integer(img["width"]) > lower && Integer(img["width"]) < upper 
				best_fit = img
			end
			p img
		end
		return best_fit
	end
end
