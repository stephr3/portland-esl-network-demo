class LinksController < ApplicationController
  before_filter :is_admin, only:[:new, :edit, :destroy]
  def learning
    @links = Link.where(page: 'Student Learning Resources')
  end

  def teaching
    @links = Link.where(page: 'Teaching Resources')
  end

  def refugees
    @links = Link.where(page: 'Refugee Backgrounders')
  end

  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end      
    else
      flash[:alert] = "We're sorry, your link updates have not been successfully submitted."
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to admin_path
  end
private
  def link_params
    params.require(:link).permit(:page, :title, :url, :description, :tag)
  end
end
