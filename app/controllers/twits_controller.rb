class TwitsController < ApplicationController
  # before any blog action happens, it will authenticate the user

  before_action :authenticate_user!

  def index
    @twits = Twit.all
  end
end

def index
  @twits = Twit.all
end

def new
  @twit = Twit.new
end

def create
  @twit = Twit.new(twit_params)
  @twit.user_id = current_user.id
  if twit.save
    redirect_to '/twits#index'
  else
    render 'new'
  end
end

def destroy

    @tweet = Tweet.find(params[:id])

    @tweet.destroy

    redirect_to '/', :notice => "Your tweet has been deleted"

  end

Inside tweet body

      <% if current_user == tweet.user %>

        <%= link_to "Delete", tweet_path(tweet.id), :confirm => "Are you sure?", :method => :delete %>

      <% end %>
private
def twit_params
  params.require(:twit).permit(:body)
end
