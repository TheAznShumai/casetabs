class TwitterUsersController < ApplicationController
  def show
    @twitter_user = twitter_client.user(params[:name])
    render json: @twitter_user
  end
end
