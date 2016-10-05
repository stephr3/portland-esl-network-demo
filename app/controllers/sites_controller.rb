class SitesController < ApplicationController
  def index
    if params[:site_type].present?
      if params[:site_type] == 'church'
        @layer = "layer_churches"
      elsif params[:site_type] == 'college'
        @layer = "layer_colleges"
      elsif params[:site_type] == 'business'
        @layer = "layer_businesses"
      elsif params[:site_type] == 'library'
        @layer = "layer_libraries"
      elsif params[:site_type] == 'public_school'
        @layer = "layer_schools"
      elsif params[:site_type] == 'social_service'
        @layer = "layer_services"
      else
        @layer = "layer_all"
      end
    else
      @layer = "layer_all"
    end
  end

  def north_northeast
  end

  def south_southeast
  end

  def southwest
  end

  def downtown
  end

  def gresham
  end

  def washington_county
  end

  def clark_county
  end

  def other_areas
  end
end
