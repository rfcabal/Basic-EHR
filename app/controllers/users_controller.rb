class UsersController < ApplicationController

  before_filter :check_login

  def index
    @users = User.search(params[:search])    
  end

  def show
      @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		flash[:status] = TRUE
  		flash[:alert] = 'Congratulations! You have succesfully registered.'
  	else
  		flash[:status] = FALSE
  		flash[:alert] = @user.errors.full_messages
  	end

  	redirect_to register_path
  end
end
