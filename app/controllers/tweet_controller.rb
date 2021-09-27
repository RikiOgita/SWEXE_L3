class TweetController < ApplicationController
    def index
        @tweet = Tweet.all
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        logger.debug "---------" + params[:tweet][:message] + "---------"
        @tweet =Tweet.new(message: params[:tweet][:message],tdate: Time.current)
        if @tweet.save
            flash[:notice] = 'ツイート完了'
            redirect_to root_path
        else 
            render 'new'
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to root_path
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        @tweet.update(message: message)
        redirect_to root_path
    end
    
    def show
        @tweet = Tweet.find(params[:id])
    end
    
end
