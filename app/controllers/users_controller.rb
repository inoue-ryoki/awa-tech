class UsersController < ApplicationController

  def edit
  end

   def update
       if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

def show
  @user = User.find(params[:id])
end

  private

  def user_params
    params.require(:user).permit(:name, :email,:school_name,:telephone_number,:teacher_name,:school_content)
  end
end
