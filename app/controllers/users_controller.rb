class UsersController < ApplicationController
  def new
    # @user = User.find(params[:id])
    # flash[:notice] = ['Welcome, shane']
  end
  def create
    @user = User.new(params.require(:user).permit(:fname, :lname, :email))
    if @user.save
      flash[:notice] = ["Welcome, #{@user.fname}"]
      redirect_to '/users/'+@user.id.to_s
    else
      # scenario "unsuccessfully creates a new user account" do, to test it you go to the localhost/users/new and input info and make your email wrong structurer for example
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
