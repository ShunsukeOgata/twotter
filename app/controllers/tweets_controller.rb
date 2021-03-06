class TweetsController < ApplicationController
  
  def index
    if signed_in?
      @tweets = Tweet.all
      @tweet = Tweet.new
      @user = current_user#User.where(id: current_user.id).last
      @others = User.where('id != ?', current_user.id) #where('id NOT IN ?' , [配列])とする事で、当てはまらないものを選択
    else
      redirect_to new_user_registration_path
    end

  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
	  @tweet = Tweet.new(tweet_params)
    @tweets = Tweet.all
    @user = current_user #User.where(id: current_user.id).last
	  @tweet.save
    render 'index'

  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    @tweets = Tweet.all
    @user = current_user
    render 'index'
  end

  private
    
    def tweet_params
      params.require(:tweet).permit(:content).merge(user_id: current_user.id)

    end
	
	
end
