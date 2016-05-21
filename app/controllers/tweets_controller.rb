class TweetsController < ApplicationController
  def show
    @tweets = twitter_client.user_timeline(params[:name])
  end
end
