class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end
  
  def show
    @user = User.find(params[:id])
    authorize @user
    @recordings = Recording.where(user: @user)
  end
  
  def respond_json
    # @user = User.find(params[:id])
    authorize current_user
    render :json => JSON.parse(Recording.first.data)  
  end
end
