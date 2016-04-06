module TumblrApiHelper
  require 'tumblr_client'


  def get_tumblr_sources
    return ["catsncats.tumblr.com"]
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
    return accounts[target]
  end

  def get_image_url(source, number)
    client = Tumblr::Client.new

    postingAccount = client.blog_info(source)
    target = Random.rand(postingAccount["blog"]["total_posts"] - 1)


    post = client.posts("catsncats.tumblr.com", :limit => 1, :offset => target)

    # return post["posts"][0]["photos"][0]["original_size"]["url"]
    return post["posts"]
  end


  def get_image_alg
    config_tumblr
    accounts = get_tumblr_sources
    account = get_tumblr_account(accounts)
    get_image_url(account, 1)


  end

end