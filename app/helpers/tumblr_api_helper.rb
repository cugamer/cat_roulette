module TumblrApiHelper
  require 'tumblr_client'


  def get_tumblr_sources
    return %w[ catsncats.tumblr.com catsinknots.tumblr.com getoutoftherecat.tumblr.com ]
  end

  def config_tumblr
    Tumblr.configure do |config|
      config.consumer_key = Rails.application.secrets.tumblr_consumer_key
      config.consumer_secret = Rails.application.secrets.tumblr_consumer_secret
      config.oauth_token = Rails.application.secrets.tumblr_oauth_token
      config.oauth_token_secret = Rails.application.secrets.tumblr_oauth_token_secret
    end
  end

  def get_tumblr_account(accounts)
    target = Random.rand(accounts.length)
    p accounts.length
    p target
    return accounts[target]
  end

  def get_image_metadata(source)
    client = Tumblr::Client.new

    postingAccount = client.blog_info(source)
    target = Random.rand(postingAccount["blog"]["total_posts"] - 1)

    post = client.posts(source, :limit => 1, :offset => target)

    # Conditional in place to prevent return of an empty array if the post has no content.
    if post["posts"] == []
      p "Empty post conditional tripped ------------------------------------------------------"
      return get_image_metadata(source)
    end

    # return post["posts"][0]["photos"][0]["original_size"]["url"]
    return post["posts"]
  end


  def get_image_metadata_alg
    config_tumblr
    accounts = get_tumblr_sources
    account = get_tumblr_account(accounts)
    return get_image_metadata(account)
  end

  def get_image_metadata_conf_pic
    post = get_image_metadata_alg
    if(post[0]["type"] != "photo")
      
      p post
      p "--------------------------------Tripped --------------------------------------"
      return get_image_metadata_conf_pic
    end
    return post
  end

end