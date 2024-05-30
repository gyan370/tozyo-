class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  
   def index
    @user = User.all  
   end
   
  def show
   @user = User.find(params[:id])
   @reviws = @user.reviws.page(params[:page])
   @today_reviw =  @reviws.created_today
   @yesterday_reviw = @reviws.created_yesterday
   @this_week_reviw = @reviws.created_this_week
   @last_week_reviw = @reviws.created_last_week
  end

  def edit
     @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)  
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
  
   def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to  current_user
    end
   end
   
   def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
   end  
  
end
