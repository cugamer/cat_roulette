module TumblrApiHelper
  require 'tumblr_client'


  def get_tumblr_sources
    return ["catsncats.tumblr.com"]
  end

  def get_image_url(source, number)
    Tumblr.configure do |config|
      config.consumer_key = Rails.application.secrets.tumblr_consumer_key
      config.consumer_secret = Rails.application.secrets.tumblr_consumer_secret
      config.oauth_token = Rails.application.secrets.tumblr_oauth_token
      config.oauth_token_secret = Rails.application.secrets.tumblr_oauth_token_secret
    end

    client = Tumblr::Client.new

    postingAccount = client.blog_info("catsncats.tumblr.com")
    target = Random.rand(postingAccount["blog"]["total_posts"] - 1)


    post = client.posts("catsncats.tumblr.com", :limit => 1, :offset => target)

    return post["posts"][0]["photos"][0]["original_size"]["url"]
  end

end