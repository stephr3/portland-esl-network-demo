class LinksController < ApplicationController
  before_filter :is_admin, only:[:new]
  def learning
    @links = Link.all
  end

  def teaching
  end

  def refugees
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "You have successfully submitted a link!"
      redirect_to admin_path
    else
      flash[:alert] = "We're sorry, your class has not been successfully submitted."
      render :new
    end
  end
private
  def link_params
    params.require(:link).permit(:page, :title, :url, :description, :tag)
  end
end
