class LinksController < ApplicationController
  before_filter :is_admin, only:[:new]
  def learning
  end

  def teaching
  end

  def refugees
  end

  def new
    @link = Link.new
  end
end
