class PagesController < ApplicationController
  before_filter :is_admin, only:[:admin]
  def volunteer
  end

  def about
  end

  def admin
  end
end
