class TwitsController < ApplicationController
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

private
def twit_params
  params.require(:twit).permit(:body)
end
