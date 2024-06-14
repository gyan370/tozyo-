class ReviwsController < ApplicationController
  def show
    @reviw = Reviw.find(params[:id])
    @reviw_json = reviw_to_hash(@reviw).to_json
    @reviw_comment = ReviwComment.new
  end

  def edit
    @reviw = Reviw.find(params[:id])
    is_matching_login_user(@reviw.user)
  end

  def new
    @reviw = Reviw.new
  end

  def index
    @reviws = Reviw.order(created_at: :desc).page(params[:page])
    @reviws_json = @reviws.map { |o| reviw_to_hash(o) }.to_json
  end
  
  def create
    @reviw = Reviw.new(reviw_params)
    @reviw.user = current_user
    if @reviw.save
      redirect_to reviws_path
    else
      flash.now[:error] = "投稿の保存に失敗しました。"
      render :new
    end
  end
  
  def destroy
    reviw = Reviw.find(params[:id])  
    reviw.destroy  
    redirect_to reviws_path
    is_matching_login_user(@reviw.user)
  end
  
  def update
    @reviw = Reviw.find(params[:id])
    if @reviw.update(reviw_params)
      flash[:notice] = "successfully"
      redirect_to reviw_path(@reviw.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end
  
  private
 
  def is_matching_login_user(owner)
    unless owner == current_user
      redirect_to reviws_path
    end
  end
  
  def reviw_params
    params.require(:reviw).permit(:title, :introduction, :castle, :store, :image, :star, :address, :latitude, :longitude, :keyword)
  end
 
  def reviw_to_hash(reviw)
    { id: reviw.id,
      name: reviw.castle,
      lat: reviw.latitude,
      lng: reviw.longitude }
  end
end
