class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
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
		  params[:tweet].permit(:content)
	  end
	
	
end
