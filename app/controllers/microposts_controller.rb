class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = t("micropost.success")
      redirect_to root_url
    else
      @feed_items = []
      flash[:danger] = t("micropost.fail")
      redirect_to root_url
    end
  end

  def show

  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :picture, :title)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
    end
end
