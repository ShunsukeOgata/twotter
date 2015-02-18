class TweetsController < ApplicationController
  
  def index
    unless signed_in?
      redirect_to new_user_registration_path
    end
    @tweets = Tweet.all
    @tweet = Tweet.new
    @user = User.where(id: current_user.id).last
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
	  @tweet = Tweet.new(tweet_params)
	  if @tweet.save
	    redirect_to tweets_path
	  else
	    render 'new'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  

  private
    
    def tweet_params
      params.require(:tweet).permit(:content).merge(user_id: current_user.id)

    end
	
	
end
