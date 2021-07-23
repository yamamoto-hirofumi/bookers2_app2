class UsersController < ApplicationController
 def edit
    @user =User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
 end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:success] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
